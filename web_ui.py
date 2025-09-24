from flask import Flask, render_template, jsonify, request
import threading
import time
from colorama import Fore, Style

class WebUI:
    def __init__(self, filament_manager, command_module, bambuapi_module, host='0.0.0.0', port=5000):
        self.filament_manager = filament_manager
        self.command = command_module
        self.bambuapi = bambuapi_module
        self.host = host
        self.port = port
        self.app = Flask(__name__)
        self.printer = None
        self.setup_routes()
        
    def setup_routes(self):
        @self.app.route('/')
        def index():
            filaments = self.filament_manager.get_all_filaments()
            loaded_filament = self.filament_manager.get_loaded_filament()
            return render_template('index.html', filaments=filaments, loaded_filament=loaded_filament)
        
        @self.app.route('/api/filaments')
        def get_filaments():
            return jsonify(self.filament_manager.get_all_filaments())
        
        @self.app.route('/api/loaded')
        def get_loaded():
            loaded = self.filament_manager.get_loaded_filament()
            return jsonify({'loaded': loaded})
        
        @self.app.route('/api/load/<int:filament_num>', methods=['POST'])
        def load_filament(filament_num):
            try:
                if not self.command.test_connection():
                    return jsonify({'success': False, 'error': 'AMS board not connected'})
                
                print(Fore.CYAN + f"Web UI: Loading filament {filament_num}" + Style.RESET_ALL)
                
                # Load filament via AMS
                success = self.command.load_filament(filament_num)
                if success:
                    self.filament_manager.set_loaded_filament(filament_num)
                    return jsonify({'success': True, 'message': f'Filament {filament_num} loaded successfully'})
                else:
                    return jsonify({'success': False, 'error': 'Failed to load filament'})
            except Exception as e:
                print(Fore.RED + f"Error loading filament: {e}" + Style.RESET_ALL)
                return jsonify({'success': False, 'error': str(e)})
        
        @self.app.route('/api/unload', methods=['POST'])
        def unload_filament():
            try:
                if self.printer:
                    print(Fore.CYAN + "Web UI: Unloading filament" + Style.RESET_ALL)
                    self.bambuapi.unload_filament(self.printer)
                    self.filament_manager.set_loaded_filament(None)
                    return jsonify({'success': True, 'message': 'Filament unloaded successfully'})
                else:
                    return jsonify({'success': False, 'error': 'Printer not connected'})
            except Exception as e:
                print(Fore.RED + f"Error unloading filament: {e}" + Style.RESET_ALL)
                return jsonify({'success': False, 'error': str(e)})
        
        @self.app.route('/api/color/<int:filament_num>', methods=['POST'])
        def set_filament_color(filament_num):
            try:
                data = request.get_json()
                color = data.get('color')
                name = data.get('name')
                
                if color or name:
                    success = self.filament_manager.set_filament_color(filament_num, color, name)
                    if success:
                        return jsonify({'success': True, 'message': 'Filament settings updated'})
                    else:
                        return jsonify({'success': False, 'error': 'Invalid filament number'})
                else:
                    return jsonify({'success': False, 'error': 'No data provided'})
            except Exception as e:
                print(Fore.RED + f"Error updating filament color: {e}" + Style.RESET_ALL)
                return jsonify({'success': False, 'error': str(e)})
        
        @self.app.route('/api/printer/status')
        def get_printer_status():
            if self.printer:
                try:
                    status = self.printer.get_state()
                    # Get additional printer info
                    nozzle_temp = "N/A"
                    bed_temp = "N/A"
                    try:
                        nozzle_temp = f"{self.printer.get_nozzle_temperature()}°C"
                        bed_temp = f"{self.printer.get_bed_temperature()}°C"
                    except:
                        pass
                    
                    return jsonify({
                        'status': status,
                        'nozzle_temp': nozzle_temp,
                        'bed_temp': bed_temp
                    })
                except Exception as e:
                    return jsonify({'status': 'ERROR', 'error': str(e)})
            return jsonify({'status': 'DISCONNECTED'})
        
        @self.app.route('/api/printer/info')
        def get_printer_info():
            if self.printer:
                try:
                    # Get comprehensive printer information
                    info = {
                        'status': self.printer.get_state(),
                        'nozzle_temp': self.printer.get_nozzle_temperature(),
                        'bed_temp': self.printer.get_bed_temperature(),
                        'progress': self.printer.get_percentage(),
                        'current_layer': getattr(self.printer, 'current_layer_num', lambda: 'N/A')(),
                        'total_layers': getattr(self.printer, 'total_layer_num', lambda: 'N/A')(),
                    }
                    return jsonify(info)
                except Exception as e:
                    return jsonify({'error': str(e)})
            return jsonify({'error': 'Printer not connected'})
    
    def set_printer(self, printer):
        self.printer = printer
    
    def run(self):
        print(Fore.CYAN + f"🚀 Starting web UI on http://{self.host}:{self.port}" + Style.RESET_ALL)
        print(Fore.GREEN + "💡 Access the interface from any device on your network!" + Style.RESET_ALL)
        self.app.run(host=self.host, port=self.port, debug=False, use_reloader=False)
    
    def start_in_thread(self):
        thread = threading.Thread(target=self.run, daemon=True)
        thread.start()
        return thread