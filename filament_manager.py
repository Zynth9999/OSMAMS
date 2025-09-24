import json
import os
from colorama import Fore, Style

class FilamentManager:
    def __init__(self, config_file="filament_config.json"):
        self.config_file = config_file
        self.filaments = self.load_config()
        
    def load_config(self):
        """Load filament configuration from JSON file"""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except (json.JSONDecodeError, IOError):
                print(Fore.YELLOW + "Warning: Could not load filament config, using defaults" + Style.RESET_ALL)
        
        # Default configuration
        return {
            "1": {"color": "#FF0000", "name": "Red", "loaded": False},
            "2": {"color": "#00FF00", "name": "Green", "loaded": False},
            "3": {"color": "#0000FF", "name": "Blue", "loaded": False},
            "4": {"color": "#FFFF00", "name": "Yellow", "loaded": False}
        }
    
    def save_config(self):
        """Save filament configuration to JSON file"""
        try:
            with open(self.config_file, 'w') as f:
                json.dump(self.filaments, f, indent=2)
        except IOError as e:
            print(Fore.RED + f"Error saving filament config: {e}" + Style.RESET_ALL)
    
    def set_filament_color(self, filament_num, color, name=None):
        """Set color and name for a filament"""
        filament_str = str(filament_num)
        if filament_str in self.filaments:
            self.filaments[filament_str]["color"] = color
            if name:
                self.filaments[filament_str]["name"] = name
            self.save_config()
            return True
        return False
    
    def get_filament_info(self, filament_num):
        """Get information for a specific filament"""
        filament_str = str(filament_num)
        return self.filaments.get(filament_str, {"color": "#808080", "name": f"Filament {filament_num}", "loaded": False})
    
    def set_loaded_filament(self, filament_num):
        """Mark a filament as currently loaded"""
        filament_str = str(filament_num)
        # Reset all loaded flags
        for f in self.filaments.values():
            f["loaded"] = False
        
        # Set the new loaded filament
        if filament_str in self.filaments:
            self.filaments[filament_str]["loaded"] = True
            self.save_config()
            return True
        return False
    
    def get_loaded_filament(self):
        """Get the currently loaded filament number"""
        for filament_num, info in self.filaments.items():
            if info.get("loaded", False):
                return int(filament_num)
        return None
    
    def get_all_filaments(self):
        """Get information for all filaments"""
        return self.filaments