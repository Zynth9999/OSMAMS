; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 27m 54s; total estimated time: 34m 9s
; total layer number: 11
; total filament length [mm] : 1430.82,689.12
; total filament volume [cm^3] : 3441.53,1657.53
; total filament weight [g] : 4.37,2.11
; filament_density: 1.27,1.27
; filament_diameter: 1.75,1.75
; max_z_height: 3.00
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 0,0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 2
; bottom_shell_layers = 2
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = ;===== A1mini 20250206 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_fan_the_first_x_layers = 3,3
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 0,0
; cool_plate_temp_initial_layer = 0,0
; counter_coef_1 = 0,0
; counter_coef_2 = 0.008,0.008
; counter_coef_3 = -0.041,-0.041
; counter_limit_max = 0.033,0.033
; counter_limit_min = -0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 1
; diameter_limit = 50,50
; different_settings_to_system = bottom_color_penetration_layers;bottom_shell_layers;detect_thin_wall;enable_support;inner_wall_speed;internal_solid_infill_speed;outer_wall_speed;prime_tower_infill_gap;prime_tower_rib_wall;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;support_on_build_plate_only;support_speed;top_color_penetration_layers;top_shell_layers;top_surface_speed;wall_generator;;filament_end_gcode;filament_start_gcode;nozzle_temperature_range_high;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 1
; enforce_support_layers = 0
; eng_plate_temp = 70,70
; eng_plate_temp_initial_layer = 70,70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 30,30
; fan_max_speed = 90,90
; fan_min_speed = 40,40
; filament_adhesiveness_category = 300,300
; filament_change_length = 10,10
; filament_colour = #FFFFFF;#00FF00
; filament_cost = 30,30
; filament_density = 1.27,1.27
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\nM400 U1"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.95,0.95
; filament_flush_temp = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = GFG99;GFG99
; filament_is_support = 0,0
; filament_map = 1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 8,8
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_notes = 
; filament_pre_cooling_temperature = 0,0
; filament_prime_volume = 45,45
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_scarf_gap = 0%,0%
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "Generic PETG @BBL A1M";"PETG Second color pla"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}\nM400 U1"
; filament_type = PETG;PETG
; filament_vendor = Generic;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,340,552,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 200
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.23415,0.23415
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; host_type = octoprint
; hot_plate_temp = 70,70
; hot_plate_temp_initial_layer = 70,70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;"Generic PETG @BBL A1M";
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 350
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.28
; line_width = 0.42
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0
; machine_end_gcode = ;===== date: 20231229 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20240620 =====================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M104 S{nozzle_temperature_range_high[initial_no_support_extruder]}\n    G92 E0\n    G1 E50 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action : 2\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of "draw extrinsic para cali paint"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.76
; nozzle_temperature = 255,255
; nozzle_temperature_initial_layer = 255,255
; nozzle_temperature_range_high = 270,240
; nozzle_temperature_range_low = 220,220
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 350
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 90,90
; overhang_fan_threshold = 10%,10%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.28mm Extra Draft @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 3%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 3%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 12,12
; slow_down_min_speed = 20,20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 3%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 300
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70,70
; supertack_plate_temp_initial_layer = 70,70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 1
; support_remove_small_overhang = 1
; support_speed = 225
; support_style = default
; support_threshold_angle = 40
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70,70
; template_custom_gcode = 
; textured_plate_temp = 70,70
; textured_plate_temp_initial_layer = 70,70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 2
; top_one_wall_type = all top
; top_shell_layers = 2
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.45
; top_surface_pattern = monotonicline
; top_surface_speed = 325
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = arachne
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 158.318
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R34
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20240620 =====================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PETG
M104 S170
M140 S70
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S255
    M104 S250
    M400
    T0
    G1 X-13.5 F3000
    M400
    M620.1 E F199.559 T270
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
M73 P1 R33
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG
    M104 S270
    G92 E0
    G1 E50 F199.559
    M400
    M106 P1 S178
    G92 E0
M73 P2 R33
    G1 E5 F199.559
    M109 S235 ; drop nozzle temp, make filament shink a bit
    M104 S215
    G92 E0
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
M73 P3 R33
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S215
    G392 S0 ;turn off clog detect
M621 S0A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P15 R28
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P16 R28
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action : 2
M104 S0
M190 S70;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X11.8005 Y70.6058 I92.5338 J96.9121
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S255
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PETG
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F480
    G0 X93 E.3742  F800
    G0 X98 E.3742  F3200
    G0 X103 E.3742  F800
    G0 X108 E.3742  F3200
    G0 X113 E.3742  F800
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F200
    M983 F3.33333 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F3.33333 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F3.33333 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S255
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F480
G0 X93 E.3742  F800
G0 X98 E.3742  F3200
G0 X103 E.3742  F800
G0 X108 E.3742  F3200
G0 X113 E.3742  F800
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F42000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/11
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
M106 P2 S0
G1 E-.8 F1800
M204 S6000
G1 Z.6 F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
M73 P17 R28
G1 Z0.6
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X49.5 Y163.318 F42000
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  X15.500 Y163.318  E1.2922 F3000
G1  Y158.818  E0.1710
G1  X49.500  E1.2922
G1  Y163.318  E0.1710
M204 S6000
G1  X16.500 Y158.818  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S500
G1  Y159.318  E0.0190
G1  X49.000  E1.2352
G1  Y159.818  E0.0190
G1  X16.000  E1.2542
G1  Y160.318  E0.0190
G1  X49.000  E1.2542
G1  Y160.818  E0.0190
G1  X16.000  E1.2542
M73 P18 R28
G1  Y161.318  E0.0190
M73 P18 R27
G1  X49.000  E1.2542
G1  Y161.818  E0.0190
G1  X16.000  E1.2542
G1  Y162.318  E0.0190
G1  X49.000  E1.2542
G1  Y162.818  E0.0190
G1  X16.000  E1.2542
G1  Y163.318  E0.0190
; CP EMPTY GRID END
;------------------






M204 S6000
G1  X15.000 Y164.318  
M204 S500
G1  Y158.318  E0.2280
G1  X50.000  E1.3302
G1  Y164.318  E0.2280
G1  X15.000  E1.3302
M204 S6000
G1  X14.543 Y164.775  
M204 S500
G1  Y157.861  E0.2628
G1  X50.457  E1.3650
G1  Y164.775  E0.2628
G1  X14.543  E1.3650
M204 S6000
G1  X14.086 Y165.232  
M204 S500
G1  Y157.404  E0.2975
G1  X50.914  E1.3997
G1  Y165.232  E0.2975
G1  X14.086  E1.3997
M204 S6000
G1  X13.629 Y165.689  
M204 S500
G1  Y156.947  E0.3323
G1  X51.371  E1.4345
G1  Y165.689  E0.3323
G1  X13.629  E1.4345
M204 S6000
G1  X13.172 Y166.146  
M204 S500
G1  Y156.490  E0.3670
G1  X51.828  E1.4692
G1  Y166.146  E0.3670
G1  X13.172  E1.4692
M204 S6000
G1  X12.715 Y166.603  
M204 S500
G1  Y156.033  E0.4018
G1  X52.285  E1.5039
G1  Y166.603  E0.4018
G1  X12.715  E1.5039
M204 S6000
G1  X12.258 Y167.060  
M204 S500
G1  Y155.576  E0.4365
G1  X52.742  E1.5387
G1  Y167.060  E0.4365
G1  X12.258  E1.5387
M204 S6000
G1  X11.801 Y167.517  
M204 S500
G1  Y155.119  E0.4712
G1  X53.199  E1.5734
G1  Y167.517  E0.4712
G1  X11.801  E1.5734
; WIPE_TOWER_END

; WIPE_START
G1 F33600
M204 S500
G1 X13.801 Y167.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X103.627 Y101.265 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X73.675 Y101.265 E1.08144
M73 P19 R27
G1 X73.675 Y71.313 E1.08144
G1 X103.627 Y71.313 E1.08144
G1 X103.627 Y86.289 E.54072
G1 X103.627 Y101.205 E.53855
M204 S6000
G1 X104.084 Y101.722 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X73.218 Y101.722 E1.11444
G1 X73.218 Y70.856 E1.11444
G1 X104.084 Y70.856 E1.11444
G1 X104.084 Y86.289 E.55722
G1 X104.084 Y101.662 E.55506
; WIPE_START
G1 X102.084 Y101.666 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.193 Y94.035 Z.6 F42000
G1 X102.513 Y71.496 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50343
G1 F5211.613
M204 S500
G1 X103.239 Y72.221 E.03733
G1 X103.239 Y72.873 E.02369
G1 X102.068 Y71.701 E.06025
G1 X101.416 Y71.701 E.02369
G1 X103.239 Y73.524 E.09375
G1 X103.239 Y74.175 E.02369
G1 X100.765 Y71.701 E.12726
G1 X100.114 Y71.701 E.02369
G1 X103.239 Y74.826 E.16076
G1 X103.239 Y75.478 E.02369
G1 X99.462 Y71.701 E.19426
G1 X98.811 Y71.701 E.02369
G1 X103.239 Y76.129 E.22777
G1 X103.239 Y76.78 E.02369
G1 X98.16 Y71.701 E.26127
G1 X97.509 Y71.701 E.02369
G1 X103.239 Y77.431 E.29478
G1 X103.239 Y78.083 E.02369
G1 X96.857 Y71.701 E.32828
G1 X96.206 Y71.701 E.02369
G1 X103.239 Y78.734 E.36178
G1 X103.239 Y79.385 E.02369
G1 X95.555 Y71.701 E.39529
G1 X94.904 Y71.701 E.02369
G1 X103.239 Y80.036 E.42879
G1 X103.239 Y80.688 E.02369
G1 X94.252 Y71.701 E.4623
G1 X93.601 Y71.701 E.02369
G1 X103.239 Y81.339 E.4958
G1 X103.239 Y81.99 E.02369
G1 X92.95 Y71.701 E.5293
G1 X92.299 Y71.701 E.02369
G1 X103.239 Y82.641 E.56281
G1 X103.239 Y83.293 E.02369
G1 X91.647 Y71.701 E.59631
G1 X90.996 Y71.701 E.02369
G1 X103.239 Y83.944 E.62982
G1 X103.239 Y84.595 E.02369
G1 X90.345 Y71.701 E.66332
G1 X89.694 Y71.701 E.02369
G1 X103.239 Y85.246 E.69682
G1 X103.239 Y85.898 E.02369
G1 X89.042 Y71.701 E.73033
G1 X88.391 Y71.701 E.02369
G1 X103.239 Y86.549 E.76383
G1 X103.239 Y87.2 E.02369
G1 X87.74 Y71.701 E.79734
G1 X87.089 Y71.701 E.02369
G1 X103.239 Y87.852 E.83084
G1 X103.239 Y88.503 E.02369
G1 X86.437 Y71.701 E.86434
G1 X85.786 Y71.701 E.02369
G1 X103.239 Y89.154 E.89785
G1 X103.239 Y89.805 E.02369
G1 X85.135 Y71.701 E.93135
G1 X84.484 Y71.701 E.02369
M73 P20 R27
G1 X103.239 Y90.457 E.96485
G1 X103.239 Y91.108 E.02369
G1 X83.832 Y71.701 E.99836
G1 X83.181 Y71.701 E.02369
G1 X103.239 Y91.759 E1.03186
G1 X103.239 Y92.41 E.02369
G1 X82.53 Y71.701 E1.06537
G1 X81.878 Y71.701 E.02369
G1 X103.239 Y93.062 E1.09887
G1 X103.239 Y93.713 E.02369
G1 X81.227 Y71.701 E1.13237
G1 X80.576 Y71.701 E.02369
G1 X103.239 Y94.364 E1.16588
G1 X103.239 Y95.015 E.02369
G1 X79.925 Y71.701 E1.19938
G1 X79.273 Y71.701 E.02369
G1 X103.239 Y95.667 E1.23289
G1 X103.239 Y96.318 E.02369
G1 X78.622 Y71.701 E1.26639
G1 X77.971 Y71.701 E.02369
G1 X103.239 Y96.969 E1.29989
G1 X103.239 Y97.62 E.02369
G1 X77.32 Y71.701 E1.3334
G1 X76.668 Y71.701 E.02369
G1 X103.239 Y98.272 E1.3669
G1 X103.239 Y98.923 E.02369
G1 X76.017 Y71.701 E1.40041
G1 X75.366 Y71.701 E.02369
G1 X103.239 Y99.574 E1.43391
G1 X103.239 Y100.225 E.02369
G1 X74.715 Y71.701 E1.46741
G1 X74.063 Y71.701 E.02369
G1 X103.239 Y100.877 E1.50092
G1 X102.588 Y100.877 E.02369
G1 X74.063 Y72.353 E1.46743
G1 X74.063 Y73.004 E.02369
G1 X101.936 Y100.877 E1.43392
G1 X101.285 Y100.877 E.02369
G1 X74.063 Y73.655 E1.40042
G1 X74.063 Y74.306 E.02369
G1 X100.634 Y100.877 E1.36691
G1 X99.982 Y100.877 E.02369
G1 X74.063 Y74.958 E1.33341
G1 X74.063 Y75.609 E.02369
G1 X99.331 Y100.877 E1.29991
G1 X98.68 Y100.877 E.02369
G1 X74.063 Y76.26 E1.2664
G1 X74.063 Y76.911 E.02369
G1 X98.029 Y100.877 E1.2329
G1 X97.377 Y100.877 E.02369
G1 X74.063 Y77.563 E1.19939
G1 X74.063 Y78.214 E.02369
G1 X96.726 Y100.877 E1.16589
G1 X96.075 Y100.877 E.02369
G1 X74.063 Y78.865 E1.13239
G1 X74.063 Y79.516 E.02369
G1 X95.424 Y100.877 E1.09888
G1 X94.772 Y100.877 E.02369
G1 X74.063 Y80.168 E1.06538
G1 X74.063 Y80.819 E.02369
G1 X94.121 Y100.877 E1.03187
G1 X93.47 Y100.877 E.02369
G1 X74.063 Y81.47 E.99837
G1 X74.063 Y82.121 E.02369
G1 X92.819 Y100.877 E.96487
G1 X92.167 Y100.877 E.02369
G1 X74.063 Y82.773 E.93136
G1 X74.063 Y83.424 E.02369
G1 X91.516 Y100.877 E.89786
G1 X90.865 Y100.877 E.02369
G1 X74.063 Y84.075 E.86435
G1 X74.063 Y84.727 E.02369
G1 X90.214 Y100.877 E.83085
G1 X89.562 Y100.877 E.02369
G1 X74.063 Y85.378 E.79735
G1 X74.063 Y86.029 E.02369
G1 X88.911 Y100.877 E.76384
G1 X88.26 Y100.877 E.02369
M73 P20 R26
G1 X74.063 Y86.68 E.73034
G1 X74.063 Y87.332 E.02369
M73 P21 R26
G1 X87.609 Y100.877 E.69684
G1 X86.957 Y100.877 E.02369
G1 X74.063 Y87.983 E.66333
G1 X74.063 Y88.634 E.02369
G1 X86.306 Y100.877 E.62983
G1 X85.655 Y100.877 E.02369
G1 X74.063 Y89.285 E.59632
G1 X74.063 Y89.937 E.02369
G1 X85.003 Y100.877 E.56282
G1 X84.352 Y100.877 E.02369
G1 X74.063 Y90.588 E.52932
G1 X74.063 Y91.239 E.02369
G1 X83.701 Y100.877 E.49581
G1 X83.05 Y100.877 E.02369
G1 X74.063 Y91.89 E.46231
G1 X74.063 Y92.542 E.02369
G1 X82.398 Y100.877 E.4288
G1 X81.747 Y100.877 E.02369
G1 X74.063 Y93.193 E.3953
G1 X74.063 Y93.844 E.02369
G1 X81.096 Y100.877 E.3618
G1 X80.445 Y100.877 E.02369
G1 X74.063 Y94.495 E.32829
G1 X74.063 Y95.147 E.02369
G1 X79.793 Y100.877 E.29479
G1 X79.142 Y100.877 E.02369
G1 X74.063 Y95.798 E.26128
G1 X74.063 Y96.449 E.02369
G1 X78.491 Y100.877 E.22778
G1 X77.84 Y100.877 E.02369
G1 X74.063 Y97.1 E.19428
G1 X74.063 Y97.752 E.02369
G1 X77.188 Y100.877 E.16077
G1 X76.537 Y100.877 E.02369
G1 X74.063 Y98.403 E.12727
G1 X74.063 Y99.054 E.02369
G1 X75.886 Y100.877 E.09376
G1 X75.235 Y100.877 E.02369
G1 X74.063 Y99.705 E.06026
G1 X74.063 Y100.357 E.02369
G1 X74.789 Y101.083 E.03734
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F5211.613
G1 X74.063 Y100.357 E-.39004
G1 X74.063 Y99.705 E-.24748
G1 X74.291 Y99.933 E-.12248
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/11
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

; open powerlost recovery
M1003 S1
; OBJECT_ID: 1297
M204 S10000
G17
G3 Z.6 I-.06 J1.215 P1  F42000
G1 X103.749 Y101.388 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
; LAYER_HEIGHT: 0.28
G1 F4396.619
M204 S6000
G1 X73.553 Y101.388 E1.30209
G1 X73.553 Y71.191 E1.30209
G1 X103.749 Y71.191 E1.30209
G1 X103.749 Y78.917 E.33314
G1 X103.749 Y101.328 E.96636
M204 S10000
G1 X104.124 Y101.762 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X73.178 Y101.762 E1.23175
G1 X73.178 Y70.816 E1.23175
G1 X104.124 Y70.816 E1.23175
G1 X104.124 Y78.917 E.32243
G1 X104.124 Y101.702 E.90693
; WIPE_START
M204 S6000
G1 X102.124 Y101.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.009 Y95.278 Z.88 F42000
G1 X95.539 Y91.42 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.429929
G1 F4635.209
M204 S5000
G1 X95.78 Y91.482 E.01019
; LINE_WIDTH: 0.430579
G1 F4627.077
G1 X95.497 Y91.631 E.01307
G1 X95.071 Y92.044 E.02431
; LINE_WIDTH: 0.425779
G1 F4687.812
G1 X94.818 Y92.459 E.01967
; LINE_WIDTH: 0.432499
G1 F4603.221
G1 X94.796 Y92.235 E.00928
; LINE_WIDTH: 0.437019
G1 F4548.021
G1 X94.585 Y92.02 E.01255
G1 X94.816 Y91.782 E.01382
; LINE_WIDTH: 0.430579
G1 F4627.077
G1 X95.411 Y91.208 E.03389
G1 X95.508 Y91.368 E.00765
; WIPE_START
M204 S6000
G1 X95.78 Y91.482 E-.11209
G1 X95.497 Y91.631 E-.12122
G1 X95.071 Y92.044 E-.22546
G1 X94.818 Y92.459 E-.18485
G1 X94.796 Y92.235 E-.08564
G1 X94.739 Y92.177 E-.03074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.87 Y93.014 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.414488
G1 F4837.15
M204 S5000
G1 X97.485 Y93.535 E.03158
; LINE_WIDTH: 0.441689
G1 F4492.363
G1 X97.524 Y93.594 E.00297
; LINE_WIDTH: 0.468888
G1 F4193.458
G1 X97.564 Y93.652 E.00318
; LINE_WIDTH: 0.515478
G1 F3764.434
G1 X97.565 Y93.699 E.00235
; LINE_WIDTH: 0.562069
G1 F3415.048
G1 X97.567 Y93.745 E.00259
; LINE_WIDTH: 0.608658
G1 F3125.008
G1 X97.569 Y93.792 E.00283
; LINE_WIDTH: 0.655249
G1 F2880.378
G1 X97.571 Y93.839 E.00307
; LINE_WIDTH: 0.701838
G1 F2671.267
G1 X97.573 Y93.885 E.00331
; LINE_WIDTH: 0.748429
G1 F2490.463
G1 X97.574 Y93.932 E.00356
M204 S10000
G1 X96.913 Y94.317 F42000
; LINE_WIDTH: 0.518209
G1 F3742.002
M204 S5000
G1 X97.146 Y94.149 E.01455
; WIPE_START
M204 S6000
G1 X96.913 Y94.317 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.654 Y92.367 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.359509
G1 F5725.355
M204 S5000
G1 X96.824 Y92.491 E.00696
G1 X96.889 Y92.613 E.00459
; LINE_WIDTH: 0.383419
G1 F5301.969
G1 X96.833 Y92.883 E.00985
; LINE_WIDTH: 0.400089
G1 F5042.017
G1 X96.87 Y93.014 E.00515
G1 X96.698 Y92.8 E.01034
; LINE_WIDTH: 0.368789
G1 F5553.242
G1 X96.322 Y92.416 E.01835
; LINE_WIDTH: 0.354149
G1 F5829.714
G1 X96.5 Y92.347 E.00619
G1 X96.594 Y92.359 E.0031
; WIPE_START
M204 S6000
G1 X96.824 Y92.491 E-.10507
G1 X96.889 Y92.613 E-.05511
G1 X96.833 Y92.883 E-.10937
G1 X96.87 Y93.014 E-.05436
G1 X96.698 Y92.8 E-.10919
G1 X96.322 Y92.416 E-.21344
G1 X96.5 Y92.347 E-.0756
G1 X96.594 Y92.359 E-.03786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.187 Y94.361 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.445669
G1 F4445.992
M204 S5000
G1 X98.298 Y94.373 E.00477
; LINE_WIDTH: 0.491249
G1 F3975.985
G1 X98.41 Y94.386 E.00534
; LINE_WIDTH: 0.536829
G1 F3595.851
G1 X98.521 Y94.399 E.0059
; LINE_WIDTH: 0.558109
G1 F3442.202
G1 X98.762 Y94.526 E.01501
; WIPE_START
M204 S6000
G1 X98.521 Y94.399 E-.34054
G1 X98.41 Y94.386 E-.13982
G1 X98.298 Y94.373 E-.13982
G1 X98.187 Y94.361 E-.13982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.309 Y95.555 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.434889
G1 F4573.868
M204 S5000
G1 X98.174 Y95.535 E.00566
; LINE_WIDTH: 0.469689
G1 F4185.268
G1 X98.039 Y95.514 E.00619
; LINE_WIDTH: 0.475969
G1 F4122.068
G1 X97.821 Y95.393 E.01147
; WIPE_START
M204 S6000
G1 X98.039 Y95.514 E-.36266
G1 X98.174 Y95.535 E-.19866
G1 X98.309 Y95.555 E-.19868
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.125 Y93.699 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F4396.619
M204 S6000
G1 X92.933 Y93.657 E.0085
G1 X92.734 Y93.491 E.01114
G1 X92.624 Y93.232 E.01214
G1 X92.411 Y92.429 E.03583
G3 X92.562 Y91.864 I.697 J-.116 E.026
G1 X92.54 Y91.585 E.01205
G3 X92.694 Y91.29 I.546 J.097 E.01459
; LINE_WIDTH: 0.492054
G1 F3968.576
G1 X92.767 Y91.188 E.00598
; LINE_WIDTH: 0.534108
G1 F3616.484
G1 X92.839 Y91.086 E.00657
; LINE_WIDTH: 0.576164
G1 F3321.776
G1 X92.912 Y90.983 E.00715
; LINE_WIDTH: 0.618218
G1 F3071.481
G3 X93.09 Y90.78 I.611 J.357 E.0168
; LINE_WIDTH: 0.611389
G1 F3109.533
G1 X93.204 Y90.755 E.00709
; LINE_WIDTH: 0.571041
G1 F3355.079
G1 X93.317 Y90.73 E.00657
; LINE_WIDTH: 0.530693
G1 F3642.728
G1 X93.431 Y90.706 E.00605
; LINE_WIDTH: 0.490346
G1 F3984.325
G1 X93.545 Y90.681 E.00553
; LINE_WIDTH: 0.449998
G1 F4396.619
G1 X93.702 Y90.748 E.00739
G3 X94.643 Y89.865 I6.848 J6.358 E.05568
G1 X94.878 Y89.725 E.01178
G1 X95.28 Y89.618 E.01792
G1 X95.625 Y89.674 E.01507
G1 X96.05 Y89.881 E.02042
G1 X96.438 Y90.274 E.0238
G1 X96.675 Y90.683 E.02039
G1 X96.731 Y90.969 E.01254
G1 X97.276 Y91.178 E.02517
G1 X97.673 Y91.485 E.02163
G1 X98.017 Y91.895 E.02311
G1 X98.241 Y92.413 E.02433
G1 X98.281 Y92.902 E.02113
G1 X98.696 Y92.932 E.01791
G1 X99.195 Y93.123 E.02306
G1 X99.692 Y93.503 E.02698
G1 X100.034 Y93.892 E.02233
G1 X100.287 Y94.379 E.02368
G1 X100.372 Y94.88 E.0219
G1 X100.364 Y95.025 E.00625
G1 X100.743 Y94.966 E.01656
G1 X100.967 Y95.016 E.00991
G1 X101.445 Y95.269 E.02329
G1 X101.801 Y95.65 E.02248
G1 X102.07 Y96.183 E.02576
G3 X102.023 Y96.522 I-.546 J.096 E.01499
G1 X101.871 Y96.712 E.01049
G1 X101.387 Y97.1 E.02675
G1 X101.177 Y97.204 E.01009
G1 X100.835 Y97.183 E.0148
G1 X100.723 Y97.088 E.00631
G1 X100.437 Y97.373 E.01743
G1 X100.521 Y97.5 E.00655
G1 X100.546 Y97.842 E.0148
G1 X100.399 Y98.101 E.01285
G1 X99.953 Y98.548 E.02725
G1 X99.656 Y98.702 E.01441
G1 X99.481 Y98.705 E.00753
G1 X99.229 Y98.579 E.01217
G1 X98.871 Y98.933 E.02171
G1 X98.617 Y99.048 E.01203
G3 X98.052 Y98.797 I-.064 J-.618 E.02793
G1 X97.754 Y97.772 E.04605
G1 X97.736 Y97.622 E.00651
G1 X97.836 Y97.312 E.01405
G1 X97.905 Y97.207 E.00543
G3 X97.905 Y96.94 I.304 J-.133 E.01184
G1 X97.535 Y96.828 E.01669
G1 X97.11 Y96.555 E.02178
G1 X96.618 Y96.045 E.03054
G1 X96.345 Y95.558 E.02408
G1 X96.257 Y95.092 E.02043
G1 X96.277 Y94.859 E.01012
G1 X95.96 Y94.865 E.01368
G1 X95.483 Y94.743 E.02126
G1 X95.038 Y94.483 E.0222
G1 X94.676 Y94.112 E.02238
G1 X94.408 Y93.615 E.02433
G1 X94.346 Y93.329 E.01261
G1 X94.157 Y93.365 E.00831
G1 X93.884 Y93.238 E.01295
G1 X93.468 Y93.633 E.02472
G1 X93.194 Y93.714 E.01231
G1 X93.184 Y93.712 E.00045
M204 S10000
G1 X93.159 Y93.338 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X93.034 Y93.267 E.0057
G3 X92.775 Y92.237 I5.818 J-2.013 E.04234
G1 X93.065 Y91.915 E.01724
G1 X92.917 Y91.741 E.0091
G1 X92.937 Y91.583 E.00635
G1 X92.959 Y91.555 E.00143
G1 X93.408 Y91.107 E.02524
G1 X93.537 Y91.056 E.00553
G3 X93.766 Y91.214 I-.082 J.364 E.01136
G3 X94.889 Y90.148 I8.105 J7.416 E.06165
G1 X94.987 Y90.084 E.00467
G1 X95.335 Y89.993 E.01432
G1 X95.472 Y90.016 E.00553
G1 X95.838 Y90.192 E.01616
G1 X96.134 Y90.495 E.01686
G1 X96.36 Y90.919 E.01911
G1 X96.302 Y91.069 E.00643
G1 X95.81 Y91.465 E.02514
; LINE_WIDTH: 0.419778
G1 F4766.009
G1 X96.003 Y91.375 E.00849
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.466 Y91.31 E.01859
G1 X96.683 Y91.34 E.00875
G1 X97.079 Y91.498 E.01695
G1 X97.474 Y91.811 E.02008
G1 X97.753 Y92.184 E.01854
G1 X97.902 Y92.607 E.01784
G1 X97.899 Y93.025 E.01662
G1 X97.775 Y93.409 E.01607
G3 X98.524 Y93.284 I.648 J1.578 E.03051
G1 X99.014 Y93.453 E.02062
G1 X99.459 Y93.796 E.02236
G1 X99.771 Y94.171 E.01943
G1 X99.968 Y94.628 E.01979
G1 X99.995 Y94.977 E.01393
G1 X99.898 Y95.332 E.01466
; LINE_WIDTH: 0.409389
G1 F4907.775
G1 X99.62 Y95.65 E.01632
; LINE_WIDTH: 0.400194
G1 F5040.46
G1 X99.469 Y95.759 E.00702
; LINE_WIDTH: 0.431889
G1 F4610.774
G1 X99.317 Y95.868 E.00767
; LINE_WIDTH: 0.471703
G1 F4164.78
G1 X99.153 Y95.907 E.00767
; LINE_WIDTH: 0.511518
G1 F3797.456
G1 X98.989 Y95.945 E.00841
G1 X98.699 Y95.901 E.01466
G1 X98.905 Y96.245 E.02001
G1 X98.901 Y96.323 E.00392
G1 X98.824 Y96.385 E.00498
; LINE_WIDTH: 0.465759
G1 F4225.814
G1 X98.746 Y96.448 E.00447
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X98.512 Y96.543 E.01004
G1 X98.112 Y96.6 E.01606
G1 X97.733 Y96.51 E.01553
G1 X97.309 Y96.224 E.02034
G1 X96.889 Y95.785 E.02417
G1 X96.662 Y95.328 E.02032
G1 X96.632 Y94.991 E.01347
G1 X96.717 Y94.661 E.01356
; LINE_WIDTH: 0.465064
G1 F4233.065
G1 X96.812 Y94.491 E.00872
; LINE_WIDTH: 0.510128
G1 F3809.185
G1 X96.907 Y94.321 E.00969
G1 X96.667 Y94.395 E.01247
; LINE_WIDTH: 0.465064
G1 F4233.065
G1 X96.428 Y94.468 E.01122
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.034 Y94.497 E.01571
G1 X95.664 Y94.414 E.01511
G1 X95.274 Y94.191 E.01787
G1 X94.912 Y93.803 E.02114
G1 X94.731 Y93.398 E.01765
G1 X94.692 Y92.957 E.01762
; LINE_WIDTH: 0.420279
G1 F4759.393
G1 X94.772 Y92.513 E.01795
G1 X94.345 Y92.94 E.02407
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X94.176 Y92.988 E.00699
G1 X93.871 Y92.721 E.01613
G1 X93.306 Y93.286 E.03182
G1 X93.215 Y93.318 E.00382
; WIPE_START
M204 S6000
G1 X93.034 Y93.267 E-.07146
G1 X92.848 Y92.614 E-.25799
G1 X92.775 Y92.237 E-.14605
G1 X93.065 Y91.915 E-.16456
G1 X92.917 Y91.741 E-.08688
G1 X92.928 Y91.655 E-.03306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y88.974 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.576409
G1 F3320.2
M204 S5000
G1 X91.443 Y88.845 E.00867
; LINE_WIDTH: 0.569028
G1 F3368.345
G1 X91.425 Y88.763 E.00471
; LINE_WIDTH: 0.526793
G1 F3673.168
G1 X91.407 Y88.681 E.00432
; LINE_WIDTH: 0.484558
G1 F4038.65
G1 X91.389 Y88.599 E.00393
; LINE_WIDTH: 0.442324
G1 F4484.9
G1 X91.371 Y88.518 E.00354
; WIPE_START
M204 S6000
G1 X91.389 Y88.599 E-.13069
G1 X91.407 Y88.681 E-.13071
G1 X91.425 Y88.763 E-.13069
G1 X91.443 Y88.845 E-.13071
G1 X91.522 Y88.974 E-.2372
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.429 Y88.576 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F4396.619
M204 S6000
G1 X94.437 Y88.671 E.00409
G1 X94.326 Y88.914 E.01153
G3 X93.759 Y89.266 I-1.243 J-1.369 E.02897
G1 X93.192 Y89.794 E.03338
; LINE_WIDTH: 0.490346
G1 F3984.325
G1 X93.071 Y89.942 E.00912
; LINE_WIDTH: 0.530693
G1 F3642.728
G1 X92.949 Y90.09 E.00998
; LINE_WIDTH: 0.571041
G1 F3355.079
G1 X92.827 Y90.238 E.01083
; LINE_WIDTH: 0.611389
G1 F3109.533
G3 X92.569 Y90.471 I-.479 J-.271 E.02157
; LINE_WIDTH: 0.582789
G1 F3279.674
G1 X92.385 Y90.527 E.01112
; LINE_WIDTH: 0.538525
G1 F3583.099
G1 X92.201 Y90.583 E.01017
; LINE_WIDTH: 0.494262
G1 F3948.39
G1 X92.017 Y90.639 E.00923
; LINE_WIDTH: 0.449998
G1 F4396.619
G1 X91.562 Y90.635 E.01961
G1 X91.076 Y90.445 E.0225
G1 X90.587 Y90.05 E.02712
G1 X90.152 Y89.518 E.02963
G1 X89.952 Y88.984 E.02459
G1 X89.976 Y88.422 E.02426
G1 X90.23 Y87.836 E.02752
G1 X90.48 Y87.658 E.01325
G1 X90.719 Y87.634 E.01038
; LINE_WIDTH: 0.481559
G1 F4067.397
G1 X90.856 Y87.175 E.0223
; LINE_WIDTH: 0.527988
G1 F3663.787
G1 X90.897 Y87.076 E.00556
; LINE_WIDTH: 0.574418
G1 F3333.047
G1 X90.939 Y86.977 E.00611
; LINE_WIDTH: 0.620848
G1 F3057.076
G1 X90.98 Y86.878 E.00666
; LINE_WIDTH: 0.625108
G1 F3034.027
G3 X91.203 Y86.718 I.29 J.168 E.01762
; LINE_WIDTH: 0.581331
G1 F3288.845
G1 X91.332 Y86.661 E.00814
; LINE_WIDTH: 0.537553
G1 F3590.391
G1 X91.461 Y86.604 E.00745
; LINE_WIDTH: 0.493776
G1 F3952.813
G1 X91.59 Y86.547 E.00677
; LINE_WIDTH: 0.449998
G1 F4396.619
G1 X92.084 Y86.461 E.02163
G1 X92.502 Y86.536 E.01829
G1 X92.975 Y86.801 E.02341
G1 X93.328 Y87.175 E.02216
G1 X93.5 Y87.494 E.01562
G1 X93.735 Y87.627 E.01164
G1 X94.284 Y88.176 E.0335
G1 X94.413 Y88.377 E.01029
G1 X94.424 Y88.516 E.00601
M204 S10000
G1 X94.072 Y88.572 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X94.007 Y88.707 E.00598
G1 X93.511 Y88.985 E.0226
G2 X92.384 Y90.062 I20.532 J22.606 E.06209
G1 X92.001 Y90.265 E.01723
G1 X91.636 Y90.266 E.01452
G1 X91.242 Y90.105 E.01695
G3 X90.476 Y89.331 I1.71 J-2.456 E.04358
G1 X90.322 Y88.907 E.01795
G1 X90.34 Y88.517 E.01555
G1 X90.545 Y88.046 E.02042
G1 X90.691 Y88.003 E.00607
G3 X91.328 Y88.465 I-1.347 J2.529 E.03143
G1 X91.12 Y88.098 E.0168
G1 X91.079 Y87.742 E.01426
G1 X91.175 Y87.401 E.01412
G1 X91.394 Y87.111 E.01447
G1 X91.759 Y86.888 E.017
G1 X92.129 Y86.84 E.01487
G1 X92.36 Y86.883 E.00935
G1 X92.713 Y87.069 E.01589
G1 X93.002 Y87.361 E.01635
G1 X93.176 Y87.684 E.01462
G1 X93.216 Y87.882 E.00802
G1 X93.354 Y87.84 E.00574
G1 X93.508 Y87.93 E.00711
G1 X94.019 Y88.441 E.02876
G1 X94.049 Y88.516 E.0032
; WIPE_START
M204 S6000
G1 X94.007 Y88.707 E-.07439
G1 X93.511 Y88.985 E-.21581
G1 X92.618 Y89.839 E-.4698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.857 Y86.103 Z.88 F42000
M73 P22 R26
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.434889
G1 F4573.868
M204 S5000
G1 X88.722 Y86.082 E.00566
; LINE_WIDTH: 0.469689
G1 F4185.268
G1 X88.587 Y86.061 E.00619
; LINE_WIDTH: 0.475929
G1 F4122.465
G1 X88.369 Y85.94 E.01147
; WIPE_START
M204 S6000
G1 X88.587 Y86.061 E-.36271
G1 X88.722 Y86.082 E-.19865
G1 X88.857 Y86.103 E-.19865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.735 Y84.908 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.445669
G1 F4445.992
M204 S5000
G1 X88.846 Y84.921 E.00477
; LINE_WIDTH: 0.491249
G1 F3975.985
G1 X88.957 Y84.933 E.00534
; LINE_WIDTH: 0.536829
G1 F3595.851
G1 X89.068 Y84.946 E.0059
; LINE_WIDTH: 0.558109
G1 F3442.202
G1 X89.309 Y85.074 E.01501
; WIPE_START
M204 S6000
G1 X89.068 Y84.946 E-.34047
G1 X88.957 Y84.933 E-.13985
G1 X88.846 Y84.921 E-.13983
G1 X88.735 Y84.908 E-.13984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.66 Y84.649 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.635608
G1 F2978.673
M204 S5000
G1 X87.716 Y84.561 E.00666
; LINE_WIDTH: 0.590836
G1 F3229.946
G1 X87.772 Y84.473 E.00614
; LINE_WIDTH: 0.546063
G1 F3527.518
G1 X87.829 Y84.385 E.00562
; LINE_WIDTH: 0.501291
G1 F3885.485
G1 X87.885 Y84.296 E.0051
; LINE_WIDTH: 0.462108
G1 F4264.18
G1 X88.146 Y84.04 E.01627
G1 X88.151 Y84.273 E.01037
; LINE_WIDTH: 0.457339
G1 F4315.383
G1 X88.483 Y84.7 E.0238
; LINE_WIDTH: 0.456519
G1 F4324.309
G1 X88.147 Y84.628 E.01506
; LINE_WIDTH: 0.501291
G1 F3885.485
G1 X88.025 Y84.633 E.00596
; LINE_WIDTH: 0.546063
G1 F3527.518
G1 X87.904 Y84.639 E.00656
; LINE_WIDTH: 0.590836
G1 F3229.946
G1 X87.782 Y84.644 E.00717
; LINE_WIDTH: 0.635608
G1 F2978.673
G1 X87.72 Y84.646 E.00395
M204 S10000
G1 X87.37 Y84.904 F42000
G1 F2978.673
M204 S5000
G1 X87.66 Y84.649 E.02453
; WIPE_START
M204 S6000
G1 X87.37 Y84.904 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.554 Y85.367 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.400089
G1 F5042.017
M204 S5000
G1 X85.995 Y84.808 E.02973
; WIPE_START
M204 S6000
G1 X86.554 Y85.367 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.745 Y87.002 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F4396.619
M204 S6000
G1 X89.742 Y87.032 E.00134
G1 X89.597 Y87.236 E.0108
G1 X89.167 Y87.45 E.0207
G1 X88.666 Y87.525 E.02184
G1 X88.154 Y87.413 E.02257
G1 X87.713 Y87.146 E.02225
G1 X87.166 Y86.592 E.03358
G1 X86.893 Y86.105 E.02407
G1 X86.829 Y85.859 E.01097
G1 X86.344 Y86.342 E.0295
G1 X86.203 Y86.457 E.00785
G1 X85.892 Y86.532 E.01382
G1 X85.688 Y86.48 E.00904
G1 X85.531 Y86.37 E.00826
G1 X84.982 Y85.82 E.03352
G1 X84.848 Y85.605 E.01092
G1 X84.82 Y85.391 E.00933
G1 X84.907 Y85.129 E.01188
G3 X85.605 Y84.438 I5.226 J4.581 E.0424
G3 X87.497 Y82.52 I38.223 J35.828 E.11618
G3 X87.89 Y82.212 I.841 J.668 E.02173
G1 X88.192 Y82.2 E.01304
G1 X88.412 Y82.309 E.01059
G1 X89.005 Y82.897 E.036
G3 X89.154 Y83.463 I-.492 J.432 E.02616
G1 X89.696 Y83.65 E.02474
G1 X90.24 Y84.05 E.02909
G1 X90.581 Y84.439 E.02232
G1 X90.834 Y84.927 E.02368
G1 X90.919 Y85.427 E.0219
G1 X90.843 Y85.901 E.02071
; LINE_WIDTH: 0.493776
G1 F3952.813
G1 X90.796 Y86.027 E.00642
; LINE_WIDTH: 0.537553
G1 F3590.391
G1 X90.749 Y86.152 E.00706
; LINE_WIDTH: 0.581331
G1 F3288.845
G1 X90.702 Y86.277 E.00771
; LINE_WIDTH: 0.625108
G1 F3034.027
G3 X90.548 Y86.514 I-.352 J-.06 E.01813
; LINE_WIDTH: 0.610898
G1 F3112.3
G1 X90.433 Y86.567 E.00775
; LINE_WIDTH: 0.570674
G1 F3357.493
G1 X90.317 Y86.621 E.00718
; LINE_WIDTH: 0.530448
G1 F3644.625
G1 X90.202 Y86.674 E.00662
; LINE_WIDTH: 0.490223
G1 F3985.46
G1 X90.087 Y86.728 E.00605
; LINE_WIDTH: 0.449998
G1 F4396.619
G1 X89.765 Y86.801 E.0142
G1 X89.751 Y86.942 E.0061
M204 S10000
G1 X89.395 Y86.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X89.301 Y86.986 E.00533
G1 X89.059 Y87.09 E.0105
G1 X88.66 Y87.147 E.01606
G1 X88.273 Y87.053 E.01585
G1 X87.893 Y86.81 E.01795
G1 X87.436 Y86.333 E.02628
G1 X87.209 Y85.876 E.02032
G1 X87.18 Y85.538 E.01348
; LINE_WIDTH: 0.456199
G1 F4327.802
G1 X87.249 Y85.198 E.01521
; LINE_WIDTH: 0.499669
G1 F3899.826
G1 X87.29 Y85.1 E.00516
; LINE_WIDTH: 0.543139
G1 F3548.879
G1 X87.33 Y85.002 E.00567
; LINE_WIDTH: 0.586609
G1 F3255.879
G1 X87.37 Y84.904 E.00618
G1 X87.28 Y84.964 E.00634
; LINE_WIDTH: 0.544956
G1 F3535.576
G1 X87.19 Y85.025 E.00584
; LINE_WIDTH: 0.503303
G1 F3867.843
G1 X87.099 Y85.086 E.00534
; LINE_WIDTH: 0.461651
G1 F4269.039
G1 X87.009 Y85.147 E.00484
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X86.734 Y85.409 E.01513
G1 X86.554 Y85.367 E.00737
G1 X86.596 Y85.547 E.00737
G1 X86.079 Y86.077 E.02947
G1 X85.934 Y86.157 E.00661
G1 X85.847 Y86.141 E.00351
G1 X85.247 Y85.555 E.03338
G1 X85.195 Y85.416 E.00593
G1 X85.247 Y85.301 E.00503
G1 X85.795 Y84.761 E.03061
G1 X85.995 Y84.808 E.00817
G1 X85.961 Y84.589 E.0088
G3 X87.762 Y82.785 I325.893 J323.732 E.10147
G1 X87.94 Y82.608 E.00998
G1 X88.065 Y82.56 E.00537
G1 X88.19 Y82.612 E.00538
G1 X88.74 Y83.162 E.03094
G1 X88.792 Y83.293 E.00562
G1 X88.74 Y83.416 E.00534
; LINE_WIDTH: 0.451228
G1 F4382.793
G1 X88.223 Y83.955 E.03226
; LINE_WIDTH: 0.459089
G1 F4296.456
G1 X88.17 Y84.014 E.00353
G1 X88.523 Y83.879 E.01669
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X88.934 Y83.818 E.01656
G1 X89.164 Y83.847 E.00921
G1 X89.609 Y84.027 E.01911
G1 X90.006 Y84.343 E.02021
G1 X90.319 Y84.718 E.01943
G1 X90.514 Y85.158 E.01913
G1 X90.529 Y85.585 E.01704
G1 X90.45 Y85.882 E.01223
G1 X90.224 Y86.19 E.01521
G1 X89.864 Y86.409 E.01679
G1 X89.522 Y86.444 E.01367
G3 X89.084 Y86.293 I.114 J-1.045 E.0186
G1 X89.377 Y86.719 E.02059
G1 X89.389 Y86.83 E.00443
; WIPE_START
M204 S6000
G1 X89.301 Y86.986 E-.06781
G1 X89.059 Y87.09 E-.10022
G1 X88.66 Y87.147 E-.15335
G1 X88.273 Y87.053 E-.15131
G1 X87.893 Y86.81 E-.17137
G1 X87.682 Y86.589 E-.11594
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.747 Y81.993 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.434898
G1 F4573.746
M204 S5000
G1 X84.612 Y81.972 E.00566
; LINE_WIDTH: 0.469709
G1 F4185.064
G1 X84.477 Y81.951 E.00619
; LINE_WIDTH: 0.475969
G1 F4122.068
G1 X84.259 Y81.83 E.01147
; WIPE_START
M204 S6000
G1 X84.477 Y81.951 E-.36266
G1 X84.612 Y81.972 E-.19868
G1 X84.747 Y81.993 E-.19866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.625 Y80.798 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.445662
G1 F4446.07
M204 S5000
G1 X84.736 Y80.811 E.00477
; LINE_WIDTH: 0.491235
G1 F3976.108
G1 X84.847 Y80.823 E.00534
; LINE_WIDTH: 0.536808
G1 F3596.001
G1 X84.958 Y80.836 E.0059
; LINE_WIDTH: 0.558109
G1 F3442.202
G1 X85.199 Y80.964 E.01501
M204 S10000
G1 X84.373 Y80.59 F42000
; LINE_WIDTH: 0.456519
G1 F4324.309
M204 S5000
G1 X84.037 Y80.518 E.01506
; LINE_WIDTH: 0.501291
G1 F3885.485
G1 X83.916 Y80.523 E.00596
; LINE_WIDTH: 0.546063
G1 F3527.518
G1 X83.794 Y80.529 E.00656
; LINE_WIDTH: 0.590836
G1 F3229.946
G1 X83.672 Y80.534 E.00716
; LINE_WIDTH: 0.635608
G1 F2978.673
G1 X83.55 Y80.539 E.00777
G1 X83.606 Y80.451 E.00666
; LINE_WIDTH: 0.590836
G1 F3229.946
G1 X83.663 Y80.363 E.00614
; LINE_WIDTH: 0.546063
G1 F3527.518
G1 X83.719 Y80.275 E.00562
; LINE_WIDTH: 0.501291
G1 F3885.485
G1 X83.775 Y80.187 E.0051
; LINE_WIDTH: 0.462129
G1 F4263.968
G1 X84.036 Y79.93 E.01627
G1 X84.041 Y80.163 E.01037
; LINE_WIDTH: 0.457348
G1 F4315.274
G1 X84.336 Y80.543 E.02116
; WIPE_START
M204 S6000
G1 X84.037 Y80.518 E-.114
G1 X83.916 Y80.523 E-.04638
G1 X83.794 Y80.529 E-.04638
G1 X83.672 Y80.534 E-.04638
G1 X83.55 Y80.539 E-.04639
G1 X83.606 Y80.451 E-.03975
G1 X83.663 Y80.363 E-.03975
G1 X83.719 Y80.275 E-.03975
G1 X83.775 Y80.187 E-.03975
G1 X84.036 Y79.93 E-.13904
G1 X84.041 Y80.163 E-.08861
G1 X84.16 Y80.316 E-.07381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.263 Y80.79 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.635608
G1 F2978.673
M204 S5000
G1 X83.55 Y80.539 E.02427
; WIPE_START
M204 S6000
G1 X83.263 Y80.79 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.444 Y81.257 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.400089
G1 F5042.017
M204 S5000
G1 X81.885 Y80.698 E.02973
; WIPE_START
M204 S6000
G1 X82.444 Y81.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.843 Y78.923 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.481508
G1 F4067.88
M204 S5000
G1 X79.346 Y78.42 E.03316
; LINE_WIDTH: 0.483108
G1 F4052.494
G1 X79.371 Y78.393 E.00171
; WIPE_START
M204 S6000
G1 X79.346 Y78.42 E-.03715
G1 X78.843 Y78.923 E-.72285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.125 Y76.31 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F4396.619
M204 S6000
G1 X76.17 Y76.224 E.00417
G1 X76.66 Y75.734 E.02989
G1 X76.956 Y75.58 E.01441
G1 X77.132 Y75.577 E.00759
G1 X77.445 Y75.734 E.01506
G1 X77.837 Y76.127 E.02395
G1 X79.644 Y74.32 E.11014
G1 X79.94 Y74.166 E.01441
G1 X80.132 Y74.166 E.00827
G1 X80.428 Y74.32 E.01441
G1 X81.005 Y74.897 E.03517
G1 X81.141 Y75.119 E.01121
G1 X81.167 Y75.296 E.00772
; LINE_WIDTH: 0.464009
G1 F4244.122
G1 X81.01 Y75.687 E.01883
G1 X79.209 Y77.488 E.11378
G1 X79.494 Y77.774 E.01804
G1 X81.296 Y75.972 E.11378
G1 X81.687 Y75.815 E.01883
; LINE_WIDTH: 0.449998
G1 F4396.619
G1 X81.976 Y75.892 E.01291
G1 X82.635 Y76.527 E.03946
G3 X82.792 Y76.843 I-.392 J.392 E.01549
G1 X82.683 Y77.167 E.01474
G1 X83.008 Y77.058 E.01474
G1 X83.271 Y77.17 E.01235
G1 X83.873 Y77.765 E.03651
G1 X83.998 Y77.957 E.00987
G1 X83.957 Y78.154 E.00866
G1 X84.153 Y78.112 E.00866
G1 X84.345 Y78.237 E.00987
G1 X84.895 Y78.787 E.03352
G3 X85.044 Y79.353 I-.492 J.432 E.02616
G1 X85.586 Y79.54 E.02475
G1 X86.13 Y79.94 E.02909
G1 X86.471 Y80.329 E.02233
G1 X86.724 Y80.817 E.02368
G1 X86.809 Y81.317 E.0219
G1 X86.729 Y81.809 E.0215
G1 X86.473 Y82.243 E.02172
G1 X86.323 Y82.392 E.00912
G1 X85.88 Y82.655 E.02218
G1 X85.656 Y82.691 E.00983
G1 X85.629 Y82.929 E.0103
G1 X85.437 Y83.166 E.01314
G1 X85.014 Y83.35 E.01991
G1 X84.482 Y83.406 E.02308
G1 X83.972 Y83.266 E.02279
G1 X83.512 Y82.959 E.02382
G1 X83.056 Y82.482 E.02847
G1 X82.783 Y81.995 E.02408
G1 X82.719 Y81.749 E.01096
G1 X82.234 Y82.232 E.02949
G1 X82.093 Y82.347 E.00785
G1 X81.807 Y82.423 E.01278
G1 X81.544 Y82.353 E.0117
G1 X80.872 Y81.71 E.04011
G1 X80.732 Y81.476 E.01175
G1 X80.715 Y81.236 E.01039
G1 X80.872 Y80.926 E.01498
G1 X81.384 Y80.414 E.03121
G1 X81.468 Y80.351 E.00455
G1 X81.084 Y80.289 E.0168
G1 X80.622 Y80.059 E.02221
G1 X80.257 Y79.689 E.0224
G1 X79.868 Y80.065 E.02333
G1 X79.636 Y80.157 E.01075
G1 X79.343 Y80.121 E.01275
G1 X79.162 Y80 E.00938
G1 X78.612 Y79.451 E.03352
G1 X78.53 Y79.346 E.00573
G1 X78.539 Y79.227 E.00516
G1 X78.42 Y79.236 E.00516
G1 X78.315 Y79.154 E.00573
G1 X76.17 Y77.009 E.13082
G1 X76.016 Y76.712 E.01441
G1 X76.016 Y76.52 E.00827
G1 X76.098 Y76.363 E.00765
M204 S10000
G1 X76.435 Y76.489 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X76.925 Y75.999 E.02759
G1 X77.078 Y75.948 E.00643
G1 X77.18 Y75.999 E.00451
G1 X77.837 Y76.657 E.03703
G1 X79.909 Y74.586 E.11659
G1 X80.067 Y74.536 E.00661
G1 X80.163 Y74.586 E.00431
G1 X80.74 Y75.162 E.03246
G1 X80.793 Y75.292 E.00556
G1 X80.74 Y75.417 E.00541
G1 X78.669 Y77.488 E.11659
G1 X79.325 Y78.144 E.03693
; LINE_WIDTH: 0.451553
G1 F4379.155
G1 X79.348 Y78.268 E.00548
; LINE_WIDTH: 0.483108
G1 F4052.494
G1 X79.371 Y78.393 E.00592
G1 X79.639 Y78.147 E.01703
; LINE_WIDTH: 0.451553
G1 F4379.155
G1 X79.907 Y77.901 E.01576
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.566 Y76.243 E.09335
G1 X81.748 Y76.199 E.00748
G1 X82.37 Y76.792 E.03421
G1 X82.421 Y76.895 E.00456
; LINE_WIDTH: 0.462319
G1 F4261.954
G1 X82.419 Y76.96 E.00292
; LINE_WIDTH: 0.504638
G1 F3856.227
G1 X82.417 Y77.026 E.00323
; LINE_WIDTH: 0.546959
G1 F3521.034
G1 X82.415 Y77.092 E.00354
G1 X81.444 Y78.063 E.07395
G1 X81.156 Y78.468 E.02676
; LINE_WIDTH: 0.541638
G1 F3559.933
G1 X81.168 Y78.613 E.00772
G1 X81.335 Y78.766 E.01207
G1 X81.503 Y78.663 E.0105
; LINE_WIDTH: 0.546959
G1 F3521.034
G1 X81.799 Y78.396 E.02143
G1 X82.759 Y77.436 E.07313
G1 X82.85 Y77.444 E.00493
; LINE_WIDTH: 0.504638
G1 F3856.227
G1 X82.941 Y77.451 E.0045
; LINE_WIDTH: 0.462319
G1 F4261.954
G1 X83.033 Y77.459 E.00407
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X83.608 Y78.03 E.03227
G1 X83.649 Y78.093 E.00296
G1 X83.599 Y78.276 E.00755
; LINE_WIDTH: 0.393869
G1 F5135.975
G1 X82.449 Y79.425 E.06001
; LINE_WIDTH: 0.402439
G1 F5007.407
G1 X82.195 Y79.667 E.01328
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.776 Y79.929 E.01968
G1 X81.429 Y79.978 E.01391
G1 X81.109 Y79.903 E.01309
G1 X80.797 Y79.719 E.01443
G1 X80.493 Y79.376 E.01823
G1 X80.358 Y79.058 E.01374
G1 X79.681 Y79.735 E.03811
G1 X79.531 Y79.786 E.00631
G1 X79.427 Y79.735 E.00463
G1 X78.877 Y79.186 E.03094
; LINE_WIDTH: 0.450754
G1 F4388.122
G1 X78.86 Y79.054 E.00572
; LINE_WIDTH: 0.481508
G1 F4067.88
G1 X78.843 Y78.923 E.00617
G1 X78.712 Y78.906 E.00617
; LINE_WIDTH: 0.450754
G1 F4388.122
G1 X78.58 Y78.889 E.00572
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X76.435 Y76.743 E.12075
G1 X76.385 Y76.585 E.00661
G1 X76.407 Y76.542 E.00193
; WIPE_START
M204 S6000
G1 X76.925 Y75.999 E-.28521
G1 X77.078 Y75.948 E-.06135
G1 X77.18 Y75.999 E-.04306
G1 X77.837 Y76.657 E-.35356
G1 X77.869 Y76.625 E-.01683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.675 Y81.579 Z.88 F42000
G1 X85.194 Y82.875 Z.88
G1 Z.48
G1 E.8 F1800
G1 F4763.096
M204 S5000
G3 X84.55 Y83.037 I-.71 J-1.459 E.02661
G1 X84.17 Y82.947 E.01553
G1 X83.783 Y82.7 E.01829
G1 X83.326 Y82.223 E.02628
G1 X83.099 Y81.766 E.02032
G1 X83.07 Y81.429 E.01347
; LINE_WIDTH: 0.454289
G1 F4348.771
G1 X83.14 Y81.089 E.01513
; LINE_WIDTH: 0.497555
G1 F3918.666
G1 X83.18 Y80.99 E.00514
; LINE_WIDTH: 0.540822
G1 F3565.981
G1 X83.22 Y80.892 E.00565
; LINE_WIDTH: 0.584089
G1 F3271.538
G1 X83.26 Y80.794 E.00615
G1 X83.17 Y80.854 E.00631
; LINE_WIDTH: 0.543066
G1 F3549.412
G1 X83.08 Y80.915 E.00582
; LINE_WIDTH: 0.502043
G1 F3878.87
G1 X82.989 Y80.976 E.00532
; LINE_WIDTH: 0.461021
G1 F4275.746
G1 X82.899 Y81.037 E.00483
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X82.624 Y81.299 E.01513
G1 X82.444 Y81.257 E.00737
G1 X82.486 Y81.437 E.00737
G1 X81.969 Y81.967 E.02947
G1 X81.824 Y82.048 E.00662
G1 X81.687 Y81.995 E.00584
G1 X81.137 Y81.445 E.03094
G1 X81.086 Y81.291 E.00645
G1 X81.137 Y81.191 E.00448
G1 X81.649 Y80.679 E.02881
G1 X81.734 Y80.641 E.00374
; LINE_WIDTH: 0.412859
G1 F4859.5
G1 X81.885 Y80.698 E.00626
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.835 Y80.504 E.00798
G1 X82.408 Y79.932 E.03221
; LINE_WIDTH: 0.402439
G1 F5007.407
G1 X82.689 Y79.658 E.01485
; LINE_WIDTH: 0.393809
G1 F5136.898
G1 X83.835 Y78.512 E.05982
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X84.05 Y78.478 E.00866
G1 X84.63 Y79.052 E.03248
G1 X84.682 Y79.183 E.00562
G1 X84.63 Y79.307 E.00534
; LINE_WIDTH: 0.451239
G1 F4382.681
G1 X84.113 Y79.845 E.03226
; LINE_WIDTH: 0.459109
G1 F4296.24
G1 X84.06 Y79.904 E.00353
G1 X84.413 Y79.769 E.01669
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X84.824 Y79.708 E.01656
G1 X85.054 Y79.737 E.00922
G1 X85.499 Y79.917 E.01911
G1 X85.896 Y80.234 E.02021
G1 X86.209 Y80.609 E.01943
G1 X86.403 Y81.038 E.01875
G1 X86.433 Y81.414 E.01503
G1 X86.34 Y81.772 E.01473
G1 X86.114 Y82.081 E.01521
G1 X85.754 Y82.3 E.01679
G1 X85.412 Y82.334 E.01367
G3 X84.974 Y82.183 I.114 J-1.045 E.01861
G1 X85.267 Y82.609 E.0206
G1 X85.29 Y82.766 E.00631
G1 X85.233 Y82.83 E.0034
; WIPE_START
M204 S6000
G1 X84.83 Y83.001 E-.16659
G1 X84.55 Y83.037 E-.10722
G1 X84.17 Y82.947 E-.14825
G1 X83.783 Y82.7 E-.17459
G1 X83.486 Y82.389 E-.16335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.657 Y88.003 Z.88 F42000
G1 X98.49 Y98.679 Z.88
G1 Z.48
G1 E.8 F1800
G1 F4763.096
M204 S5000
G1 X98.369 Y98.598 E.00581
G1 X98.116 Y97.676 E.03805
G1 X98.143 Y97.527 E.00603
G1 X98.408 Y97.258 E.01502
G1 X98.252 Y97.053 E.01024
G1 X98.302 Y96.898 E.00651
G1 X98.757 Y96.44 E.02569
; LINE_WIDTH: 0.465759
G1 F4225.814
G1 X98.84 Y96.399 E.00416
; LINE_WIDTH: 0.511518
G1 F3797.456
G1 X98.923 Y96.357 E.00463
G1 X99.109 Y96.492 E.01144
G1 X99.272 Y96.356 E.01061
; LINE_WIDTH: 0.473408
G1 F4147.599
G1 X99.435 Y96.219 E.00971
; LINE_WIDTH: 0.435299
G1 F4568.87
G1 X99.599 Y96.083 E.00882
; LINE_WIDTH: 0.409389
G1 F4907.775
G1 X100.157 Y95.563 E.0295
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X100.33 Y95.427 E.00873
G1 X100.705 Y95.339 E.01535
G1 X101.127 Y95.498 E.01796
G1 X101.476 Y95.838 E.0194
G1 X101.704 Y96.279 E.01976
G1 X101.636 Y96.419 E.0062
G1 X101.152 Y96.807 E.02469
G3 X100.973 Y96.834 I-.113 J-.14 E.00755
G3 X100.756 Y96.544 I1.13 J-1.075 E.01448
G2 X99.915 Y97.363 I20.804 J22.182 E.04671
G1 X100.174 Y97.641 E.01511
G1 X100.169 Y97.787 E.00583
G1 X99.688 Y98.283 E.02751
G1 X99.535 Y98.334 E.00641
G1 X99.433 Y98.283 E.00453
G1 X99.214 Y98.064 E.01234
G1 X98.648 Y98.629 E.03182
G1 X98.547 Y98.661 E.00422
; WIPE_START
M204 S6000
G1 X98.369 Y98.598 E-.07195
G1 X98.116 Y97.676 E-.36324
G1 X98.143 Y97.527 E-.05758
G1 X98.408 Y97.258 E-.14335
G1 X98.252 Y97.053 E-.09773
G1 X98.273 Y96.988 E-.02614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.934 Y90.709 Z.88 F42000
G1 X92.087 Y88.034 Z.88
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.380859
G1 F5344.283
M204 S5000
G1 X92.14 Y87.963 E.00317
G3 X92.405 Y88.04 I.075 J.236 E.01038
G1 X92.492 Y88.272 E.00878
G1 X92.487 Y88.357 E.00303
G1 X92.346 Y88.558 E.00871
G3 X92.107 Y88.091 I1.731 J-1.184 E.01867
; WIPE_START
M204 S6000
G1 X92.14 Y87.963 E-.0661
G1 X92.285 Y87.961 E-.07237
G1 X92.405 Y88.04 E-.07127
G1 X92.492 Y88.272 E-.12336
G1 X92.487 Y88.357 E-.04261
G1 X92.346 Y88.558 E-.1223
G1 X92.216 Y88.34 E-.1263
G1 X92.107 Y88.091 E-.13569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.433 Y93.558 Z.88 F42000
G1 X101.124 Y97.346 Z.88
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421779
G1 F4739.655
M204 S6000
G1 X100.687 Y97.783 E.02471
M204 S10000
G1 X102.864 Y101.233 F42000
G1 F4739.655
M204 S6000
G1 X103.433 Y100.664 E.03221
G1 X103.433 Y100.152 E.02046
G1 X102.514 Y101.071 E.05198
G1 X102.002 Y101.071 E.02046
G1 X103.433 Y99.641 E.08092
G1 X103.433 Y99.129 E.02046
G1 X101.491 Y101.071 E.10985
G1 X100.979 Y101.071 E.02046
G1 X103.433 Y98.618 E.13879
G1 X103.433 Y98.106 E.02046
G1 X100.468 Y101.071 E.16772
G1 X99.956 Y101.071 E.02046
G1 X103.433 Y97.595 E.19666
G1 X103.433 Y97.083 E.02046
G1 X99.445 Y101.071 E.22559
G1 X98.933 Y101.071 E.02046
G1 X103.433 Y96.572 E.25453
G1 X103.433 Y96.06 E.02046
G1 X98.422 Y101.071 E.28346
G1 X97.91 Y101.071 E.02046
G1 X103.433 Y95.549 E.31239
G1 X103.433 Y95.037 E.02046
G1 X102.373 Y96.097 E.05998
G2 X102.219 Y95.74 I-1.085 J.256 E.01565
G1 X103.433 Y94.526 E.06869
G1 X103.433 Y94.014 E.02046
G1 X102.024 Y95.423 E.07972
G2 X101.78 Y95.156 I-1.133 J.787 E.01452
G1 X103.433 Y93.503 E.09351
G1 X103.433 Y92.991 E.02046
G1 X101.498 Y94.926 E.10944
G2 X101.154 Y94.758 I-.593 J.778 E.0154
G1 X103.433 Y92.48 E.12888
G1 X103.433 Y91.968 E.02046
G1 X100.752 Y94.649 E.15163
G2 X100.666 Y94.653 I-.035 J.18 E.00351
G2 X100.593 Y94.296 I-1.174 J.052 E.01461
G1 X103.433 Y91.457 E.16063
G1 X103.433 Y90.945 E.02046
G1 X100.43 Y93.948 E.16986
G2 X100.23 Y93.636 I-1.314 J.624 E.01485
G1 X103.433 Y90.434 E.18118
G1 X103.433 Y89.922 E.02046
G1 X99.99 Y93.365 E.19478
G2 X99.722 Y93.122 I-.832 J.645 E.01456
G1 X103.433 Y89.411 E.20994
G1 X103.433 Y88.899 E.02046
G1 X99.432 Y92.9 E.22633
G2 X99.079 Y92.741 I-.57 J.792 E.01557
G1 X103.433 Y88.387 E.24626
G1 X103.433 Y87.876 E.02046
G1 X98.695 Y92.614 E.26801
G1 X98.586 Y92.599 E.00438
G2 X98.521 Y92.276 I-.603 J-.046 E.01334
G1 X103.433 Y87.364 E.27785
G1 X103.433 Y86.853 E.02046
G1 X98.383 Y91.903 E.28568
G2 X98.182 Y91.593 I-1.246 J.586 E.01484
G1 X103.433 Y86.341 E.29705
G1 X103.433 Y85.83 E.02046
G1 X97.949 Y91.314 E.31024
G2 X97.669 Y91.082 I-1.058 J.989 E.01457
G1 X103.433 Y85.318 E.32604
G1 X103.433 Y84.807 E.02046
G1 X97.37 Y90.87 E.34296
G3 X97.011 Y90.717 I10.169 J-24.42 E.0156
G1 X103.433 Y84.295 E.36326
G1 X103.433 Y83.784 E.02046
G1 X96.854 Y90.363 E.37214
G1 X96.656 Y90.049 E.01483
G1 X103.433 Y83.272 E.38334
G1 X103.433 Y82.761 E.02046
G1 X96.407 Y89.787 E.39746
G2 X96.128 Y89.554 I-.812 J.687 E.0146
G1 X103.433 Y82.249 E.41321
G1 X103.433 Y81.738 E.02046
G1 X95.773 Y89.398 E.43332
G2 X95.355 Y89.304 I-.493 J1.215 E.01719
G1 X103.433 Y81.226 E.45693
G1 X103.433 Y80.715 E.02046
G1 X94.682 Y89.465 E.49499
G2 X94.491 Y89.579 I.191 J.541 E.00895
G2 X93.619 Y90.384 I5.324 J6.644 E.04752
G1 X93.564 Y90.361 E.00236
G1 X93.225 Y90.411 E.01372
G1 X103.433 Y80.203 E.57743
G1 X103.433 Y79.692 E.02046
G1 X94.742 Y88.383 E.49162
G1 X94.645 Y88.128 E.01092
G1 X94.575 Y88.038 E.00453
G1 X103.433 Y79.18 E.50106
G1 X103.433 Y78.669 E.02046
G1 X94.329 Y87.773 E.51501
G1 X94.073 Y87.518 E.01447
G1 X103.433 Y78.157 E.52948
G1 X103.433 Y77.646 E.02046
G1 X93.792 Y87.287 E.54539
G1 X93.734 Y87.25 E.00274
G1 X93.579 Y86.989 E.01215
G1 X103.433 Y77.134 E.55743
G1 X103.433 Y76.623 E.02046
G1 X93.338 Y86.718 E.57104
G2 X93.068 Y86.477 I-.967 J.814 E.01454
G1 X103.433 Y76.111 E.58634
G1 X103.433 Y75.6 E.02046
G1 X92.734 Y86.299 E.6052
G2 X92.348 Y86.173 I-.609 J1.221 E.01631
G1 X103.433 Y75.088 E.62706
G1 X103.433 Y74.577 E.02046
G1 X91.834 Y86.175 E.6561
G2 X91.186 Y86.382 I.193 J1.726 E.0274
G1 X91.1 Y86.398 E.0035
G1 X103.433 Y74.065 E.69764
G1 X103.433 Y73.554 E.02046
G1 X91.184 Y85.802 E.69287
G2 X91.218 Y85.257 I-1.401 J-.361 E.02199
G1 X103.433 Y73.042 E.69095
G1 X103.433 Y72.531 E.02046
G1 X91.134 Y84.829 E.6957
G1 X90.968 Y84.484 E.01532
G1 X103.433 Y72.019 E.70513
G1 X103.433 Y71.508 E.02046
G1 X90.765 Y84.176 E.71659
G1 X90.532 Y83.897 E.01452
G1 X102.922 Y71.507 E.70087
G1 X102.41 Y71.507 E.02046
G1 X90.257 Y83.661 E.68751
G2 X89.965 Y83.441 I-.81 J.77 E.01467
G1 X101.899 Y71.507 E.67506
G1 X101.387 Y71.507 E.02046
G1 X89.614 Y83.28 E.66597
G1 X89.469 Y83.225 E.00623
G1 X89.42 Y82.963 E.01064
G1 X100.876 Y71.507 E.64803
G1 X100.364 Y71.507 E.02046
G1 X89.206 Y82.665 E.63118
G1 X88.952 Y82.408 E.01447
G1 X99.853 Y71.507 E.61661
G1 X99.341 Y71.507 E.02046
G1 X88.699 Y82.15 E.60204
G2 X88.398 Y81.94 I-.644 J.601 E.0148
G1 X98.83 Y71.507 E.59013
G1 X98.318 Y71.507 E.02046
G1 X87.948 Y81.878 E.58665
G1 X87.909 Y81.881 E.00156
G2 X87.471 Y82.099 I.147 J.843 E.01983
G1 X85.482 Y84.088 E.11249
G3 X85.274 Y84.295 I-.559 J-.351 E.01186
G1 X84.745 Y84.825 E.02994
G2 X84.517 Y85.309 I.66 J.608 E.02176
G1 X73.869 Y95.957 E.60231
G1 X73.869 Y96.468 E.02046
G1 X84.576 Y85.761 E.60566
G2 X84.785 Y86.063 I.609 J-.198 E.01491
G1 X73.869 Y96.98 E.61751
G1 X73.869 Y97.491 E.02046
G1 X85.04 Y86.32 E.63192
G1 X85.295 Y86.577 E.01447
G1 X73.869 Y98.003 E.64634
G1 X73.869 Y98.514 E.02046
G1 X85.601 Y86.782 E.66363
G2 X86.055 Y86.84 I.321 J-.712 E.01858
G1 X73.869 Y99.026 E.68932
G1 X73.869 Y99.537 E.02046
G1 X86.801 Y86.605 E.73153
G2 X87.023 Y86.894 I.634 J-.257 E.01477
G1 X73.869 Y100.049 E.7441
G1 X73.869 Y100.56 E.02046
G1 X87.273 Y87.156 E.75824
G1 X87.459 Y87.351 E.01076
G1 X87.54 Y87.401 E.00381
G1 X73.87 Y101.071 E.77329
G1 X74.381 Y101.071 E.02046
G1 X87.855 Y87.597 E.76219
G2 X88.214 Y87.749 I.404 J-.455 E.01589
G1 X74.893 Y101.071 E.75358
G1 X75.404 Y101.071 E.02046
G1 X88.64 Y87.835 E.74871
G1 X88.806 Y87.836 E.00665
G1 X89.226 Y87.761 E.01707
G1 X75.916 Y101.071 E.75294
G1 X76.427 Y101.071 E.02046
G1 X90.59 Y86.908 E.80116
G3 X90.471 Y87.336 I-2.515 J-.469 E.01776
G2 X89.857 Y87.854 I.22 J.884 E.0333
G1 X89.671 Y88.339 E.02077
G1 X76.939 Y101.071 E.72024
G1 X77.45 Y101.071 E.02046
G1 X89.633 Y88.888 E.68917
G2 X89.726 Y89.307 I.969 J.006 E.01731
G1 X77.962 Y101.071 E.66546
G1 X78.473 Y101.071 E.02046
G1 X89.878 Y89.666 E.64515
G2 X90.095 Y89.961 I1.214 J-.668 E.01467
G1 X78.985 Y101.071 E.62849
G1 X79.496 Y101.071 E.02046
G1 X90.327 Y90.24 E.61267
G1 X90.609 Y90.47 E.01454
G1 X80.008 Y101.071 E.59969
G1 X80.519 Y101.071 E.02046
G1 X90.891 Y90.699 E.5867
G1 X91.248 Y90.854 E.01556
G1 X81.031 Y101.071 E.57796
G1 X81.542 Y101.071 E.02046
G1 X91.65 Y90.963 E.57179
G1 X92.192 Y90.933 E.0217
G1 X82.054 Y101.071 E.5735
G1 X82.565 Y101.071 E.02046
G1 X92.281 Y91.355 E.54959
G2 X92.232 Y91.799 I.718 J.304 E.0181
G2 X92.115 Y92.033 I.398 J.346 E.01059
G1 X83.077 Y101.071 E.51125
G1 X83.588 Y101.071 E.02046
G1 X92.115 Y92.545 E.48232
M73 P23 R26
G1 X92.222 Y92.949 E.01674
G1 X84.1 Y101.071 E.45944
G1 X84.611 Y101.071 E.02046
G1 X92.329 Y93.354 E.43656
G2 X92.496 Y93.698 I.873 J-.211 E.01543
G1 X85.123 Y101.071 E.41709
G1 X85.634 Y101.071 E.02046
G1 X92.775 Y93.93 E.40394
G2 X93.187 Y94.03 I.426 J-.864 E.0171
G1 X86.146 Y101.071 E.39832
G1 X86.657 Y101.071 E.02046
G1 X94.062 Y93.667 E.41884
G1 X94.095 Y93.671 E.00133
G2 X94.246 Y93.994 I1.134 J-.333 E.01434
G1 X87.169 Y101.071 E.40033
G1 X87.68 Y101.071 E.02046
G1 X94.439 Y94.313 E.38231
G1 X94.691 Y94.572 E.01447
G1 X88.192 Y101.071 E.36763
G1 X88.703 Y101.071 E.02046
G1 X94.966 Y94.808 E.35427
G1 X95.296 Y94.99 E.01506
G1 X89.215 Y101.071 E.34399
G1 X89.726 Y101.071 E.02046
G1 X95.672 Y95.125 E.33634
G2 X95.951 Y95.18 I.351 J-1.048 E.01142
G1 X95.968 Y95.341 E.00646
G1 X90.238 Y101.071 E.32414
G1 X90.749 Y101.071 E.02046
G1 X96.084 Y95.737 E.30176
G1 X96.254 Y96.078 E.01525
G1 X91.261 Y101.071 E.28246
G1 X91.772 Y101.071 E.02046
G1 X96.483 Y96.36 E.26647
G1 X96.734 Y96.621 E.01447
G1 X92.284 Y101.071 E.25175
G1 X92.795 Y101.071 E.02046
G1 X97.005 Y96.862 E.23812
G1 X97.315 Y97.063 E.01479
G1 X93.307 Y101.071 E.22674
G1 X93.818 Y101.071 E.02046
G1 X97.447 Y97.442 E.20527
G2 X97.472 Y97.929 I.814 J.202 E.01976
G1 X94.33 Y101.071 E.17775
G1 X94.841 Y101.071 E.02046
G1 X97.578 Y98.335 E.15478
G1 X97.684 Y98.74 E.01675
G1 X95.353 Y101.071 E.13187
G1 X95.864 Y101.071 E.02046
G1 X97.871 Y99.064 E.11353
G2 X98.167 Y99.28 I.412 J-.253 E.01501
G1 X96.376 Y101.071 E.1013
G1 X96.887 Y101.071 E.02046
G1 X98.592 Y99.367 E.09641
G1 X98.7 Y99.356 E.00437
G1 X99.022 Y99.217 E.01399
G1 X99.297 Y98.955 E.01519
G1 X99.45 Y99.02 E.00666
G1 X97.237 Y101.233 E.12521
M204 S10000
G1 X73.707 Y95.607 F42000
G1 F4739.655
M204 S6000
G1 X97.807 Y71.507 E1.36327
G1 X97.295 Y71.507 E.02046
G1 X87.065 Y81.738 E.57872
G1 X87.129 Y81.412 E.0133
G1 X87.109 Y81.182 E.00921
G1 X96.784 Y71.507 E.54728
G1 X96.272 Y71.507 E.02046
G1 X87.031 Y80.749 E.52277
G1 X86.872 Y80.397 E.01546
G1 X95.761 Y71.507 E.50285
G1 X95.249 Y71.507 E.02046
G1 X86.671 Y80.086 E.48525
G1 X86.442 Y79.803 E.01454
G1 X94.738 Y71.507 E.46929
G1 X94.226 Y71.507 E.02046
G1 X86.162 Y79.571 E.45615
G1 X85.879 Y79.343 E.01455
G1 X93.715 Y71.507 E.44326
G1 X93.203 Y71.507 E.02046
G1 X85.53 Y79.18 E.43404
G1 X85.359 Y79.115 E.00734
G1 X85.319 Y78.88 E.00953
G1 X92.692 Y71.507 E.41705
G1 X92.18 Y71.507 E.02046
G1 X85.121 Y78.566 E.3993
G1 X84.864 Y78.312 E.01447
G1 X91.669 Y71.507 E.38491
G1 X91.157 Y71.507 E.02046
G1 X84.607 Y78.057 E.37052
G2 X84.312 Y77.841 I-.558 J.452 E.0148
G1 X90.646 Y71.507 E.35829
G1 X90.134 Y71.507 E.02046
G1 X84.096 Y77.545 E.34156
G1 X83.84 Y77.29 E.01447
G1 X89.623 Y71.507 E.32714
G1 X89.111 Y71.507 E.02046
G1 X83.583 Y77.035 E.31272
G2 X83.292 Y76.815 I-.596 J.483 E.01474
G1 X88.6 Y71.507 E.30023
G1 X88.088 Y71.507 E.02046
G1 X83.036 Y76.559 E.28578
G2 X82.812 Y76.272 I-.653 J.277 E.01474
G1 X87.577 Y71.507 E.26951
G1 X87.065 Y71.507 E.02046
G1 X82.56 Y76.012 E.25484
G1 X82.308 Y75.753 E.01447
G1 X86.554 Y71.507 E.24016
G1 X86.042 Y71.507 E.02046
G1 X81.995 Y75.554 E.22893
G1 X81.67 Y75.495 E.01321
G1 X81.46 Y75.578 E.00903
G1 X85.531 Y71.507 E.23027
G1 X85.019 Y71.507 E.02046
G1 X81.451 Y75.075 E.20182
G2 X81.279 Y74.736 I-.808 J.199 E.01535
G1 X84.508 Y71.507 E.18266
G1 X83.996 Y71.507 E.02046
G1 X81.029 Y74.474 E.16783
G1 X80.774 Y74.218 E.01447
G1 X83.485 Y71.507 E.15336
G1 X82.973 Y71.507 E.02046
G1 X80.494 Y73.987 E.14025
G2 X80.116 Y73.853 I-.421 J.587 E.01624
G1 X82.462 Y71.507 E.13268
G1 X81.95 Y71.507 E.02046
G1 X77.808 Y75.649 E.23432
G2 X77.518 Y75.428 I-.479 J.326 E.01485
G1 X81.439 Y71.507 E.22177
G1 X80.927 Y71.507 E.02046
G1 X77.172 Y75.263 E.21244
G2 X76.444 Y75.502 I-.093 J.942 E.03155
G1 X75.938 Y76.008 E.02862
G1 X75.763 Y76.266 E.01244
G2 X75.701 Y76.734 I.868 J.354 E.01909
G1 X73.869 Y78.565 E.10361
G1 X73.869 Y79.077 E.02046
G1 X75.85 Y77.095 E.11209
G2 X76.086 Y77.372 I.842 J-.478 E.0146
G1 X73.869 Y79.588 E.12539
G1 X73.869 Y80.1 E.02046
G1 X76.341 Y77.628 E.13985
G1 X76.597 Y77.883 E.01447
G1 X73.869 Y80.611 E.15432
G1 X73.869 Y81.123 E.02046
G1 X76.853 Y78.139 E.16879
G1 X77.109 Y78.395 E.01447
G1 X73.869 Y81.634 E.18326
G1 X73.869 Y82.146 E.02046
G1 X77.364 Y78.651 E.19772
G1 X77.62 Y78.906 E.01447
G1 X73.869 Y82.657 E.21219
G1 X73.869 Y83.169 E.02046
G1 X77.876 Y79.162 E.22666
G2 X78.136 Y79.414 I1.173 J-.952 E.0145
G1 X73.869 Y83.68 E.24137
G1 X73.869 Y84.192 E.02046
G1 X78.387 Y79.674 E.25559
G1 X78.643 Y79.929 E.01447
G1 X73.869 Y84.703 E.27006
G1 X73.869 Y85.215 E.02046
G1 X78.899 Y80.185 E.28453
G2 X79.197 Y80.398 I.872 J-.904 E.01472
G1 X73.869 Y85.726 E.3014
G1 X73.869 Y86.238 E.02046
G1 X79.636 Y80.471 E.3262
G1 X79.689 Y80.471 E.00212
G1 X80.044 Y80.331 E.01529
G1 X80.251 Y80.137 E.01133
G1 X80.369 Y80.25 E.0065
G1 X73.869 Y86.749 E.36768
G1 X73.869 Y87.261 E.02046
G1 X80.677 Y80.453 E.38513
G2 X80.828 Y80.528 I.314 J-.436 E.00676
G1 X80.542 Y80.827 E.01653
G1 X80.401 Y81.183 E.01532
G1 X80.401 Y81.241 E.00229
G1 X73.869 Y87.772 E.36949
G1 X73.869 Y88.284 E.02046
G1 X80.474 Y81.679 E.37363
G2 X80.694 Y81.97 I.645 J-.258 E.01478
G1 X73.869 Y88.796 E.38608
G1 X73.869 Y89.307 E.02046
G1 X80.95 Y82.226 E.40056
G1 X81.206 Y82.481 E.01447
G1 X73.869 Y89.819 E.41504
G1 X73.869 Y90.33 E.02046
G1 X81.518 Y82.681 E.43268
G2 X81.997 Y82.714 I.281 J-.591 E.01965
G1 X73.869 Y90.842 E.45975
G1 X73.869 Y91.353 E.02046
G1 X82.704 Y82.518 E.49975
G2 X82.93 Y82.804 I.639 J-.275 E.01473
G1 X73.869 Y91.865 E.51255
G1 X73.869 Y92.376 E.02046
G1 X83.179 Y83.066 E.52662
G2 X83.447 Y83.31 I1.185 J-1.036 E.01452
G1 X73.869 Y92.888 E.54178
G1 X73.869 Y93.399 E.02046
G1 X83.765 Y83.503 E.55981
G2 X84.133 Y83.647 I.411 J-.507 E.01603
G1 X73.869 Y93.911 E.58059
G1 X73.869 Y94.422 E.02046
G1 X84.571 Y83.72 E.60539
G1 X84.727 Y83.721 E.00622
G1 X85.168 Y83.635 E.01798
G1 X73.707 Y95.096 E.64831
M204 S10000
G1 X73.707 Y78.216 F42000
G1 F4739.655
M204 S6000
G1 X80.416 Y71.507 E.37949
G1 X79.904 Y71.507 E.02046
G1 X73.869 Y77.542 E.34139
G1 X73.869 Y77.031 E.02046
G1 X79.393 Y71.507 E.31246
G1 X78.881 Y71.507 E.02046
G1 X73.869 Y76.519 E.28352
G1 X73.869 Y76.008 E.02046
G1 X78.37 Y71.507 E.25459
G1 X77.858 Y71.507 E.02046
G1 X73.869 Y75.496 E.22565
G1 X73.869 Y74.985 E.02046
G1 X77.347 Y71.507 E.19672
G1 X76.835 Y71.507 E.02046
G1 X73.869 Y74.473 E.16779
G1 X73.869 Y73.962 E.02046
G1 X76.324 Y71.507 E.13885
G1 X75.812 Y71.507 E.02046
G1 X73.869 Y73.45 E.10992
G1 X73.869 Y72.939 E.02046
G1 X75.301 Y71.507 E.08098
G1 X74.789 Y71.507 E.02046
G1 X73.869 Y72.427 E.05205
G1 X73.869 Y71.916 E.02046
G1 X74.44 Y71.345 E.03227
; WIPE_START
G1 X73.869 Y71.916 E-.30661
G1 X73.869 Y72.427 E-.19437
G1 X74.351 Y71.945 E-.25902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.88
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X49.5 Y163.318 F42000
G1 Z.48
G1 E.8 F1800
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X49.250 Y164.318  
M204 S6000
G1  X15.000  E1.7540 F3897
G1  Y158.318  E0.3073
G1  X50.000  E1.7924
G1  Y162.568  E0.2176
M204 S10000
G1  X50.440 Y164.758  
M204 S6000
G1  X14.560  E1.8374
G1  Y157.878  E0.3523
G1  X50.440  E1.8374
G1  Y164.758  E0.3523
M204 S10000
G1  X50.880 Y165.198  
M204 S6000
G1  X14.120  E1.8825
G1  Y157.438  E0.3974
G1  X50.880  E1.8825
G1  Y165.198  E0.3974
M204 S10000
G1  X51.320 Y165.638  
M204 S6000
G1  X13.680  E1.9275
G1  Y156.998  E0.4424
G1  X51.320  E1.9275
G1  Y165.638  E0.4424
M204 S10000
G1  X51.760 Y166.078  
M204 S6000
G1  X13.240  E1.9726
G1  Y156.558  E0.4875
G1  X51.760  E1.9726
G1  Y166.078  E0.4875
M204 S10000
G1  X52.200 Y166.518  
M204 S6000
G1  X12.800  E2.0176
G1  Y156.118  E0.5325
G1  X52.200  E2.0176
G1  Y166.518  E0.5325
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z.88 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z3.48 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T1
M73 E8
M620.1 E F199 T240
M620.10 A1 F199 L123.994 H0.4 T240

M73 P23 R25
G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
M73 P24 R25
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
M73 P27 R24
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P28 R24
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.48
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S0
M106 P2 S0
G1 X47.199 Y153.119 F42000
G1 Z.48
M73 P29 R24
G1 X54.831 Y153.119 Z.88
G1 X55.199 Y153.119 Z.88
G1 X55.199 Y163.818
G1 X49.5 Y163.818

; filament start gcode
M106 P3 S180



M400 U1
G1 Z.48
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
M73 P29 R23
G1  X46.500 Y163.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
M73 P30 R23
G1  X51.000  F600
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.5875 F1782
G1  Y163.318  E0.0256
G1  X49.500  E1.7412 F2025
G1  Y162.818  E0.0256
G1  X15.500  E1.7412 F2473
G1  Y162.318  E0.0256
G1  X49.500  E1.7412 F3897
G1  Y161.818  E0.0256
G1  X15.500  E1.7412
G1  Y161.318  E0.0256
G1  X49.500  E1.7412
G1  Y160.818  E0.0256
G1  X15.500  E1.7412
G1  Y160.318  E0.0256
G1  X49.500  E1.7412
G1  Y159.818  E0.0256
G1  X15.500  E1.7412
G1  Y159.318  E0.0256
G1  X49.500  E1.7412
G1  Y158.818  E0.0256
G1  X15.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F4739.655
M204 S6000
G1 X17.5 Y158.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.88 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X100.826 Y96.098
G1 Z.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.444858
; LAYER_HEIGHT: 0.28
G1 F4455.352
M204 S5000
G1 X100.613 Y96.136 E.00923
; LINE_WIDTH: 0.400499
G1 F5035.944
G1 X100.258 Y96.448 E.01777
; LINE_WIDTH: 0.389959
G1 F5196.853
G1 X99.459 Y97.246 E.0412
; LINE_WIDTH: 0.431879
G1 F4610.898
G1 X99.415 Y97.29 E.00257
; LINE_WIDTH: 0.473799
G1 F4143.689
G1 X99.371 Y97.334 E.00286
; LINE_WIDTH: 0.522793
G1 F3704.922
G1 X99.411 Y97.467 E.00711
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X99.451 Y97.6 E.00786
G1 X99.364 Y97.574 E.00513
; LINE_WIDTH: 0.537808
G1 F3588.474
G1 X99.278 Y97.547 E.00479
; LINE_WIDTH: 0.503828
G1 F3863.267
G1 X99.191 Y97.521 E.00445
; LINE_WIDTH: 0.469849
G1 F4183.634
G1 X99.144 Y97.564 E.0029
; LINE_WIDTH: 0.429909
M73 P31 R23
G1 F4635.46
G1 X99.097 Y97.608 E.00262
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X98.639 Y98.066 E.02365
G1 X98.541 Y97.697 E.01392
; LINE_WIDTH: 0.431884
G1 F4610.836
G1 X98.747 Y97.492 E.01195
; LINE_WIDTH: 0.473808
G1 F4143.589
G1 X98.952 Y97.286 E.0133
; LINE_WIDTH: 0.522798
G1 F3704.882
G1 X98.914 Y97.156 E.00696
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X98.876 Y97.025 E.0077
G1 X99.006 Y97.066 E.00769
; LINE_WIDTH: 0.527888
G1 F3664.57
G1 X99.136 Y97.106 E.00703
; LINE_WIDTH: 0.483988
G1 F4044.081
G1 X99.18 Y97.06 E.00303
; LINE_WIDTH: 0.436979
G1 F4548.504
G1 X99.225 Y97.013 E.00269
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X99.509 Y96.731 E.01459
G1 X100.023 Y96.22 E.02643
; LINE_WIDTH: 0.393979
G1 F5134.283
G1 X100.291 Y95.958 E.01383
; LINE_WIDTH: 0.412459
G1 F4865.016
G1 X100.592 Y95.77 E.01383
G1 X100.831 Y95.811 E.00945
; LINE_WIDTH: 0.444858
G1 F4455.352
G1 X100.94 Y95.905 E.00612
; LINE_WIDTH: 0.484709
G1 F4037.223
G1 X100.998 Y96 E.00525
; LINE_WIDTH: 0.524558
G1 F3690.843
G1 X101.056 Y96.096 E.00574
; LINE_WIDTH: 0.564408
G1 F3399.203
G1 X101.114 Y96.191 E.00623
G1 X101.018 Y96.16 E.00562
; LINE_WIDTH: 0.524558
G1 F3690.843
G1 X100.922 Y96.129 E.00518
; LINE_WIDTH: 0.484709
G1 F4037.223
G1 X100.883 Y96.117 E.00192
; WIPE_START
M204 S6000
G1 X100.613 Y96.136 E-.10316
G1 X100.258 Y96.448 E-.17935
G1 X99.459 Y97.246 E-.42917
G1 X99.415 Y97.29 E-.02372
G1 X99.371 Y97.334 E-.02372
G1 X99.371 Y97.336 E-.00088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.451 Y97.6 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.571788
G1 F3350.177
M204 S5000
G1 X99.56 Y97.709 E.00873
; WIPE_START
M204 S6000
G1 X99.451 Y97.6 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.109 Y96.059 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.639129
G1 F2960.565
M204 S5000
G1 X97.967 Y96.029 E.00931
; LINE_WIDTH: 0.603088
G1 F3157.064
G1 X97.825 Y96 E.00873
; LINE_WIDTH: 0.567048
G1 F3381.501
G1 X97.464 Y95.732 E.02515
; LINE_WIDTH: 0.534388
G1 F3614.349
G1 X97.267 Y95.494 E.01623
; LINE_WIDTH: 0.560889
G1 F3423.094
G1 X97.144 Y95.202 E.01757
; LINE_WIDTH: 0.595149
G1 F3203.913
G1 X97.155 Y95.008 E.0115
; WIPE_START
M204 S6000
G1 X97.144 Y95.202 E-.09464
G1 X97.267 Y95.494 E-.15453
G1 X97.464 Y95.732 E-.1507
G1 X97.825 Y96 E-.21854
G1 X97.967 Y96.029 E-.07079
G1 X98.109 Y96.059 E-.07079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.313 Y94.93 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.359899
G1 F5717.907
M204 S5000
G1 X99.341 Y94.709 E.00736
; LINE_WIDTH: 0.319309
G1 F6613.246
G1 X99.2 Y94.387 E.01009
; LINE_WIDTH: 0.290439
G1 F7442.091
G1 X98.938 Y94.117 E.00958
; LINE_WIDTH: 0.322289
G1 F6538.084
G1 X98.629 Y93.964 E.01001
; LINE_WIDTH: 0.363169
G1 F5656.215
G1 X98.304 Y93.987 E.01091
G1 X98.103 Y93.713 E.01139
G1 X98.219 Y93.675 E.00409
G1 X98.642 Y93.7 E.01421
; LINE_WIDTH: 0.324139
G1 F6492.277
G1 X99.009 Y93.882 E.01196
; LINE_WIDTH: 0.294668
G1 F7307.894
G1 X99.339 Y94.19 E.01171
; LINE_WIDTH: 0.310208
G1 F6853.854
G1 X99.538 Y94.502 E.01024
; LINE_WIDTH: 0.341419
G1 F6093.505
G1 X99.615 Y94.841 E.01081
; LINE_WIDTH: 0.344889
G1 F6019.262
G1 X99.61 Y94.903 E.00196
; LINE_WIDTH: 0.376049
G1 F5425.642
G1 X99.534 Y95.153 E.00915
; LINE_WIDTH: 0.398269
G1 F5069.151
G1 X99.364 Y95.36 E.01002
G1 X99.212 Y95.452 E.00665
G1 X98.997 Y95.48 E.00808
; LINE_WIDTH: 0.395039
G1 F5118.035
G1 X98.589 Y95.341 E.01599
; LINE_WIDTH: 0.375309
G1 F5438.379
G1 X97.682 Y94.848 E.03597
; LINE_WIDTH: 0.405409
G1 F4964.34
G1 X97.571 Y94.852 E.00425
; LINE_WIDTH: 0.438958
G1 F4524.734
G1 X97.459 Y94.856 E.00467
; LINE_WIDTH: 0.472508
G1 F4156.651
G1 X97.348 Y94.86 E.00508
; LINE_WIDTH: 0.511889
G1 F3794.346
G1 X97.288 Y94.901 E.00363
; LINE_WIDTH: 0.551268
G1 F3490.138
G1 X97.227 Y94.942 E.00395
; LINE_WIDTH: 0.590648
G1 F3231.088
G1 X97.167 Y94.982 E.00427
G1 X97.162 Y94.877 E.00622
; LINE_WIDTH: 0.542368
G1 F3554.545
G1 X97.197 Y94.79 E.00499
; LINE_WIDTH: 0.493552
G1 F3954.858
G1 X97.232 Y94.703 E.00449
; LINE_WIDTH: 0.444735
G1 F4456.78
G1 X97.268 Y94.617 E.00398
; LINE_WIDTH: 0.395919
G1 F5104.624
G1 X97.461 Y94.514 E.00811
; LINE_WIDTH: 0.385739
G1 F5264.197
G1 X97.713 Y94.525 E.00908
; LINE_WIDTH: 0.380249
G1 F5354.465
G1 X98.219 Y94.753 E.01966
; LINE_WIDTH: 0.378049
G1 F5391.514
G1 X98.797 Y95.09 E.02353
; LINE_WIDTH: 0.398369
G1 F5067.653
G1 X99.091 Y95.137 E.01111
G1 X99.269 Y94.971 E.00913
; WIPE_START
M204 S6000
G1 X99.341 Y94.709 E-.10287
G1 X99.2 Y94.387 E-.13374
G1 X98.938 Y94.117 E-.14284
G1 X98.629 Y93.964 E-.13119
G1 X98.304 Y93.987 E-.12368
G1 X98.108 Y93.72 E-.12569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.604 Y91.864 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.616288
G1 F3082.139
M204 S5000
G1 X96.785 Y91.937 E.01199
; LINE_WIDTH: 0.585069
G1 F3265.431
G1 X96.966 Y92.009 E.01132
; LINE_WIDTH: 0.553849
G1 F3471.901
G1 X97.227 Y92.267 E.02005
; LINE_WIDTH: 0.600568
G1 F3171.784
G1 X97.356 Y92.538 E.01794
; LINE_WIDTH: 0.626189
G1 F3028.238
G1 X97.367 Y92.671 E.00836
; LINE_WIDTH: 0.651809
G1 F2897.123
G1 X97.377 Y92.804 E.00874
; WIPE_START
M204 S6000
G1 X97.367 Y92.671 E-.07665
G1 X97.356 Y92.538 E-.07665
G1 X97.227 Y92.267 E-.17226
G1 X96.966 Y92.009 E-.21069
G1 X96.785 Y91.937 E-.11188
G1 X96.604 Y91.864 E-.11187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.604 Y91.864 Z.48 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.616288
G1 F3082.139
M204 S5000
G1 X96.57 Y91.869 E.00211
; LINE_WIDTH: 0.593948
G1 F3211.115
G1 X96.5 Y91.905 E.00459
; LINE_WIDTH: 0.549697
G1 F3501.343
G1 X96.431 Y91.94 E.00421
; LINE_WIDTH: 0.505445
G1 F3849.248
G1 X96.362 Y91.976 E.00383
; LINE_WIDTH: 0.461192
G1 F4273.919
G1 X96.293 Y92.011 E.00345
; LINE_WIDTH: 0.416941
G1 F4803.912
G1 X96.224 Y92.047 E.00307
; LINE_WIDTH: 0.413171
G1 F4855.199
G1 X96.11 Y92.121 E.00531
; LINE_WIDTH: 0.453654
G1 F4355.788
G1 X95.996 Y92.195 E.00591
; LINE_WIDTH: 0.494136
G1 F3949.535
G1 X95.882 Y92.269 E.00652
; LINE_WIDTH: 0.534618
G1 F3612.597
G1 X95.768 Y92.343 E.00713
G1 X95.808 Y92.423 E.0047
; LINE_WIDTH: 0.489983
G1 F3987.685
G1 X95.848 Y92.504 E.00426
G1 X95.764 Y92.47 E.00426
; LINE_WIDTH: 0.534618
G1 F3612.597
G1 X95.681 Y92.437 E.0047
G1 X95.626 Y92.519 E.00521
; LINE_WIDTH: 0.494396
G1 F3947.171
G1 X95.57 Y92.602 E.00477
; LINE_WIDTH: 0.454174
G1 F4350.041
G1 X95.515 Y92.684 E.00433
; LINE_WIDTH: 0.413951
G1 F4844.497
G1 X95.459 Y92.766 E.00389
; LINE_WIDTH: 0.419291
G1 F4772.484
G1 X95.412 Y92.847 E.00374
; LINE_WIDTH: 0.464852
G1 F4235.273
G1 X95.364 Y92.929 E.00421
; LINE_WIDTH: 0.510414
G1 F3806.766
G1 X95.316 Y93.01 E.00469
; LINE_WIDTH: 0.555977
G1 F3457.002
G1 X95.269 Y93.091 E.00516
; LINE_WIDTH: 0.601538
G1 F3166.102
G1 X95.221 Y93.172 E.00564
G1 X95.199 Y93.116 E.00361
; LINE_WIDTH: 0.572104
G1 F3348.116
G1 X95.177 Y93.06 E.00341
; LINE_WIDTH: 0.542668
G1 F3552.335
G1 X95.168 Y92.98 E.00431
; LINE_WIDTH: 0.498174
G1 F3913.135
G1 X95.159 Y92.9 E.00391
; LINE_WIDTH: 0.453679
G1 F4355.511
G1 X95.151 Y92.819 E.00351
; LINE_WIDTH: 0.409184
G1 F4910.657
G1 X95.142 Y92.739 E.00312
; LINE_WIDTH: 0.395948
G1 F5104.168
G1 X95.378 Y92.319 E.01791
; LINE_WIDTH: 0.442172
G1 F4486.68
G1 X95.441 Y92.29 E.00291
; LINE_WIDTH: 0.488395
G1 F4002.472
G1 X95.503 Y92.262 E.00326
; LINE_WIDTH: 0.534618
G1 F3612.597
G2 X95.598 Y92.168 I-.01 J-.105 E.0076
; LINE_WIDTH: 0.484798
G1 F4036.368
G1 X95.631 Y92.102 E.00344
; LINE_WIDTH: 0.434979
G1 F4572.77
G1 X95.663 Y92.036 E.00304
; LINE_WIDTH: 0.385159
G1 F5273.589
G1 X96.099 Y91.76 E.01857
; LINE_WIDTH: 0.410246
G1 F4895.756
G1 X96.181 Y91.766 E.00318
; LINE_WIDTH: 0.448494
G1 F4413.655
G1 X96.263 Y91.773 E.00352
; LINE_WIDTH: 0.486741
G1 F4017.991
G1 X96.344 Y91.78 E.00387
; LINE_WIDTH: 0.524988
G1 F3687.429
G1 X96.426 Y91.786 E.00422
; LINE_WIDTH: 0.570638
G1 F3357.724
G1 X96.515 Y91.825 E.00547
; LINE_WIDTH: 0.616288
G1 F3082.139
G1 X96.549 Y91.84 E.00227
M204 S10000
G1 X95.848 Y92.504 F42000
; LINE_WIDTH: 0.445349
G1 F4449.685
M204 S5000
G1 X95.878 Y92.532 E.00176
; LINE_WIDTH: 0.439068
G1 F4523.42
G1 X96.681 Y93.336 E.04765
; LINE_WIDTH: 0.488045
G1 F4005.752
G1 X96.707 Y93.396 E.00311
; LINE_WIDTH: 0.537021
G1 F3594.403
G1 X96.733 Y93.456 E.00346
; LINE_WIDTH: 0.585997
G1 F3259.668
G1 X96.759 Y93.517 E.00382
; LINE_WIDTH: 0.634973
G1 F2981.968
G1 X96.784 Y93.577 E.00417
; LINE_WIDTH: 0.683949
G1 F2747.869
G1 X96.81 Y93.638 E.00453
G1 X96.622 Y93.795 E.01688
; LINE_WIDTH: 0.680288
G1 F2764.085
G1 X96.463 Y93.875 E.01222
; LINE_WIDTH: 0.653219
G1 F2890.236
G1 X96.304 Y93.955 E.01169
; LINE_WIDTH: 0.626149
G1 F3028.452
G1 X96.001 Y93.977 E.01899
; LINE_WIDTH: 0.587689
G1 F3249.215
G1 X95.658 Y93.862 E.02113
; LINE_WIDTH: 0.543388
G1 F3547.043
G1 X95.452 Y93.687 E.01448
; LINE_WIDTH: 0.578909
G1 F3304.201
G1 X95.258 Y93.368 E.02141
; LINE_WIDTH: 0.605869
G1 F3140.983
G1 X95.221 Y93.174 E.01191
; WIPE_START
M204 S6000
G1 X95.258 Y93.368 E-.07497
G1 X95.452 Y93.687 E-.14182
G1 X95.658 Y93.862 E-.10293
G1 X96.001 Y93.977 E-.13759
G1 X96.304 Y93.955 E-.1153
G1 X96.463 Y93.875 E-.0677
G1 X96.622 Y93.795 E-.0677
G1 X96.727 Y93.707 E-.05199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.484 Y90.756 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.444869
G1 F4455.236
M204 S5000
G1 X95.27 Y90.794 E.00924
; LINE_WIDTH: 0.400499
G1 F5035.944
G1 X94.916 Y91.105 E.01777
; LINE_WIDTH: 0.389959
G1 F5196.853
G1 X94.116 Y91.903 E.0412
; LINE_WIDTH: 0.431893
G1 F4610.712
G1 X94.072 Y91.947 E.00257
; LINE_WIDTH: 0.473828
G1 F4143.389
G1 X94.028 Y91.991 E.00286
; LINE_WIDTH: 0.522819
G1 F3704.721
G1 X94.068 Y92.124 E.00711
; LINE_WIDTH: 0.571809
G1 F3350.046
G1 X94.108 Y92.257 E.00786
G1 X94.022 Y92.231 E.00513
; LINE_WIDTH: 0.537818
G1 F3588.399
G1 X93.935 Y92.204 E.00479
; LINE_WIDTH: 0.503828
G1 F3863.267
G1 X93.848 Y92.178 E.00445
; LINE_WIDTH: 0.469839
G1 F4183.736
G1 X93.801 Y92.222 E.0029
; LINE_WIDTH: 0.429904
G1 F4635.522
G1 X93.754 Y92.265 E.00262
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X93.296 Y92.723 E.02365
G1 X93.198 Y92.355 E.01392
; LINE_WIDTH: 0.431893
G1 F4610.712
G1 X93.404 Y92.149 E.01195
; LINE_WIDTH: 0.473828
G1 F4143.389
G1 X93.609 Y91.943 E.0133
; LINE_WIDTH: 0.522808
G1 F3704.802
G1 X93.571 Y91.813 E.00696
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X93.533 Y91.682 E.0077
G1 X93.663 Y91.723 E.00769
; LINE_WIDTH: 0.527888
G1 F3664.57
G1 X93.793 Y91.764 E.00703
; LINE_WIDTH: 0.483988
G1 F4044.081
G1 X93.838 Y91.717 E.00303
; LINE_WIDTH: 0.436983
G1 F4548.444
G1 X93.883 Y91.67 E.00269
; LINE_WIDTH: 0.389978
G1 F5196.537
G1 X94.166 Y91.388 E.01459
G1 X94.68 Y90.877 E.02643
; LINE_WIDTH: 0.393948
G1 F5134.744
G1 X94.948 Y90.616 E.01384
; LINE_WIDTH: 0.412468
G1 F4864.878
G1 X95.249 Y90.428 E.01382
G1 X95.488 Y90.469 E.00945
; LINE_WIDTH: 0.444869
G1 F4455.236
G1 X95.598 Y90.562 E.00612
; LINE_WIDTH: 0.484709
G1 F4037.223
G1 X95.656 Y90.657 E.00524
; LINE_WIDTH: 0.524548
G1 F3690.923
G1 X95.714 Y90.753 E.00574
; LINE_WIDTH: 0.564389
G1 F3399.337
G1 X95.771 Y90.848 E.00623
G1 X95.675 Y90.817 E.00562
; LINE_WIDTH: 0.524548
G1 F3690.923
G1 X95.58 Y90.786 E.00518
; LINE_WIDTH: 0.484709
G1 F4037.223
G1 X95.541 Y90.774 E.00192
; WIPE_START
M204 S6000
G1 X95.27 Y90.794 E-.10316
G1 X94.916 Y91.105 E-.17936
G1 X94.116 Y91.903 E-.42915
G1 X94.072 Y91.947 E-.02372
G1 X94.028 Y91.991 E-.02372
G1 X94.029 Y91.994 E-.00088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.108 Y92.257 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.571809
G1 F3350.046
M204 S5000
G1 X94.218 Y92.366 E.00873
; WIPE_START
M204 S6000
G1 X94.108 Y92.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.381 Y87.464 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.582228
G1 F3283.192
M204 S5000
G1 X92.514 Y87.561 E.0095
; LINE_WIDTH: 0.534998
G1 F3609.707
G1 X92.647 Y87.658 E.00864
; LINE_WIDTH: 0.487769
G1 F4008.337
G1 X92.745 Y87.839 E.00976
; LINE_WIDTH: 0.444728
G1 F4456.858
G1 X92.843 Y88.021 E.00878
; LINE_WIDTH: 0.427509
G1 F4665.739
G1 X92.897 Y88.368 E.01429
; WIPE_START
M204 S6000
G1 X92.843 Y88.021 E-.24432
G1 X92.745 Y87.839 E-.14346
G1 X92.647 Y87.658 E-.14346
G1 X92.514 Y87.561 E-.11438
G1 X92.381 Y87.464 E-.11438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.54 Y89.69 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.575669
G1 F3324.965
M204 S5000
G1 X91.452 Y89.631 E.00605
G1 X91.562 Y89.628 E.00627
; LINE_WIDTH: 0.542269
G1 F3555.281
G1 X91.672 Y89.625 E.00587
; LINE_WIDTH: 0.508869
G1 F3819.88
G1 X91.728 Y89.598 E.00307
; LINE_WIDTH: 0.469068
G1 F4191.613
G1 X91.783 Y89.57 E.0028
; LINE_WIDTH: 0.429269
G1 F4643.496
G1 X91.839 Y89.543 E.00253
; LINE_WIDTH: 0.427446
G1 F4666.532
G1 X91.942 Y89.469 E.00516
; LINE_WIDTH: 0.465423
G1 F4229.306
G1 X92.046 Y89.396 E.0057
; LINE_WIDTH: 0.503401
G1 F3866.992
G1 X92.149 Y89.322 E.00623
; LINE_WIDTH: 0.541378
G1 F3561.856
G1 X92.253 Y89.248 E.00676
G1 X92.224 Y89.173 E.00427
; LINE_WIDTH: 0.509903
G1 F3811.091
G1 X92.195 Y89.099 E.00399
G1 X92.27 Y89.128 E.00399
; LINE_WIDTH: 0.541378
G1 F3561.856
G1 X92.344 Y89.157 E.00427
G1 X92.357 Y89.13 E.00157
; LINE_WIDTH: 0.501766
G1 F3881.307
G1 X92.371 Y89.104 E.00144
; LINE_WIDTH: 0.462153
G1 F4263.703
G1 X92.384 Y89.077 E.00131
; LINE_WIDTH: 0.422541
G1 F4729.684
G1 X92.397 Y89.051 E.00118
; LINE_WIDTH: 0.391239
G1 F5176.765
G1 X92.73 Y88.692 E.01794
; LINE_WIDTH: 0.429601
G1 F4639.317
G1 X92.772 Y88.664 E.00205
; LINE_WIDTH: 0.467964
G1 F4202.968
G1 X92.814 Y88.637 E.00226
; LINE_WIDTH: 0.506326
G1 F3841.645
G1 X92.856 Y88.61 E.00247
; LINE_WIDTH: 0.544688
G1 F3537.527
G2 X92.898 Y88.511 I-.011 J-.063 E.00682
; LINE_WIDTH: 0.505628
G1 F3847.659
G1 X92.898 Y88.44 E.00352
; LINE_WIDTH: 0.466568
G1 F4217.393
G1 X92.897 Y88.368 E.00321
; LINE_WIDTH: 0.468602
G1 F4196.401
G1 X92.939 Y88.409 E.00265
; LINE_WIDTH: 0.509695
G1 F3812.857
G1 X92.981 Y88.45 E.00292
; LINE_WIDTH: 0.550788
G1 F3493.552
G1 X93.024 Y88.491 E.00319
G1 X93.284 Y88.393 E.01512
G1 X93.365 Y88.477 E.00631
G1 X93.098 Y88.702 E.01899
G1 X93.08 Y88.744 E.00245
; LINE_WIDTH: 0.512188
G1 F3791.829
G1 X93.062 Y88.785 E.00226
; LINE_WIDTH: 0.473588
G1 F4145.794
G1 X93.044 Y88.826 E.00206
; LINE_WIDTH: 0.434988
G1 F4572.648
G1 X93.026 Y88.868 E.00187
; LINE_WIDTH: 0.396389
G1 F5097.49
G1 X92.656 Y89.246 E.01968
; LINE_WIDTH: 0.420846
G1 F4751.906
G1 X92.603 Y89.271 E.00234
; LINE_WIDTH: 0.461024
G1 F4275.72
G1 X92.55 Y89.296 E.0026
; LINE_WIDTH: 0.501201
G1 F3886.278
G1 X92.497 Y89.321 E.00286
; LINE_WIDTH: 0.541378
G1 F3561.856
G2 X92.433 Y89.385 I-.004 J.061 E.00545
; LINE_WIDTH: 0.503041
G1 F3870.135
G1 X92.422 Y89.424 E.00198
; LINE_WIDTH: 0.464704
G1 F4236.832
G1 X92.411 Y89.463 E.00181
; LINE_WIDTH: 0.426366
G1 F4680.292
G1 X92.399 Y89.502 E.00164
; LINE_WIDTH: 0.389469
G1 F5204.583
G1 X92.009 Y89.829 E.01855
; LINE_WIDTH: 0.400849
G1 F5030.772
G1 X91.805 Y89.867 E.00782
; LINE_WIDTH: 0.444553
G1 F4458.886
G1 X91.717 Y89.808 E.00451
; LINE_WIDTH: 0.488259
G1 F4003.75
G1 X91.629 Y89.749 E.00502
; LINE_WIDTH: 0.531963
G1 F3632.924
G1 X91.59 Y89.723 E.0024
; WIPE_START
M204 S6000
G1 X91.452 Y89.631 E-.0631
G1 X91.562 Y89.628 E-.04181
G1 X91.672 Y89.625 E-.04181
G1 X91.728 Y89.598 E-.02351
G1 X91.783 Y89.57 E-.02351
G1 X91.839 Y89.543 E-.02351
G1 X91.942 Y89.469 E-.04829
G1 X92.046 Y89.396 E-.04829
G1 X92.149 Y89.322 E-.04829
G1 X92.253 Y89.248 E-.04829
G1 X92.224 Y89.173 E-.03049
G1 X92.195 Y89.099 E-.03049
G1 X92.27 Y89.128 E-.03049
G1 X92.344 Y89.157 E-.03049
G1 X92.357 Y89.13 E-.01121
G1 X92.371 Y89.104 E-.01121
G1 X92.384 Y89.077 E-.01121
G1 X92.397 Y89.051 E-.01121
G1 X92.724 Y88.698 E-.18279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.671 Y88.218 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.482929
G1 F4054.218
M204 S5000
G1 X91.882 Y88.601 E.02046
; LINE_WIDTH: 0.478429
G1 F4097.829
G1 X92.195 Y89.099 E.02719
; WIPE_START
M204 S6000
G1 X91.882 Y88.601 E-.43569
G1 X91.671 Y88.218 E-.32431
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.847 Y88.732 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.636348
G1 F2974.848
M204 S5000
G1 X90.871 Y88.883 E.00973
; LINE_WIDTH: 0.604909
G1 F3146.517
G1 X90.895 Y89.034 E.0092
; LINE_WIDTH: 0.573469
G1 F3339.214
G1 X91.123 Y89.366 E.02291
; LINE_WIDTH: 0.575669
G1 F3324.965
G1 X91.452 Y89.631 E.02407
; WIPE_START
M204 S6000
G1 X91.123 Y89.366 E-.28366
G1 X90.895 Y89.034 E-.27115
G1 X90.871 Y88.883 E-.10259
G1 X90.847 Y88.732 E-.10259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.602 Y88.114 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.449814
G1 F4398.706
M204 S5000
G1 X91.533 Y88.01 E.00538
; LINE_WIDTH: 0.416699
G1 F4807.172
G1 X91.48 Y87.82 E.00776
; LINE_WIDTH: 0.378588
G1 F5382.373
G1 X91.511 Y87.653 E.006
; LINE_WIDTH: 0.388209
G1 F5224.569
G1 X91.667 Y87.426 E.01
; LINE_WIDTH: 0.393178
G1 F5146.615
G1 X91.867 Y87.281 E.00907
; LINE_WIDTH: 0.420979
G1 F4750.161
G1 X91.988 Y87.281 E.00485
; LINE_WIDTH: 0.448779
G1 F4410.419
G1 X92.11 Y87.281 E.00522
; LINE_WIDTH: 0.493262
G1 F3957.506
G1 X92.2 Y87.342 E.00522
; LINE_WIDTH: 0.537745
G1 F3588.95
G1 X92.29 Y87.403 E.00575
; LINE_WIDTH: 0.582228
G1 F3283.192
G1 X92.381 Y87.464 E.00629
G1 X92.27 Y87.465 E.00639
; LINE_WIDTH: 0.548138
G1 F3512.521
G1 X92.185 Y87.505 E.0051
; LINE_WIDTH: 0.509011
G1 F3818.668
G1 X92.099 Y87.546 E.00469
; LINE_WIDTH: 0.469884
G1 F4183.276
G1 X92.014 Y87.586 E.00428
; LINE_WIDTH: 0.430756
G1 F4624.861
G1 X91.928 Y87.627 E.00387
; LINE_WIDTH: 0.391629
G1 F5170.676
G1 X91.721 Y87.888 E.01223
; LINE_WIDTH: 0.437274
G1 F4544.947
G1 X91.696 Y88.053 E.00695
; LINE_WIDTH: 0.482929
G1 F4054.218
G1 X91.671 Y88.218 E.00779
G1 X91.635 Y88.164 E.00303
; WIPE_START
M204 S6000
G1 X91.533 Y88.01 E-.07022
G1 X91.48 Y87.82 E-.07473
G1 X91.511 Y87.653 E-.06477
G1 X91.667 Y87.426 E-.10468
G1 X91.867 Y87.281 E-.09356
G1 X91.988 Y87.281 E-.04616
G1 X92.11 Y87.281 E-.04617
G1 X92.2 Y87.342 E-.0414
G1 X92.29 Y87.403 E-.0414
G1 X92.381 Y87.464 E-.0414
G1 X92.27 Y87.465 E-.04207
G1 X92.185 Y87.505 E-.03591
G1 X92.099 Y87.546 E-.03591
G1 X92.048 Y87.57 E-.02161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.702 Y85.555 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.595128
G1 F3204.033
M204 S5000
G1 X87.692 Y85.749 E.01149
; LINE_WIDTH: 0.560908
G1 F3422.958
G1 X87.814 Y86.041 E.01757
; LINE_WIDTH: 0.534409
G1 F3614.197
G1 X88.012 Y86.28 E.01624
; LINE_WIDTH: 0.567048
G1 F3381.501
G1 X88.372 Y86.547 E.02514
; LINE_WIDTH: 0.603088
G1 F3157.064
G1 X88.514 Y86.577 E.00873
; LINE_WIDTH: 0.639129
G1 F2960.565
G1 X88.657 Y86.607 E.00931
; WIPE_START
M204 S6000
G1 X88.514 Y86.577 E-.07079
G1 X88.372 Y86.547 E-.0708
G1 X88.012 Y86.28 E-.21849
G1 X87.814 Y86.041 E-.15081
G1 X87.692 Y85.749 E-.15453
G1 X87.702 Y85.555 E-.09458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.861 Y85.477 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.359899
G1 F5717.907
M204 S5000
G1 X89.888 Y85.257 E.00736
; LINE_WIDTH: 0.319309
G1 F6613.246
G1 X89.748 Y84.934 E.01009
; LINE_WIDTH: 0.290428
G1 F7442.415
G1 X89.486 Y84.665 E.00958
; LINE_WIDTH: 0.322249
G1 F6539.082
G1 X89.177 Y84.511 E.01001
; LINE_WIDTH: 0.363169
G1 F5656.215
G1 X88.852 Y84.534 E.01091
G1 X88.65 Y84.26 E.01139
G1 X88.766 Y84.222 E.00409
G1 X89.189 Y84.248 E.01421
; LINE_WIDTH: 0.324129
G1 F6492.523
G1 X89.557 Y84.429 E.01196
; LINE_WIDTH: 0.294679
G1 F7307.582
G1 X89.886 Y84.737 E.01171
; LINE_WIDTH: 0.310199
G1 F6854.127
G1 X90.086 Y85.049 E.01024
; LINE_WIDTH: 0.341419
G1 F6093.505
G1 X90.162 Y85.388 E.01081
; LINE_WIDTH: 0.344899
G1 F6019.05
G1 X90.157 Y85.45 E.00197
; LINE_WIDTH: 0.376069
G1 F5425.298
G1 X90.081 Y85.701 E.00915
; LINE_WIDTH: 0.398289
G1 F5068.852
G1 X89.911 Y85.908 E.01001
G1 X89.759 Y86 E.00665
G1 X89.545 Y86.027 E.00808
; LINE_WIDTH: 0.395039
G1 F5118.035
G1 X89.136 Y85.888 E.01599
; LINE_WIDTH: 0.375309
G1 F5438.379
G1 X88.229 Y85.396 E.03597
; LINE_WIDTH: 0.405389
G1 F4964.627
G1 X88.118 Y85.4 E.00425
; LINE_WIDTH: 0.438919
G1 F4525.211
G1 X88.007 Y85.404 E.00467
; LINE_WIDTH: 0.472448
G1 F4157.255
G1 X87.895 Y85.408 E.00508
; LINE_WIDTH: 0.511828
G1 F3794.851
G1 X87.835 Y85.448 E.00363
; LINE_WIDTH: 0.551208
G1 F3490.564
G1 X87.775 Y85.489 E.00395
; LINE_WIDTH: 0.590589
G1 F3231.453
G1 X87.714 Y85.53 E.00427
G1 X87.709 Y85.424 E.00622
; LINE_WIDTH: 0.542328
G1 F3554.84
G1 X87.744 Y85.337 E.00499
; LINE_WIDTH: 0.493505
G1 F3955.283
G1 X87.78 Y85.251 E.00449
; LINE_WIDTH: 0.444682
G1 F4457.399
G1 X87.815 Y85.164 E.00398
; LINE_WIDTH: 0.395858
G1 F5105.536
G1 X88.008 Y85.061 E.00811
; LINE_WIDTH: 0.385739
G1 F5264.197
G1 X88.26 Y85.072 E.00908
; LINE_WIDTH: 0.380249
G1 F5354.465
G1 X88.766 Y85.3 E.01966
; LINE_WIDTH: 0.378018
G1 F5392.023
G1 X89.345 Y85.637 E.02353
; LINE_WIDTH: 0.398369
G1 F5067.653
G1 X89.638 Y85.684 E.01111
G1 X89.817 Y85.518 E.00913
; WIPE_START
M204 S6000
G1 X89.888 Y85.257 E-.10289
G1 X89.748 Y84.934 E-.13372
G1 X89.486 Y84.665 E-.14287
G1 X89.177 Y84.511 E-.13116
G1 X88.852 Y84.534 E-.1237
G1 X88.656 Y84.268 E-.12566
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.886 Y85.215 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.361879
G1 F5680.393
M204 S5000
G1 X86.137 Y85.466 E.01186
G1 X86.03 Y85.573 E.00504
G1 X85.924 Y85.679 E.00504
G1 X85.672 Y85.428 E.01186
G1 X85.843 Y85.257 E.00807
M204 S10000
G1 X86.653 Y84.931 F42000
; LINE_WIDTH: 0.388679
G1 F5217.096
M204 S5000
G1 X86.421 Y84.699 E.01194
G1 X88.063 Y83.057 E.08439
G1 X88.179 Y83.173 E.00597
G1 X88.295 Y83.289 E.00597
G1 X86.695 Y84.889 E.08221
; WIPE_START
M204 S6000
G1 X86.421 Y84.699 E-.12693
G1 X87.599 Y83.521 E-.63307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.547 Y82.497 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.639148
G1 F2960.463
M204 S5000
G1 X84.404 Y82.467 E.00931
; LINE_WIDTH: 0.603088
G1 F3157.064
G1 X84.262 Y82.437 E.00873
; LINE_WIDTH: 0.567029
G1 F3381.634
G1 X83.902 Y82.17 E.02515
; LINE_WIDTH: 0.534409
G1 F3614.197
G1 X83.704 Y81.932 E.01623
; LINE_WIDTH: 0.560929
G1 F3422.821
G1 X83.582 Y81.639 E.01757
; LINE_WIDTH: 0.595149
G1 F3203.913
G1 X83.592 Y81.445 E.01149
; WIPE_START
M204 S6000
G1 X83.582 Y81.639 E-.09463
G1 X83.704 Y81.932 E-.15454
G1 X83.902 Y82.17 E-.1507
G1 X84.262 Y82.437 E-.21853
G1 X84.404 Y82.467 E-.07081
G1 X84.547 Y82.497 E-.0708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.751 Y81.367 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.359899
G1 F5717.907
M204 S5000
G1 X85.778 Y81.147 E.00736
; LINE_WIDTH: 0.319319
G1 F6612.991
G1 X85.638 Y80.824 E.01009
; LINE_WIDTH: 0.290439
G1 F7442.091
G1 X85.376 Y80.555 E.00958
; LINE_WIDTH: 0.322259
G1 F6538.833
G1 X85.067 Y80.401 E.01001
; LINE_WIDTH: 0.363158
G1 F5656.402
G1 X84.742 Y80.424 E.01091
G1 X84.54 Y80.15 E.01139
G1 X84.656 Y80.112 E.00409
G1 X85.08 Y80.138 E.01421
; LINE_WIDTH: 0.324129
G1 F6492.523
G1 X85.447 Y80.319 E.01196
; LINE_WIDTH: 0.294679
G1 F7307.582
G1 X85.776 Y80.627 E.01171
; LINE_WIDTH: 0.310219
G1 F6853.579
G1 X85.976 Y80.939 E.01024
; LINE_WIDTH: 0.341429
G1 F6093.288
G1 X86.052 Y81.278 E.01081
; LINE_WIDTH: 0.344909
G1 F6018.839
G1 X86.047 Y81.34 E.00196
; LINE_WIDTH: 0.376059
G1 F5425.47
G1 X85.971 Y81.591 E.00915
; LINE_WIDTH: 0.398289
G1 F5068.852
G1 X85.801 Y81.798 E.01002
G1 X85.649 Y81.89 E.00665
G1 X85.435 Y81.918 E.00808
; LINE_WIDTH: 0.395029
G1 F5118.187
G1 X85.026 Y81.778 E.01599
; LINE_WIDTH: 0.375299
G1 F5438.551
G1 X84.119 Y81.286 E.03597
; LINE_WIDTH: 0.405395
G1 F4964.531
G1 X84.008 Y81.29 E.00425
; LINE_WIDTH: 0.438932
G1 F4525.052
G1 X83.897 Y81.294 E.00467
; LINE_WIDTH: 0.472468
G1 F4157.054
G1 X83.785 Y81.298 E.00508
; LINE_WIDTH: 0.511855
G1 F3794.627
G1 X83.725 Y81.339 E.00363
; LINE_WIDTH: 0.551242
G1 F3490.327
G1 X83.665 Y81.379 E.00395
; LINE_WIDTH: 0.590629
G1 F3231.209
G1 X83.604 Y81.42 E.00427
G1 X83.599 Y81.314 E.00622
; LINE_WIDTH: 0.542318
G1 F3554.913
G1 X83.635 Y81.227 E.00499
; LINE_WIDTH: 0.493512
G1 F3955.223
G1 X83.67 Y81.141 E.00449
; LINE_WIDTH: 0.444705
G1 F4457.128
G1 X83.705 Y81.054 E.00398
; LINE_WIDTH: 0.395899
G1 F5104.927
G1 X83.898 Y80.951 E.00811
; LINE_WIDTH: 0.385739
G1 F5264.197
G1 X84.15 Y80.962 E.00909
; LINE_WIDTH: 0.380249
G1 F5354.465
G1 X84.657 Y81.19 E.01966
; LINE_WIDTH: 0.378038
G1 F5391.684
G1 X85.235 Y81.527 E.02353
; LINE_WIDTH: 0.398358
G1 F5067.803
G1 X85.528 Y81.574 E.01111
G1 X85.707 Y81.408 E.00913
; WIPE_START
M204 S6000
G1 X85.778 Y81.147 E-.10287
G1 X85.638 Y80.824 E-.13374
G1 X85.376 Y80.555 E-.14284
G1 X85.067 Y80.401 E-.13117
G1 X84.742 Y80.424 E-.1237
G1 X84.546 Y80.158 E-.12569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.563 Y81.318 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.361888
G1 F5680.205
M204 S5000
G1 X81.776 Y81.105 E.01007
G1 X82.027 Y81.356 E.01186
G1 X81.921 Y81.463 E.00504
G1 X81.814 Y81.569 E.00504
G1 X81.605 Y81.361 E.00986
; WIPE_START
M204 S6000
G1 X81.776 Y81.105 E-.18556
G1 X82.027 Y81.356 E-.21432
G1 X81.921 Y81.463 E-.091
G1 X81.814 Y81.569 E-.091
G1 X81.605 Y81.361 E-.17813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.543 Y80.821 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.388679
G1 F5217.096
M204 S5000
G1 X82.311 Y80.589 E.01194
G1 X83.953 Y78.947 E.08439
G1 X84.069 Y79.063 E.00597
G1 X84.185 Y79.179 E.00597
G1 X82.585 Y80.779 E.08221
; WIPE_START
M204 S6000
G1 X82.311 Y80.589 E-.12693
G1 X83.489 Y79.411 E-.63307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.03 Y79.249 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.564209
G1 F3400.551
M204 S5000
G1 X80.937 Y79.148 E.00768
; LINE_WIDTH: 0.535208
G1 F3608.111
G1 X80.843 Y79.046 E.00724
; LINE_WIDTH: 0.506208
G1 F3842.656
G1 X80.805 Y78.955 E.00488
; LINE_WIDTH: 0.472289
G1 F4158.869
G1 X80.766 Y78.864 E.00451
; LINE_WIDTH: 0.438368
G1 F4531.791
G1 X80.728 Y78.773 E.00414
; LINE_WIDTH: 0.404449
G1 F4978.179
G1 X80.705 Y78.52 E.00968
M204 S10000
G1 X80.498 Y78.366 F42000
; LINE_WIDTH: 0.415559
G1 F4822.589
M204 S5000
G1 X80.441 Y78.403 E.00266
; LINE_WIDTH: 0.388699
G1 F5216.779
G1 X79.554 Y79.291 E.0456
G1 X79.322 Y79.058 E.01194
G1 X80.209 Y78.171 E.0456
; LINE_WIDTH: 0.414089
G1 F4842.615
G2 X80.87 Y77.51 I-5.692 J-6.352 E.0366
; LINE_WIDTH: 0.388699
G1 F5216.779
G1 X81.693 Y76.687 E.04231
G1 X81.925 Y76.919 E.01194
G1 X81.809 Y77.036 E.00597
; LINE_WIDTH: 0.403888
G1 F4986.288
G1 X80.835 Y78.041 E.05323
; LINE_WIDTH: 0.424909
G1 F4698.991
G1 X80.695 Y78.324 E.01271
G1 X80.705 Y78.52 E.00794
; LINE_WIDTH: 0.413509
G1 F4850.562
G1 X80.67 Y78.405 E.00471
; LINE_WIDTH: 0.442419
G1 F4483.785
G1 X80.554 Y78.328 E.00587
G1 X80.548 Y78.333 E.00033
; WIPE_START
M204 S6000
G1 X80.441 Y78.403 E-.04855
G1 X79.554 Y79.291 E-.47684
G1 X79.322 Y79.058 E-.12487
G1 X79.526 Y78.854 E-.10973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.047 Y78.041 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.388679
G1 F5217.096
M204 S5000
G1 X83.163 Y78.158 E.00597
G1 X83.047 Y78.274 E.00597
; LINE_WIDTH: 0.388889
G1 F5213.764
G1 X82.277 Y79.044 E.0396
; LINE_WIDTH: 0.390929
G1 F5181.616
G1 X81.88 Y79.401 E.01952
; LINE_WIDTH: 0.396149
G1 F5101.13
G1 X81.612 Y79.54 E.01125
G1 X81.406 Y79.565 E.00773
; LINE_WIDTH: 0.420274
G1 F4759.459
G1 X81.307 Y79.514 E.00444
; LINE_WIDTH: 0.455249
G1 F4338.207
G1 X81.208 Y79.463 E.00487
; LINE_WIDTH: 0.491569
G1 F3973.036
G1 X81.148 Y79.392 E.00442
; LINE_WIDTH: 0.527888
G1 F3664.57
G1 X81.089 Y79.321 E.0048
; LINE_WIDTH: 0.564209
G1 F3400.551
G1 X81.03 Y79.249 E.00517
G1 X81.118 Y79.249 E.00491
; LINE_WIDTH: 0.524243
G1 F3693.348
G1 X81.206 Y79.248 E.00452
; LINE_WIDTH: 0.484279
G1 F4041.316
G1 X81.294 Y79.248 E.00413
; LINE_WIDTH: 0.444313
G1 F4461.672
G1 X81.382 Y79.247 E.00374
; LINE_WIDTH: 0.404348
G1 F4979.625
G1 X81.67 Y79.146 E.01162
; LINE_WIDTH: 0.395618
G1 F5109.188
G1 X82.05 Y78.806 E.01893
; LINE_WIDTH: 0.388889
G1 F5213.764
G1 X82.931 Y77.925 E.04529
; LINE_WIDTH: 0.388679
G1 F5217.096
G1 X83.005 Y77.999 E.00379
; WIPE_START
M204 S6000
G1 X83.163 Y78.158 E-.08523
G1 X83.047 Y78.274 E-.06244
G1 X82.277 Y79.044 E-.41384
G1 X81.889 Y79.393 E-.1985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.052 Y76.616 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.633029
G1 F2992.086
M204 S5000
G1 X77.568 Y77.132 E.04623
M204 S10000
G1 X78.223 Y77.786 F42000
; LINE_WIDTH: 0.633048
G1 F2991.982
M204 S5000
G1 X78.707 Y78.271 E.04345
; WIPE_START
M204 S6000
G1 X78.223 Y77.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.142 Y77.429 Z.88 F42000
G1 Z.48
G1 E.8 F1800
; LINE_WIDTH: 0.494009
G1 F3950.695
M204 S5000
G1 X78.152 Y77.543 E.00547
; LINE_WIDTH: 0.535918
G1 F3602.728
G1 X78.161 Y77.656 E.006
; LINE_WIDTH: 0.584484
G1 F3269.073
G1 X78.192 Y77.721 E.00418
; LINE_WIDTH: 0.633048
G1 F2991.982
G1 X78.223 Y77.786 E.00456
G1 X78.157 Y77.756 E.00456
; LINE_WIDTH: 0.584484
G1 F3269.073
G1 X78.092 Y77.725 E.00418
; LINE_WIDTH: 0.535918
G1 F3602.728
G1 X77.985 Y77.642 E.00714
; LINE_WIDTH: 0.495255
G1 F3939.378
G1 X77.878 Y77.559 E.00653
; LINE_WIDTH: 0.454592
G1 F4345.428
G1 X77.77 Y77.476 E.00592
; LINE_WIDTH: 0.457749
G1 F4310.933
G1 X77.73 Y77.407 E.00351
; LINE_WIDTH: 0.501568
G1 F3883.043
G1 X77.689 Y77.338 E.00389
; LINE_WIDTH: 0.545388
G1 F3532.425
G1 X77.649 Y77.27 E.00428
; LINE_WIDTH: 0.589208
G1 F3239.881
G1 X77.609 Y77.201 E.00467
; LINE_WIDTH: 0.633029
G1 F2992.086
G1 X77.568 Y77.132 E.00505
G1 X77.614 Y77.154 E.00317
; LINE_WIDTH: 0.599289
G1 F3179.313
G1 X77.659 Y77.175 E.00298
; LINE_WIDTH: 0.565548
G1 F3391.536
G1 X77.711 Y77.174 E.00295
; LINE_WIDTH: 0.527644
G1 F3666.49
G1 X77.764 Y77.173 E.00273
; LINE_WIDTH: 0.489738
G1 F3989.959
G1 X77.817 Y77.171 E.00251
; LINE_WIDTH: 0.451834
G1 F4376.024
G1 X77.87 Y77.17 E.00229
; LINE_WIDTH: 0.413929
G1 F4844.805
G1 X77.95 Y77.13 E.0035
; LINE_WIDTH: 0.409169
G1 F4910.868
G1 X79.364 Y75.716 E.07721
; LINE_WIDTH: 0.408199
G1 F4924.552
G1 X79.913 Y75.167 E.0299
; LINE_WIDTH: 0.407829
G1 F4929.792
G1 X80.036 Y75.044 E.00669
G1 X80.159 Y75.167 E.00669
G1 X80.282 Y75.29 E.00669
G1 X78.206 Y77.365 E.11288
; LINE_WIDTH: 0.452099
G1 F4373.066
G1 X78.185 Y77.387 E.00132
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F4373.066
M204 S6000
G1 X78.152 Y77.543 E-.06061
G1 X78.161 Y77.656 E-.04332
G1 X78.192 Y77.721 E-.02736
G1 X78.223 Y77.786 E-.02736
G1 X78.157 Y77.756 E-.02736
G1 X78.092 Y77.725 E-.02736
G1 X77.985 Y77.642 E-.05158
G1 X77.878 Y77.559 E-.05158
G1 X77.77 Y77.476 E-.05158
G1 X77.73 Y77.407 E-.03029
G1 X77.689 Y77.338 E-.0303
G1 X77.649 Y77.27 E-.03029
G1 X77.609 Y77.201 E-.0303
G1 X77.568 Y77.132 E-.0303
G1 X77.614 Y77.154 E-.01902
G1 X77.659 Y77.175 E-.01901
G1 X77.711 Y77.174 E-.02005
G1 X77.764 Y77.173 E-.02005
G1 X77.817 Y77.171 E-.02005
G1 X77.87 Y77.17 E-.02005
G1 X77.95 Y77.13 E-.03402
G1 X78.114 Y76.966 E-.08818
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/11
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z.88 I-.784 J.931 P1  F42000
G1 X100.826 Y96.098 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.444818
; LAYER_HEIGHT: 0.28
G1 F4455.815
M204 S5000
G1 X100.613 Y96.136 E.00923
; LINE_WIDTH: 0.400488
G1 F5036.092
G1 X100.258 Y96.448 E.01778
; LINE_WIDTH: 0.389959
G1 F5196.853
G1 X99.459 Y97.246 E.04119
; LINE_WIDTH: 0.431874
G1 F4610.96
G1 X99.415 Y97.29 E.00257
; LINE_WIDTH: 0.473788
G1 F4143.79
G1 X99.371 Y97.334 E.00286
; LINE_WIDTH: 0.522788
G1 F3704.962
G1 X99.411 Y97.467 E.00711
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X99.451 Y97.6 E.00786
G1 X99.364 Y97.574 E.00513
; LINE_WIDTH: 0.537808
G1 F3588.474
G1 X99.278 Y97.547 E.00479
; LINE_WIDTH: 0.503828
G1 F3863.267
G1 X99.191 Y97.521 E.00445
; LINE_WIDTH: 0.469849
G1 F4183.634
G1 X99.144 Y97.564 E.0029
; LINE_WIDTH: 0.429904
G1 F4635.522
G1 X99.097 Y97.608 E.00262
; LINE_WIDTH: 0.389959
G1 F5196.853
G1 X98.639 Y98.066 E.02365
G1 X98.541 Y97.697 E.01392
; LINE_WIDTH: 0.431879
G1 F4610.898
G1 X98.747 Y97.492 E.01195
; LINE_WIDTH: 0.473799
G1 F4143.689
G1 X98.952 Y97.286 E.0133
; LINE_WIDTH: 0.522793
G1 F3704.922
G1 X98.914 Y97.156 E.00696
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X98.876 Y97.025 E.0077
G1 X99.006 Y97.066 E.00769
; LINE_WIDTH: 0.527898
G1 F3664.492
G1 X99.136 Y97.106 E.00703
; LINE_WIDTH: 0.484008
G1 F4043.89
G1 X99.18 Y97.06 E.00303
; LINE_WIDTH: 0.436989
G1 F4548.384
G1 X99.225 Y97.013 E.00269
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X99.509 Y96.731 E.01459
G1 X100.022 Y96.22 E.02642
; LINE_WIDTH: 0.393968
G1 F5134.437
G1 X100.291 Y95.958 E.01385
; LINE_WIDTH: 0.412459
G1 F4865.016
G1 X100.592 Y95.77 E.01383
G1 X100.831 Y95.811 E.00945
; LINE_WIDTH: 0.444818
G1 F4455.815
G1 X100.94 Y95.904 E.00612
; LINE_WIDTH: 0.484668
G1 F4037.604
G1 X100.998 Y96 E.00525
; LINE_WIDTH: 0.524518
G1 F3691.161
G1 X101.056 Y96.096 E.00574
; LINE_WIDTH: 0.564368
G1 F3399.472
G1 X101.114 Y96.191 E.00623
G1 X101.018 Y96.16 E.00562
; LINE_WIDTH: 0.524518
G1 F3691.161
G1 X100.922 Y96.129 E.00518
; LINE_WIDTH: 0.484668
G1 F4037.604
G1 X100.883 Y96.117 E.00192
; WIPE_START
M204 S6000
G1 X100.613 Y96.136 E-.10316
G1 X100.258 Y96.448 E-.17947
G1 X99.459 Y97.246 E-.42902
G1 X99.415 Y97.29 E-.02372
G1 X99.371 Y97.334 E-.02372
G1 X99.371 Y97.336 E-.00091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.451 Y97.6 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.571788
G1 F3350.177
M204 S5000
G1 X99.56 Y97.709 E.00873
; WIPE_START
M204 S6000
G1 X99.451 Y97.6 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.109 Y96.059 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.639129
G1 F2960.565
M204 S5000
G1 X97.967 Y96.029 E.00931
; LINE_WIDTH: 0.603088
G1 F3157.064
G1 X97.825 Y96 E.00873
; LINE_WIDTH: 0.567048
G1 F3381.501
G1 X97.464 Y95.732 E.02515
; LINE_WIDTH: 0.534388
G1 F3614.349
G1 X97.267 Y95.494 E.01623
; LINE_WIDTH: 0.560889
G1 F3423.094
G1 X97.144 Y95.202 E.01756
; LINE_WIDTH: 0.595169
G1 F3203.793
G1 X97.154 Y95.008 E.0115
; WIPE_START
M204 S6000
G1 X97.144 Y95.202 E-.09464
G1 X97.267 Y95.494 E-.15447
G1 X97.464 Y95.732 E-.15079
G1 X97.825 Y96 E-.2185
G1 X97.967 Y96.029 E-.0708
G1 X98.109 Y96.059 E-.0708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.313 Y94.93 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.359888
G1 F5718.098
M204 S5000
G1 X99.341 Y94.709 E.00736
; LINE_WIDTH: 0.319309
G1 F6613.246
G1 X99.2 Y94.387 E.01009
; LINE_WIDTH: 0.290428
G1 F7442.415
G1 X98.938 Y94.117 E.00958
; LINE_WIDTH: 0.322269
G1 F6538.583
G1 X98.629 Y93.964 E.01001
; LINE_WIDTH: 0.363179
G1 F5656.028
G1 X98.304 Y93.987 E.01091
G1 X98.103 Y93.713 E.01139
G1 X98.219 Y93.675 E.00409
G1 X98.642 Y93.7 E.01421
; LINE_WIDTH: 0.324139
G1 F6492.277
G1 X99.009 Y93.882 E.01196
; LINE_WIDTH: 0.294679
G1 F7307.582
G1 X99.339 Y94.19 E.01171
; LINE_WIDTH: 0.310199
G1 F6854.127
G1 X99.538 Y94.502 E.01024
; LINE_WIDTH: 0.341409
G1 F6093.721
G1 X99.615 Y94.841 E.01081
; LINE_WIDTH: 0.344889
G1 F6019.262
G1 X99.61 Y94.903 E.00197
; LINE_WIDTH: 0.376049
G1 F5425.642
G1 X99.534 Y95.153 E.00915
; LINE_WIDTH: 0.398269
G1 F5069.151
G1 X99.364 Y95.36 E.01002
G1 X99.212 Y95.452 E.00665
G1 X98.997 Y95.48 E.00808
; LINE_WIDTH: 0.395029
G1 F5118.187
G1 X98.589 Y95.341 E.01599
; LINE_WIDTH: 0.375309
G1 F5438.379
G1 X97.682 Y94.848 E.03598
; LINE_WIDTH: 0.405399
G1 F4964.483
G1 X97.571 Y94.852 E.00425
; LINE_WIDTH: 0.438938
G1 F4524.972
G1 X97.459 Y94.856 E.00467
; LINE_WIDTH: 0.472479
G1 F4156.953
G1 X97.348 Y94.86 E.00508
; LINE_WIDTH: 0.511865
G1 F3794.543
G1 X97.288 Y94.901 E.00363
; LINE_WIDTH: 0.551252
G1 F3490.256
G1 X97.227 Y94.942 E.00395
; LINE_WIDTH: 0.590639
G1 F3231.148
G1 X97.167 Y94.982 E.00427
G1 X97.162 Y94.877 E.00622
; LINE_WIDTH: 0.542349
G1 F3554.692
G1 X97.197 Y94.79 E.00499
; LINE_WIDTH: 0.493535
G1 F3955.009
G1 X97.232 Y94.703 E.00449
; LINE_WIDTH: 0.444722
G1 F4456.935
G1 X97.268 Y94.617 E.00398
; LINE_WIDTH: 0.395909
G1 F5104.776
G1 X97.461 Y94.514 E.00811
; LINE_WIDTH: 0.385729
G1 F5264.359
G1 X97.713 Y94.525 E.00908
; LINE_WIDTH: 0.380259
G1 F5354.298
G1 X98.219 Y94.753 E.01966
; LINE_WIDTH: 0.378038
G1 F5391.684
G1 X98.797 Y95.09 E.02354
; LINE_WIDTH: 0.398358
G1 F5067.803
G1 X99.091 Y95.137 E.01111
G1 X99.269 Y94.971 E.00913
; WIPE_START
M204 S6000
G1 X99.341 Y94.709 E-.10288
G1 X99.2 Y94.387 E-.13373
G1 X98.938 Y94.117 E-.14284
G1 X98.629 Y93.964 E-.13118
G1 X98.304 Y93.987 E-.12368
G1 X98.108 Y93.72 E-.12569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.604 Y91.864 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.616269
G1 F3082.25
M204 S5000
G1 X96.785 Y91.937 E.01199
; LINE_WIDTH: 0.585069
G1 F3265.431
G1 X96.966 Y92.009 E.01132
; LINE_WIDTH: 0.553868
G1 F3471.761
G1 X97.227 Y92.267 E.02005
; LINE_WIDTH: 0.600568
G1 F3171.784
G1 X97.356 Y92.538 E.01795
; LINE_WIDTH: 0.626199
G1 F3028.185
G1 X97.367 Y92.671 E.00836
; LINE_WIDTH: 0.651829
G1 F2897.025
G1 X97.377 Y92.804 E.00874
; WIPE_START
M204 S6000
G1 X97.367 Y92.671 E-.07663
G1 X97.356 Y92.538 E-.07663
G1 X97.227 Y92.267 E-.17229
G1 X96.966 Y92.009 E-.2107
G1 X96.785 Y91.937 E-.11188
G1 X96.604 Y91.864 E-.11187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.604 Y91.864 Z.76 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.616269
G1 F3082.25
M204 S5000
G1 X96.57 Y91.869 E.00211
; LINE_WIDTH: 0.593948
G1 F3211.115
G1 X96.5 Y91.905 E.00459
; LINE_WIDTH: 0.549697
G1 F3501.343
G1 X96.431 Y91.94 E.00421
; LINE_WIDTH: 0.505445
G1 F3849.248
G1 X96.362 Y91.976 E.00383
; LINE_WIDTH: 0.461192
G1 F4273.919
G1 X96.293 Y92.011 E.00345
; LINE_WIDTH: 0.416941
G1 F4803.912
G1 X96.224 Y92.047 E.00307
; LINE_WIDTH: 0.413171
G1 F4855.199
G1 X96.11 Y92.121 E.0053
; LINE_WIDTH: 0.453654
G1 F4355.788
G1 X95.996 Y92.195 E.00591
; LINE_WIDTH: 0.494136
G1 F3949.535
G1 X95.882 Y92.269 E.00652
; LINE_WIDTH: 0.534618
G1 F3612.597
G1 X95.768 Y92.343 E.00713
G1 X95.808 Y92.423 E.0047
; LINE_WIDTH: 0.489994
G1 F3987.592
G1 X95.847 Y92.504 E.00426
G1 X95.764 Y92.47 E.00426
; LINE_WIDTH: 0.534618
G1 F3612.597
G1 X95.681 Y92.437 E.0047
G1 X95.626 Y92.519 E.00521
; LINE_WIDTH: 0.494393
G1 F3947.193
G1 X95.57 Y92.602 E.00477
; LINE_WIDTH: 0.454168
G1 F4350.096
G1 X95.515 Y92.684 E.00433
; LINE_WIDTH: 0.413943
G1 F4844.6
G1 X95.459 Y92.766 E.00389
; LINE_WIDTH: 0.419291
G1 F4772.484
G1 X95.412 Y92.847 E.00374
; LINE_WIDTH: 0.464862
G1 F4235.168
G1 X95.364 Y92.929 E.00421
; LINE_WIDTH: 0.510435
G1 F3806.597
G1 X95.316 Y93.01 E.00469
; LINE_WIDTH: 0.556006
G1 F3456.793
G1 X95.269 Y93.091 E.00516
; LINE_WIDTH: 0.601578
G1 F3165.868
G1 X95.221 Y93.172 E.00564
G1 X95.199 Y93.116 E.00361
; LINE_WIDTH: 0.572128
G1 F3347.953
G1 X95.177 Y93.06 E.00341
; LINE_WIDTH: 0.542678
G1 F3552.261
G1 X95.168 Y92.98 E.00431
; LINE_WIDTH: 0.498181
G1 F3913.068
G1 X95.159 Y92.9 E.00391
; LINE_WIDTH: 0.453683
G1 F4355.456
G1 X95.151 Y92.819 E.00351
; LINE_WIDTH: 0.409186
G1 F4910.622
G1 X95.142 Y92.739 E.00312
; LINE_WIDTH: 0.395948
G1 F5104.168
G1 X95.378 Y92.319 E.01791
; LINE_WIDTH: 0.442172
G1 F4486.68
G1 X95.441 Y92.29 E.00291
; LINE_WIDTH: 0.488395
G1 F4002.472
G1 X95.503 Y92.262 E.00326
; LINE_WIDTH: 0.534618
G1 F3612.597
G2 X95.598 Y92.168 I-.01 J-.105 E.0076
; LINE_WIDTH: 0.484795
G1 F4036.399
G1 X95.631 Y92.102 E.00344
; LINE_WIDTH: 0.434972
G1 F4572.851
G1 X95.663 Y92.036 E.00304
; LINE_WIDTH: 0.385148
G1 F5273.752
G1 X96.099 Y91.76 E.01857
; LINE_WIDTH: 0.410241
G1 F4895.826
G1 X96.181 Y91.766 E.00318
; LINE_WIDTH: 0.448494
G1 F4413.655
G1 X96.263 Y91.773 E.00352
; LINE_WIDTH: 0.486746
G1 F4017.943
G1 X96.344 Y91.78 E.00387
; LINE_WIDTH: 0.524998
G1 F3687.35
G1 X96.426 Y91.786 E.00422
; LINE_WIDTH: 0.570634
G1 F3357.756
G1 X96.515 Y91.825 E.00547
; LINE_WIDTH: 0.616269
G1 F3082.25
G1 X96.549 Y91.84 E.00227
M204 S10000
G1 X95.847 Y92.504 F42000
; LINE_WIDTH: 0.445368
G1 F4449.454
M204 S5000
G1 X95.878 Y92.532 E.00176
; LINE_WIDTH: 0.439068
G1 F4523.42
G1 X96.681 Y93.336 E.04765
; LINE_WIDTH: 0.488045
G1 F4005.752
G1 X96.707 Y93.396 E.00311
; LINE_WIDTH: 0.537021
G1 F3594.403
G1 X96.733 Y93.456 E.00346
; LINE_WIDTH: 0.585997
G1 F3259.668
G1 X96.759 Y93.517 E.00382
; LINE_WIDTH: 0.634973
G1 F2981.968
G1 X96.784 Y93.577 E.00417
; LINE_WIDTH: 0.683949
G1 F2747.869
G1 X96.81 Y93.638 E.00453
G1 X96.622 Y93.795 E.01689
; LINE_WIDTH: 0.680269
G1 F2764.174
G1 X96.463 Y93.875 E.01222
; LINE_WIDTH: 0.653208
G1 F2890.285
G1 X96.304 Y93.955 E.01169
; LINE_WIDTH: 0.626149
G1 F3028.452
G1 X96.001 Y93.977 E.01899
; LINE_WIDTH: 0.587689
G1 F3249.215
G1 X95.658 Y93.862 E.02112
; LINE_WIDTH: 0.543368
G1 F3547.19
G1 X95.452 Y93.687 E.01447
; LINE_WIDTH: 0.578888
G1 F3304.329
G1 X95.258 Y93.368 E.02141
; LINE_WIDTH: 0.605888
G1 F3140.868
G1 X95.221 Y93.174 E.01191
; WIPE_START
M204 S6000
G1 X95.258 Y93.368 E-.07498
G1 X95.452 Y93.687 E-.14183
G1 X95.658 Y93.862 E-.10291
G1 X96.001 Y93.977 E-.13758
G1 X96.304 Y93.955 E-.11529
G1 X96.463 Y93.875 E-.0677
G1 X96.622 Y93.795 E-.0677
G1 X96.727 Y93.707 E-.05201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.484 Y90.756 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.444858
G1 F4455.352
M204 S5000
G1 X95.27 Y90.794 E.00923
; LINE_WIDTH: 0.400499
G1 F5035.944
G1 X94.915 Y91.106 E.01778
; LINE_WIDTH: 0.389959
G1 F5196.853
G1 X94.116 Y91.903 E.04119
; LINE_WIDTH: 0.431884
G1 F4610.836
G1 X94.072 Y91.947 E.00257
; LINE_WIDTH: 0.473808
G1 F4143.589
G1 X94.028 Y91.991 E.00286
; LINE_WIDTH: 0.522798
G1 F3704.882
G1 X94.068 Y92.124 E.00711
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X94.108 Y92.257 E.00786
G1 X94.022 Y92.231 E.00513
; LINE_WIDTH: 0.537815
G1 F3588.424
G1 X93.935 Y92.204 E.00479
; LINE_WIDTH: 0.503842
G1 F3863.15
G1 X93.848 Y92.178 E.00445
; LINE_WIDTH: 0.469869
G1 F4183.43
G1 X93.801 Y92.222 E.0029
; LINE_WIDTH: 0.429918
G1 F4635.335
G1 X93.754 Y92.265 E.00262
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X93.296 Y92.723 E.02365
G1 X93.198 Y92.355 E.01392
; LINE_WIDTH: 0.431884
G1 F4610.836
G1 X93.404 Y92.149 E.01195
; LINE_WIDTH: 0.473808
G1 F4143.589
G1 X93.609 Y91.943 E.0133
; LINE_WIDTH: 0.522798
G1 F3704.882
G1 X93.571 Y91.813 E.00696
; LINE_WIDTH: 0.571788
G1 F3350.177
G1 X93.533 Y91.682 E.0077
G1 X93.663 Y91.723 E.00769
; LINE_WIDTH: 0.527888
G1 F3664.57
G1 X93.793 Y91.764 E.00703
; LINE_WIDTH: 0.483988
G1 F4044.081
G1 X93.838 Y91.717 E.00303
; LINE_WIDTH: 0.436979
G1 F4548.504
G1 X93.883 Y91.67 E.00269
; LINE_WIDTH: 0.389969
G1 F5196.695
G1 X94.166 Y91.388 E.01459
G1 X94.68 Y90.878 E.02642
; LINE_WIDTH: 0.393959
G1 F5134.591
G1 X94.948 Y90.616 E.01385
; LINE_WIDTH: 0.412468
G1 F4864.878
G1 X95.249 Y90.428 E.01382
G1 X95.488 Y90.469 E.00945
; LINE_WIDTH: 0.444858
G1 F4455.352
G1 X95.598 Y90.562 E.00612
; LINE_WIDTH: 0.484702
G1 F4037.287
G1 X95.656 Y90.657 E.00524
; LINE_WIDTH: 0.524545
G1 F3690.948
G1 X95.714 Y90.753 E.00574
; LINE_WIDTH: 0.564389
G1 F3399.337
G1 X95.771 Y90.848 E.00623
G1 X95.676 Y90.817 E.00562
; LINE_WIDTH: 0.524545
G1 F3690.948
G1 X95.58 Y90.787 E.00518
; LINE_WIDTH: 0.484702
G1 F4037.287
G1 X95.541 Y90.774 E.00192
; WIPE_START
M204 S6000
G1 X95.27 Y90.794 E-.10316
G1 X94.915 Y91.106 E-.1795
G1 X94.116 Y91.903 E-.42901
G1 X94.072 Y91.947 E-.02372
G1 X94.028 Y91.991 E-.02372
G1 X94.029 Y91.994 E-.00088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.108 Y92.257 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.571788
G1 F3350.177
M204 S5000
G1 X94.218 Y92.366 E.00873
; WIPE_START
M204 S6000
G1 X94.108 Y92.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.381 Y87.464 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.582228
G1 F3283.192
M204 S5000
G1 X92.514 Y87.561 E.0095
; LINE_WIDTH: 0.534998
G1 F3609.707
G1 X92.647 Y87.658 E.00864
; LINE_WIDTH: 0.487769
G1 F4008.337
G1 X92.745 Y87.839 E.00976
; LINE_WIDTH: 0.444739
G1 F4456.742
G1 X92.843 Y88.021 E.00878
; LINE_WIDTH: 0.427529
G1 F4665.485
G1 X92.897 Y88.368 E.01429
; WIPE_START
M204 S6000
G1 X92.843 Y88.021 E-.24432
G1 X92.745 Y87.839 E-.14347
G1 X92.647 Y87.658 E-.14346
G1 X92.514 Y87.561 E-.11438
G1 X92.381 Y87.464 E-.11437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.54 Y89.69 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.575688
G1 F3324.837
M204 S5000
G1 X91.452 Y89.631 E.00605
G1 X91.562 Y89.628 E.00627
; LINE_WIDTH: 0.542278
G1 F3555.208
G1 X91.672 Y89.625 E.00587
; LINE_WIDTH: 0.508869
G1 F3819.88
G1 X91.728 Y89.598 E.00307
; LINE_WIDTH: 0.469068
G1 F4191.613
G1 X91.783 Y89.57 E.0028
; LINE_WIDTH: 0.429269
G1 F4643.496
G1 X91.839 Y89.543 E.00253
; LINE_WIDTH: 0.427449
G1 F4666.501
G1 X91.942 Y89.469 E.00516
; LINE_WIDTH: 0.465429
G1 F4229.254
G1 X92.046 Y89.396 E.0057
; LINE_WIDTH: 0.503408
G1 F3866.926
G1 X92.149 Y89.322 E.00623
; LINE_WIDTH: 0.541389
G1 F3561.782
G1 X92.253 Y89.248 E.00676
G1 X92.224 Y89.173 E.00427
; LINE_WIDTH: 0.509908
G1 F3811.048
G1 X92.195 Y89.099 E.00399
G1 X92.27 Y89.128 E.00399
; LINE_WIDTH: 0.541389
G1 F3561.782
G1 X92.344 Y89.157 E.00427
G1 X92.357 Y89.13 E.00157
; LINE_WIDTH: 0.501776
G1 F3881.219
G1 X92.371 Y89.104 E.00144
; LINE_WIDTH: 0.462164
G1 F4263.597
G1 X92.384 Y89.077 E.00131
; LINE_WIDTH: 0.422551
G1 F4729.553
G1 X92.397 Y89.051 E.00118
; LINE_WIDTH: 0.391248
G1 F5176.609
G1 X92.73 Y88.692 E.01795
; LINE_WIDTH: 0.429601
G1 F4639.317
G1 X92.772 Y88.664 E.00204
; LINE_WIDTH: 0.467954
G1 F4203.072
G1 X92.814 Y88.637 E.00226
; LINE_WIDTH: 0.506306
G1 F3841.817
G1 X92.856 Y88.61 E.00247
; LINE_WIDTH: 0.544658
G1 F3537.747
G2 X92.898 Y88.511 I-.011 J-.063 E.00682
; LINE_WIDTH: 0.505615
G1 F3847.774
G1 X92.898 Y88.44 E.00352
; LINE_WIDTH: 0.466572
G1 F4217.358
G1 X92.897 Y88.368 E.00321
; LINE_WIDTH: 0.468615
G1 F4196.264
G1 X92.939 Y88.409 E.00265
; LINE_WIDTH: 0.509702
G1 F3812.801
G1 X92.981 Y88.45 E.00292
; LINE_WIDTH: 0.550788
G1 F3493.552
G1 X93.024 Y88.491 E.00319
G1 X93.284 Y88.393 E.01512
G1 X93.365 Y88.477 E.00631
G1 X93.098 Y88.702 E.01899
G1 X93.08 Y88.744 E.00245
; LINE_WIDTH: 0.512191
G1 F3791.808
G1 X93.062 Y88.785 E.00226
; LINE_WIDTH: 0.473594
G1 F4145.744
G1 X93.044 Y88.826 E.00206
; LINE_WIDTH: 0.434996
G1 F4572.557
G1 X93.026 Y88.868 E.00187
; LINE_WIDTH: 0.396399
G1 F5097.338
G1 X92.656 Y89.246 E.01968
; LINE_WIDTH: 0.420849
G1 F4751.873
G1 X92.603 Y89.271 E.00234
; LINE_WIDTH: 0.461029
G1 F4275.666
G1 X92.55 Y89.296 E.0026
; LINE_WIDTH: 0.501208
G1 F3886.212
G1 X92.497 Y89.321 E.00286
; LINE_WIDTH: 0.541389
G1 F3561.782
G2 X92.433 Y89.385 I-.004 J.061 E.00545
; LINE_WIDTH: 0.503043
G1 F3870.113
G1 X92.422 Y89.424 E.00198
; LINE_WIDTH: 0.464698
G1 F4236.884
G1 X92.411 Y89.463 E.00181
; LINE_WIDTH: 0.426354
G1 F4680.452
G1 X92.399 Y89.502 E.00164
; LINE_WIDTH: 0.389469
G1 F5204.583
G1 X92.009 Y89.829 E.01855
; LINE_WIDTH: 0.400849
G1 F5030.772
G1 X91.805 Y89.867 E.00782
; LINE_WIDTH: 0.444559
G1 F4458.828
G1 X91.717 Y89.808 E.00451
; LINE_WIDTH: 0.488268
G1 F4003.657
G1 X91.629 Y89.749 E.00502
; LINE_WIDTH: 0.531978
G1 F3632.808
G1 X91.59 Y89.723 E.0024
M204 S10000
G1 X92.195 Y89.099 F42000
; LINE_WIDTH: 0.478429
G1 F4097.829
M204 S5000
G1 X91.882 Y88.601 E.02718
; LINE_WIDTH: 0.482949
G1 F4054.027
G1 X91.671 Y88.218 E.02047
; WIPE_START
M204 S6000
G1 X91.882 Y88.601 E-.32454
G1 X92.195 Y89.099 E-.43546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.452 Y89.631 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.575688
G1 F3324.837
M204 S5000
G1 X91.123 Y89.366 E.02407
; LINE_WIDTH: 0.573469
G1 F3339.214
G1 X90.895 Y89.034 E.02291
; LINE_WIDTH: 0.604899
G1 F3146.575
G1 X90.871 Y88.883 E.0092
; LINE_WIDTH: 0.636329
G1 F2974.951
G1 X90.847 Y88.732 E.00973
M204 S10000
G1 X91.602 Y88.114 F42000
; LINE_WIDTH: 0.449834
G1 F4398.48
M204 S5000
G1 X91.533 Y88.01 E.00538
; LINE_WIDTH: 0.416719
G1 F4806.903
G1 X91.48 Y87.82 E.00776
; LINE_WIDTH: 0.378599
G1 F5382.204
G1 X91.511 Y87.653 E.006
; LINE_WIDTH: 0.388218
G1 F5224.41
G1 X91.667 Y87.426 E.01
; LINE_WIDTH: 0.393169
G1 F5146.769
G1 X91.867 Y87.282 E.00907
; LINE_WIDTH: 0.420974
G1 F4750.227
G1 X91.988 Y87.281 E.00485
; LINE_WIDTH: 0.448779
G1 F4410.419
G1 X92.11 Y87.281 E.00522
; LINE_WIDTH: 0.493262
G1 F3957.506
G1 X92.2 Y87.342 E.00522
; LINE_WIDTH: 0.537745
G1 F3588.95
G1 X92.29 Y87.403 E.00575
; LINE_WIDTH: 0.582228
G1 F3283.192
G1 X92.381 Y87.464 E.00629
G1 X92.27 Y87.465 E.00639
; LINE_WIDTH: 0.548138
G1 F3512.521
G1 X92.185 Y87.505 E.0051
; LINE_WIDTH: 0.509011
G1 F3818.668
G1 X92.099 Y87.546 E.00469
; LINE_WIDTH: 0.469884
G1 F4183.276
G1 X92.014 Y87.586 E.00428
; LINE_WIDTH: 0.430756
G1 F4624.861
G1 X91.928 Y87.627 E.00387
; LINE_WIDTH: 0.391639
G1 F5170.519
G1 X91.721 Y87.888 E.01223
; LINE_WIDTH: 0.437293
G1 F4544.706
G1 X91.696 Y88.053 E.00695
; LINE_WIDTH: 0.482949
G1 F4054.027
G1 X91.671 Y88.218 E.00779
G1 X91.635 Y88.164 E.00303
; WIPE_START
M204 S6000
G1 X91.533 Y88.01 E-.07021
G1 X91.48 Y87.82 E-.07474
G1 X91.511 Y87.653 E-.06477
G1 X91.667 Y87.426 E-.10469
G1 X91.867 Y87.282 E-.09354
G1 X91.988 Y87.281 E-.04617
G1 X92.11 Y87.281 E-.04618
G1 X92.2 Y87.342 E-.04139
G1 X92.29 Y87.403 E-.04139
G1 X92.381 Y87.464 E-.0414
G1 X92.27 Y87.465 E-.04206
G1 X92.185 Y87.505 E-.03591
G1 X92.099 Y87.546 E-.03591
G1 X92.048 Y87.57 E-.02164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.657 Y86.607 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.639129
G1 F2960.565
M204 S5000
G1 X88.514 Y86.577 E.00931
; LINE_WIDTH: 0.603088
G1 F3157.064
G1 X88.372 Y86.547 E.00873
; LINE_WIDTH: 0.567048
G1 F3381.501
G1 X88.012 Y86.28 E.02514
; LINE_WIDTH: 0.534388
G1 F3614.349
G1 X87.814 Y86.041 E.01624
; LINE_WIDTH: 0.560908
G1 F3422.958
G1 X87.692 Y85.749 E.01757
; LINE_WIDTH: 0.595109
G1 F3204.152
G1 X87.702 Y85.555 E.01149
; WIPE_START
M204 S6000
G1 X87.692 Y85.749 E-.09458
G1 X87.814 Y86.041 E-.15453
G1 X88.012 Y86.28 E-.15081
G1 X88.372 Y86.547 E-.21848
G1 X88.514 Y86.577 E-.07081
G1 X88.657 Y86.607 E-.0708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.861 Y85.477 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.359899
G1 F5717.907
M204 S5000
G1 X89.888 Y85.257 E.00736
; LINE_WIDTH: 0.319309
G1 F6613.246
G1 X89.748 Y84.934 E.01009
; LINE_WIDTH: 0.290428
G1 F7442.415
G1 X89.486 Y84.665 E.00958
; LINE_WIDTH: 0.322259
G1 F6538.833
G1 X89.177 Y84.511 E.01001
; LINE_WIDTH: 0.363169
G1 F5656.215
G1 X88.852 Y84.534 E.01091
G1 X88.65 Y84.26 E.01139
G1 X88.766 Y84.222 E.00409
G1 X89.189 Y84.248 E.01421
; LINE_WIDTH: 0.324129
G1 F6492.523
G1 X89.557 Y84.429 E.01196
; LINE_WIDTH: 0.294668
G1 F7307.894
G1 X89.886 Y84.737 E.01171
; LINE_WIDTH: 0.310208
G1 F6853.854
G1 X90.086 Y85.049 E.01024
; LINE_WIDTH: 0.341419
G1 F6093.505
G1 X90.162 Y85.388 E.01081
; LINE_WIDTH: 0.344889
G1 F6019.262
G1 X90.157 Y85.45 E.00197
; LINE_WIDTH: 0.376079
G1 F5425.126
G1 X90.081 Y85.701 E.00915
; LINE_WIDTH: 0.398269
G1 F5069.151
G1 X89.911 Y85.908 E.01002
G1 X89.759 Y86 E.00665
G1 X89.545 Y86.027 E.00808
; LINE_WIDTH: 0.395039
G1 F5118.035
G1 X89.136 Y85.888 E.01599
; LINE_WIDTH: 0.375309
G1 F5438.379
G1 X88.229 Y85.396 E.03598
; LINE_WIDTH: 0.405362
G1 F4965.011
G1 X88.118 Y85.4 E.00425
; LINE_WIDTH: 0.438875
G1 F4525.728
G1 X88.007 Y85.404 E.00467
; LINE_WIDTH: 0.472389
G1 F4157.86
G1 X87.895 Y85.408 E.00508
; LINE_WIDTH: 0.511782
G1 F3795.243
G1 X87.835 Y85.448 E.00363
; LINE_WIDTH: 0.551175
G1 F3490.801
G1 X87.775 Y85.489 E.00395
; LINE_WIDTH: 0.590568
G1 F3231.575
G1 X87.714 Y85.53 E.00427
G1 X87.709 Y85.424 E.00622
; LINE_WIDTH: 0.542278
G1 F3555.208
G1 X87.744 Y85.337 E.00499
; LINE_WIDTH: 0.493459
G1 F3955.709
G1 X87.78 Y85.25 E.00449
; LINE_WIDTH: 0.444638
G1 F4457.901
G1 X87.815 Y85.164 E.00398
; LINE_WIDTH: 0.395819
G1 F5106.144
G1 X88.008 Y85.061 E.00811
; LINE_WIDTH: 0.385739
G1 F5264.197
G1 X88.26 Y85.072 E.00908
; LINE_WIDTH: 0.380249
G1 F5354.465
G1 X88.766 Y85.3 E.01966
; LINE_WIDTH: 0.378029
G1 F5391.853
G1 X89.345 Y85.637 E.02354
; LINE_WIDTH: 0.398369
G1 F5067.653
G1 X89.638 Y85.684 E.01111
G1 X89.817 Y85.518 E.00913
; WIPE_START
M204 S6000
G1 X89.888 Y85.257 E-.10289
G1 X89.748 Y84.934 E-.13372
G1 X89.486 Y84.665 E-.14285
G1 X89.177 Y84.511 E-.13117
G1 X88.852 Y84.534 E-.12369
G1 X88.656 Y84.268 E-.12567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.672 Y85.428 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.361888
G1 F5680.205
M204 S5000
G1 X85.886 Y85.215 E.01007
G1 X86.137 Y85.466 E.01186
G1 X86.03 Y85.573 E.00504
G1 X85.924 Y85.679 E.00504
G1 X85.715 Y85.471 E.00986
; WIPE_START
M204 S6000
G1 X85.886 Y85.215 E-.18556
G1 X86.137 Y85.466 E-.21432
G1 X86.03 Y85.573 E-.091
G1 X85.924 Y85.679 E-.091
G1 X85.715 Y85.471 E-.17813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.179 Y83.173 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.388679
G1 F5217.096
M204 S5000
G1 X88.295 Y83.289 E.00597
G1 X86.653 Y84.931 E.08439
G1 X86.421 Y84.699 E.01194
G1 X88.063 Y83.057 E.08439
G1 X88.136 Y83.131 E.00379
; WIPE_START
M204 S6000
G1 X88.295 Y83.289 E-.08523
G1 X87.039 Y84.545 E-.67477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.592 Y81.445 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.595149
G1 F3203.913
M204 S5000
G1 X83.582 Y81.639 E.01149
; LINE_WIDTH: 0.560908
G1 F3422.958
G1 X83.704 Y81.932 E.01756
; LINE_WIDTH: 0.534388
G1 F3614.349
G1 X83.902 Y82.17 E.01623
; LINE_WIDTH: 0.567029
G1 F3381.634
G1 X84.262 Y82.437 E.02515
; LINE_WIDTH: 0.603078
G1 F3157.122
G1 X84.404 Y82.467 E.00873
; LINE_WIDTH: 0.639129
G1 F2960.565
G1 X84.547 Y82.497 E.00931
; WIPE_START
M204 S6000
G1 X84.404 Y82.467 E-.0708
G1 X84.262 Y82.437 E-.0708
G1 X83.902 Y82.17 E-.21851
G1 X83.704 Y81.932 E-.15079
G1 X83.582 Y81.639 E-.15448
G1 X83.592 Y81.445 E-.09461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.751 Y81.367 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.359888
G1 F5718.098
M204 S5000
G1 X85.778 Y81.147 E.00736
; LINE_WIDTH: 0.319319
G1 F6612.991
G1 X85.638 Y80.824 E.01009
; LINE_WIDTH: 0.290439
G1 F7442.091
G1 X85.376 Y80.555 E.00958
; LINE_WIDTH: 0.322259
G1 F6538.833
G1 X85.067 Y80.401 E.01001
; LINE_WIDTH: 0.363158
G1 F5656.402
G1 X84.742 Y80.424 E.01091
G1 X84.54 Y80.15 E.01139
G1 X84.656 Y80.112 E.00409
G1 X85.08 Y80.138 E.01421
; LINE_WIDTH: 0.324129
G1 F6492.523
G1 X85.447 Y80.319 E.01196
; LINE_WIDTH: 0.294679
G1 F7307.582
G1 X85.776 Y80.627 E.01171
; LINE_WIDTH: 0.310208
G1 F6853.854
G1 X85.976 Y80.939 E.01024
; LINE_WIDTH: 0.341429
G1 F6093.288
G1 X86.052 Y81.278 E.01081
; LINE_WIDTH: 0.344899
G1 F6019.05
G1 X86.047 Y81.34 E.00196
; LINE_WIDTH: 0.376059
G1 F5425.47
G1 X85.971 Y81.591 E.00915
; LINE_WIDTH: 0.398289
G1 F5068.852
G1 X85.801 Y81.798 E.01002
G1 X85.649 Y81.89 E.00665
G1 X85.435 Y81.918 E.00808
; LINE_WIDTH: 0.395029
G1 F5118.187
G1 X85.026 Y81.778 E.01599
; LINE_WIDTH: 0.375309
G1 F5438.379
G1 X84.119 Y81.286 E.03598
; LINE_WIDTH: 0.405385
G1 F4964.675
G1 X84.008 Y81.29 E.00425
; LINE_WIDTH: 0.438912
G1 F4525.291
G1 X83.897 Y81.294 E.00467
; LINE_WIDTH: 0.472439
G1 F4157.356
G1 X83.785 Y81.298 E.00508
; LINE_WIDTH: 0.511832
G1 F3794.823
G1 X83.725 Y81.339 E.00363
; LINE_WIDTH: 0.551225
G1 F3490.445
G1 X83.665 Y81.379 E.00395
; LINE_WIDTH: 0.590618
G1 F3231.27
G1 X83.605 Y81.42 E.00427
G1 X83.599 Y81.314 E.00622
; LINE_WIDTH: 0.542318
G1 F3554.913
G1 X83.634 Y81.227 E.00499
; LINE_WIDTH: 0.493505
G1 F3955.283
G1 X83.67 Y81.141 E.00449
; LINE_WIDTH: 0.444692
G1 F4457.283
G1 X83.705 Y81.054 E.00398
; LINE_WIDTH: 0.395878
G1 F5105.232
G1 X83.898 Y80.951 E.00811
; LINE_WIDTH: 0.385749
G1 F5264.036
G1 X84.15 Y80.962 E.00909
; LINE_WIDTH: 0.380249
G1 F5354.465
G1 X84.657 Y81.19 E.01966
; LINE_WIDTH: 0.378038
G1 F5391.684
G1 X85.235 Y81.527 E.02354
; LINE_WIDTH: 0.398369
G1 F5067.653
G1 X85.528 Y81.574 E.01111
G1 X85.707 Y81.408 E.00913
; WIPE_START
M204 S6000
G1 X85.778 Y81.147 E-.10288
G1 X85.638 Y80.824 E-.13373
G1 X85.376 Y80.555 E-.14284
G1 X85.067 Y80.401 E-.13118
G1 X84.742 Y80.424 E-.12369
G1 X84.546 Y80.158 E-.12568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.563 Y81.318 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.361888
G1 F5680.205
M204 S5000
G1 X81.776 Y81.105 E.01007
G1 X82.027 Y81.356 E.01186
G1 X81.921 Y81.463 E.00504
G1 X81.814 Y81.569 E.00504
G1 X81.605 Y81.361 E.00986
; WIPE_START
M204 S6000
G1 X81.776 Y81.105 E-.18555
G1 X82.027 Y81.356 E-.21432
G1 X81.921 Y81.463 E-.091
G1 X81.814 Y81.569 E-.091
G1 X81.605 Y81.361 E-.17813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.543 Y80.821 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.388679
G1 F5217.096
M204 S5000
G1 X82.311 Y80.589 E.01194
G1 X83.953 Y78.947 E.08439
G1 X84.069 Y79.063 E.00597
G1 X84.185 Y79.179 E.00597
G1 X82.585 Y80.779 E.08221
; WIPE_START
M204 S6000
G1 X82.311 Y80.589 E-.12693
G1 X83.489 Y79.411 E-.63307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.03 Y79.249 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.564209
G1 F3400.551
M204 S5000
G1 X80.936 Y79.148 E.00768
; LINE_WIDTH: 0.535208
G1 F3608.111
G1 X80.843 Y79.046 E.00724
; LINE_WIDTH: 0.506208
G1 F3842.656
G1 X80.805 Y78.955 E.00488
; LINE_WIDTH: 0.472289
G1 F4158.869
G1 X80.766 Y78.864 E.00451
; LINE_WIDTH: 0.438368
G1 F4531.791
G1 X80.728 Y78.773 E.00414
; LINE_WIDTH: 0.404449
G1 F4978.179
G1 X80.705 Y78.52 E.00968
M204 S10000
G1 X80.498 Y78.366 F42000
; LINE_WIDTH: 0.415554
G1 F4822.657
M204 S5000
G1 X80.441 Y78.403 E.00266
; LINE_WIDTH: 0.388699
G1 F5216.779
G1 X79.554 Y79.291 E.0456
G1 X79.322 Y79.058 E.01194
G1 X80.209 Y78.171 E.0456
; LINE_WIDTH: 0.414089
G1 F4842.615
G2 X80.87 Y77.51 I-5.697 J-6.358 E.0366
; LINE_WIDTH: 0.388689
G1 F5216.938
G1 X81.693 Y76.687 E.04231
G1 X81.925 Y76.919 E.01194
G1 X81.809 Y77.036 E.00597
; LINE_WIDTH: 0.403899
G1 F4986.143
G1 X80.835 Y78.041 E.05323
; LINE_WIDTH: 0.424909
G1 F4698.991
G1 X80.695 Y78.324 E.01271
G1 X80.705 Y78.52 E.00794
; LINE_WIDTH: 0.413499
G1 F4850.699
G1 X80.67 Y78.405 E.00471
; LINE_WIDTH: 0.442419
G1 F4483.785
G1 X80.554 Y78.328 E.00587
G1 X80.548 Y78.333 E.00033
; WIPE_START
M204 S6000
G1 X80.441 Y78.403 E-.04856
G1 X79.554 Y79.291 E-.47684
G1 X79.322 Y79.058 E-.12487
G1 X79.526 Y78.854 E-.10973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.047 Y78.041 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.388689
G1 F5216.938
M204 S5000
G1 X83.163 Y78.158 E.00597
G1 X83.047 Y78.274 E.00597
; LINE_WIDTH: 0.388889
G1 F5213.764
G1 X82.277 Y79.044 E.0396
; LINE_WIDTH: 0.390918
G1 F5181.772
G1 X81.88 Y79.401 E.01953
; LINE_WIDTH: 0.396149
G1 F5101.13
G1 X81.612 Y79.54 E.01125
G1 X81.406 Y79.565 E.00772
; LINE_WIDTH: 0.420279
G1 F4759.393
G1 X81.307 Y79.514 E.00444
; LINE_WIDTH: 0.455269
G1 F4337.987
G1 X81.208 Y79.463 E.00487
; LINE_WIDTH: 0.491582
G1 F3972.914
G1 X81.148 Y79.392 E.00442
; LINE_WIDTH: 0.527895
G1 F3664.518
G1 X81.089 Y79.32 E.0048
; LINE_WIDTH: 0.564209
G1 F3400.551
G1 X81.03 Y79.249 E.00517
G1 X81.118 Y79.249 E.00491
; LINE_WIDTH: 0.524243
G1 F3693.348
G1 X81.206 Y79.248 E.00452
; LINE_WIDTH: 0.484279
G1 F4041.316
G1 X81.294 Y79.248 E.00413
; LINE_WIDTH: 0.444313
G1 F4461.672
G1 X81.382 Y79.247 E.00374
; LINE_WIDTH: 0.404348
G1 F4979.625
G1 X81.67 Y79.146 E.01162
; LINE_WIDTH: 0.395609
G1 F5109.34
G1 X82.05 Y78.806 E.01893
; LINE_WIDTH: 0.388889
G1 F5213.764
G1 X82.931 Y77.925 E.04529
; LINE_WIDTH: 0.388689
G1 F5216.938
G1 X83.005 Y77.999 E.00379
; WIPE_START
M204 S6000
G1 X83.163 Y78.158 E-.08523
G1 X83.047 Y78.274 E-.06244
G1 X82.277 Y79.044 E-.41381
G1 X81.889 Y79.393 E-.19852
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.568 Y77.132 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.633069
G1 F2991.877
M204 S5000
G1 X77.052 Y76.616 E.04623
; WIPE_START
M204 S6000
G1 X77.568 Y77.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.223 Y77.786 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F2991.877
M204 S5000
G1 X78.707 Y78.271 E.04345
; WIPE_START
M204 S6000
G1 X78.223 Y77.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.142 Y77.429 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.494009
G1 F3950.695
M204 S5000
G1 X78.152 Y77.543 E.00547
; LINE_WIDTH: 0.535908
G1 F3602.803
G1 X78.161 Y77.656 E.006
; LINE_WIDTH: 0.584489
G1 F3269.042
G1 X78.192 Y77.721 E.00418
; LINE_WIDTH: 0.633069
G1 F2991.877
G1 X78.223 Y77.786 E.00456
G1 X78.157 Y77.756 E.00456
; LINE_WIDTH: 0.584489
G1 F3269.042
G1 X78.092 Y77.725 E.00418
; LINE_WIDTH: 0.535908
G1 F3602.803
G1 X77.985 Y77.642 E.00714
; LINE_WIDTH: 0.495239
G1 F3939.528
G1 X77.878 Y77.559 E.00653
; LINE_WIDTH: 0.454569
G1 F4345.685
G1 X77.77 Y77.476 E.00592
; LINE_WIDTH: 0.457732
G1 F4311.107
G1 X77.73 Y77.407 E.00351
; LINE_WIDTH: 0.501566
G1 F3883.061
G1 X77.689 Y77.338 E.00389
; LINE_WIDTH: 0.545401
G1 F3532.338
G1 X77.649 Y77.27 E.00428
; LINE_WIDTH: 0.589235
G1 F3239.721
G1 X77.609 Y77.201 E.00467
; LINE_WIDTH: 0.633069
G1 F2991.877
G1 X77.568 Y77.132 E.00505
G1 X77.613 Y77.154 E.00317
; LINE_WIDTH: 0.599303
G1 F3179.225
G1 X77.659 Y77.175 E.00299
; LINE_WIDTH: 0.565539
G1 F3391.603
G1 X77.711 Y77.174 E.00295
; LINE_WIDTH: 0.527628
G1 F3666.608
G1 X77.764 Y77.173 E.00273
; LINE_WIDTH: 0.489718
G1 F3990.144
G1 X77.817 Y77.171 E.00251
; LINE_WIDTH: 0.451809
G1 F4376.304
G1 X77.87 Y77.17 E.00228
; LINE_WIDTH: 0.413898
G1 F4845.216
G1 X77.95 Y77.13 E.0035
; LINE_WIDTH: 0.409169
G1 F4910.868
G1 X79.364 Y75.716 E.07721
; LINE_WIDTH: 0.408258
G1 F4923.703
G1 X80.036 Y75.044 E.03659
; LINE_WIDTH: 0.407829
G1 F4929.792
G1 X80.159 Y75.167 E.00669
G1 X80.282 Y75.29 E.00669
G1 X78.206 Y77.365 E.11288
; LINE_WIDTH: 0.452109
G1 F4372.955
G1 X78.185 Y77.387 E.00132
; WIPE_START
M204 S6000
G1 X78.152 Y77.543 E-.06061
G1 X78.161 Y77.656 E-.04331
G1 X78.192 Y77.721 E-.02737
G1 X78.223 Y77.786 E-.02737
G1 X78.157 Y77.756 E-.02737
G1 X78.092 Y77.725 E-.02737
G1 X77.985 Y77.642 E-.05159
G1 X77.878 Y77.559 E-.05159
G1 X77.77 Y77.476 E-.05159
G1 X77.73 Y77.407 E-.03029
G1 X77.689 Y77.338 E-.0303
G1 X77.649 Y77.27 E-.03029
G1 X77.609 Y77.201 E-.0303
G1 X77.568 Y77.132 E-.0303
G1 X77.613 Y77.154 E-.01903
G1 X77.659 Y77.175 E-.01902
G1 X77.711 Y77.174 E-.02004
G1 X77.764 Y77.173 E-.02004
G1 X77.817 Y77.171 E-.02004
G1 X77.87 Y77.17 E-.02004
G1 X77.95 Y77.13 E-.03403
G1 X78.114 Y76.966 E-.0881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.16
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 

M400 U1

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z3.76 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T240
M620.10 A0 F199
T0
M73 E7
M620.1 E F199 T270
M620.10 A1 F199 L212.133 H0.4 T270

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S270
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P34 R22
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
M73 P35 R22
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
M73 P35 R21
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
M73 P36 R21
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
M73 P37 R21
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.76
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
M73 P38 R21
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S0
M106 P2 S0
G1 X50.628 Y153.119 F42000
G1 Z.76
G1 X55.199 Y153.119 Z1.16
G1 X55.199 Y158.818
G1 X49.5 Y158.818

; filament start gcode
M106 P3 S180


G1 Z.76
M73 P38 R20
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y158.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
M73 P39 R20
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.5875 F1782
G1  Y159.318  E0.0256
G1  X49.500  E1.7412 F2025
G1  Y159.818  E0.0256
G1  X15.500  E1.7412 F2473
G1  Y160.318  E0.0256
G1  X49.500  E1.7412 F3897
G1  Y160.818  E0.0256
G1  X15.500  E1.7412
M73 P40 R20
G1  Y161.318  E0.0256
G1  X49.500  E1.7412
G1  Y161.818  E0.0256
G1  X15.500  E1.7412
G1  Y162.318  E0.0256
G1  X49.500  E1.7412
G1  Y162.818  E0.0256
G1  X15.500  E1.7412
G1  Y163.318  E0.0256
G1  X49.500  E1.7412
G1  Y163.818  E0.0256
G1  X15.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y163.318  F5400.000000
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y164.318  
M204 S6000
G1  Y158.318  E0.3073 F3897
G1  X49.250  E1.7540
G1 E-0.8000 F1800
M204 S10000
G1  X50.000 Y160.068   F600
G1 E0.8000 F1800
M204 S6000
G1  Y164.318  E0.2176 F3897
G1  X15.000  E1.7924
M204 S10000
G1  X14.560 Y164.758  
M204 S6000
G1  Y157.878  E0.3523
G1  X50.440  E1.8374
G1  Y164.758  E0.3523
G1  X14.560  E1.8374
M204 S10000
G1  X14.120 Y165.198  
M204 S6000
G1  Y157.438  E0.3974
G1  X50.880  E1.8825
G1  Y165.198  E0.3974
G1  X14.120  E1.8825
M204 S10000
G1  X13.680 Y165.638  
M204 S6000
G1  Y156.998  E0.4424
G1  X51.320  E1.9275
G1  Y165.638  E0.4424
G1  X13.680  E1.9275
M204 S10000
G1  X13.240 Y166.078  
M204 S6000
G1  Y156.558  E0.4875
G1  X51.760  E1.9726
G1  Y166.078  E0.4875
G1  X13.240  E1.9726
; WIPE_TOWER_END

; WIPE_START
G1 F4372.955
M204 S6000
G1 X15.24 Y166.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X79.371 Y78.393 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.483088
; LAYER_HEIGHT: 0.28
G1 F4052.685
M204 S5000
G1 X79.346 Y78.42 E.00171
; LINE_WIDTH: 0.481488
G1 F4068.072
G1 X78.843 Y78.923 E.03316
; WIPE_START
M204 S6000
G1 X79.346 Y78.42 E-.72284
G1 X79.371 Y78.393 E-.03716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.435 Y76.489 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X76.925 Y75.999 E.02759
G1 X77.078 Y75.948 E.00643
G1 X77.18 Y75.999 E.00451
G1 X77.837 Y76.657 E.03703
G1 X79.909 Y74.586 E.11659
G1 X80.067 Y74.536 E.00661
G1 X80.163 Y74.586 E.00431
G1 X80.74 Y75.162 E.03246
G1 X80.793 Y75.292 E.00556
G1 X80.74 Y75.417 E.00541
G1 X78.669 Y77.488 E.11659
G1 X79.325 Y78.144 E.03693
; LINE_WIDTH: 0.451544
G1 F4379.266
G1 X79.348 Y78.268 E.00547
; LINE_WIDTH: 0.483088
G1 F4052.685
G1 X79.371 Y78.393 E.00592
G1 X79.639 Y78.147 E.01703
; LINE_WIDTH: 0.451544
G1 F4379.266
G1 X79.907 Y77.901 E.01576
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.566 Y76.243 E.09335
G1 X81.748 Y76.199 E.00748
G1 X82.37 Y76.792 E.03421
G1 X82.421 Y76.895 E.00456
; LINE_WIDTH: 0.462315
G1 F4261.989
G1 X82.419 Y76.96 E.00292
; LINE_WIDTH: 0.504632
G1 F3856.285
G1 X82.417 Y77.026 E.00323
; LINE_WIDTH: 0.546948
G1 F3521.106
G1 X82.415 Y77.092 E.00354
G1 X81.444 Y78.063 E.07395
G1 X81.156 Y78.468 E.02676
; LINE_WIDTH: 0.541618
G1 F3560.081
G1 X81.168 Y78.613 E.00772
G1 X81.335 Y78.766 E.01207
G1 X81.503 Y78.663 E.0105
; LINE_WIDTH: 0.546959
G1 F3521.034
G1 X81.799 Y78.396 E.02143
G1 X82.759 Y77.436 E.07313
G1 X82.85 Y77.444 E.00493
; LINE_WIDTH: 0.504632
G1 F3856.285
G1 X82.941 Y77.451 E.0045
; LINE_WIDTH: 0.462315
G1 F4261.989
G1 X83.033 Y77.459 E.00407
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X83.608 Y78.03 E.03227
G1 X83.649 Y78.093 E.00296
G1 X83.599 Y78.276 E.00755
; LINE_WIDTH: 0.393869
G1 F5135.975
G1 X82.449 Y79.425 E.06001
; LINE_WIDTH: 0.402429
G1 F5007.553
G1 X82.195 Y79.667 E.01329
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.776 Y79.929 E.01968
G1 X81.429 Y79.978 E.01391
G1 X81.109 Y79.903 E.01309
G1 X80.797 Y79.719 E.01443
G1 X80.493 Y79.376 E.01823
G1 X80.358 Y79.058 E.01373
G1 X79.681 Y79.735 E.03811
G1 X79.531 Y79.787 E.00631
G1 X79.427 Y79.735 E.00463
G1 X78.877 Y79.186 E.03094
; LINE_WIDTH: 0.450743
G1 F4388.235
G1 X78.86 Y79.054 E.00572
; LINE_WIDTH: 0.481488
G1 F4068.072
G1 X78.843 Y78.923 E.00617
G1 X78.712 Y78.906 E.00617
; LINE_WIDTH: 0.450743
G1 F4388.235
G1 X78.58 Y78.889 E.00572
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X76.435 Y76.743 E.12076
G1 X76.385 Y76.585 E.00661
G1 X76.407 Y76.542 E.00193
; WIPE_START
M204 S6000
G1 X76.925 Y75.999 E-.28521
G1 X77.078 Y75.948 E-.06135
G1 X77.18 Y75.999 E-.04306
G1 X77.837 Y76.657 E-.35357
G1 X77.869 Y76.625 E-.01682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.494 Y77.644 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.647289
G1 F2919.424
M204 S6000
G1 X79.338 Y77.488 E.01433
; WIPE_START
G1 X79.494 Y77.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.117 Y82.805 Z1.16 F42000
G1 X85.194 Y82.875 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G3 X84.55 Y83.037 I-.71 J-1.459 E.02661
G1 X84.17 Y82.947 E.01553
G1 X83.783 Y82.7 E.01829
G1 X83.326 Y82.223 E.02628
G1 X83.099 Y81.766 E.02032
G1 X83.07 Y81.428 E.01347
; LINE_WIDTH: 0.454259
G1 F4349.103
G1 X83.14 Y81.089 E.01512
; LINE_WIDTH: 0.497535
G1 F3918.845
G1 X83.18 Y80.99 E.00514
; LINE_WIDTH: 0.540812
G1 F3566.055
G1 X83.22 Y80.892 E.00565
; LINE_WIDTH: 0.584089
G1 F3271.538
G1 X83.26 Y80.794 E.00616
G1 X83.17 Y80.855 E.00631
; LINE_WIDTH: 0.543066
G1 F3549.412
G1 X83.08 Y80.915 E.00582
; LINE_WIDTH: 0.502043
G1 F3878.87
G1 X82.989 Y80.976 E.00532
; LINE_WIDTH: 0.461021
G1 F4275.746
G1 X82.899 Y81.037 E.00483
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X82.624 Y81.299 E.01512
G1 X82.444 Y81.257 E.00737
G1 X82.486 Y81.437 E.00737
G1 X81.969 Y81.967 E.02946
G1 X81.824 Y82.048 E.00663
G1 X81.687 Y81.995 E.00584
G1 X81.137 Y81.445 E.03094
G1 X81.086 Y81.291 E.00645
G1 X81.137 Y81.191 E.00448
G1 X81.649 Y80.679 E.02881
G1 X81.734 Y80.641 E.00374
; LINE_WIDTH: 0.412859
G1 F4859.5
G1 X81.885 Y80.698 E.00626
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X81.835 Y80.504 E.00798
M73 P41 R20
G1 X82.408 Y79.932 E.03221
; LINE_WIDTH: 0.402429
G1 F5007.553
G1 X82.689 Y79.658 E.01486
; LINE_WIDTH: 0.393799
G1 F5137.052
G1 X83.835 Y78.512 E.05982
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X84.05 Y78.478 E.00866
G1 X84.63 Y79.052 E.03248
G1 X84.682 Y79.183 E.00562
G1 X84.63 Y79.307 E.00534
; LINE_WIDTH: 0.451228
G1 F4382.793
G1 X84.113 Y79.845 E.03226
; LINE_WIDTH: 0.459089
G1 F4296.456
G1 X84.06 Y79.904 E.00353
G1 X84.413 Y79.769 E.01669
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X84.824 Y79.708 E.01656
G1 X85.054 Y79.737 E.00922
G1 X85.499 Y79.917 E.01911
G1 X85.896 Y80.234 E.02021
G1 X86.209 Y80.609 E.01943
G1 X86.403 Y81.038 E.01875
G1 X86.433 Y81.414 E.01502
G1 X86.34 Y81.772 E.01473
G1 X86.114 Y82.081 E.01521
G1 X85.754 Y82.3 E.01678
G1 X85.412 Y82.334 E.01367
G3 X84.974 Y82.183 I.114 J-1.045 E.01861
G1 X85.267 Y82.609 E.02059
G1 X85.29 Y82.766 E.00631
G1 X85.233 Y82.83 E.0034
; WIPE_START
M204 S6000
G1 X84.83 Y83.001 E-.16661
G1 X84.55 Y83.037 E-.1072
G1 X84.17 Y82.947 E-.14824
G1 X83.783 Y82.7 E-.17462
G1 X83.486 Y82.389 E-.16332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.444 Y81.257 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.400089
G1 F5042.017
M204 S5000
G1 X81.885 Y80.698 E.02973
; WIPE_START
M204 S6000
G1 X82.444 Y81.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.263 Y80.79 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.635589
G1 F2978.776
M204 S5000
G1 X83.55 Y80.539 E.02427
M204 S10000
G1 X84.373 Y80.59 F42000
; LINE_WIDTH: 0.456519
G1 F4324.309
M204 S5000
G1 X84.038 Y80.518 E.01506
; LINE_WIDTH: 0.501286
G1 F3885.529
G1 X83.916 Y80.523 E.00596
; LINE_WIDTH: 0.546053
G1 F3527.591
G1 X83.794 Y80.529 E.00656
; LINE_WIDTH: 0.590821
G1 F3230.037
G1 X83.672 Y80.534 E.00716
; LINE_WIDTH: 0.635589
G1 F2978.776
G1 X83.55 Y80.539 E.00777
G1 X83.606 Y80.451 E.00666
; LINE_WIDTH: 0.590821
G1 F3230.037
G1 X83.663 Y80.363 E.00614
; LINE_WIDTH: 0.546053
G1 F3527.591
G1 X83.719 Y80.275 E.00562
; LINE_WIDTH: 0.501286
G1 F3885.529
G1 X83.775 Y80.187 E.0051
; LINE_WIDTH: 0.462108
G1 F4264.18
G1 X84.036 Y79.93 E.01627
G1 X84.041 Y80.163 E.01037
; LINE_WIDTH: 0.457339
G1 F4315.383
G1 X84.336 Y80.543 E.02116
M204 S10000
G1 X84.625 Y80.798 F42000
; LINE_WIDTH: 0.445662
G1 F4446.07
M204 S5000
G1 X84.736 Y80.811 E.00477
; LINE_WIDTH: 0.491235
G1 F3976.108
G1 X84.847 Y80.823 E.00534
; LINE_WIDTH: 0.536808
G1 F3596.001
G1 X84.958 Y80.836 E.0059
; LINE_WIDTH: 0.558128
G1 F3442.065
G1 X85.199 Y80.964 E.01501
; WIPE_START
M204 S6000
G1 X84.958 Y80.836 E-.34049
G1 X84.847 Y80.823 E-.13983
G1 X84.736 Y80.811 E-.13983
G1 X84.625 Y80.798 E-.13984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.747 Y81.993 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.434909
G1 F4573.624
M204 S5000
G1 X84.612 Y81.972 E.00566
; LINE_WIDTH: 0.469728
G1 F4184.859
G1 X84.477 Y81.951 E.00619
; LINE_WIDTH: 0.475929
G1 F4122.465
G1 X84.259 Y81.83 E.01147
; WIPE_START
M204 S6000
G1 X84.477 Y81.951 E-.3627
G1 X84.612 Y81.972 E-.19865
G1 X84.747 Y81.993 E-.19865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.554 Y85.367 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.400089
G1 F5042.017
M204 S5000
G1 X85.995 Y84.808 E.02973
; WIPE_START
M204 S6000
G1 X86.554 Y85.367 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.395 Y86.89 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X89.301 Y86.986 E.00534
G1 X89.059 Y87.09 E.0105
G1 X88.66 Y87.147 E.01606
G1 X88.273 Y87.053 E.01586
G1 X87.893 Y86.81 E.01794
G1 X87.436 Y86.333 E.02628
G1 X87.209 Y85.876 E.02032
G1 X87.18 Y85.538 E.01347
; LINE_WIDTH: 0.454278
G1 F4348.882
G1 X87.25 Y85.199 E.01512
; LINE_WIDTH: 0.497552
G1 F3918.696
G1 X87.29 Y85.1 E.00514
; LINE_WIDTH: 0.540825
G1 F3565.956
G1 X87.33 Y85.002 E.00565
; LINE_WIDTH: 0.584099
G1 F3271.475
G1 X87.37 Y84.904 E.00616
G1 X87.28 Y84.964 E.00631
; LINE_WIDTH: 0.543073
G1 F3549.356
G1 X87.19 Y85.025 E.00582
; LINE_WIDTH: 0.502048
G1 F3878.826
G1 X87.099 Y85.086 E.00532
; LINE_WIDTH: 0.461024
G1 F4275.72
G1 X87.009 Y85.147 E.00483
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X86.734 Y85.409 E.01512
G1 X86.554 Y85.367 E.00737
G1 X86.596 Y85.547 E.00737
G1 X86.079 Y86.077 E.02947
G1 X85.934 Y86.157 E.00661
G1 X85.847 Y86.141 E.00351
G1 X85.247 Y85.555 E.03338
G1 X85.195 Y85.416 E.00593
G1 X85.247 Y85.301 E.00503
G1 X85.795 Y84.761 E.03061
G1 X85.995 Y84.808 E.00817
G1 X85.961 Y84.589 E.0088
G3 X87.762 Y82.785 I325.923 J323.762 E.10147
G1 X87.94 Y82.608 E.00998
G1 X88.065 Y82.56 E.00536
G1 X88.19 Y82.612 E.00538
G1 X88.74 Y83.162 E.03094
G1 X88.792 Y83.293 E.00562
G1 X88.74 Y83.416 E.00534
; LINE_WIDTH: 0.451228
G1 F4382.793
G1 X88.223 Y83.955 E.03226
; LINE_WIDTH: 0.459089
G1 F4296.456
G1 X88.17 Y84.014 E.00353
G1 X88.523 Y83.879 E.01669
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X88.934 Y83.818 E.01656
G1 X89.164 Y83.847 E.00922
G1 X89.609 Y84.027 E.01911
G1 X90.006 Y84.343 E.02021
G1 X90.319 Y84.718 E.01942
G1 X90.514 Y85.158 E.01913
G1 X90.529 Y85.585 E.01704
G1 X90.45 Y85.882 E.01223
G1 X90.224 Y86.191 E.01521
G1 X89.864 Y86.409 E.01678
G1 X89.522 Y86.444 E.01366
G3 X89.084 Y86.293 I.114 J-1.045 E.01861
G1 X89.377 Y86.719 E.02059
G1 X89.389 Y86.83 E.00443
; WIPE_START
M204 S6000
G1 X89.301 Y86.986 E-.06782
G1 X89.059 Y87.09 E-.10024
G1 X88.66 Y87.147 E-.15333
G1 X88.273 Y87.053 E-.15138
G1 X87.893 Y86.81 E-.17129
G1 X87.682 Y86.589 E-.11595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.373 Y84.9 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.635589
G1 F2978.776
M204 S5000
G1 X87.66 Y84.649 E.02427
M204 S10000
G1 X88.483 Y84.7 F42000
; LINE_WIDTH: 0.456519
G1 F4324.309
M204 S5000
G1 X88.147 Y84.628 E.01506
; LINE_WIDTH: 0.501286
G1 F3885.529
G1 X88.026 Y84.633 E.00596
; LINE_WIDTH: 0.546053
G1 F3527.591
G1 X87.904 Y84.639 E.00656
; LINE_WIDTH: 0.590821
G1 F3230.037
G1 X87.782 Y84.644 E.00717
; LINE_WIDTH: 0.635589
G1 F2978.776
G1 X87.66 Y84.649 E.00777
G1 X87.716 Y84.561 E.00666
; LINE_WIDTH: 0.590821
G1 F3230.037
G1 X87.772 Y84.473 E.00614
; LINE_WIDTH: 0.546053
G1 F3527.591
G1 X87.829 Y84.385 E.00562
; LINE_WIDTH: 0.501286
G1 F3885.529
G1 X87.885 Y84.296 E.0051
; LINE_WIDTH: 0.462108
G1 F4264.18
G1 X88.146 Y84.04 E.01627
G1 X88.151 Y84.273 E.01037
; LINE_WIDTH: 0.457339
G1 F4315.383
G1 X88.446 Y84.653 E.02116
M204 S10000
G1 X88.735 Y84.908 F42000
; LINE_WIDTH: 0.445662
G1 F4446.07
M204 S5000
G1 X88.846 Y84.921 E.00477
; LINE_WIDTH: 0.491235
G1 F3976.108
G1 X88.957 Y84.933 E.00534
; LINE_WIDTH: 0.536808
G1 F3596.001
G1 X89.068 Y84.946 E.0059
; LINE_WIDTH: 0.558109
G1 F3442.202
G1 X89.309 Y85.074 E.01501
; WIPE_START
M204 S6000
G1 X89.068 Y84.946 E-.34048
G1 X88.957 Y84.933 E-.13985
G1 X88.846 Y84.921 E-.13984
G1 X88.735 Y84.908 E-.13984
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.857 Y86.103 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.434889
G1 F4573.868
M204 S5000
G1 X88.722 Y86.082 E.00566
; LINE_WIDTH: 0.469689
G1 F4185.268
G1 X88.587 Y86.061 E.00619
; LINE_WIDTH: 0.475929
G1 F4122.465
G1 X88.369 Y85.94 E.01147
; WIPE_START
M204 S6000
G1 X88.587 Y86.061 E-.36275
G1 X88.722 Y86.082 E-.19862
G1 X88.857 Y86.103 E-.19863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.072 Y88.572 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X94.007 Y88.707 E.00598
G1 X93.511 Y88.985 E.02261
G2 X92.384 Y90.062 I20.515 J22.587 E.06209
G1 X92.001 Y90.265 E.01724
G1 X91.636 Y90.266 E.01452
G1 X91.242 Y90.105 E.01695
G3 X90.476 Y89.331 I1.71 J-2.455 E.04358
G1 X90.322 Y88.907 E.01795
G1 X90.34 Y88.517 E.01555
G1 X90.545 Y88.046 E.02042
G1 X90.691 Y88.003 E.00607
G3 X91.328 Y88.465 I-1.347 J2.529 E.03143
G1 X91.12 Y88.098 E.0168
G1 X91.079 Y87.742 E.01426
G1 X91.175 Y87.401 E.01412
G1 X91.394 Y87.111 E.01447
G1 X91.759 Y86.888 E.017
G1 X92.129 Y86.84 E.01488
G1 X92.36 Y86.883 E.00935
G1 X92.713 Y87.069 E.01589
G1 X93.002 Y87.361 E.01635
G1 X93.176 Y87.684 E.01462
G1 X93.216 Y87.882 E.00802
G1 X93.354 Y87.84 E.00574
G1 X93.508 Y87.93 E.00711
G1 X94.019 Y88.441 E.02877
G1 X94.049 Y88.516 E.0032
; WIPE_START
M204 S6000
G1 X94.007 Y88.707 E-.07439
G1 X93.511 Y88.985 E-.21583
G1 X92.618 Y89.839 E-.46978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y88.974 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.576409
G1 F3320.2
M204 S5000
G1 X91.443 Y88.845 E.00867
; LINE_WIDTH: 0.569028
G1 F3368.345
G1 X91.425 Y88.763 E.00471
; LINE_WIDTH: 0.526793
G1 F3673.168
G1 X91.407 Y88.681 E.00432
; LINE_WIDTH: 0.484558
G1 F4038.65
G1 X91.389 Y88.599 E.00393
; LINE_WIDTH: 0.442324
G1 F4484.9
G1 X91.371 Y88.518 E.00354
; WIPE_START
M204 S6000
G1 X91.389 Y88.599 E-.13069
G1 X91.407 Y88.681 E-.13071
G1 X91.425 Y88.763 E-.13071
G1 X91.443 Y88.845 E-.13071
G1 X91.522 Y88.974 E-.23718
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.159 Y93.338 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X93.034 Y93.267 E.0057
G3 X92.775 Y92.237 I5.821 J-2.013 E.04234
G1 X93.065 Y91.915 E.01724
G1 X92.917 Y91.741 E.0091
G1 X92.937 Y91.583 E.00635
G1 X92.959 Y91.555 E.00143
G1 X93.408 Y91.107 E.02525
G1 X93.537 Y91.056 E.00553
G3 X93.766 Y91.214 I-.082 J.364 E.01136
G3 X94.889 Y90.148 I8.106 J7.416 E.06165
G1 X94.987 Y90.084 E.00467
G1 X95.335 Y89.993 E.01432
G1 X95.472 Y90.016 E.00553
G1 X95.838 Y90.192 E.01615
G1 X96.134 Y90.495 E.01686
G1 X96.36 Y90.919 E.01911
G1 X96.302 Y91.069 E.00643
G1 X95.81 Y91.465 E.02514
; LINE_WIDTH: 0.419778
G1 F4766.009
G1 X96.003 Y91.375 E.00849
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.466 Y91.31 E.01859
G1 X96.683 Y91.34 E.00875
G1 X97.079 Y91.498 E.01695
G1 X97.474 Y91.811 E.02008
G1 X97.753 Y92.184 E.01854
G1 X97.902 Y92.607 E.01784
G1 X97.899 Y93.024 E.01661
G1 X97.774 Y93.409 E.01607
G3 X98.524 Y93.284 I.648 J1.578 E.03051
G1 X99.014 Y93.453 E.02062
G1 X99.459 Y93.796 E.02236
G1 X99.771 Y94.171 E.01943
G1 X99.968 Y94.628 E.01979
G1 X99.995 Y94.977 E.01393
G1 X99.898 Y95.332 E.01466
; LINE_WIDTH: 0.409409
G1 F4907.494
G1 X99.62 Y95.65 E.01633
; LINE_WIDTH: 0.400189
G1 F5040.534
G1 X99.469 Y95.759 E.00702
; LINE_WIDTH: 0.431868
G1 F4611.022
G1 X99.317 Y95.868 E.00767
; LINE_WIDTH: 0.471694
G1 F4164.881
G1 X99.153 Y95.907 E.00767
; LINE_WIDTH: 0.511518
G1 F3797.456
G1 X98.989 Y95.945 E.00842
G1 X98.699 Y95.901 E.01466
G1 X98.905 Y96.245 E.02001
G1 X98.901 Y96.323 E.00392
G1 X98.824 Y96.385 E.00498
; LINE_WIDTH: 0.465759
G1 F4225.814
G1 X98.746 Y96.448 E.00447
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X98.512 Y96.543 E.01005
G1 X98.112 Y96.6 E.01606
G1 X97.733 Y96.51 E.01553
G1 X97.309 Y96.224 E.02034
G1 X96.889 Y95.785 E.02418
G1 X96.662 Y95.328 E.02032
G1 X96.632 Y94.991 E.01347
G1 X96.717 Y94.661 E.01356
; LINE_WIDTH: 0.465064
G1 F4233.065
G1 X96.812 Y94.491 E.00872
; LINE_WIDTH: 0.510128
G1 F3809.185
G1 X96.907 Y94.321 E.00969
G1 X96.667 Y94.395 E.01247
; LINE_WIDTH: 0.465064
G1 F4233.065
G1 X96.428 Y94.468 E.01122
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.034 Y94.497 E.01571
G1 X95.664 Y94.414 E.01511
G1 X95.274 Y94.191 E.01787
G1 X94.912 Y93.803 E.02114
G1 X94.731 Y93.398 E.01765
G1 X94.692 Y92.957 E.01762
; LINE_WIDTH: 0.420269
G1 F4759.525
G1 X94.772 Y92.513 E.01795
G1 X94.345 Y92.94 E.02407
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X94.176 Y92.988 E.00699
G1 X93.871 Y92.721 E.01613
G1 X93.306 Y93.286 E.03182
G1 X93.215 Y93.318 E.00382
; WIPE_START
M204 S6000
G1 X93.034 Y93.267 E-.07146
G1 X92.848 Y92.614 E-.25795
G1 X92.775 Y92.237 E-.14609
G1 X93.065 Y91.915 E-.16456
G1 X92.917 Y91.741 E-.08688
G1 X92.928 Y91.655 E-.03306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.539 Y91.42 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.429918
G1 F4635.335
M204 S5000
G1 X95.78 Y91.482 E.01018
; LINE_WIDTH: 0.430569
G1 F4627.202
G1 X95.497 Y91.631 E.01307
G1 X95.071 Y92.044 E.02431
; LINE_WIDTH: 0.425788
G1 F4687.683
G1 X94.818 Y92.459 E.01967
; LINE_WIDTH: 0.432508
G1 F4603.098
G1 X94.796 Y92.235 E.00928
; LINE_WIDTH: 0.437028
G1 F4547.901
G1 X94.585 Y92.02 E.01255
G1 X94.816 Y91.782 E.01382
; LINE_WIDTH: 0.430569
G1 F4627.202
G1 X95.411 Y91.208 E.03389
G1 X95.508 Y91.368 E.00765
; WIPE_START
M204 S6000
G1 X95.78 Y91.482 E-.11208
G1 X95.497 Y91.631 E-.12122
G1 X95.071 Y92.044 E-.22547
G1 X94.818 Y92.459 E-.18485
G1 X94.796 Y92.235 E-.08564
G1 X94.739 Y92.177 E-.03074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.574 Y93.932 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.748429
G1 F2490.463
M204 S5000
G1 X97.573 Y93.885 E.00356
; LINE_WIDTH: 0.701838
G1 F2671.267
G1 X97.571 Y93.839 E.00331
; LINE_WIDTH: 0.655249
G1 F2880.378
G1 X97.569 Y93.792 E.00307
; LINE_WIDTH: 0.608658
G1 F3125.008
G1 X97.567 Y93.745 E.00283
; LINE_WIDTH: 0.562069
G1 F3415.048
G1 X97.565 Y93.699 E.00259
; LINE_WIDTH: 0.515478
G1 F3764.434
G1 X97.564 Y93.652 E.00235
; LINE_WIDTH: 0.468888
G1 F4193.458
G1 X97.524 Y93.594 E.00318
; LINE_WIDTH: 0.441689
G1 F4492.363
G1 X97.485 Y93.535 E.00297
; LINE_WIDTH: 0.414488
G1 F4837.15
G1 X96.87 Y93.014 E.03158
; WIPE_START
M204 S6000
G1 X97.485 Y93.535 E-.49921
G1 X97.524 Y93.594 E-.04358
G1 X97.564 Y93.652 E-.04358
G1 X97.565 Y93.699 E-.02894
G1 X97.567 Y93.745 E-.02894
G1 X97.569 Y93.792 E-.02894
G1 X97.571 Y93.839 E-.02894
G1 X97.573 Y93.885 E-.02894
G1 X97.574 Y93.932 E-.02894
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.913 Y94.318 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.518228
G1 F3741.838
M204 S5000
G1 X97.146 Y94.149 E.01455
; WIPE_START
M204 S6000
G1 X96.913 Y94.318 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.87 Y93.014 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.400089
G1 F5042.017
M204 S5000
G1 X96.698 Y92.8 E.01034
; LINE_WIDTH: 0.368798
G1 F5553.062
G1 X96.322 Y92.416 E.01835
; LINE_WIDTH: 0.354149
G1 F5829.714
G1 X96.5 Y92.347 E.00619
G1 X96.654 Y92.367 E.00505
; LINE_WIDTH: 0.359509
G1 F5725.355
G1 X96.824 Y92.491 E.00696
G1 X96.889 Y92.613 E.00459
; LINE_WIDTH: 0.383419
G1 F5301.969
G1 X96.833 Y92.883 E.00985
; LINE_WIDTH: 0.400089
G1 F5042.017
G1 X96.854 Y92.957 E.00289
; WIPE_START
M204 S6000
G1 X96.698 Y92.8 E-.09305
G1 X96.322 Y92.416 E-.22624
G1 X96.5 Y92.347 E-.08015
G1 X96.654 Y92.367 E-.06538
G1 X96.824 Y92.491 E-.0885
G1 X96.889 Y92.613 E-.0584
G1 X96.833 Y92.883 E-.11593
G1 X96.854 Y92.957 E-.03235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.187 Y94.361 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.445669
G1 F4445.992
M204 S5000
G1 X98.298 Y94.373 E.00477
; LINE_WIDTH: 0.491249
G1 F3975.985
G1 X98.41 Y94.386 E.00534
; LINE_WIDTH: 0.536829
G1 F3595.851
G1 X98.521 Y94.399 E.0059
; LINE_WIDTH: 0.558109
G1 F3442.202
G1 X98.762 Y94.526 E.01501
; WIPE_START
M204 S6000
G1 X98.521 Y94.399 E-.3405
G1 X98.41 Y94.386 E-.13984
G1 X98.298 Y94.373 E-.13983
G1 X98.187 Y94.361 E-.13983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.309 Y95.555 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.448178
G1 F4417.238
M204 S5000
G1 X98.136 Y95.52 E.00758
; LINE_WIDTH: 0.496269
G1 F3930.225
G3 X97.821 Y95.393 I.002 J-.457 E.0168
; WIPE_START
M204 S6000
G1 X97.963 Y95.485 E-.24643
G1 X98.136 Y95.52 E-.25678
G1 X98.309 Y95.555 E-.25679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.49 Y98.679 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X98.413 Y98.646 E.00335
G1 X98.347 Y98.548 E.00468
G1 X98.115 Y97.672 E.03607
G1 X98.143 Y97.527 E.00588
G1 X98.408 Y97.258 E.01501
G1 X98.252 Y97.053 E.01024
G1 X98.302 Y96.898 E.00651
G1 X98.746 Y96.448 E.02515
; LINE_WIDTH: 0.465759
G1 F4225.814
G1 X98.834 Y96.403 E.00447
; LINE_WIDTH: 0.511518
G1 F3797.456
G1 X98.923 Y96.357 E.00497
G1 X99.109 Y96.492 E.01144
G1 X99.272 Y96.356 E.01061
; LINE_WIDTH: 0.473412
G1 F4147.566
G1 X99.435 Y96.219 E.00972
; LINE_WIDTH: 0.435305
G1 F4568.789
G1 X99.599 Y96.083 E.00882
; LINE_WIDTH: 0.409409
G1 F4907.494
G1 X100.157 Y95.562 E.02951
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X100.33 Y95.427 E.00873
G1 X100.705 Y95.339 E.01534
G1 X101.127 Y95.498 E.01795
G1 X101.476 Y95.838 E.0194
G1 X101.704 Y96.279 E.01975
G1 X101.636 Y96.419 E.0062
G1 X101.152 Y96.807 E.02469
G3 X100.973 Y96.834 I-.113 J-.14 E.00755
G3 X100.756 Y96.544 I1.13 J-1.074 E.01448
G2 X99.915 Y97.363 I20.777 J22.154 E.04671
G1 X100.174 Y97.641 E.01511
G1 X100.169 Y97.787 E.00583
G1 X99.688 Y98.283 E.02751
G1 X99.535 Y98.334 E.00641
G1 X99.433 Y98.283 E.00453
G1 X99.214 Y98.064 E.01234
G1 X98.648 Y98.629 E.03182
G1 X98.547 Y98.661 E.00422
; WIPE_START
M204 S6000
G1 X98.413 Y98.646 E-.05145
G1 X98.347 Y98.548 E-.0447
G1 X98.115 Y97.672 E-.34441
G1 X98.143 Y97.527 E-.05615
G1 X98.408 Y97.258 E-.14335
G1 X98.252 Y97.053 E-.09773
G1 X98.27 Y96.998 E-.02222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.426 Y89.367 Z1.16 F42000
G1 X98.64 Y78.967 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.504228
G1 F3859.787
M204 S6000
G3 X98.612 Y78.919 I-.052 J-.002 E.0132
; WIPE_START
G1 X98.556 Y78.919 E-.15198
G1 X98.529 Y78.967 E-.15201
G1 X98.556 Y79.015 E-.15199
G1 X98.612 Y79.015 E-.15201
G1 X98.64 Y78.967 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.875 Y76.632 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.477509
G1 F4106.86
M204 S6000
G3 X97.849 Y76.587 I-.049 J-.002 E.01166
; WIPE_START
G1 X97.797 Y76.587 E-.15198
G1 X97.771 Y76.632 E-.15201
G1 X97.797 Y76.677 E-.152
G1 X97.849 Y76.677 E-.15201
G1 X97.875 Y76.632 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.346 Y76.646 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.517769
G1 F3745.599
M204 S6000
G3 X95.317 Y76.596 I-.054 J-.002 E.01402
; WIPE_START
G1 X95.26 Y76.596 E-.15197
G1 X95.232 Y76.646 E-.15201
G1 X95.26 Y76.695 E-.152
G1 X95.317 Y76.695 E-.152
G1 X95.346 Y76.646 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.665 Y78.981 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.513008
G1 F3784.964
M204 S6000
G2 X94.694 Y79.03 I-.025 J.047 E.01372
; WIPE_START
G1 X94.665 Y79.079 E-.15201
G1 X94.609 Y79.079 E-.152
G1 X94.581 Y79.03 E-.152
G1 X94.609 Y78.981 E-.15201
G1 X94.665 Y78.981 E-.15197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.592 Y86.03 Z1.16 F42000
G1 X104.124 Y101.762 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F4763.096
M204 S5000
G1 X73.178 Y101.762 E1.23175
G1 X73.178 Y70.816 E1.23175
G1 X104.124 Y70.816 E1.23175
G1 X104.124 Y78.917 E.32243
G1 X104.124 Y101.702 E.90693
; WIPE_START
M204 S6000
G1 X102.124 Y101.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.607 Y95.554 Z1.16 F42000
G1 X92.087 Y88.034 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.380859
G1 F5344.283
M204 S5000
G1 X92.14 Y87.963 E.00317
G3 X92.405 Y88.04 I.075 J.236 E.01038
G1 X92.492 Y88.272 E.00878
G1 X92.487 Y88.357 E.00303
G1 X92.346 Y88.558 E.00871
G3 X92.107 Y88.091 I1.731 J-1.184 E.01866
; WIPE_START
M204 S6000
G1 X92.14 Y87.963 E-.06612
G1 X92.285 Y87.961 E-.07237
G1 X92.405 Y88.04 E-.07125
G1 X92.492 Y88.272 E-.12338
G1 X92.487 Y88.357 E-.0426
G1 X92.346 Y88.558 E-.1223
G1 X92.216 Y88.34 E-.12629
G1 X92.107 Y88.091 E-.13569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.404 Y81.208 Z1.16 F42000
G1 X96.483 Y78.957 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F4396.602
M204 S2000
G1 X96.094 Y78.568 E.02371
G1 X95.729 Y78.755
G1 X96.43 Y79.456 E.04272
G1 X96.377 Y79.954
G1 X95.365 Y78.942 E.06173
G1 X95 Y79.129
G1 X96.331 Y80.459 E.08115
; WIPE_START
M204 S6000
G1 X95 Y79.129 E-.7151
G1 X95.105 Y79.075 E-.0449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.899 Y74.106 Z1.16 F42000
G1 X103.925 Y71.511 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X103.429 Y71.015 E.03022
G1 X102.878 Y71.015
G1 X103.925 Y72.062 E.06385
G1 X103.925 Y72.614
G1 X102.326 Y71.015 E.09747
G1 X101.775 Y71.015
G1 X103.925 Y73.165 E.1311
G1 X103.925 Y73.717
G1 X101.224 Y71.015 E.16472
G1 X100.672 Y71.015
G1 X103.925 Y74.268 E.19835
G1 X103.925 Y74.819
G1 X100.121 Y71.015 E.23198
G1 X99.569 Y71.015
G1 X103.925 Y75.371 E.2656
G1 X103.925 Y75.922
G1 X99.018 Y71.015 E.29923
G1 X98.466 Y71.015
G1 X103.925 Y76.474 E.33285
G1 X103.925 Y77.025
G1 X97.915 Y71.015 E.36648
G1 X97.364 Y71.015
G1 X103.925 Y77.576 E.40011
G1 X103.925 Y78.128
G1 X96.812 Y71.015 E.43373
G1 X96.261 Y71.015
G1 X103.925 Y78.679 E.46736
G1 X103.925 Y79.231
G1 X95.709 Y71.015 E.50099
G1 X95.158 Y71.015
G1 X103.925 Y79.782 E.53461
G1 X103.925 Y80.334
G1 X94.607 Y71.015 E.56824
G1 X94.055 Y71.015
G1 X103.925 Y80.885 E.60186
G1 X103.925 Y81.436
G1 X93.504 Y71.015 E.63549
G1 X92.952 Y71.015
G1 X103.925 Y81.988 E.66912
G1 X103.925 Y82.539
G1 X98.076 Y76.69 E.35667
G1 X97.817 Y76.983
G1 X103.925 Y83.091 E.37247
G1 X103.925 Y83.642
G1 X97.558 Y77.275 E.38828
G1 X97.298 Y77.567
G1 X98.421 Y78.69 E.06847
G1 X97.739 Y78.559
G1 X97.039 Y77.859 E.04266
M204 S10000
G1 X97.73 Y76.344 F42000
G1 F4396.602
M204 S2000
G1 X92.401 Y71.015 E.32498
G1 X91.849 Y71.015
G1 X97.522 Y76.688 E.34592
G1 X97.314 Y77.031
G1 X91.298 Y71.015 E.36687
G1 X90.747 Y71.015
M73 P41 R19
G1 X97.106 Y77.375 E.38781
G1 X96.898 Y77.718
G1 X90.195 Y71.015 E.40876
G1 X89.644 Y71.015
G1 X95.104 Y76.475 E.33295
M204 S10000
G1 X96.423 Y78.346 F42000
G1 F4396.602
M204 S2000
G1 X89.092 Y71.015 E.44701
G1 X88.541 Y71.015
G1 X95.978 Y78.452 E.45352
G1 X95.534 Y78.559
G1 X87.99 Y71.015 E.46004
G1 X87.438 Y71.015
G1 X95.089 Y78.666 E.46656
G1 X94.646 Y78.774
G1 X86.887 Y71.015 E.47315
G1 X86.335 Y71.015
G1 X94.392 Y79.072 E.49128
; WIPE_START
M204 S6000
G1 X92.977 Y77.657 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.805 Y79.073 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X103.925 Y84.193 E.31223
G1 X103.925 Y84.745
G1 X98.275 Y79.096 E.3445
G1 X97.288 Y78.659
G1 X103.925 Y85.296 E.40474
G1 X103.925 Y85.848
G1 X96.578 Y78.501 E.44802
G1 X96.644 Y79.118
G1 X103.925 Y86.399 E.44402
G1 X103.925 Y86.951
G1 X96.709 Y79.735 E.44002
G1 X96.775 Y80.352
G1 X103.925 Y87.502 E.43602
G1 X103.925 Y88.053
G1 X96.552 Y80.681 E.44959
; WIPE_START
M204 S6000
G1 X97.966 Y82.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.627 Y79.307 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X103.925 Y88.605 E.56701
G1 X103.925 Y89.156
G1 X85.784 Y71.015 E1.10625
G1 X85.232 Y71.015
G1 X103.925 Y89.708 E1.13988
G1 X103.925 Y90.259
G1 X84.681 Y71.015 E1.17351
G1 X84.13 Y71.015
G1 X103.925 Y90.81 E1.20713
G1 X103.925 Y91.362
G1 X83.578 Y71.015 E1.24076
G1 X83.027 Y71.015
G1 X103.925 Y91.913 E1.27438
G1 X103.925 Y92.465
G1 X82.475 Y71.015 E1.30801
G1 X81.924 Y71.015
G1 X103.925 Y93.016 E1.34164
G1 X103.925 Y93.568
G1 X81.373 Y71.015 E1.37526
G1 X80.821 Y71.015
G1 X103.925 Y94.119 E1.40889
G1 X103.925 Y94.67
G1 X80.27 Y71.015 E1.44251
G1 X79.718 Y71.015
G1 X103.925 Y95.222 E1.47614
G1 X103.925 Y95.773
G1 X79.167 Y71.015 E1.50977
G1 X78.616 Y71.015
G1 X103.925 Y96.325 E1.54339
G1 X103.925 Y96.876
G1 X78.064 Y71.015 E1.57702
G1 X77.513 Y71.015
G1 X103.925 Y97.427 E1.61065
G1 X103.925 Y97.979
G1 X90.156 Y84.21 E.83965
G1 X90.73 Y85.336
G1 X92.036 Y86.641 E.07963
G1 X91.592 Y86.749
G1 X90.677 Y85.834 E.0558
G1 X90.482 Y86.19
G1 X91.258 Y86.966 E.04733
G1 X91.018 Y87.278
G1 X90.189 Y86.449 E.05053
G1 X89.799 Y86.61
G1 X90.885 Y87.696 E.06622
G1 X90.491 Y87.854
G1 X89.578 Y86.941 E.05567
G1 X89.293 Y87.207
G1 X90.26 Y88.174 E.05896
G1 X90.129 Y88.594
G1 X88.857 Y87.322 E.07759
G1 X88.235 Y87.252
G1 X90.227 Y89.244 E.12148
; WIPE_START
M204 S6000
M73 P42 R19
G1 X88.813 Y87.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.187 Y88.792 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X95.204 Y89.81 E.06206
G1 X94.803 Y89.96
G1 X93.847 Y89.004 E.05827
G1 X93.527 Y89.236
G1 X94.507 Y90.216 E.05976
G1 X94.219 Y90.479
G1 X93.241 Y89.5 E.05968
G1 X92.961 Y89.772
G1 X93.944 Y90.755 E.05991
G1 X93.506 Y90.868
G1 X92.682 Y90.044 E.05026
G1 X92.384 Y90.297
G1 X93.16 Y91.074 E.04737
G1 X92.887 Y91.353
G1 X91.994 Y90.46 E.05447
G1 X91.349 Y90.366
G1 X92.712 Y91.729 E.08312
G1 X92.592 Y92.16
G1 X86.435 Y86.003 E.37547
G1 X86.155 Y86.275
G1 X92.702 Y92.821 E.39923
; WIPE_START
M204 S6000
G1 X91.288 Y91.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.173 Y93.19 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X94.61 Y93.627 E.02666
; WIPE_START
M204 S6000
G1 X94.173 Y93.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.575 Y94.592 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X96.543 Y95.559 E.05899
; WIPE_START
M204 S6000
G1 X95.575 Y94.592 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.934 Y97.502 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X93.653 Y93.221 E.26107
G1 X93.367 Y93.487
G1 X98.039 Y98.159 E.28489
; WIPE_START
M204 S6000
G1 X96.625 Y96.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.547 Y95.153 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X100.186 Y94.791 E.02205
; WIPE_START
M204 S6000
G1 X100.547 Y95.153 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.854 Y96.459 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X103.925 Y98.53 E.12628
G1 X103.925 Y99.082
G1 X101.571 Y96.728 E.14356
G1 X101.262 Y96.971
G1 X103.925 Y99.633 E.16235
G1 X103.925 Y100.184
G1 X100.652 Y96.912 E.19959
G1 X100.375 Y97.187
G1 X103.925 Y100.736 E.21644
G1 X103.925 Y101.287
G1 X100.372 Y97.734 E.21668
G1 X100.169 Y98.083
G1 X103.649 Y101.563 E.21219
G1 X103.098 Y101.563
G1 X99.894 Y98.359 E.19538
G1 X99.515 Y98.532
G1 X102.546 Y101.563 E.18486
G1 X101.995 Y101.563
G1 X98.994 Y98.562 E.183
G1 X98.707 Y98.827
G1 X101.443 Y101.563 E.16687
; WIPE_START
M204 S6000
G1 X100.029 Y100.149 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.477 Y93.082 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X98.102 Y92.708 E.02282
; WIPE_START
M204 S6000
G1 X98.477 Y93.082 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.255 Y87.515 Z1.16 F42000
G1 X90.153 Y84.207 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X76.961 Y71.015 E.80443
G1 X76.41 Y71.015
G1 X79.81 Y74.415 E.20734
G1 X79.528 Y74.685
G1 X75.858 Y71.015 E.22376
G1 X75.307 Y71.015
G1 X79.252 Y74.96 E.24057
G1 X78.976 Y75.236
G1 X74.756 Y71.015 E.25738
G1 X74.204 Y71.015
G1 X78.701 Y75.512 E.27419
G1 X78.425 Y75.787
G1 X73.653 Y71.015 E.29101
G1 X73.377 Y71.291
G1 X78.149 Y76.063 E.291
G1 X77.873 Y76.339
G1 X73.377 Y71.842 E.27419
G1 X73.377 Y72.394
G1 X76.818 Y75.834 E.2098
G1 X76.537 Y76.105
G1 X73.377 Y72.945 E.19268
G1 X73.377 Y73.497
G1 X76.267 Y76.387 E.17624
; WIPE_START
M204 S6000
G1 X74.853 Y74.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.903 Y75.509 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X81.474 Y76.079 E.03479
G1 X81.185 Y76.341
G1 X80.641 Y75.798 E.03315
G1 X80.365 Y76.074
G1 X80.909 Y76.617 E.03315
G1 X80.633 Y76.893
G1 X80.09 Y76.349 E.03315
G1 X79.906 Y76.717
G1 X80.265 Y77.076 E.02189
; WIPE_START
M204 S6000
G1 X79.906 Y76.717 E-.19287
G1 X80.09 Y76.349 E-.15627
G1 X80.633 Y76.893 E-.29217
G1 X80.854 Y76.672 E-.1187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.089 Y80.106 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X81.516 Y80.533 E.02604
G1 X81.239 Y80.807
G1 X80.063 Y79.631 E.07169
G1 X79.785 Y79.905
G1 X80.966 Y81.086 E.072
; WIPE_START
M204 S6000
G1 X79.785 Y79.905 E-.63453
G1 X80.021 Y79.673 E-.12547
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.621 Y81.226 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X87.834 Y82.44 E.074
G1 X87.554 Y82.711
G1 X86.567 Y81.724 E.0602
G1 X86.372 Y82.08
G1 X87.279 Y82.987 E.05531
G1 X87.003 Y83.263
G1 X86.08 Y82.339 E.05631
G1 X85.688 Y82.5
G1 X86.727 Y83.538 E.06335
G1 X86.452 Y83.814
G1 X85.475 Y82.837 E.05958
G1 X85.179 Y83.093
G1 X86.176 Y84.09 E.0608
G1 X85.9 Y84.365
G1 X84.752 Y83.217 E.07002
G1 X84.129 Y83.146
G1 X85.626 Y84.642 E.09125
G1 X85.349 Y84.917
G1 X82.324 Y81.892 E.1845
G1 X82.047 Y82.166
G1 X85.076 Y85.196 E.18475
; WIPE_START
M204 S6000
G1 X83.662 Y83.782 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.119 Y78.535 Z1.16 F42000
G1 X73.377 Y74.048 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F4396.602
M204 S2000
G1 X100.892 Y101.563 E1.67789
G1 X100.341 Y101.563
G1 X73.377 Y74.6 E1.64426
G1 X73.377 Y75.151
G1 X99.789 Y101.563 E1.61064
G1 X99.238 Y101.563
G1 X73.377 Y75.702 E1.57701
G1 X73.377 Y76.254
G1 X98.686 Y101.563 E1.54339
G1 X98.135 Y101.563
G1 X73.377 Y76.805 E1.50976
G1 X73.377 Y77.357
G1 X97.583 Y101.563 E1.47613
G1 X97.032 Y101.563
G1 X73.377 Y77.908 E1.44251
G1 X73.377 Y78.459
G1 X96.481 Y101.563 E1.40888
G1 X95.929 Y101.563
G1 X73.377 Y79.011 E1.37526
G1 X73.377 Y79.562
G1 X95.378 Y101.563 E1.34163
G1 X94.826 Y101.563
G1 X73.377 Y80.114 E1.308
G1 X73.377 Y80.665
G1 X94.275 Y101.563 E1.27438
G1 X93.724 Y101.563
G1 X73.377 Y81.217 E1.24075
G1 X73.377 Y81.768
G1 X93.172 Y101.563 E1.20712
G1 X92.621 Y101.563
G1 X73.377 Y82.319 E1.1735
G1 X73.377 Y82.871
G1 X92.069 Y101.563 E1.13987
G1 X91.518 Y101.563
G1 X73.377 Y83.422 E1.10625
G1 X73.377 Y83.974
G1 X90.966 Y101.563 E1.07262
G1 X90.415 Y101.563
G1 X73.377 Y84.525 E1.03899
G1 X73.377 Y85.076
G1 X89.864 Y101.563 E1.00537
G1 X89.312 Y101.563
G1 X73.377 Y85.628 E.97174
G1 X73.377 Y86.179
G1 X88.761 Y101.563 E.93812
G1 X88.209 Y101.563
G1 X73.377 Y86.731 E.90449
G1 X73.377 Y87.282
G1 X87.658 Y101.563 E.87086
G1 X87.107 Y101.563
G1 X73.377 Y87.834 E.83724
G1 X73.377 Y88.385
G1 X86.555 Y101.563 E.80361
G1 X86.004 Y101.563
G1 X73.377 Y88.936 E.76999
G1 X73.377 Y89.488
G1 X85.452 Y101.563 E.73636
G1 X84.901 Y101.563
G1 X73.377 Y90.039 E.70273
G1 X73.377 Y90.591
G1 X84.349 Y101.563 E.66911
G1 X83.798 Y101.563
G1 X73.377 Y91.142 E.63548
G1 X73.377 Y91.693
G1 X83.247 Y101.563 E.60186
G1 X82.695 Y101.563
G1 X73.377 Y92.245 E.56823
M73 P43 R19
G1 X73.377 Y92.796
G1 X82.144 Y101.563 E.5346
G1 X81.592 Y101.563
G1 X73.377 Y93.348 E.50098
G1 X73.377 Y93.899
G1 X81.041 Y101.563 E.46735
G1 X80.49 Y101.563
G1 X73.377 Y94.451 E.43373
G1 X73.377 Y95.002
G1 X79.938 Y101.563 E.4001
G1 X79.387 Y101.563
G1 X73.377 Y95.553 E.36647
G1 X73.377 Y96.105
G1 X78.835 Y101.563 E.33285
G1 X78.284 Y101.563
G1 X73.377 Y96.656 E.29922
G1 X73.377 Y97.208
G1 X77.732 Y101.563 E.26559
G1 X77.181 Y101.563
G1 X73.377 Y97.759 E.23197
G1 X73.377 Y98.31
G1 X76.63 Y101.563 E.19834
G1 X76.078 Y101.563
G1 X73.377 Y98.862 E.16472
G1 X73.377 Y99.413
G1 X75.527 Y101.563 E.13109
G1 X74.975 Y101.563
G1 X73.377 Y99.965 E.09746
G1 X73.377 Y100.516
G1 X74.424 Y101.563 E.06384
G1 X73.873 Y101.563
G1 X73.377 Y101.068 E.03021
; WIPE_START
M204 S6000
G1 X73.873 Y101.563 E-.26625
G1 X74.424 Y101.563 E-.20954
G1 X73.895 Y101.034 E-.28421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.378 Y93.817 Z1.16 F42000
G1 X81.098 Y80.096 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.180683
G1 F12000
M204 S6000
G1 X80.989 Y80.115 E.00148
; LINE_WIDTH: 0.191359
G1 X80.951 Y80.12 E.00055
G1 X80.657 Y79.891 E.00541
; LINE_WIDTH: 0.15669
G3 X80.241 Y79.429 I3.693 J-3.741 E.00664
; WIPE_START
G1 X80.36 Y79.584 E-.2387
G1 X80.657 Y79.891 E-.5213
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.03 Y82.323 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.389557
G1 F5203.19
M204 S6000
G1 X82.616 Y81.552 E.03191
; WIPE_START
G1 X83.03 Y82.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.065 Y83.211 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.221586
G1 F10614.953
M204 S6000
G1 X83.87 Y83.057 E.00443
; LINE_WIDTH: 0.160872
G1 F12000
G3 X83.667 Y82.896 I1.171 J-1.683 E.00289
G1 X83.123 Y82.341 E.00865
; LINE_WIDTH: 0.189223
G1 X83.031 Y82.216 E.00222
; LINE_WIDTH: 0.236475
G1 F9718.909
G1 X82.939 Y82.09 E.00304
; LINE_WIDTH: 0.283727
G1 F7665.427
G1 X82.847 Y81.965 E.00385
; LINE_WIDTH: 0.312185
G1 F6800.124
G1 X82.596 Y81.585 E.01269
; WIPE_START
G1 X82.847 Y81.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.953 Y79.541 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.163822
G1 F12000
M204 S6000
G1 X84.873 Y79.203 E.00398
M204 S10000
G1 X85.264 Y79.598 F42000
; LINE_WIDTH: 0.208337
G1 F11563.616
M204 S6000
G1 X84.812 Y79.35 E.00845
; WIPE_START
G1 X85.264 Y79.598 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.141 Y86.433 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.389547
G1 F5203.348
M204 S6000
G1 X86.726 Y85.662 E.03192
; WIPE_START
G1 X87.141 Y86.433 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.168 Y87.318 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.21809
G1 F10849.797
M204 S6000
G1 X87.967 Y87.157 E.0045
; LINE_WIDTH: 0.159284
G1 F12000
G3 X87.758 Y86.989 I1.293 J-1.821 E.00295
G1 X87.233 Y86.451 E.00824
; LINE_WIDTH: 0.189238
G1 X87.141 Y86.326 E.00222
; LINE_WIDTH: 0.236463
G1 F9719.595
G1 X87.049 Y86.2 E.00304
; LINE_WIDTH: 0.283688
G1 F7666.785
G1 X86.957 Y86.074 E.00385
; LINE_WIDTH: 0.312165
G1 F6800.65
G1 X86.705 Y85.695 E.01269
; WIPE_START
G1 X86.957 Y86.074 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.04 Y85.258 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.121169
G1 F12000
M204 S6000
G1 X84.99 Y85.334 E.00061
G1 X85.012 Y85.407 E.00052
; WIPE_START
G1 X84.99 Y85.334 E-.34795
G1 X85.04 Y85.258 E-.41205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.549 Y82.499 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.172948
G1 F12000
M204 S6000
G2 X85.554 Y82.757 I.202 J.125 E.00342
; WIPE_START
G1 X85.515 Y82.673 E-.25825
G1 X85.512 Y82.599 E-.20426
G1 X85.549 Y82.499 E-.29749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.696 Y81.151 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.143621
G1 F12000
M204 S6000
G1 X86.578 Y80.927 E.00234
; WIPE_START
G1 X86.696 Y81.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.062 Y83.65 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.163844
G1 F12000
M204 S6000
G1 X88.983 Y83.313 E.00398
M204 S10000
G1 X89.364 Y83.693 F42000
; LINE_WIDTH: 0.210443
G1 F11401.625
M204 S6000
G1 X88.919 Y83.467 E.0083
M204 S10000
G1 X89.357 Y83.706 F42000
; LINE_WIDTH: 0.150536
G1 F12000
M204 S6000
G1 X88.93 Y83.445 E.00501
; WIPE_START
G1 X89.357 Y83.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.284 Y90.431 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.213197
G1 F11196.548
M204 S6000
G1 X91.104 Y90.307 E.0037
; LINE_WIDTH: 0.17358
G1 F12000
G1 X90.882 Y90.104 E.00378
; LINE_WIDTH: 0.14538
G3 X90.654 Y89.896 I2.037 J-2.459 E.00291
; LINE_WIDTH: 0.145403
G1 X90.479 Y89.701 E.00247
; LINE_WIDTH: 0.17942
G1 X90.241 Y89.428 E.00477
; LINE_WIDTH: 0.22101
G1 F10652.943
G1 X90.162 Y89.309 E.00255
; WIPE_START
G1 X90.241 Y89.428 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.104 Y93.259 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.20525
G1 F11809.518
M204 S6000
G3 X93.824 Y93.023 I.76 J-1.187 E.0059
; WIPE_START
G1 X94.104 Y93.259 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.512 Y94.656 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.223311
G1 F10502.727
M204 S6000
G1 X95.358 Y94.54 E.00347
; LINE_WIDTH: 0.18159
G1 F12000
G1 X95.199 Y94.42 E.00268
; LINE_WIDTH: 0.153152
G1 X95.119 Y94.35 E.00109
G3 X94.695 Y93.904 I2.432 J-2.733 E.00634
; LINE_WIDTH: 0.192959
G1 X94.621 Y93.798 E.00191
; LINE_WIDTH: 0.222667
G1 F10544.387
G1 X94.546 Y93.691 E.00234
; WIPE_START
G1 X94.621 Y93.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.471 Y94.913 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.14562
G1 F12000
M204 S6000
G1 X95.961 Y94.686 E.00528
M204 S10000
G1 X96.244 Y94.663 F42000
; LINE_WIDTH: 0.213883
G1 F11146.599
M204 S6000
G1 X96.439 Y95.18 E.00939
; WIPE_START
G1 X96.244 Y94.663 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.081 Y97.103 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.254379
G1 F8823.292
M204 S6000
G1 X97.586 Y96.743 E.01313
; LINE_WIDTH: 0.234225
G1 F9844.504
G1 X97.462 Y96.644 E.00306
; LINE_WIDTH: 0.199604
G1 F12000
G1 X97.339 Y96.545 E.00245
; LINE_WIDTH: 0.156741
G1 X97.215 Y96.445 E.0017
G3 X96.654 Y95.865 I4.058 J-4.48 E.00863
; LINE_WIDTH: 0.192133
G1 X96.567 Y95.744 E.00218
; LINE_WIDTH: 0.224748
G1 F10411.124
G1 X96.479 Y95.623 E.00272
; WIPE_START
G1 X96.567 Y95.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.075 Y97.04 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.315904
G1 F6701.248
M204 S6000
G1 X97.283 Y96.575 E.02599
M204 S10000
G1 X97.805 Y96.718 F42000
; LINE_WIDTH: 0.313973
G1 F6752.235
M204 S6000
G1 X98.067 Y97.349 E.01916
M204 S10000
G1 X98.109 Y97.304 F42000
; LINE_WIDTH: 0.23457
G1 F9825.057
M204 S6000
G3 X97.68 Y96.679 I3.36 J-2.77 E.01465
; WIPE_START
G1 X98.109 Y97.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.449 Y98.597 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.206764
G1 F11687.637
M204 S6000
G3 X99.166 Y98.365 I.621 J-1.047 E.00596
; WIPE_START
G1 X99.275 Y98.471 E-.31528
G1 X99.449 Y98.597 E-.44472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.442 Y97.664 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.184332
G1 F12000
M204 S6000
G2 X100.384 Y97.544 I-.503 J.173 E.00183
; LINE_WIDTH: 0.142752
G1 X100.197 Y97.337 E.00255
; WIPE_START
G1 X100.384 Y97.544 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.262 Y94.715 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.127003
G1 F12000
M204 S6000
G2 X100.139 Y94.494 I-2.257 J1.109 E.00187
; WIPE_START
G1 X100.262 Y94.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.808 Y93.154 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.151852
G1 F12000
M204 S6000
G1 X98.552 Y93.007 E.00299
; WIPE_START
G1 X98.808 Y93.154 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.638 Y91.154 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.172317
G1 F12000
M204 S6000
G1 X96.556 Y90.886 E.00347
M204 S10000
G1 X96.828 Y91.178 F42000
; LINE_WIDTH: 0.132235
G1 F12000
M204 S6000
G1 X96.531 Y91.007 E.00274
; WIPE_START
G1 X96.828 Y91.178 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.403 Y83.68 Z1.16 F42000
G1 X94.576 Y79.33 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.139804
G1 F12000
M204 S6000
G3 X94.489 Y79.384 I-.17 J-.18 E.00091
G1 X94.285 Y79.178 E.00255
; WIPE_START
G1 X94.489 Y79.384 E-.562
G1 X94.576 Y79.33 E-.198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.479 Y79.174 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.111338
G1 F12000
M204 S6000
G3 X96.358 Y79.082 I.054 J-.196 E.00089
M204 S10000
G1 X96.219 Y80.571 F42000
; LINE_WIDTH: 0.126546
G1 F12000
M204 S6000
G1 X96.435 Y80.798 E.0023
; WIPE_START
G1 X96.219 Y80.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.223 Y78.723 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.214092
G1 F11131.443
M204 S6000
G1 X97.096 Y78.636 E.00263
; LINE_WIDTH: 0.171206
G1 F12000
G1 X96.969 Y78.549 E.0019
; LINE_WIDTH: 0.128319
G1 X96.842 Y78.462 E.00116
M204 S10000
G1 X96.569 Y78.51 F42000
; LINE_WIDTH: 0.417406
G1 F4797.648
M204 S6000
G1 X96.568 Y77.933 E.02277
; LINE_WIDTH: 0.417406
G1 X96.441 Y77.772 E.00814
; LINE_WIDTH: 0.369633
G1 F5538.086
G1 X96.313 Y77.61 E.00705
; LINE_WIDTH: 0.321861
G1 F6548.766
G1 X96.186 Y77.448 E.00596
; LINE_WIDTH: 0.274088
G1 F8010.687
G1 X96.058 Y77.287 E.00487
; LINE_WIDTH: 0.226316
G1 F10312.899
G1 X95.931 Y77.125 E.00378
; LINE_WIDTH: 0.178543
G1 F12000
G1 X95.804 Y76.963 E.0027
; LINE_WIDTH: 0.130771
G1 X95.676 Y76.801 E.00161
M204 S10000
G1 X97.142 Y78.238 F42000
; LINE_WIDTH: 0.196121
G1 F12000
M204 S6000
G1 X96.378 Y78.467 E.01199
; LINE_WIDTH: 0.163547
G1 X96.354 Y78.483 E.00034
; LINE_WIDTH: 0.133118
G1 X96.36 Y78.524 E.00033
; LINE_WIDTH: 0.10774
G1 X96.371 Y78.548 E.00014
M204 S10000
G1 X97.221 Y78.317 F42000
; LINE_WIDTH: 0.162279
G1 F12000
M204 S6000
G1 X96.847 Y78.323 E.00423
; LINE_WIDTH: 0.126942
G1 X96.473 Y78.33 E.00277
; LINE_WIDTH: 0.0979252
G1 X96.348 Y78.547 E.00105
M204 S10000
G1 X98.188 Y76.579 F42000
; LINE_WIDTH: 0.160853
G1 F12000
M204 S6000
G1 X97.997 Y76.423 E.00274
; LINE_WIDTH: 0.1983
G1 X97.807 Y76.268 E.00376
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F12000
G1 X97.997 Y76.423 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/11
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

M106 S102
; OBJECT_ID: 1297
M204 S10000
G17
G3 Z1.16 I-1.062 J-.594 P1  F42000
G1 X96.889 Y78.408 Z1.16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.493598
; LAYER_HEIGHT: 0.28
G1 F3954.432
M204 S6000
G1 X96.716 Y78.475 E.0089
G1 X96.553 Y78.634 E.01091
G2 X96.278 Y78.434 I-.391 J.248 E.01673
G1 X96.366 Y78.283 E.00837
G1 X96.393 Y78.053 E.01111
G2 X96.795 Y78.032 I.175 J-.503 E.01978
G2 X96.857 Y78.357 I.546 J.064 E.01611
M204 S10000
G1 X96.975 Y78.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.457435
G1 F4314.333
M204 S5000
G1 X96.907 Y78.824 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.837 Y78.991 E.00722
G3 X97.04 Y80.901 I-21.739 J3.276 E.07649
G1 X96.092 Y80.901 E.03772
G3 X96.275 Y78.999 I16.488 J.631 E.07609
G1 X96.249 Y78.88 E.00488
G1 X96.143 Y78.801 E.00526
G1 X96.007 Y78.82 E.00546
G3 X94.358 Y79.665 I-7.302 J-12.209 E.0738
G1 X94.039 Y78.714 E.03993
G3 X95.861 Y78.264 I8.259 J29.538 E.07469
G1 X95.992 Y78.149 E.00696
; LINE_WIDTH: 0.457025
G1 F4318.789
G1 X96.001 Y78.086 E.00281
; LINE_WIDTH: 0.494052
G1 F3950.301
G1 X96.011 Y78.022 E.00307
; LINE_WIDTH: 0.531079
G1 F3639.75
G2 X95.98 Y77.917 I-.056 J-.04 E.00657
; LINE_WIDTH: 0.523598
G1 F3698.487
G1 X95.798 Y77.765 E.01214
; LINE_WIDTH: 0.489065
G1 F3996.221
G1 X95.617 Y77.612 E.01124
; LINE_WIDTH: 0.454532
G1 F4346.089
G1 X95.436 Y77.46 E.01033
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.321 J-13.734 E.04815
G1 X95.412 Y75.957 E.04115
G3 X96.047 Y76.983 I-26.51 J17.135 E.04804
; LINE_WIDTH: 0.455202
G1 F4338.719
G1 X96.151 Y77.198 E.0104
; LINE_WIDTH: 0.490405
G1 F3983.777
G1 X96.255 Y77.412 E.01133
; LINE_WIDTH: 0.525608
G1 F3682.518
G1 X96.359 Y77.626 E.01226
G1 X96.425 Y77.66 E.00381
; LINE_WIDTH: 0.493839
G1 F3952.244
G1 X96.49 Y77.695 E.00355
; LINE_WIDTH: 0.511913
G1 F3794.137
G1 X96.619 Y77.683 E.00648
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X96.748 Y77.67 E.00719
G1 X96.776 Y77.628 E.00283
; LINE_WIDTH: 0.558509
G1 F3439.44
G1 X96.891 Y77.393 E.0144
; LINE_WIDTH: 0.512338
G1 F3790.572
G1 X97.007 Y77.158 E.01307
; LINE_WIDTH: 0.466168
G1 F4221.547
G1 X97.122 Y76.924 E.01174
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-15.214 J-12.892 E.03238
; LINE_WIDTH: 0.466168
G1 F4221.547
G1 X97.562 Y77.568 E.01174
; LINE_WIDTH: 0.512338
G1 F3790.572
G1 X97.372 Y77.748 E.01307
; LINE_WIDTH: 0.558509
G1 F3439.44
G1 X97.182 Y77.927 E.01441
G1 X97.172 Y77.998 E.00398
; LINE_WIDTH: 0.517473
G1 F3748.015
G1 X97.161 Y78.07 E.00365
; LINE_WIDTH: 0.504373
G1 F3858.527
G1 X97.225 Y78.192 E.00678
; LINE_WIDTH: 0.532308
G1 F3630.27
G1 X97.288 Y78.315 E.0072
G1 X97.329 Y78.321 E.00214
; LINE_WIDTH: 0.524529
G1 F3691.081
G1 X97.587 Y78.348 E.01331
; LINE_WIDTH: 0.489685
G1 F3990.454
G1 X97.844 Y78.375 E.01231
; LINE_WIDTH: 0.454842
G1 F4342.676
G1 X98.102 Y78.402 E.01132
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.614 I-5.329 J29.608 E.0433
G1 X99.041 Y79.05 E.0181
G1 X98.884 Y79.587 E.02227
G3 X97.872 Y79.155 I5.641 J-14.604 E.0438
; LINE_WIDTH: 0.457435
G1 F4314.333
G1 X97.619 Y79.021 E.01261
; LINE_WIDTH: 0.494872
G1 F3942.851
G1 X97.365 Y78.886 E.01379
; LINE_WIDTH: 0.532308
G1 F3630.27
G1 X97.112 Y78.752 E.01498
G1 X97.043 Y78.776 E.00377
; LINE_WIDTH: 0.494872
G1 F3942.851
G1 X97.032 Y78.78 E.00059
; WIPE_START
M204 S6000
G1 X96.907 Y78.824 E-.05026
G1 X96.837 Y78.991 E-.06892
G1 X97.007 Y80.393 E-.53672
G1 X97.025 Y80.666 E-.1041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.654 Y78.965 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.626849
G1 F3024.712
M204 S6000
G3 X98.619 Y78.903 I-.066 J-.003 E.02149
; WIPE_START
G1 X98.548 Y78.903 E-.152
G1 X98.513 Y78.965 E-.152
G1 X98.548 Y79.026 E-.152
G1 X98.619 Y79.026 E-.152
G1 X98.654 Y78.965 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.487469
G1 F4011.151
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.642268
G1 F2944.598
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.704 Y79.03 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.626149
G1 F3028.452
M204 S6000
G3 X94.669 Y78.969 I-.066 J-.003 E.02144
; WIPE_START
G1 X94.598 Y78.969 E-.15198
G1 X94.563 Y79.03 E-.15201
G1 X94.598 Y79.092 E-.152
G1 X94.669 Y79.092 E-.152
G1 X94.704 Y79.03 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.563 Y80.454 Z1.44 F42000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.595088
G1 F3204.273
M204 S6000
G1 X96.558 Y80.27 E.01089
; WIPE_START
G1 X96.563 Y80.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.44
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.44 F4000
            G39.3 S1
            G0 Z1.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X15.5 Y163.318 F42000
G1 Z1.04
G1 E.8 F1800
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y162.568  
M204 S6000
G1  Y158.318  E0.2176 F3897
G1  X50.000  E1.7924
G1  Y164.318  E0.3073
G1  X15.750  E1.7540
M204 S10000
G1  X14.560 Y164.758  
M204 S6000
G1  Y157.878  E0.3523
G1  X50.440  E1.8374
G1  Y164.758  E0.3523
G1  X14.560  E1.8374
M204 S10000
G1  X14.120 Y165.198  
M204 S6000
G1  Y157.438  E0.3974
G1  X50.880  E1.8825
G1  Y165.198  E0.3974
G1  X14.120  E1.8825
M204 S10000
G1  X13.680 Y165.638  
M204 S6000
G1  Y156.998  E0.4424
G1  X51.320  E1.9275
G1  Y165.638  E0.4424
G1  X13.680  E1.9275
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.44 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z4.04 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T1
M73 E6
M620.1 E F199 T240
M620.10 A1 F199 L123.994 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
M73 P44 R19
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P47 R18
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P47 R17
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4.04
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
M73 P48 R17
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X9.801 Y163.818 F42000
G1 Z1.04
G1 X15.5 Y163.818 Z1.44

; filament start gcode
M106 P3 S180



M400 U1
G1 Z1.04
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X18.500 Y163.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
M73 P49 R17
G1  X49.500  E1.5875 F1782
G1  Y163.318  E0.0256
G1  X15.500  E1.7412 F2025
G1  Y162.818  E0.0256
G1  X49.500  E1.7412 F2473
G1  Y162.318  E0.0256
G1  X15.500  E1.7412 F3897
G1  Y161.818  E0.0256
G1  X49.500  E1.7412
G1  Y161.318  E0.0256
M73 P50 R17
G1  X15.500  E1.7412
G1  Y160.818  E0.0256
G1  X49.500  E1.7412
G1  Y160.318  E0.0256
G1  X15.500  E1.7412
G1  Y159.818  E0.0256
G1  X49.500  E1.7412
G1  Y159.318  E0.0256
G1  X15.500  E1.7412
G1  Y158.818  E0.0256
G1  X49.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F3204.273
M204 S6000
G1 X47.5 Y158.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.44 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X98.102 Y76.321
M73 P50 R16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559128
; LAYER_HEIGHT: 0.28
G1 F3435.167
M204 S5000
G3 X98.07 Y76.267 I-.058 J-.002 E.01666
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3435.167
M204 S6000
G1 X98.008 Y76.267 E-.152
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/11
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z1.44 I1.155 J-.385 P1  F42000
G1 X98.102 Y76.321 Z1.44
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559128
; LAYER_HEIGHT: 0.28
G1 F3435.167
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00078
; WIPE_START
M204 S6000
G1 X98.056 Y76.267 E-.03431
G1 X98.032 Y76.267 E-.05885
G1 X98.008 Y76.267 E-.05885
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.72
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.72 F4000
            G39.3 S1
            G0 Z1.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 

M400 U1

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z4.32 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T240
M620.10 A0 F199
T0
M73 E5
M620.1 E F199 T270
M620.10 A1 F199 L212.133 H0.4 T270

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S270
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
M73 P53 R15
G1 E9.54599 F199
M73 P54 R15
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P55 R15
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
M73 P56 R15
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
M73 P56 R14
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4.32
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
M73 P57 R14
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X9.801 Y158.818 F42000
G1 Z1.32
G1 X15.5 Y158.818 Z1.72

; filament start gcode
M106 P3 S180


G1 Z1.32
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X18.500 Y158.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X49.500  E1.5875 F1782
G1  Y159.318  E0.0256
G1  X15.500  E1.7412 F2025
G1  Y159.818  E0.0256
M73 P58 R14
G1  X49.500  E1.7412 F2473
G1  Y160.318  E0.0256
G1  X15.500  E1.7412 F3897
G1  Y160.818  E0.0256
G1  X49.500  E1.7412
G1  Y161.318  E0.0256
G1  X15.500  E1.7412
G1  Y161.818  E0.0256
M73 P59 R14
G1  X49.500  E1.7412
G1  Y162.318  E0.0256
G1  X15.500  E1.7412
G1  Y162.818  E0.0256
M73 P59 R13
G1  X49.500  E1.7412
G1  Y163.318  E0.0256
G1  X15.500  E1.7412
G1  Y163.818  E0.0256
G1  X49.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y163.318  F5400.000000
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X50.000 Y164.318  
M204 S6000
G1  X15.000  E1.7924 F3897
G1  Y160.068  E0.2176
G1 E-0.8000 F1800
M204 S10000
G1  X15.750 Y158.318   F600
G1 E0.8000 F1800
M204 S6000
G1  X50.000  E1.7540 F3897
G1  Y164.318  E0.3073
M204 S10000
G1  X50.440 Y164.758  
M204 S6000
G1  X14.560  E1.8374
G1  Y157.878  E0.3523
G1  X50.440  E1.8374
G1  Y164.758  E0.3523
M204 S10000
G1  X50.880 Y165.198  
M204 S6000
G1  X14.120  E1.8825
G1  Y157.438  E0.3974
G1  X50.880  E1.8825
G1  Y165.198  E0.3974
; WIPE_TOWER_END

; WIPE_START
G1 F3435.167
M204 S6000
G1 X50.88 Y163.198 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X96.888 Y78.408 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.493468
; LAYER_HEIGHT: 0.28
G1 F3955.618
M204 S6000
G1 X96.715 Y78.474 E.00889
G1 X96.553 Y78.633 E.01087
G2 X96.278 Y78.433 I-.392 J.25 E.01671
G1 X96.366 Y78.282 E.00837
G1 X96.393 Y78.053 E.01107
G2 X96.795 Y78.032 I.175 J-.503 E.0198
G2 X96.857 Y78.356 I.546 J.064 E.0161
M204 S10000
G1 X96.975 Y78.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.457395
G1 F4314.767
M204 S5000
G1 X96.907 Y78.823 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.835 Y78.984 E.00702
G3 X97.044 Y80.901 I-21.995 J3.357 E.07676
G1 X96.09 Y80.901 E.03796
G3 X96.276 Y79 I19.412 J.942 E.07607
G1 X96.25 Y78.879 E.00493
G1 X96.144 Y78.801 E.00525
G1 X96.008 Y78.819 E.00546
G3 X94.358 Y79.665 I-7.302 J-12.206 E.07384
G1 X94.039 Y78.713 E.03996
G3 X95.86 Y78.265 I7.845 J27.906 E.07464
G1 X95.992 Y78.149 E.007
; LINE_WIDTH: 0.457065
G1 F4318.354
G1 X96.001 Y78.086 E.00281
; LINE_WIDTH: 0.494132
G1 F3949.573
G1 X96.01 Y78.022 E.00307
; LINE_WIDTH: 0.531199
G1 F3638.823
G2 X95.979 Y77.918 I-.056 J-.04 E.00656
; LINE_WIDTH: 0.523728
G1 F3697.45
G1 X95.798 Y77.765 E.01213
; LINE_WIDTH: 0.489152
G1 F3995.414
G1 X95.617 Y77.613 E.01123
; LINE_WIDTH: 0.454575
G1 F4345.611
G1 X95.436 Y77.46 E.01032
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.376 J-13.787 E.04818
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.984 I-26.451 J17.099 E.04806
; LINE_WIDTH: 0.457065
G1 F4318.354
G1 X96.161 Y77.212 E.01117
; LINE_WIDTH: 0.494132
G1 F3949.573
G1 X96.274 Y77.44 E.01222
; LINE_WIDTH: 0.531199
G1 F3638.823
G1 X96.387 Y77.668 E.01326
G1 X96.516 Y77.682 E.00675
; LINE_WIDTH: 0.503853
G1 F3863.049
G1 X96.645 Y77.696 E.00635
; LINE_WIDTH: 0.519399
G1 F3732.307
G1 X96.711 Y77.662 E.00378
; LINE_WIDTH: 0.562289
G1 F3413.552
G1 X96.778 Y77.629 E.00413
G1 X96.892 Y77.394 E.01452
; LINE_WIDTH: 0.514858
G1 F3769.567
G1 X97.007 Y77.159 E.01315
; LINE_WIDTH: 0.467429
G1 F4208.488
G1 X97.122 Y76.924 E.01178
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-15.066 J-12.76 E.03238
; LINE_WIDTH: 0.467248
G1 F4210.349
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514498
G1 F3772.553
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561749
G1 F3417.226
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521459
G1 F3715.642
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481169
G1 F4071.164
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482603
G1 F4057.337
G1 X97.27 Y78.262 E.00389
; LINE_WIDTH: 0.524328
G1 F3692.671
G1 X97.328 Y78.321 E.00427
G1 X97.678 Y78.365 E.0181
; LINE_WIDTH: 0.489552
G1 F3991.693
G1 X98.027 Y78.409 E.01674
; LINE_WIDTH: 0.454775
G1 F4343.409
G1 X98.377 Y78.452 E.01538
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.615 I-2.458 J14.006 E.03216
G1 X99.028 Y79.094 E.0199
G1 X98.884 Y79.586 E.02039
G1 X98.124 Y79.272 E.03273
; LINE_WIDTH: 0.454775
G1 F4343.409
G1 X97.811 Y79.111 E.01538
; LINE_WIDTH: 0.489552
G1 F3991.693
G1 X97.497 Y78.95 E.01674
; LINE_WIDTH: 0.524328
G1 F3692.671
G1 X97.184 Y78.789 E.0181
; LINE_WIDTH: 0.532188
G1 F3631.192
G2 X97.043 Y78.776 I-.076 J.061 E.00821
; LINE_WIDTH: 0.494792
G1 F3943.576
G1 X97.032 Y78.78 E.00059
; WIPE_START
M204 S6000
G1 X96.907 Y78.823 E-.05029
G1 X96.835 Y78.984 E-.06698
G1 X96.981 Y80.136 E-.44095
G1 X97.024 Y80.665 E-.20177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.965 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.620609
G1 F3058.385
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02102
; WIPE_START
G1 X98.552 Y78.904 E-.152
G1 X98.516 Y78.965 E-.152
G1 X98.552 Y79.026 E-.152
G1 X98.622 Y79.026 E-.152
G1 X98.657 Y78.965 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.487469
G1 F4011.151
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.642249
G1 F2944.699
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.706 Y79.028 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.629429
G1 F3011.005
M204 S6000
G3 X94.67 Y78.967 I-.067 J-.003 E.02169
; WIPE_START
G1 X94.599 Y78.967 E-.152
G1 X94.563 Y79.028 E-.152
G1 X94.599 Y79.09 E-.152
G1 X94.67 Y79.09 E-.152
G1 X94.706 Y79.028 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.625 Y80.454 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.594269
G1 F3209.191
M204 S6000
G3 X96.592 Y80.396 I-.063 J-.002 E.01909
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3209.191
G1 X96.525 Y80.396 E-.15199
G1 X96.491 Y80.454 E-.15201
G1 X96.525 Y80.512 E-.15199
G1 X96.592 Y80.512 E-.15201
G1 X96.625 Y80.454 E-.15201
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/11
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z1.72 I1.216 J-.048 P1  F42000
G1 X96.553 Y78.634 Z1.72
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.493519
; LAYER_HEIGHT: 0.28
G1 F3955.162
M204 S6000
G2 X96.278 Y78.434 I-.391 J.248 E.01672
G1 X96.366 Y78.283 E.00837
G1 X96.393 Y78.053 E.01109
G2 X96.795 Y78.032 I.175 J-.503 E.01978
G2 X96.888 Y78.408 I.546 J.064 E.01899
G1 X96.715 Y78.475 E.0089
G1 X96.596 Y78.592 E.00802
M204 S10000
G1 X96.975 Y78.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.457429
G1 F4314.405
M204 S5000
G1 X96.907 Y78.824 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.836 Y78.991 E.00724
G3 X97.044 Y80.901 I-26.593 J3.86 E.07649
G1 X96.092 Y80.901 E.0379
G3 X96.276 Y78.999 I16.839 J.667 E.07609
G1 X96.25 Y78.88 E.00488
; LINE_WIDTH: 0.438789
G1 F4526.764
G1 X96.146 Y78.792 E.0057
; LINE_WIDTH: 0.473869
G1 F4142.988
G1 X96.065 Y78.787 E.00368
; LINE_WIDTH: 0.508949
G1 F3819.199
G1 X95.985 Y78.781 E.004
G1 X95.69 Y78.977 E.01759
; LINE_WIDTH: 0.464474
G1 F4239.242
G1 X95.395 Y79.174 E.01585
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.358 Y79.665 I-10.154 J-20.091 E.04568
G1 X94.039 Y78.714 E.03994
G3 X95.371 Y78.371 I5.437 J18.386 E.05475
; LINE_WIDTH: 0.455355
G1 F4337.036
G1 X95.538 Y78.353 E.00733
; LINE_WIDTH: 0.490712
G1 F3980.94
G1 X95.705 Y78.335 E.00799
; LINE_WIDTH: 0.526069
G1 F3678.883
G1 X95.871 Y78.316 E.00865
G1 X95.912 Y78.261 E.00354
; LINE_WIDTH: 0.490712
G1 F3980.94
G1 X95.952 Y78.205 E.00328
; LINE_WIDTH: 0.455355
G1 F4337.036
G1 X95.992 Y78.149 E.00301
; LINE_WIDTH: 0.457035
G1 F4318.68
G1 X96.001 Y78.086 E.00281
; LINE_WIDTH: 0.494072
G1 F3950.119
G1 X96.01 Y78.022 E.00307
; LINE_WIDTH: 0.531108
G1 F3639.518
G2 X95.979 Y77.917 I-.056 J-.04 E.00656
; LINE_WIDTH: 0.523638
G1 F3698.168
G1 X95.798 Y77.765 E.01214
; LINE_WIDTH: 0.489092
G1 F3995.973
G1 X95.617 Y77.613 E.01124
; LINE_WIDTH: 0.454545
G1 F4345.942
G1 X95.436 Y77.46 E.01033
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.323 J-13.736 E.04816
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.983 I-26.515 J17.138 E.04804
; LINE_WIDTH: 0.457035
G1 F4318.68
G1 X96.161 Y77.211 E.01118
; LINE_WIDTH: 0.494072
G1 F3950.119
G1 X96.274 Y77.44 E.01222
; LINE_WIDTH: 0.531108
G1 F3639.518
G1 X96.387 Y77.668 E.01327
G1 X96.516 Y77.682 E.00674
; LINE_WIDTH: 0.503793
G1 F3863.571
G1 X96.645 Y77.696 E.00635
; LINE_WIDTH: 0.519383
G1 F3732.429
G1 X96.711 Y77.662 E.00378
; LINE_WIDTH: 0.562289
G1 F3413.552
G1 X96.778 Y77.629 E.00413
G1 X96.892 Y77.394 E.01452
; LINE_WIDTH: 0.514858
G1 F3769.567
G1 X97.007 Y77.159 E.01315
; LINE_WIDTH: 0.467429
G1 F4208.488
G1 X97.122 Y76.924 E.01178
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-15.428 J-13.082 E.03238
; LINE_WIDTH: 0.467252
G1 F4210.315
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514505
G1 F3772.498
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521465
G1 F3715.588
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481172
G1 F4071.132
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482693
G1 F4056.473
G1 X97.27 Y78.262 E.00389
; LINE_WIDTH: 0.524508
G1 F3691.24
G1 X97.328 Y78.321 E.00427
G1 X97.675 Y78.365 E.01798
; LINE_WIDTH: 0.489672
G1 F3990.578
G1 X98.023 Y78.408 E.01663
; LINE_WIDTH: 0.454835
G1 F4342.749
G1 X98.37 Y78.452 E.01528
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.614 I-2.444 J14.033 E.03246
G1 X99.028 Y79.094 E.0199
G1 X98.884 Y79.586 E.0204
G1 X98.118 Y79.269 E.03302
; LINE_WIDTH: 0.454835
G1 F4342.749
G1 X97.806 Y79.109 E.01528
; LINE_WIDTH: 0.489672
G1 F3990.578
G1 X97.495 Y78.949 E.01663
; LINE_WIDTH: 0.524508
G1 F3691.24
G1 X97.183 Y78.789 E.01798
; LINE_WIDTH: 0.532288
G1 F3630.423
G2 X97.043 Y78.776 I-.076 J.061 E.00821
; LINE_WIDTH: 0.494859
G1 F3942.972
G1 X97.032 Y78.78 E.0006
; WIPE_START
M204 S6000
G1 X96.907 Y78.824 E-.05031
G1 X96.836 Y78.991 E-.0691
G1 X97.005 Y80.364 E-.52553
G1 X97.027 Y80.666 E-.11507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.965 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.620888
G1 F3056.858
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02104
; WIPE_START
G1 X98.551 Y78.904 E-.152
G1 X98.516 Y78.965 E-.152
G1 X98.551 Y79.025 E-.152
G1 X98.622 Y79.025 E-.152
G1 X98.657 Y78.965 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.487469
G1 F4011.151
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.642289
G1 F2944.496
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.67 Y78.967 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.628549
G1 F3015.666
M204 S6000
G2 X94.705 Y79.029 I-.031 J.059 E.02162
; WIPE_START
G1 X94.67 Y79.09 E-.15201
G1 X94.599 Y79.09 E-.152
G1 X94.563 Y79.029 E-.152
G1 X94.599 Y78.967 E-.15201
G1 X94.67 Y78.967 E-.15198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.563 Y80.454 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.594468
G1 F3207.99
M204 S6000
G1 X96.558 Y80.268 E.01098
; WIPE_START
G1 X96.563 Y80.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X49.5 Y163.318 F42000
G1 Z1.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X49.250 Y164.318  
M204 S6000
G1  X15.000  E1.7540 F3897
G1  Y158.318  E0.3073
G1  X50.000  E1.7924
G1  Y162.568  E0.2176
M204 S10000
G1  X50.440 Y164.758  
M204 S6000
G1  X14.560  E1.8374
G1  Y157.878  E0.3523
G1  X50.440  E1.8374
G1  Y164.758  E0.3523
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z4.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T1
M73 E4
M620.1 E F199 T240
M620.10 A1 F199 L123.994 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.1594 F199
M73 P60 R13
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M73 P63 R12
G1 Z4.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
M73 P64 R12
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X47.199 Y153.119 F42000
G1 Z1.6
G1 X54.831 Y153.119 Z2
G1 X55.199 Y153.119 Z2
G1 X55.199 Y163.818
G1 X49.5 Y163.818

; filament start gcode
M106 P3 S180



M400 U1
G1 Z1.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y163.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
M73 P64 R11
G1  X46.500  F240
M73 P65 R11
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.5875 F1782
G1  Y163.318  E0.0256
G1  X49.500  E1.7412 F2025
G1  Y162.818  E0.0256
G1  X15.500  E1.7412 F2473
G1  Y162.318  E0.0256
G1  X49.500  E1.7412 F3897
G1  Y161.818  E0.0256
G1  X15.500  E1.7412
G1  Y161.318  E0.0256
G1  X49.500  E1.7412
M73 P66 R11
G1  Y160.818  E0.0256
G1  X15.500  E1.7412
G1  Y160.318  E0.0256
G1  X49.500  E1.7412
G1  Y159.818  E0.0256
G1  X15.500  E1.7412
G1  Y159.318  E0.0256
G1  X49.500  E1.7412
G1  Y158.818  E0.0256
G1  X15.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F3207.99
M204 S6000
G1 X17.5 Y158.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X98.102 Y76.321
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559148
; LAYER_HEIGHT: 0.28
G1 F3435.03
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00077
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3435.03
M204 S6000
G1 X98.056 Y76.267 E-.03419
G1 X98.032 Y76.267 E-.05892
G1 X98.008 Y76.267 E-.0589
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/11
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z2 I1.088 J-.544 P1  F42000
G1 X98.102 Y76.321 Z2
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559148
; LAYER_HEIGHT: 0.28
G1 F3435.03
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00078
; WIPE_START
M204 S6000
G1 X98.056 Y76.267 E-.03426
G1 X98.032 Y76.267 E-.05887
G1 X98.008 Y76.267 E-.05887
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.28
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.28 F4000
            G39.3 S1
            G0 Z2.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 

M400 U1

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z4.88 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T240
M620.10 A0 F199
T0
M73 E3
M620.1 E F199 T270
M620.10 A1 F199 L212.133 H0.4 T270

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S270
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
M73 P70 R10
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
M73 P70 R9
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P71 R9
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
M73 P72 R9
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4.88
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
M73 P73 R9
G1 X50.628 Y153.119 F42000
G1 Z1.88
G1 X55.199 Y153.119 Z2.28
G1 X55.199 Y158.818
G1 X49.5 Y158.818

; filament start gcode
M106 P3 S180


G1 Z1.88
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y158.818  E0.1536 F1782
M73 P73 R8
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.5875 F1782
G1  Y159.318  E0.0256
G1  X49.500  E1.7412 F2025
G1  Y159.818  E0.0256
M73 P74 R8
G1  X15.500  E1.7412 F2473
G1  Y160.318  E0.0256
G1  X49.500  E1.7412 F3897
G1  Y160.818  E0.0256
G1  X15.500  E1.7412
G1  Y161.318  E0.0256
G1  X49.500  E1.7412
G1  Y161.818  E0.0256
G1  X15.500  E1.7412
G1  Y162.318  E0.0256
M73 P75 R8
G1  X49.500  E1.7412
G1  Y162.818  E0.0256
G1  X15.500  E1.7412
G1  Y163.318  E0.0256
G1  X49.500  E1.7412
G1  Y163.818  E0.0256
G1  X15.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y163.318  F5400.000000
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y164.318  
M204 S6000
G1  Y158.318  E0.3073 F3897
G1  X49.250  E1.7540
G1 E-0.8000 F1800
M204 S10000
G1  X50.000 Y160.068   F600
G1 E0.8000 F1800
M204 S6000
G1  Y164.318  E0.2176 F3897
G1  X15.000  E1.7924
; WIPE_TOWER_END

; WIPE_START
G1 F3435.03
M204 S6000
G1 X17 Y164.318 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.28 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X96.553 Y78.633 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.493578
; LAYER_HEIGHT: 0.28
G1 F3954.614
M204 S6000
G2 X96.277 Y78.433 I-.392 J.249 E.01673
G1 X96.365 Y78.282 E.00838
G1 X96.393 Y78.053 E.01107
G2 X96.795 Y78.032 I.175 J-.503 E.01981
G2 X96.888 Y78.408 I.545 J.064 E.01898
G1 X96.715 Y78.474 E.00889
G1 X96.596 Y78.591 E.00801
M204 S10000
G1 X96.975 Y78.8 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.457405
G1 F4314.659
M204 S5000
G1 X96.907 Y78.823 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.836 Y78.991 E.00724
G3 X97.043 Y80.901 I-25.681 J3.754 E.07649
G1 X96.089 Y80.901 E.03799
G3 X96.276 Y78.998 I16.875 J.697 E.07614
G1 X96.25 Y78.879 E.00485
G1 X96.143 Y78.801 E.00526
G1 X96.007 Y78.819 E.00546
G3 X94.358 Y79.665 I-7.302 J-12.209 E.07382
G1 X94.039 Y78.714 E.03994
G3 X95.858 Y78.265 I7.694 J27.248 E.07457
G1 X95.992 Y78.149 E.00705
; LINE_WIDTH: 0.457075
G1 F4318.245
G1 X96.001 Y78.085 E.00281
; LINE_WIDTH: 0.494152
G1 F3949.391
G1 X96.01 Y78.022 E.00307
; LINE_WIDTH: 0.531228
G1 F3638.591
G2 X95.979 Y77.917 I-.056 J-.04 E.00654
; LINE_WIDTH: 0.523818
G1 F3696.732
G1 X95.798 Y77.765 E.01214
; LINE_WIDTH: 0.489212
G1 F3994.856
G1 X95.617 Y77.613 E.01123
; LINE_WIDTH: 0.454605
G1 F4345.281
G1 X95.436 Y77.46 E.01033
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.361 J-13.772 E.04818
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.984 I-26.512 J17.136 E.04806
; LINE_WIDTH: 0.455218
G1 F4338.536
G1 X96.152 Y77.198 E.01039
; LINE_WIDTH: 0.490438
G1 F3983.469
G1 X96.255 Y77.412 E.01132
; LINE_WIDTH: 0.525658
G1 F3682.123
G1 X96.359 Y77.626 E.01224
G1 X96.424 Y77.66 E.00381
; LINE_WIDTH: 0.493924
G1 F3951.469
G1 X96.49 Y77.695 E.00355
; LINE_WIDTH: 0.511974
G1 F3793.633
G1 X96.619 Y77.683 E.00648
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X96.748 Y77.67 E.0072
G1 X96.776 Y77.628 E.00282
; LINE_WIDTH: 0.558598
G1 F3438.82
G1 X96.891 Y77.393 E.01441
; LINE_WIDTH: 0.512398
G1 F3790.069
G1 X97.006 Y77.159 E.01308
; LINE_WIDTH: 0.466199
G1 F4221.235
G1 X97.122 Y76.924 E.01174
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-15.435 J-13.088 E.03238
; LINE_WIDTH: 0.467252
G1 F4210.315
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514505
G1 F3772.498
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521465
G1 F3715.588
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481172
G1 F4071.132
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482664
G1 F4056.761
G1 X97.27 Y78.262 E.00389
; LINE_WIDTH: 0.524449
G1 F3691.717
G1 X97.328 Y78.321 E.00427
G1 X97.673 Y78.364 E.01784
; LINE_WIDTH: 0.489632
G1 F3990.95
G1 X98.017 Y78.407 E.01651
; LINE_WIDTH: 0.454815
G1 F4342.969
G1 X98.362 Y78.451 E.01517
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.614 I-2.452 J14.156 E.03277
G1 X99.028 Y79.094 E.01989
G1 X98.884 Y79.586 E.02041
G1 X98.11 Y79.265 E.03334
; LINE_WIDTH: 0.454815
G1 F4342.969
G1 X97.801 Y79.107 E.01517
; LINE_WIDTH: 0.489632
G1 F3990.95
G1 X97.492 Y78.948 E.01651
; LINE_WIDTH: 0.524449
G1 F3691.717
G1 X97.183 Y78.789 E.01784
; LINE_WIDTH: 0.532219
G1 F3630.961
G2 X97.043 Y78.776 I-.076 J.061 E.00819
; LINE_WIDTH: 0.494812
G1 F3943.395
G1 X97.032 Y78.78 E.0006
; WIPE_START
M204 S6000
G1 X96.907 Y78.823 E-.0503
G1 X96.836 Y78.991 E-.06912
G1 X96.991 Y80.232 E-.47503
G1 X97.025 Y80.666 E-.16556
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.964 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.621108
G1 F3055.659
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02106
; WIPE_START
G1 X98.551 Y78.904 E-.152
G1 X98.516 Y78.964 E-.152
G1 X98.551 Y79.025 E-.152
G1 X98.622 Y79.025 E-.152
G1 X98.657 Y78.964 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.487469
G1 F4011.151
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.642268
G1 F2944.598
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.67 Y78.967 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.628528
G1 F3015.773
M204 S6000
G2 X94.705 Y79.029 I-.031 J.059 E.02162
; WIPE_START
G1 X94.67 Y79.09 E-.15201
G1 X94.599 Y79.09 E-.152
G1 X94.563 Y79.029 E-.152
G1 X94.599 Y78.967 E-.15201
G1 X94.67 Y78.967 E-.15198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.559 Y80.454 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.595188
G1 F3203.674
M204 S6000
G1 X96.56 Y80.273 E.01067
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3203.674
G1 X96.559 Y80.454 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/11
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z2.28 I1.202 J.193 P1  F42000
G1 X96.888 Y78.408 Z2.28
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.493519
; LAYER_HEIGHT: 0.28
G1 F3955.162
M204 S6000
G1 X96.715 Y78.475 E.00889
G1 X96.553 Y78.633 E.01086
G2 X96.278 Y78.433 I-.392 J.25 E.01671
G1 X96.366 Y78.282 E.00837
G1 X96.393 Y78.053 E.01107
G2 X96.795 Y78.032 I.175 J-.503 E.01979
G2 X96.857 Y78.357 I.546 J.064 E.01611
M204 S10000
G1 X97.112 Y78.752 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.532209
G1 F3631.038
M204 S5000
G2 X97.044 Y78.776 I-.005 J.097 E.00387
; LINE_WIDTH: 0.494805
G1 F3943.455
G1 X96.975 Y78.8 E.00348
; LINE_WIDTH: 0.457402
G1 F4314.695
G1 X96.907 Y78.823 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.836 Y78.985 E.00702
G3 X97.044 Y80.901 I-20.71 J3.218 E.07676
G1 X96.09 Y80.901 E.03794
G3 X96.276 Y78.998 I15.969 J.6 E.07614
G1 X96.25 Y78.879 E.00487
G1 X96.144 Y78.801 E.00524
G1 X96.008 Y78.819 E.00546
G3 X94.358 Y79.665 I-7.305 J-12.213 E.07383
G1 X94.039 Y78.714 E.03994
G3 X95.859 Y78.265 I7.682 J27.225 E.07463
G1 X95.992 Y78.149 E.00701
; LINE_WIDTH: 0.457069
G1 F4318.318
G1 X96.001 Y78.086 E.00281
; LINE_WIDTH: 0.494139
G1 F3949.512
G1 X96.01 Y78.022 E.00307
; LINE_WIDTH: 0.531209
G1 F3638.745
G2 X95.979 Y77.918 I-.056 J-.04 E.00656
; LINE_WIDTH: 0.523718
G1 F3697.53
G1 X95.798 Y77.765 E.01214
; LINE_WIDTH: 0.489145
G1 F3995.476
G1 X95.617 Y77.613 E.01124
; LINE_WIDTH: 0.454572
G1 F4345.648
G1 X95.436 Y77.46 E.01033
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.355 J-13.765 E.04815
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.983 I-26.485 J17.119 E.04804
; LINE_WIDTH: 0.457069
G1 F4318.318
G1 X96.161 Y77.212 E.01118
; LINE_WIDTH: 0.494139
G1 F3949.512
G1 X96.274 Y77.44 E.01223
; LINE_WIDTH: 0.531209
G1 F3638.745
G1 X96.387 Y77.668 E.01327
G1 X96.516 Y77.682 E.00674
; LINE_WIDTH: 0.503848
G1 F3863.092
G1 X96.645 Y77.696 E.00635
; LINE_WIDTH: 0.519394
G1 F3732.347
G1 X96.711 Y77.662 E.00378
; LINE_WIDTH: 0.562298
G1 F3413.484
G1 X96.778 Y77.629 E.00413
G1 X96.892 Y77.394 E.01452
; LINE_WIDTH: 0.514865
G1 F3769.511
G1 X97.007 Y77.159 E.01315
; LINE_WIDTH: 0.467432
G1 F4208.454
G1 X97.122 Y76.924 E.01178
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-15.309 J-12.976 E.03238
; LINE_WIDTH: 0.467252
G1 F4210.315
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514505
G1 F3772.498
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521455
G1 F3715.669
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481152
G1 F4071.325
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482634
G1 F4057.049
G1 X97.27 Y78.262 E.00388
; LINE_WIDTH: 0.524418
G1 F3691.956
G1 X97.328 Y78.321 E.00427
G1 X97.673 Y78.364 E.01785
; LINE_WIDTH: 0.489612
G1 F3991.135
G1 X98.018 Y78.408 E.01651
; LINE_WIDTH: 0.454805
G1 F4343.079
G1 X98.363 Y78.451 E.01518
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.614 I-2.44 J14.087 E.03274
G1 X99.028 Y79.094 E.01989
G1 X98.884 Y79.586 E.02041
G1 X98.111 Y79.266 E.03331
; LINE_WIDTH: 0.454805
G1 F4343.079
G1 X97.802 Y79.107 E.01518
; LINE_WIDTH: 0.489612
G1 F3991.135
G1 X97.493 Y78.948 E.01651
; LINE_WIDTH: 0.524418
G1 F3691.956
G1 X97.183 Y78.789 E.01785
; LINE_WIDTH: 0.532209
G1 F3631.038
G2 X97.169 Y78.775 I-.076 J.061 E.00104
; WIPE_START
M204 S6000
G1 X97.044 Y78.776 E-.04785
G1 X96.975 Y78.8 E-.0275
G1 X96.907 Y78.823 E-.0275
G1 X96.836 Y78.985 E-.06698
G1 X96.993 Y80.255 E-.48658
G1 X97.014 Y80.527 E-.1036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.964 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.621068
G1 F3055.877
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02106
; WIPE_START
G1 X98.551 Y78.904 E-.152
G1 X98.516 Y78.964 E-.152
G1 X98.551 Y79.025 E-.152
G1 X98.622 Y79.025 E-.152
G1 X98.657 Y78.964 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.487489
G1 F4010.963
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.642268
G1 F2944.598
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.67 Y78.967 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.628549
G1 F3015.666
M204 S6000
G2 X94.705 Y79.029 I-.031 J.059 E.02162
; WIPE_START
G1 X94.67 Y79.09 E-.15201
G1 X94.599 Y79.09 E-.152
G1 X94.563 Y79.029 E-.152
G1 X94.599 Y78.967 E-.15201
G1 X94.67 Y78.967 E-.15198
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P76 R8
G1 X96.559 Y80.452 Z2.56 F42000
G1 Z2.16
G1 E.8 F1800
; LINE_WIDTH: 0.597649
G1 F3189.013
M204 S6000
G1 X96.56 Y80.299 E.00912
; WIPE_START
G1 X96.559 Y80.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.56
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.56 F4000
            G39.3 S1
            G0 Z2.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X15.5 Y163.318 F42000
G1 Z2.16
G1 E.8 F1800
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y162.568  
M204 S6000
G1  Y158.318  E0.2176 F3897
G1  X50.000  E1.7924
G1  Y164.318  E0.3073
G1  X15.750  E1.7540
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #7
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z2.56 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z5.16 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T1
M73 E2
M620.1 E F199 T240
M620.10 A1 F199 L123.994 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z5.16
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
M73 P79 R7
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
M73 P79 R6
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X9.801 Y163.818 F42000
M73 P80 R6
G1 Z2.16
G1 X15.5 Y163.818 Z2.56

; filament start gcode
M106 P3 S180



M400 U1
G1 Z2.16
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X18.500 Y163.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X49.500  E1.5875 F1782
G1  Y163.318  E0.0256
G1  X15.500  E1.7412 F2025
G1  Y162.818  E0.0256
G1  X49.500  E1.7412 F2473
G1  Y162.318  E0.0256
M73 P81 R6
G1  X15.500  E1.7412 F3897
G1  Y161.818  E0.0256
G1  X49.500  E1.7412
G1  Y161.318  E0.0256
G1  X15.500  E1.7412
G1  Y160.818  E0.0256
G1  X49.500  E1.7412
G1  Y160.318  E0.0256
G1  X15.500  E1.7412
G1  Y159.818  E0.0256
G1  X49.500  E1.7412
G1  Y159.318  E0.0256
M73 P82 R6
G1  X15.500  E1.7412
G1  Y158.818  E0.0256
G1  X49.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F3189.013
M204 S6000
G1 X47.5 Y158.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.56 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X98.102 Y76.321
G1 Z2.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559168
; LAYER_HEIGHT: 0.28
G1 F3434.892
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3434.892
M204 S6000
G1 X98.056 Y76.267 E-.03428
G1 X98.032 Y76.267 E-.05887
G1 X98.008 Y76.267 E-.05885
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/11
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
M73 P82 R5
G3 Z2.56 I-1.217 J0 P1  F42000
G1 X98.102 Y76.321 Z2.56
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559168
; LAYER_HEIGHT: 0.28
G1 F3434.892
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00078
; WIPE_START
M204 S6000
G1 X98.056 Y76.267 E-.03424
G1 X98.032 Y76.267 E-.0589
G1 X98.008 Y76.267 E-.05887
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.84
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.84 F4000
            G39.3 S1
            G0 Z2.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 

M400 U1

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z5.44 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T240
M620.10 A0 F199
T0
M73 E1
M620.1 E F199 T270
M620.10 A1 F199 L212.133 H0.4 T270

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S270
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199
G1 E0.586666 F50
G1 E6.74666 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
M73 P86 R4
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E9.54599 F199
G1 E1.06067 F50
M73 P87 R4
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P88 R4
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z5.44
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
M73 P88 R3
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X9.801 Y158.818 F42000
G1 Z2.44
G1 X15.5 Y158.818 Z2.84

; filament start gcode
M106 P3 S180


G1 Z2.44
M73 P89 R3
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X18.500 Y158.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X49.500  E1.5875 F1782
G1  Y159.318  E0.0256
G1  X15.500  E1.7412 F2025
G1  Y159.818  E0.0256
G1  X49.500  E1.7412 F2473
G1  Y160.318  E0.0256
G1  X15.500  E1.7412 F3897
G1  Y160.818  E0.0256
G1  X49.500  E1.7412
G1  Y161.318  E0.0256
M73 P90 R3
G1  X15.500  E1.7412
G1  Y161.818  E0.0256
G1  X49.500  E1.7412
G1  Y162.318  E0.0256
G1  X15.500  E1.7412
G1  Y162.818  E0.0256
G1  X49.500  E1.7412
G1  Y163.318  E0.0256
G1  X15.500  E1.7412
G1  Y163.818  E0.0256
M73 P91 R3
G1  X49.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y163.318  F5400.000000
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X50.000 Y164.318  
M204 S6000
G1  X15.000  E1.7924 F3897
G1  Y160.068  E0.2176
G1 E-0.8000 F1800
M204 S10000
G1  X15.750 Y158.318   F600
G1 E0.8000 F1800
M204 S6000
G1  X50.000  E1.7540 F3897
G1  Y164.318  E0.3073
; WIPE_TOWER_END

; WIPE_START
G1 F3434.892
M204 S6000
M73 P91 R2
G1 X50 Y162.318 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X96.888 Y78.407
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.492999
; LAYER_HEIGHT: 0.28
G1 F3959.912
M204 S6000
G1 X96.716 Y78.474 E.00886
G1 X96.553 Y78.634 E.01092
G2 X96.278 Y78.434 I-.39 J.248 E.01667
G1 X96.366 Y78.283 E.00834
G1 X96.393 Y78.053 E.01112
G2 X96.795 Y78.031 I.175 J-.503 E.01978
G2 X96.857 Y78.356 I.545 J.065 E.01607
M204 S10000
G1 X97.112 Y78.752 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.531798
G1 F3634.194
M204 S5000
G2 X97.043 Y78.775 I-.005 J.097 E.00388
; LINE_WIDTH: 0.494532
G1 F3945.937
G1 X96.975 Y78.799 E.00348
; LINE_WIDTH: 0.457265
G1 F4316.179
G1 X96.906 Y78.823 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.836 Y78.99 E.00722
G3 X97.044 Y80.901 I-25.736 J3.766 E.07654
G1 X96.09 Y80.901 E.03795
G3 X96.276 Y78.999 I18.298 J.823 E.07609
G1 X96.25 Y78.879 E.00489
G1 X96.143 Y78.801 E.00526
G1 X96.007 Y78.819 E.00545
G3 X94.358 Y79.665 I-7.303 J-12.211 E.07382
G1 X94.039 Y78.714 E.03994
G3 X95.861 Y78.265 I7.706 J27.345 E.07468
G1 X95.992 Y78.149 E.00697
; LINE_WIDTH: 0.457032
G1 F4318.717
G1 X96.002 Y78.086 E.00281
; LINE_WIDTH: 0.494065
G1 F3950.179
G1 X96.011 Y78.023 E.00308
; LINE_WIDTH: 0.531098
G1 F3639.596
G2 X95.979 Y77.918 I-.056 J-.04 E.00658
; LINE_WIDTH: 0.523569
G1 F3698.726
G1 X95.798 Y77.765 E.01213
; LINE_WIDTH: 0.489045
G1 F3996.408
G1 X95.617 Y77.613 E.01123
; LINE_WIDTH: 0.454522
G1 F4346.199
G1 X95.436 Y77.46 E.01032
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.324 J-13.737 E.04818
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.984 I-26.519 J17.14 E.04806
; LINE_WIDTH: 0.455218
G1 F4338.536
G1 X96.152 Y77.198 E.0104
; LINE_WIDTH: 0.490438
G1 F3983.469
G1 X96.255 Y77.412 E.01132
; LINE_WIDTH: 0.525658
G1 F3682.123
G1 X96.359 Y77.626 E.01225
G1 X96.425 Y77.661 E.00381
; LINE_WIDTH: 0.493908
G1 F3951.606
G1 X96.49 Y77.695 E.00355
; LINE_WIDTH: 0.511953
G1 F3793.801
G1 X96.619 Y77.683 E.00648
; LINE_WIDTH: 0.561749
G1 F3417.226
G1 X96.748 Y77.67 E.00719
G1 X96.776 Y77.628 E.00282
; LINE_WIDTH: 0.558598
G1 F3438.82
G1 X96.891 Y77.393 E.01441
; LINE_WIDTH: 0.512398
G1 F3790.069
G1 X97.006 Y77.159 E.01308
; LINE_WIDTH: 0.466199
G1 F4221.235
G1 X97.122 Y76.924 E.01174
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.78 E.01874
G3 X97.753 Y77.389 I-15.476 J-13.125 E.03238
; LINE_WIDTH: 0.467248
G1 F4210.349
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514498
G1 F3772.553
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561749
G1 F3417.226
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521442
G1 F3715.776
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481135
G1 F4071.486
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482374
G1 F4059.547
G1 X97.27 Y78.261 E.00388
; LINE_WIDTH: 0.523919
G1 F3695.935
G1 X97.328 Y78.321 E.00427
G1 X97.676 Y78.365 E.01798
; LINE_WIDTH: 0.489278
G1 F3994.235
G1 X98.023 Y78.408 E.01663
; LINE_WIDTH: 0.454639
G1 F4344.914
G1 X98.371 Y78.452 E.01529
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.614 I-2.444 J14.024 E.03241
G1 X99.028 Y79.094 E.0199
G1 X98.884 Y79.586 E.0204
G1 X98.118 Y79.269 E.03299
; LINE_WIDTH: 0.454639
G1 F4344.914
G1 X97.807 Y79.109 E.01529
; LINE_WIDTH: 0.489278
G1 F3994.235
G1 X97.495 Y78.949 E.01663
; LINE_WIDTH: 0.523919
G1 F3695.935
G1 X97.183 Y78.788 E.01798
; LINE_WIDTH: 0.531798
G1 F3634.194
G2 X97.169 Y78.774 I-.076 J.061 E.00105
; WIPE_START
M204 S6000
G1 X97.043 Y78.775 E-.04791
G1 X96.975 Y78.799 E-.02755
G1 X96.906 Y78.823 E-.02755
G1 X96.836 Y78.99 E-.06892
G1 X97.001 Y80.333 E-.51419
G1 X97.016 Y80.527 E-.07388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.965 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.620848
G1 F3057.076
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02104
; WIPE_START
G1 X98.551 Y78.904 E-.15198
G1 X98.516 Y78.965 E-.15201
G1 X98.551 Y79.025 E-.152
G1 X98.622 Y79.025 E-.152
G1 X98.657 Y78.965 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.487489
G1 F4010.963
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.364 Y76.647 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.642268
G1 F2944.598
M204 S6000
G3 X95.328 Y76.584 I-.068 J-.003 E.02268
; WIPE_START
G1 X95.255 Y76.584 E-.15198
G1 X95.219 Y76.647 E-.15201
G1 X95.255 Y76.71 E-.152
G1 X95.328 Y76.71 E-.152
G1 X95.364 Y76.647 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.67 Y78.967 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.628528
G1 F3015.773
M204 S6000
G2 X94.705 Y79.029 I-.031 J.059 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3015.773
G1 X94.67 Y79.09 E-.15201
G1 X94.599 Y79.09 E-.152
G1 X94.563 Y79.029 E-.152
G1 X94.599 Y78.967 E-.15201
G1 X94.67 Y78.967 E-.15198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/11
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 1297
M204 S10000
G17
G3 Z2.84 I.298 J1.18 P1  F42000
G1 X96.888 Y78.407 Z2.84
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.492918
; LAYER_HEIGHT: 0.28
G1 F3960.645
M204 S6000
G1 X96.716 Y78.473 E.00885
G1 X96.553 Y78.633 E.01092
G2 X96.277 Y78.433 I-.391 J.25 E.01667
G1 X96.365 Y78.283 E.00835
G1 X96.393 Y78.052 E.0111
G2 X96.795 Y78.031 I.175 J-.503 E.0198
G2 X96.857 Y78.355 I.545 J.065 E.01605
M204 S10000
G1 X97.112 Y78.751 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.531599
G1 F3635.736
M204 S5000
G2 X97.043 Y78.775 I-.005 J.097 E.00387
; LINE_WIDTH: 0.494399
G1 F3947.148
G1 X96.975 Y78.799 E.00348
; LINE_WIDTH: 0.457199
G1 F4316.904
G1 X96.906 Y78.822 E.00318
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X96.835 Y78.983 E.00701
G1 X96.895 Y79.453 E.01884
G3 X97.042 Y80.901 I-16.248 J2.389 E.05796
G1 X96.09 Y80.901 E.03792
G3 X96.276 Y79 I19.873 J.986 E.07607
G1 X96.25 Y78.879 E.00493
G1 X96.143 Y78.801 E.00525
G1 X96.007 Y78.819 E.00545
G3 X94.358 Y79.665 I-7.301 J-12.205 E.07383
G1 X94.039 Y78.713 E.03996
G3 X95.859 Y78.265 I7.844 J27.907 E.07463
G1 X95.992 Y78.149 E.00701
; LINE_WIDTH: 0.457065
G1 F4318.354
G1 X96.001 Y78.086 E.00281
; LINE_WIDTH: 0.494132
G1 F3949.573
G1 X96.01 Y78.022 E.00307
; LINE_WIDTH: 0.531199
G1 F3638.823
G2 X95.979 Y77.918 I-.056 J-.04 E.00656
; LINE_WIDTH: 0.523728
G1 F3697.45
G1 X95.798 Y77.765 E.01213
; LINE_WIDTH: 0.489152
G1 F3995.414
G1 X95.617 Y77.613 E.01122
; LINE_WIDTH: 0.454575
G1 F4345.611
G1 X95.437 Y77.461 E.01032
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X94.595 Y76.591 I13.347 J-13.759 E.0482
G1 X95.412 Y75.957 E.04115
G3 X96.048 Y76.984 I-39.489 J25.175 E.04808
; LINE_WIDTH: 0.455232
G1 F4338.39
G1 X96.152 Y77.198 E.01039
; LINE_WIDTH: 0.490465
G1 F3983.222
G1 X96.255 Y77.412 E.01131
; LINE_WIDTH: 0.525698
G1 F3681.806
G1 X96.359 Y77.626 E.01224
G1 X96.424 Y77.66 E.00381
; LINE_WIDTH: 0.493979
G1 F3950.969
G1 X96.49 Y77.695 E.00355
; LINE_WIDTH: 0.512008
G1 F3793.339
G1 X96.619 Y77.683 E.00648
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X96.748 Y77.67 E.0072
G1 X96.776 Y77.628 E.00282
; LINE_WIDTH: 0.558589
G1 F3438.888
G1 X96.891 Y77.393 E.01441
; LINE_WIDTH: 0.512392
G1 F3790.124
G1 X97.006 Y77.159 E.01308
; LINE_WIDTH: 0.466195
G1 F4221.269
G1 X97.122 Y76.924 E.01174
; LINE_WIDTH: 0.419998
G1 F4763.096
G1 X97.524 Y76.26 E.0309
G1 X97.624 Y76.706 E.01822
G1 X97.693 Y76.811 E.00499
G1 X97.825 Y76.845 E.00543
G1 X98.291 Y76.779 E.01874
G3 X97.753 Y77.389 I-14.931 J-12.641 E.03238
; LINE_WIDTH: 0.467252
G1 F4210.315
G1 X97.553 Y77.581 E.01246
; LINE_WIDTH: 0.514505
G1 F3772.498
G1 X97.353 Y77.772 E.01391
; LINE_WIDTH: 0.561759
G1 F3417.158
G1 X97.153 Y77.964 E.01536
G1 X97.173 Y78.043 E.00454
; LINE_WIDTH: 0.521448
G1 F3715.723
G1 X97.192 Y78.122 E.00417
; LINE_WIDTH: 0.481138
G1 F4071.454
G1 X97.212 Y78.202 E.00381
; LINE_WIDTH: 0.482239
G1 F4060.845
G1 X97.27 Y78.261 E.00388
; LINE_WIDTH: 0.523649
G1 F3698.088
G1 X97.328 Y78.321 E.00426
G1 X97.676 Y78.364 E.018
; LINE_WIDTH: 0.489099
G1 F3995.911
G1 X98.025 Y78.408 E.01666
; LINE_WIDTH: 0.454549
G1 F4345.905
G1 X98.373 Y78.452 E.01532
; LINE_WIDTH: 0.419998
G1 F4763.096
G3 X99.169 Y78.615 I-2.476 J14.113 E.03233
G1 X99.028 Y79.094 E.0199
G1 X98.884 Y79.586 E.02039
G1 X98.12 Y79.27 E.03291
; LINE_WIDTH: 0.454549
G1 F4345.905
G1 X97.808 Y79.109 E.01532
; LINE_WIDTH: 0.489099
G1 F3995.911
G1 X97.496 Y78.949 E.01666
; LINE_WIDTH: 0.523649
G1 F3698.088
G1 X97.184 Y78.788 E.018
; LINE_WIDTH: 0.531599
G1 F3635.736
G2 X97.169 Y78.774 I-.077 J.061 E.00107
; WIPE_START
M204 S6000
G1 X97.043 Y78.775 E-.04792
G1 X96.975 Y78.799 E-.02755
G1 X96.906 Y78.822 E-.02755
G1 X96.835 Y78.983 E-.06692
G1 X96.895 Y79.453 E-.17982
G1 X96.978 Y80.111 E-.25199
G1 X97.012 Y80.526 E-.15825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.657 Y78.965 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.620609
G1 F3058.385
M204 S6000
G3 X98.622 Y78.904 I-.066 J-.003 E.02102
; WIPE_START
G1 X98.552 Y78.904 E-.152
G1 X98.516 Y78.965 E-.152
G1 X98.552 Y79.026 E-.152
G1 X98.622 Y79.026 E-.152
G1 X98.657 Y78.965 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.512 Y77.128 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.487489
G1 F4010.963
M204 S6000
G3 X97.485 Y77.081 I-.05 J-.002 E.01222
; WIPE_START
G1 X97.432 Y77.081 E-.152
G1 X97.405 Y77.128 E-.152
G1 X97.432 Y77.174 E-.152
G1 X97.485 Y77.174 E-.152
G1 X97.512 Y77.128 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.363 Y76.647 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.640788
G1 F2952.102
M204 S6000
G3 X95.326 Y76.584 I-.068 J-.003 E.02256
; WIPE_START
G1 X95.254 Y76.584 E-.152
G1 X95.218 Y76.647 E-.152
G1 X95.254 Y76.71 E-.152
G1 X95.326 Y76.71 E-.152
G1 X95.363 Y76.647 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.706 Y79.028 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.629349
G1 F3011.428
M204 S6000
G3 X94.67 Y78.967 I-.067 J-.003 E.02168
; WIPE_START
G1 X94.599 Y78.967 E-.15198
G1 X94.563 Y79.028 E-.15201
G1 X94.599 Y79.09 E-.152
G1 X94.67 Y79.09 E-.152
G1 X94.706 Y79.028 E-.15201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.627 Y80.453 Z3.12 F42000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.597529
G1 F3189.725
M204 S6000
G3 X96.594 Y80.394 I-.063 J-.002 E.01933
; WIPE_START
G1 X96.527 Y80.394 E-.152
G1 X96.493 Y80.453 E-.152
G1 X96.527 Y80.511 E-.152
G1 X96.594 Y80.511 E-.152
G1 X96.627 Y80.453 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.12
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.12 F4000
            G39.3 S1
            G0 Z3.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X49.5 Y163.318 F42000
G1 Z2.72
G1 E.8 F1800
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X49.250 Y164.318  
M204 S6000
G1  X15.000  E1.7540 F3897
G1  Y158.318  E0.3073
G1  X50.000  E1.7924
G1  Y162.568  E0.2176
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #9
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z3.12 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z5.72 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T1
M73 E0
M620.1 E F199 T240
M620.10 A1 F199 L123.994 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F199 ; do not need pulsatile flushing for start part
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PETG



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
G1 E11.1594 F199
G1 E1.23994 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300










M629

M400
M106 P1 S60
M109 S255
G1 E5 F199 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
M73 P92 R2
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z5.72
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
M73 P95 R1
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S1A
G392 S0

M1007 S1
M106 S102
M106 P2 S0
G1 X47.199 Y153.119 F42000
G1 Z2.72
G1 X54.831 Y153.119 Z3.12
G1 X55.199 Y153.119 Z3.12
G1 X55.199 Y163.818
M73 P96 R1
G1 X49.5 Y163.818

; filament start gcode
M106 P3 S180



M400 U1
G1 Z2.72
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y163.818  E0.1536 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.5875 F1782
G1  Y163.318  E0.0256
G1  X49.500  E1.7412 F2025
G1  Y162.818  E0.0256
G1  X15.500  E1.7412 F2473
G1  Y162.318  E0.0256
G1  X49.500  E1.7412 F3897
M73 P97 R1
G1  Y161.818  E0.0256
M73 P97 R0
G1  X15.500  E1.7412
G1  Y161.318  E0.0256
G1  X49.500  E1.7412
G1  Y160.818  E0.0256
G1  X15.500  E1.7412
G1  Y160.318  E0.0256
G1  X49.500  E1.7412
G1  Y159.818  E0.0256
G1  X15.500  E1.7412
G1  Y159.318  E0.0256
G1  X49.500  E1.7412
M73 P98 R0
G1  Y158.818  E0.0256
G1  X15.500  E1.7412
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F3189.725
M204 S6000
G1 X17.5 Y158.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.12 I1.217 J0 P1  F42000
; OBJECT_ID: 1297
G1 X98.102 Y76.321
G1 Z2.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.559128
; LAYER_HEIGHT: 0.28
G1 F3435.167
M204 S5000
G3 X98.032 Y76.267 I-.057 J.002 E.01439
G1 X98.056 Y76.267 E.00133
G1 X98.07 Y76.267 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F3435.167
M204 S6000
G1 X98.056 Y76.267 E-.03428
G1 X98.032 Y76.267 E-.05887
G1 X98.008 Y76.267 E-.05885
G1 X97.977 Y76.321 E-.152
G1 X98.008 Y76.375 E-.152
G1 X98.07 Y76.375 E-.152
G1 X98.102 Y76.321 E-.152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/11
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

M106 S229.5
; OBJECT_ID: 1297
M204 S10000
G17
G3 Z3.12 I-1.127 J-.458 P1  F42000
G1 X97.112 Y78.753 Z3.12
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.532818
G1 F1200
M204 S5000
G1 X97.044 Y78.777 E.00379
; LINE_WIDTH: 0.495212
G1 X96.975 Y78.801 E.00349
; LINE_WIDTH: 0.457605
G1 X96.907 Y78.825 E.00318
; LINE_WIDTH: 0.419998
G1 X96.836 Y78.992 E.00723
G3 X97.04 Y80.901 I-24.768 J3.61 E.07644
G1 X96.092 Y80.901 E.03775
G3 X96.276 Y78.999 I16.197 J.607 E.0761
G1 X96.25 Y78.88 E.00487
G1 X96.143 Y78.801 E.00528
G1 X96.007 Y78.82 E.00546
G3 X94.358 Y79.665 I-7.301 J-12.208 E.07381
G1 X94.039 Y78.714 E.03991
G3 X95.861 Y78.266 I7.978 J28.48 E.07468
G1 X95.993 Y78.15 E.00698
; LINE_WIDTH: 0.457082
G1 X96.002 Y78.087 E.00281
; LINE_WIDTH: 0.494165
G1 X96.011 Y78.023 E.00308
; LINE_WIDTH: 0.531249
G2 X95.979 Y77.918 I-.057 J-.04 E.00664
; LINE_WIDTH: 0.523529
G1 X95.798 Y77.765 E.01214
; LINE_WIDTH: 0.489018
G1 X95.617 Y77.612 E.01124
; LINE_WIDTH: 0.454509
G1 X95.435 Y77.46 E.01033
; LINE_WIDTH: 0.419998
G3 X94.595 Y76.591 I13.402 J-13.808 E.04813
G1 X95.412 Y75.957 E.04115
G3 X96.047 Y76.983 I-26.515 J17.138 E.04803
; LINE_WIDTH: 0.455342
G1 X96.151 Y77.198 E.01042
; LINE_WIDTH: 0.490685
G1 X96.255 Y77.412 E.01135
; LINE_WIDTH: 0.526029
G1 X96.359 Y77.627 E.01228
G1 X96.425 Y77.661 E.00381
; LINE_WIDTH: 0.494014
G1 X96.491 Y77.695 E.00355
; LINE_WIDTH: 0.511878
G1 X96.619 Y77.683 E.00647
; LINE_WIDTH: 0.561759
G1 X96.748 Y77.67 E.00718
G1 X96.776 Y77.628 E.00283
; LINE_WIDTH: 0.558538
G1 X96.997 Y77.219 E.02563
; LINE_WIDTH: 0.512358
G1 X97.218 Y76.81 E.02325
; LINE_WIDTH: 0.466179
G1 X97.438 Y76.4 E.02088
; LINE_WIDTH: 0.419998
G1 X97.681 Y76 E.01861
G1 X98.496 Y76.539 E.03889
G1 X98.159 Y76.932 E.02061
; LINE_WIDTH: 0.466179
G1 X97.833 Y77.264 E.02088
; LINE_WIDTH: 0.512358
G1 X97.508 Y77.595 E.02325
; LINE_WIDTH: 0.558538
G1 X97.182 Y77.927 E.02563
G1 X97.172 Y77.998 E.00398
; LINE_WIDTH: 0.517433
G1 X97.161 Y78.07 E.00365
; LINE_WIDTH: 0.504573
G1 X97.225 Y78.193 E.0068
; LINE_WIDTH: 0.532818
G1 X97.289 Y78.315 E.00723
G1 X97.329 Y78.321 E.0021
; LINE_WIDTH: 0.524428
G1 X97.591 Y78.349 E.01354
; LINE_WIDTH: 0.489619
G1 X97.853 Y78.376 E.01252
; LINE_WIDTH: 0.454809
G1 X98.115 Y78.404 E.01151
; LINE_WIDTH: 0.419998
G3 X99.169 Y78.613 I-5.847 J32.196 E.04276
G1 X99.059 Y78.988 E.01554
G1 X98.884 Y79.588 E.02486
G3 X97.807 Y79.13 I6.977 J-17.898 E.04657
; LINE_WIDTH: 0.457605
G1 X97.576 Y79.004 E.01158
; LINE_WIDTH: 0.495212
G1 X97.344 Y78.879 E.01268
; LINE_WIDTH: 0.532818
G1 X97.165 Y78.782 E.01064
; WIPE_START
G1 F3626.353
M204 S6000
G1 X97.044 Y78.777 E-.04608
G1 X96.975 Y78.801 E-.02752
G1 X96.907 Y78.825 E-.02752
G1 X96.836 Y78.992 E-.06902
G1 X96.991 Y80.245 E-.47985
G1 X97.012 Y80.534 E-.11
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X98.394 Y78.663 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1200
M204 S2000
G1 X98.822 Y79.09 E.02606
G1 X98.307 Y79.127
G1 X97.762 Y78.582 E.03324
M204 S10000
G1 X97.646 Y78.561 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.200955
G1 F1200
M204 S6000
G2 X97.571 Y78.687 I1.045 J.706 E.0023
; LINE_WIDTH: 0.171019
G1 X97.586 Y78.715 E.00039
; LINE_WIDTH: 0.121616
G2 X97.69 Y78.815 I.174 J-.077 E.00101
; WIPE_START
G1 F12000
G1 X97.586 Y78.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.522 Y76.688 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1200
M204 S2000
G1 X97.814 Y76.979 E.01779
M204 S10000
G1 X98.102 Y76.722 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.387677
G1 F1200
M204 S6000
G1 X97.785 Y76.464 E.01482
; LINE_WIDTH: 0.340959
G1 X97.763 Y76.466 E.00069
; LINE_WIDTH: 0.305843
G1 X97.741 Y76.469 E.00061
; LINE_WIDTH: 0.265191
G1 X97.704 Y76.484 E.00089
; LINE_WIDTH: 0.219
G1 X97.668 Y76.5 E.00069
; LINE_WIDTH: 0.170052
G2 X97.629 Y76.519 I-.003 J.043 E.00056
; LINE_WIDTH: 0.127291
G1 X97.546 Y76.636 E.00106
; WIPE_START
G1 F12000
G1 X97.629 Y76.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.089 Y76.46 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1200
M204 S2000
G1 X95.981 Y77.353 E.05442
M204 S10000
G1 X95.651 Y76.717 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12161
G1 F1200
M204 S6000
G1 X95.567 Y76.611 E.00092
; LINE_WIDTH: 0.15106
G1 X95.483 Y76.504 E.00136
; LINE_WIDTH: 0.189804
G1 X95.298 Y76.273 E.00425
M204 S10000
G1 X94.951 Y76.596 F42000
; LINE_WIDTH: 0.0804471
G1 F1200
M204 S6000
G1 X94.935 Y76.605 E.00004
; LINE_WIDTH: 0.137908
G1 X94.924 Y76.625 E.00019
G1 X95.589 Y77.298 E.00814
G1 X95.795 Y77.473 E.00232
M204 S10000
G1 X96.521 Y77.892 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1200
M204 S2000
G1 X97.158 Y78.529 E.03885
M73 P99 R0
G1 X96.766 Y78.688
G1 X96.211 Y78.134 E.03383
G1 X95.377 Y78.954
G1 X95.074 Y78.651 E.01847
G1 X94.63 Y78.759
G1 X95.01 Y79.139 E.02318
; WIPE_START
G1 F4396.602
M204 S6000
G1 X94.63 Y78.759 E-.20423
G1 X95.074 Y78.651 E-.17361
G1 X95.377 Y78.954 E-.16279
G1 X95.789 Y78.549 E-.21937
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.363 Y79.94 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X96.797 Y80.374 E.02646
M204 S10000
G1 X96.817 Y80.381 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.290634
G1 F1200
M204 S6000
G1 X96.723 Y80.607 E.00623
G1 X96.288 Y80.583 E.01112
; WIPE_START
G1 F7435.789
G1 X96.723 Y80.607 E-.48702
G1 X96.817 Y80.381 E-.27298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.659 Y79.023 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.196325
G1 F1200
M204 S6000
G2 X96.226 Y78.548 I-1.243 J.7 E.00976
; LINE_WIDTH: 0.232733
G1 X96.209 Y78.538 E.00038
G1 X96.003 Y78.612 E.00419
M204 S10000
G1 X96.556 Y78.755 F42000
; LINE_WIDTH: 0.265781
G1 F1200
M204 S6000
G1 X96.556 Y79.016 E.00594
; LINE_WIDTH: 0.281385
G1 X96.557 Y79.171 E.00378
; LINE_WIDTH: 0.319828
G1 X96.558 Y79.325 E.00444
; LINE_WIDTH: 0.35827
G1 X96.559 Y79.479 E.00509
; LINE_WIDTH: 0.385927
G1 X96.559 Y79.634 E.00556
G1 X96.778 Y79.971 E.01449
; WIPE_START
G1 F5261.149
G1 X96.559 Y79.634 E-.54909
G1 X96.559 Y79.479 E-.21091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.466 Y77.946 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.209704
G1 F1200
M204 S6000
G1 X96.299 Y77.934 E.00277
G1 X96.228 Y78.099 E.00297
; WIPE_START
G1 F11457.932
G1 X96.299 Y77.934 E-.39308
G1 X96.466 Y77.946 E-.36692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.542 Y78.763 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.201681
G1 F1200
M204 S6000
G1 X94.469 Y78.833 E.00159
; LINE_WIDTH: 0.254672
G1 X94.395 Y78.904 E.00219
G1 X94.58 Y79.369 E.01076
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F8810.041
G1 X94.395 Y78.904 E-.63155
G1 X94.469 Y78.833 E-.12845
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

M400 U1
;===== date: 20231229 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z3.5 F900 ; lower z a little
G1 X0 Y86.2891 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z103 F600
    G1 Z101

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

