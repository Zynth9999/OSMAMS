; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 1h 26m 10s; total estimated time: 1h 32m 24s
; total layer number: 35
; total filament length [mm] : 3876.08,2356.72
; total filament volume [cm^3] : 9323.05,5668.58
; total filament weight [g] : 11.84,7.20
; filament_density: 1.27,1.27
; filament_diameter: 1.75,1.75
; max_z_height: 9.25
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
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 100
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
; default_acceleration = 15000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 40
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = bridge_speed;default_acceleration;enable_overhang_speed;flush_into_infill;gap_infill_speed;infill_combination;infill_direction;infill_wall_overlap;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_print_height;initial_layer_speed;inner_wall_acceleration;inner_wall_line_width;inner_wall_speed;internal_solid_infill_line_width;internal_solid_infill_pattern;internal_solid_infill_speed;layer_height;line_width;minimum_sparse_infill_area;only_one_wall_first_layer;outer_wall_acceleration;outer_wall_line_width;overhang_2_4_speed;overhang_3_4_speed;overhang_4_4_speed;prime_tower_brim_width;prime_tower_infill_gap;prime_tower_rib_wall;sparse_infill_anchor_max;sparse_infill_density;sparse_infill_line_width;sparse_infill_pattern;sparse_infill_speed;support_line_width;top_one_wall_type;top_surface_acceleration;top_surface_line_width;top_surface_pattern;wall_generator;xy_hole_compensation;filament_end_gcode;filament_start_gcode;filament_end_gcode;filament_start_gcode;deretraction_speed;machine_max_jerk_x;machine_max_jerk_y;retract_when_changing_layer;retraction_speed;z_hop;z_hop_types
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 0
; enable_pre_heating = 0
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 0
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
; filament_end_gcode = "; filament end gcode \nM400 U1 ; C4E\n";"; filament end gcode \nM400 U1 ; C1E\n"
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
; filament_settings_id = "PETG 1ST COLOR";"PETG 2ND COLOR"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}\nM400 U1 ; C4S";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}\nM400 U1 ; C1S"
; filament_type = PETG;PETG
; filament_vendor = Generic;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 1
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,340,552,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 300
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
; infill_combination = 1
; infill_direction = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 10%
; inherits_group = ;"Generic PETG @BBL A1M";"Generic PETG @BBL A1M";"Bambu Lab A1 mini 0.4 nozzle"
; initial_layer_acceleration = 15000
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 200
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.25
; initial_layer_speed = 150
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 15000
; inner_wall_jerk = 9
; inner_wall_line_width = 0.5
; inner_wall_speed = 400
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.5
; internal_solid_infill_pattern = monotonic
; internal_solid_infill_speed = 300
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.25
; line_width = 0.5
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
; machine_max_jerk_x = 20,9
; machine_max_jerk_y = 20,9
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
; minimum_sparse_infill_area = 0
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.76
; nozzle_temperature = 255,255
; nozzle_temperature_initial_layer = 255,255
; nozzle_temperature_range_high = 270,270
; nozzle_temperature_range_low = 220,220
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 1
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 15000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.5
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 160
; overhang_3_4_speed = 120
; overhang_4_4_speed = 80
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
; prime_tower_brim_width = 2
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
; retract_when_changing_layer = 0
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 40
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
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
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
; sparse_infill_anchor_max = 0
; sparse_infill_density = 10%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.5
; sparse_infill_pattern = alignedrectilinear
; sparse_infill_speed = 500
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
; support_line_width = 0.5
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
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
; top_color_penetration_layers = 4
; top_one_wall_type = not apply
; top_shell_layers = 4
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 15000
; top_surface_jerk = 9
; top_surface_line_width = 0.5
; top_surface_pattern = alignedrectilinear
; top_surface_speed = 200
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
; wipe_tower_x = 110.286
; wipe_tower_y = 77.8308
; xy_contour_compensation = 0
; xy_hole_compensation = 0.12
; z_direction_outwall_speed_continuous = 0
; z_hop = 0
; z_hop_types = Slope Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R92
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X20.00 Y20.00 Z5.00 E3.00
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
M73 P0 R91
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG
    M104 S270
    G92 E0
    G1 E50 F199.559
    M400
    M106 P1 S178
    G92 E0
    G1 E5 F199.559
    M109 S235 ; drop nozzle temp, make filament shink a bit
    M104 S215
    G92 E0
M73 P1 R91
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
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
M73 P5 R87
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
M73 P5 R86
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
    G29 A1 X76.8534 Y72.2836 I70.2175 J22.1044
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
M73 P6 R86
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



M400 U1 ; C4S
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.25 F42000
; CHANGE_LAYER
; Z_HEIGHT: 0.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 1/37
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
M106 P2 S0
; OBJECT_ID: 254
G1 E-.8 F2400
M204 S6000
G1 X79.095 Y75.127 F42000
G1 E.8 F2400
; FEATURE: Brim
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.25
G1 F4301.562
M204 S15000
G1 X80.062 Y74.173 E.05988
G1 X80.972 Y73.536 E.04898
G1 X81.884 Y73.078 E.04495
G1 X82.842 Y72.754 E.04459
G1 X83.997 Y72.546 E.0517
G1 X84.727 Y72.507 E.03224
G1 X86.689 Y72.507 E.08647
G1 X87.374 Y72.54 E.03023
G1 X88.404 Y72.708 E.046
G1 X89.331 Y72.993 E.04272
G1 X90.249 Y73.418 E.0446
G1 X91.123 Y73.982 E.04583
G1 X92.031 Y74.792 E.05361
G1 X92.618 Y75.487 E.04009
G1 X92.903 Y75.903 E.02226
G1 X93.442 Y76.915 E.05053
G1 X93.78 Y77.861 E.04427
G1 X93.983 Y78.826 E.04346
G1 X94.042 Y79.389 E.02495
G1 X94.332 Y83.859 E.19742
G1 X94.346 Y84.884 E.04515
G1 X94.298 Y85.562 E.02996
G1 X94.16 Y86.473 E.04064
G1 X94.057 Y86.936 E.02088
G1 X93.876 Y87.572 E.02915
G1 X93.636 Y88.239 E.03126
G1 X93.259 Y89.07 E.04022
G1 X92.93 Y89.665 E.02993
G1 X92.675 Y90.068 E.02104
G1 X92.26 Y90.645 E.03133
G1 X91.658 Y91.354 E.041
G1 X91.135 Y91.874 E.03248
G1 X90.385 Y92.503 E.04316
G1 X90.043 Y92.751 E.01861
G1 X89.454 Y93.13 E.03088
G1 X88.737 Y93.506 E.03568
G1 X87.812 Y93.854 E.04356
G1 X86.956 Y94.058 E.03876
G1 X86.45 Y94.126 E.02252
G1 X85.628 Y94.164 E.03626
G1 X84.932 Y94.121 E.03074
G1 X84.045 Y93.971 E.03964
G1 X83.449 Y93.802 E.02729
G1 X82.685 Y93.503 E.03617
G1 X81.898 Y93.082 E.03932
G1 X81.207 Y92.624 E.03656
G1 X80.775 Y92.292 E.02401
G1 X80.22 Y91.807 E.03245
G1 X79.568 Y91.132 E.04138
G1 X79.229 Y90.725 E.02337
G1 X78.795 Y90.133 E.03234
G1 X78.432 Y89.555 E.03007
G1 X78.112 Y88.957 E.02988
G1 X77.744 Y88.118 E.0404
G1 X77.51 Y87.439 E.03165
G1 X77.337 Y86.797 E.02928
G1 X77.241 Y86.334 E.02083
G1 X77.114 Y85.402 E.04146
G1 X77.077 Y84.717 E.03026
G1 X77.084 Y84.079 E.02812
G1 X77.384 Y79.395 E.20687
G1 X77.426 Y78.958 E.01935
G1 X77.603 Y78.028 E.04169
G1 X77.917 Y77.078 E.04413
G1 X78.348 Y76.194 E.04332
G1 X78.83 Y75.458 E.03879
G1 X79.058 Y75.174 E.01604
M204 S6000
G1 X79.407 Y75.454 F42000
G1 F4301.562
M204 S15000
G1 X79.433 Y75.421 E.00185
G1 X80.341 Y74.525 E.05622
G1 X81.194 Y73.926 E.04594
G1 X82.048 Y73.495 E.04217
G1 X82.944 Y73.19 E.04173
G1 X84.04 Y72.992 E.04907
G1 X84.743 Y72.953 E.03101
G1 X86.682 Y72.953 E.08546
G1 X87.335 Y72.986 E.02882
G1 X88.311 Y73.147 E.04361
G1 X89.179 Y73.415 E.04004
G1 X90.025 Y73.806 E.04108
G1 X90.86 Y74.345 E.04379
G1 X91.703 Y75.097 E.04981
G1 X92.258 Y75.752 E.03782
G1 X92.524 Y76.142 E.02079
G1 X93.036 Y77.105 E.0481
G1 X93.351 Y77.992 E.04146
G1 X93.542 Y78.903 E.04102
G1 X93.598 Y79.43 E.02337
G1 X93.886 Y83.873 E.19624
G1 X93.899 Y84.865 E.04373
G1 X93.855 Y85.507 E.02835
G1 X93.72 Y86.396 E.03962
G1 X93.623 Y86.83 E.01961
G1 X93.452 Y87.431 E.02753
G1 X93.22 Y88.076 E.03024
G1 X92.862 Y88.865 E.03816
G1 X92.548 Y89.434 E.02865
G1 X92.307 Y89.815 E.01987
G1 X91.912 Y90.366 E.02987
G1 X91.334 Y91.047 E.03937
G1 X90.838 Y91.54 E.03082
G1 X90.107 Y92.154 E.04209
G1 X89.788 Y92.384 E.01732
G1 X89.234 Y92.74 E.02904
G1 X88.546 Y93.101 E.03423
G1 X87.689 Y93.423 E.04036
G1 X86.881 Y93.617 E.03662
G1 X86.415 Y93.68 E.02071
G1 X85.639 Y93.717 E.03426
G1 X84.99 Y93.677 E.02864
G1 X84.136 Y93.533 E.03817
G1 X83.586 Y93.376 E.02524
G1 X82.879 Y93.1 E.03341
G1 X82.133 Y92.701 E.0373
G1 X81.463 Y92.258 E.03543
G1 X81.054 Y91.944 E.02269
G1 X80.533 Y91.488 E.03055
G1 X79.897 Y90.83 E.0403
G1 X79.578 Y90.446 E.022
G1 X79.162 Y89.878 E.03105
G1 X78.816 Y89.326 E.02869
G1 X78.511 Y88.757 E.02846
G1 X78.162 Y87.96 E.03834
G1 X77.936 Y87.303 E.03062
G1 X77.773 Y86.697 E.02766
G1 X77.682 Y86.263 E.01954
G1 X77.558 Y85.355 E.04042
G1 X77.523 Y84.712 E.02838
G1 X77.53 Y84.092 E.02732
G1 X77.868 Y79.031 E.22355
G1 X78.038 Y78.132 E.04031
G1 X78.328 Y77.255 E.04071
G1 X78.741 Y76.408 E.04151
G1 X79.189 Y75.726 E.03597
G1 X79.369 Y75.501 E.01272
M204 S6000
G1 X79.718 Y75.781 F42000
G1 F4301.562
M204 S15000
G1 X79.771 Y75.715 E.00371
G1 X80.62 Y74.876 E.0526
G1 X81.415 Y74.315 E.04292
G1 X82.213 Y73.912 E.03939
G1 X83.047 Y73.627 E.03886
G1 X84.084 Y73.437 E.04644
G1 X84.758 Y73.4 E.02978
G1 X86.674 Y73.4 E.08441
G1 X87.295 Y73.432 E.0274
G1 X88.217 Y73.585 E.04122
G1 X89.027 Y73.836 E.03736
G1 X89.8 Y74.194 E.03757
G1 X90.596 Y74.708 E.04175
G1 X91.376 Y75.404 E.04604
G1 X91.898 Y76.018 E.03553
G1 X92.145 Y76.379 E.01931
G1 X92.63 Y77.295 E.04566
G1 X92.922 Y78.122 E.03865
G1 X93.101 Y78.979 E.03858
G1 X93.153 Y79.471 E.0218
G1 X93.44 Y83.887 E.19506
G1 X93.453 Y84.847 E.04232
G1 X93.411 Y85.453 E.02674
G1 X93.28 Y86.318 E.03858
G1 X93.189 Y86.724 E.01833
G1 X93.028 Y87.29 E.02592
G1 X92.803 Y87.914 E.02922
G1 X92.465 Y88.66 E.03611
G1 X92.165 Y89.203 E.02737
G1 X91.939 Y89.562 E.01871
G1 X91.563 Y90.086 E.02842
G1 X91.009 Y90.739 E.03774
G1 X90.541 Y91.206 E.02916
G1 X89.828 Y91.805 E.041
G1 X89.533 Y92.017 E.01602
G1 X89.014 Y92.351 E.02719
G1 X88.355 Y92.696 E.03277
G1 X87.566 Y92.993 E.0372
G1 X86.805 Y93.176 E.03448
G1 X86.38 Y93.235 E.0189
G1 X85.649 Y93.27 E.03226
G1 X85.048 Y93.233 E.02653
G1 X84.228 Y93.095 E.03667
G1 X83.722 Y92.95 E.02318
G1 X83.074 Y92.697 E.03068
G1 X82.367 Y92.321 E.03527
G1 X81.718 Y91.891 E.0343
G1 X81.335 Y91.596 E.02135
G1 X80.845 Y91.168 E.02867
G1 X80.227 Y90.528 E.03921
G1 X79.928 Y90.168 E.02062
G1 X79.529 Y89.623 E.02975
G1 X79.205 Y89.106 E.02691
G1 X78.911 Y88.557 E.02745
G1 X78.58 Y87.803 E.03629
G1 X78.361 Y87.168 E.02959
G1 X78.208 Y86.598 E.02604
G1 X78.123 Y86.192 E.01825
G1 X78.003 Y85.307 E.03937
G1 X77.97 Y84.706 E.0265
G1 X77.977 Y84.106 E.02649
G1 X78.311 Y79.095 E.2213
G1 X78.47 Y78.253 E.0378
G1 X78.74 Y77.432 E.03807
G1 X79.135 Y76.623 E.0397
G1 X79.547 Y75.994 E.03313
G1 X79.68 Y75.827 E.0094
M204 S6000
G1 X80.029 Y76.108 F42000
G1 F4301.562
M204 S15000
G1 X80.108 Y76.009 E.00557
G1 X80.899 Y75.228 E.04901
G1 X81.638 Y74.704 E.0399
G1 X82.378 Y74.328 E.0366
G1 X83.151 Y74.063 E.03599
G1 X84.128 Y73.883 E.0438
G1 X84.775 Y73.846 E.02853
G1 X86.666 Y73.846 E.08334
G1 X87.254 Y73.877 E.02597
G1 X88.123 Y74.023 E.03882
G1 X88.858 Y74.251 E.03392
G1 X89.576 Y74.582 E.03486
G1 X90.333 Y75.071 E.0397
G1 X91.049 Y75.71 E.04229
G1 X91.538 Y76.284 E.03323
G1 X91.766 Y76.617 E.01781
G1 X92.223 Y77.484 E.0432
G1 X92.493 Y78.251 E.03585
G1 X92.661 Y79.055 E.03616
G1 X92.708 Y79.511 E.02023
G1 X92.993 Y83.901 E.19388
G1 X93.006 Y84.83 E.04092
G1 X92.967 Y85.398 E.02512
G1 X92.84 Y86.24 E.03753
G1 X92.755 Y86.618 E.01705
G1 X92.604 Y87.148 E.02432
G1 X92.387 Y87.75 E.0282
G1 X92.068 Y88.454 E.03408
G1 X91.782 Y88.973 E.02608
G1 X91.57 Y89.31 E.01754
G1 X91.214 Y89.807 E.02696
G1 X90.684 Y90.432 E.03611
G1 X90.243 Y90.873 E.02749
G1 X89.557 Y91.449 E.03949
G1 X88.797 Y91.96 E.04036
G1 X88.165 Y92.29 E.03143
G1 X87.442 Y92.563 E.03405
G1 X86.729 Y92.735 E.03235
G1 X86.345 Y92.789 E.01707
G1 X85.659 Y92.822 E.03026
G1 X85.106 Y92.79 E.0244
G1 X84.32 Y92.657 E.03517
G1 X83.859 Y92.524 E.02111
G1 X83.268 Y92.294 E.02799
G1 X82.602 Y91.94 E.03324
G1 X81.974 Y91.525 E.03315
G1 X81.615 Y91.248 E.02
G1 X81.157 Y90.848 E.02679
G1 X80.556 Y90.226 E.03811
G1 X80.277 Y89.89 E.01924
G1 X79.897 Y89.369 E.02845
G1 X79.589 Y88.877 E.02554
G1 X79.31 Y88.357 E.02603
G1 X78.998 Y87.645 E.03424
G1 X78.787 Y87.033 E.02855
G1 X78.643 Y86.498 E.02443
G1 X78.564 Y86.121 E.01696
G1 X78.447 Y85.259 E.03833
G1 X78.417 Y84.701 E.02463
G1 X78.423 Y84.119 E.02566
G1 X78.754 Y79.16 E.21906
G1 X78.901 Y78.373 E.03529
G1 X79.151 Y77.609 E.03542
G1 X79.528 Y76.836 E.03789
G1 X79.905 Y76.262 E.03028
G1 X79.991 Y76.154 E.00608
M204 S6000
G1 X80.339 Y76.435 F42000
G1 F4301.562
M204 S15000
G1 X80.445 Y76.303 E.00745
G1 X81.179 Y75.578 E.04546
G1 X81.861 Y75.093 E.03689
G1 X82.545 Y74.745 E.03381
G1 X83.255 Y74.499 E.03313
G1 X84.173 Y74.328 E.04116
G1 X84.791 Y74.293 E.02728
G1 X86.65 Y74.293 E.08194
G1 X87.213 Y74.323 E.02482
G1 X88.028 Y74.461 E.03644
G1 X88.705 Y74.672 E.03129
G1 X89.352 Y74.97 E.03137
G1 X90.069 Y75.434 E.03765
G1 X90.722 Y76.017 E.03857
G1 X91.178 Y76.55 E.03092
G1 X91.387 Y76.855 E.01627
G1 X91.816 Y77.673 E.04073
G1 X92.064 Y78.38 E.03305
G1 X92.22 Y79.13 E.03376
G1 X92.264 Y79.552 E.01868
G1 X92.547 Y83.915 E.19271
G1 X92.559 Y84.812 E.03953
G1 X92.524 Y85.344 E.0235
G1 X92.399 Y86.167 E.03668
G1 X92.181 Y87.004 E.03814
G1 X91.971 Y87.587 E.02731
G1 X91.671 Y88.25 E.03206
G1 X91.4 Y88.743 E.0248
G1 X91.202 Y89.057 E.01637
G1 X90.865 Y89.528 E.02551
G1 X90.36 Y90.125 E.03449
G1 X89.945 Y90.539 E.02581
G1 X89.282 Y91.096 E.03816
G1 X88.575 Y91.572 E.03758
G1 X87.975 Y91.885 E.02983
G1 X87.302 Y92.137 E.03165
G1 X86.638 Y92.297 E.0301
G1 X86.297 Y92.344 E.01518
G1 X85.669 Y92.375 E.02774
G1 X85.164 Y92.346 E.02226
G1 X84.412 Y92.219 E.03365
G1 X83.997 Y92.099 E.01904
G1 X83.461 Y91.89 E.02532
G1 X82.825 Y91.552 E.03178
G1 X82.23 Y91.158 E.03142
G1 X81.895 Y90.9 E.01865
G1 X81.469 Y90.528 E.02493
G1 X80.885 Y89.924 E.03701
G1 X80.627 Y89.612 E.01785
G1 X80.264 Y89.114 E.02716
G1 X79.973 Y88.649 E.02416
G1 X79.71 Y88.157 E.02461
G1 X79.417 Y87.487 E.03221
G1 X79.212 Y86.894 E.02765
G1 X79.006 Y86.054 E.03813
G1 X78.891 Y85.212 E.03747
G1 X78.863 Y84.687 E.02314
G1 X78.87 Y84.133 E.02444
G1 X79.197 Y79.224 E.21683
G1 X79.333 Y78.493 E.03279
G1 X79.563 Y77.786 E.03275
G1 X79.922 Y77.05 E.03607
G1 X80.263 Y76.53 E.02741
G1 X80.302 Y76.482 E.00275
M204 S6000
G1 X80.65 Y76.762 F42000
G1 F4301.562
M204 S15000
G1 X80.782 Y76.598 E.00932
G1 X81.46 Y75.929 E.04194
G1 X82.085 Y75.482 E.03389
G1 X82.711 Y75.161 E.03102
G1 X83.36 Y74.935 E.03025
G1 X84.219 Y74.774 E.03853
G1 X84.808 Y74.739 E.02601
G1 X86.635 Y74.739 E.0805
G1 X87.171 Y74.769 E.02366
G1 X87.915 Y74.894 E.03326
G1 X88.537 Y75.087 E.0287
G1 X89.144 Y75.367 E.02949
G1 X89.789 Y75.785 E.03384
G1 X90.396 Y76.324 E.03578
G1 X90.819 Y76.816 E.0286
G1 X91.007 Y77.092 E.01472
G1 X91.401 Y77.843 E.03738
G1 X91.635 Y78.509 E.03111
G1 X91.777 Y79.192 E.03077
G1 X91.819 Y79.587 E.01749
G1 X92.101 Y83.929 E.19178
G1 X92.113 Y84.795 E.03815
G1 X92.08 Y85.29 E.02187
G1 X91.959 Y86.084 E.03538
G1 X91.756 Y86.866 E.03564
G1 X91.555 Y87.424 E.02612
G1 X91.273 Y88.045 E.03004
G1 X90.836 Y88.801 E.0385
G1 X90.516 Y89.249 E.02427
G1 X90.034 Y89.818 E.03286
G1 X89.648 Y90.206 E.02413
G1 X89.008 Y90.743 E.03682
G1 X88.352 Y91.183 E.03479
G1 X87.785 Y91.48 E.02822
G1 X87.179 Y91.707 E.02852
G1 X86.549 Y91.859 E.02856
G1 X86.25 Y91.9 E.0133
G1 X85.678 Y91.928 E.02525
G1 X85.222 Y91.902 E.02012
G1 X84.504 Y91.781 E.0321
G1 X84.134 Y91.673 E.01697
G1 X83.655 Y91.486 E.02266
G1 X83.047 Y91.164 E.03031
G1 X82.494 Y90.798 E.02926
G1 X82.182 Y90.557 E.01737
G1 X81.773 Y90.2 E.02392
G1 X81.222 Y89.63 E.03497
G1 X80.982 Y89.341 E.01652
G1 X80.631 Y88.86 E.02625
G1 X80.358 Y88.422 E.02278
G1 X80.11 Y87.957 E.0232
G1 X79.835 Y87.33 E.03018
G1 X79.639 Y86.762 E.02645
G1 X79.447 Y85.977 E.03562
G1 X79.336 Y85.164 E.03618
G1 X79.31 Y84.674 E.02164
G1 X79.316 Y84.147 E.02322
G1 X79.64 Y79.288 E.21463
G1 X79.765 Y78.612 E.0303
G1 X79.975 Y77.963 E.03007
G1 X80.315 Y77.264 E.03423
G1 X80.613 Y76.81 E.02395
M204 S6000
G1 X80.978 Y77.067 F42000
G1 F4301.562
M204 S15000
G1 X81.119 Y76.892 E.00993
G1 X81.74 Y76.279 E.03847
G1 X82.31 Y75.87 E.03091
G1 X82.879 Y75.576 E.02822
G1 X83.465 Y75.371 E.02737
G1 X84.265 Y75.219 E.03588
G1 X84.825 Y75.185 E.02472
G1 X86.618 Y75.185 E.07903
G1 X87.128 Y75.214 E.02251
G1 X87.802 Y75.328 E.03012
G1 X88.368 Y75.502 E.02609
G1 X88.936 Y75.765 E.0276
G1 X89.509 Y76.135 E.03007
G1 X90.07 Y76.632 E.033
G1 X90.459 Y77.082 E.02624
G1 X90.627 Y77.329 E.01316
G1 X90.986 Y78.013 E.03404
G1 X91.206 Y78.637 E.02918
G1 X91.334 Y79.255 E.0278
G1 X91.374 Y79.622 E.01629
G1 X91.654 Y83.943 E.19084
G1 X91.666 Y84.778 E.03677
G1 X91.636 Y85.236 E.02024
G1 X91.522 Y85.987 E.03348
G1 X91.33 Y86.729 E.03377
G1 X91.139 Y87.261 E.02494
G1 X90.879 Y87.834 E.02774
G1 X90.463 Y88.553 E.03659
G1 X90.166 Y88.97 E.02256
G1 X89.709 Y89.512 E.03124
G1 X89.35 Y89.872 E.02244
G1 X88.733 Y90.39 E.03548
G1 X88.13 Y90.795 E.03202
G1 X87.595 Y91.074 E.0266
G1 X87.039 Y91.281 E.02612
G1 X86.459 Y91.421 E.0263
G1 X86.203 Y91.455 E.0114
G1 X85.686 Y91.481 E.02281
G1 X85.279 Y91.459 E.01796
G1 X84.596 Y91.343 E.03053
G1 X84.272 Y91.248 E.01489
G1 X83.849 Y91.083 E.02004
G1 X83.27 Y90.776 E.02885
G1 X82.757 Y90.437 E.0271
G1 X82.462 Y90.21 E.01644
G1 X82.077 Y89.872 E.02255
G1 X81.558 Y89.335 E.03294
G1 X81.332 Y89.064 E.01556
G1 X81.004 Y88.614 E.02452
G1 X80.747 Y88.202 E.02141
G1 X80.514 Y87.767 E.02176
G1 X80.253 Y87.172 E.02861
G1 X80.067 Y86.63 E.02526
G1 X79.888 Y85.9 E.03312
G1 X79.781 Y85.127 E.0344
G1 X79.757 Y84.669 E.02024
G1 X79.762 Y84.161 E.0224
G1 X80.083 Y79.351 E.21245
G1 X80.197 Y78.73 E.02783
G1 X80.387 Y78.139 E.02737
G1 X80.709 Y77.478 E.03238
G1 X80.945 Y77.117 E.019
M204 S6000
G1 X81.32 Y77.381 F42000
G1 F4301.562
M204 S15000
G1 X81.456 Y77.187 E.01043
G1 X82.022 Y76.628 E.03503
G1 X82.536 Y76.257 E.02795
G1 X83.048 Y75.991 E.02541
G1 X83.572 Y75.807 E.0245
G1 X84.312 Y75.665 E.03323
G1 X84.843 Y75.632 E.02342
G1 X86.602 Y75.632 E.07753
G1 X87.086 Y75.66 E.02136
G1 X87.707 Y75.766 E.02779
G1 X88.216 Y75.924 E.02348
G1 X88.729 Y76.162 E.02491
G1 X89.246 Y76.499 E.02722
G1 X89.758 Y76.953 E.03015
G1 X90.1 Y77.349 E.02307
G1 X90.24 Y77.553 E.0109
G1 X90.572 Y78.183 E.03138
G1 X90.777 Y78.766 E.02724
G1 X90.891 Y79.318 E.02485
G1 X90.928 Y79.658 E.01508
G1 X91.208 Y83.958 E.1899
G1 X91.22 Y84.761 E.03541
G1 X91.192 Y85.182 E.0186
G1 X91.086 Y85.89 E.03156
G1 X90.905 Y86.591 E.03189
G1 X90.723 Y87.098 E.02375
G1 X90.484 Y87.624 E.02545
G1 X90.091 Y88.306 E.0347
G1 X89.817 Y88.692 E.02086
G1 X89.384 Y89.206 E.02961
G1 X89.052 Y89.539 E.02073
G1 X88.458 Y90.037 E.03413
G1 X87.908 Y90.407 E.02924
G1 X87.405 Y90.668 E.02498
G1 X86.901 Y90.856 E.0237
G1 X86.384 Y90.98 E.02344
G1 X85.698 Y91.033 E.03033
G1 X85.336 Y91.015 E.01594
G1 X84.689 Y90.905 E.02894
G1 X84.411 Y90.823 E.01279
G1 X84.042 Y90.679 E.01743
G1 X83.493 Y90.389 E.02738
G1 X83.021 Y90.076 E.02494
G1 X82.742 Y89.862 E.01551
G1 X82.382 Y89.545 E.02116
G1 X81.894 Y89.04 E.03093
G1 X81.379 Y88.37 E.03724
G1 X81.136 Y87.982 E.02018
G1 X80.918 Y87.576 E.02031
G1 X80.671 Y87.015 E.02703
G1 X80.494 Y86.498 E.02406
G1 X80.328 Y85.823 E.03063
G1 X80.227 Y85.09 E.03262
G1 X80.203 Y84.655 E.01922
G1 X80.209 Y84.174 E.02117
G1 X80.526 Y79.414 E.21028
G1 X80.629 Y78.847 E.02537
G1 X80.799 Y78.315 E.02466
G1 X81.104 Y77.689 E.03068
G1 X81.286 Y77.43 E.01393
M204 S6000
G1 X81.663 Y77.675 F42000
G1 F4301.562
M204 S15000
G1 X81.739 Y77.558 E.00615
G1 X82.055 Y77.196 E.02117
G1 X82.419 Y76.885 E.02112
G1 X82.923 Y76.558 E.0265
G1 X83.409 Y76.329 E.02368
G1 X83.962 Y76.174 E.0253
G1 X84.574 Y76.098 E.02719
G1 X85.767 Y76.078 E.05259
G1 X87.016 Y76.113 E.05504
G1 X87.655 Y76.223 E.02857
G1 X88.238 Y76.429 E.02727
G1 X88.959 Y76.846 E.03669
G1 X89.414 Y77.243 E.02661
G1 X89.751 Y77.642 E.02304
G1 X89.999 Y78.029 E.02025
G1 X90.23 Y78.552 E.0252
G1 X90.473 Y79.62 E.04826
G1 X90.772 Y84.504 E.21564
G1 X90.698 Y85.49 E.0436
G1 X90.526 Y86.28 E.03562
G1 X90.285 Y86.977 E.0325
G1 X89.781 Y87.941 E.04797
G1 X89.148 Y88.784 E.04644
G1 X88.459 Y89.458 E.04248
G1 X87.391 Y90.17 E.05657
G1 X86.697 Y90.435 E.03277
G1 X86.013 Y90.566 E.03068
G1 X85.557 Y90.576 E.02009
G1 X85.107 Y90.524 E.01998
G1 X84.518 Y90.372 E.02682
G1 X84.17 Y90.242 E.01633
G1 X83.593 Y89.924 E.02908
G1 X83.041 Y89.524 E.03004
G1 X82.408 Y88.933 E.03814
G1 X81.726 Y88.069 E.04851
G1 X81.234 Y87.18 E.04478
G1 X80.888 Y86.226 E.04474
G1 X80.687 Y85.143 E.04852
G1 X80.655 Y84.221 E.04068
G1 X80.976 Y79.488 E.20908
G1 X81.216 Y78.489 E.04525
G1 X81.416 Y78.054 E.02112
G1 X81.63 Y77.725 E.01729
M204 S6000
G1 X82.003 Y77.963 F42000
G1 F4301.562
M204 S15000
G1 X82.074 Y77.853 E.00576
G1 X82.342 Y77.538 E.01825
G1 X82.658 Y77.262 E.01849
G1 X83.113 Y76.962 E.02402
G1 X83.525 Y76.76 E.02023
G1 X84.011 Y76.618 E.02232
G1 X84.575 Y76.544 E.02504
G1 X85.755 Y76.524 E.05204
G1 X86.93 Y76.551 E.05181
G1 X87.59 Y76.665 E.02949
G1 X88.093 Y76.851 E.02366
G1 X88.741 Y77.235 E.0332
G1 X89.066 Y77.524 E.01914
G1 X89.416 Y77.937 E.02388
G1 X89.625 Y78.272 E.01741
G1 X89.793 Y78.643 E.01791
G1 X90.026 Y79.637 E.04502
G1 X90.328 Y84.464 E.21315
G1 X90.263 Y85.39 E.04091
G1 X90.107 Y86.126 E.03317
G1 X89.86 Y86.84 E.0333
G1 X89.43 Y87.665 E.04099
G1 X88.785 Y88.525 E.04738
G1 X88.142 Y89.144 E.03935
G1 X87.232 Y89.753 E.04825
G1 X86.624 Y89.995 E.02882
G1 X85.918 Y90.129 E.03169
G1 X85.55 Y90.13 E.01623
G1 X85.155 Y90.08 E.01754
G1 X84.627 Y89.939 E.02409
G1 X84.322 Y89.822 E.01441
G1 X83.806 Y89.531 E.02611
G1 X83.298 Y89.16 E.02772
G1 X82.707 Y88.602 E.03581
G1 X82.12 Y87.859 E.04173
G1 X81.656 Y87.034 E.04173
G1 X81.329 Y86.152 E.04149
G1 X81.133 Y85.136 E.04558
G1 X81.1 Y84.258 E.03873
G1 X81.422 Y79.507 E.20988
G1 X81.619 Y78.681 E.03742
G1 X81.788 Y78.301 E.01832
G1 X81.971 Y78.014 E.01502
M204 S6000
G1 X82.347 Y78.247 F42000
G1 F4301.562
M204 S15000
G1 X82.408 Y78.149 E.00507
G1 X82.688 Y77.819 E.0191
G1 X82.896 Y77.639 E.01212
G1 X83.366 Y77.329 E.0248
G1 X83.647 Y77.189 E.01387
G1 X84.063 Y77.061 E.01918
G1 X84.575 Y76.99 E.02275
G1 X85.745 Y76.971 E.05161
G1 X86.852 Y76.99 E.04878
G1 X87.433 Y77.083 E.02594
G1 X87.862 Y77.233 E.02002
G1 X88.441 Y77.566 E.02945
G1 X88.724 Y77.809 E.01643
G1 X89.035 Y78.169 E.02098
G1 X89.223 Y78.465 E.01542
G1 X89.356 Y78.737 E.01337
G1 X89.58 Y79.654 E.0416
G1 X89.883 Y84.427 E.21079
G1 X89.828 Y85.289 E.03804
G1 X89.669 Y86.042 E.03395
G1 X89.436 Y86.699 E.03071
G1 X89.08 Y87.388 E.03419
G1 X88.422 Y88.265 E.04833
G1 X87.827 Y88.827 E.03602
G1 X87.072 Y89.337 E.04016
G1 X86.546 Y89.555 E.02513
G1 X85.921 Y89.683 E.0281
G1 X85.614 Y89.688 E.01352
G1 X85.202 Y89.636 E.01832
G1 X84.742 Y89.508 E.02107
G1 X84.477 Y89.404 E.01255
G1 X84.023 Y89.142 E.02309
G1 X83.558 Y88.797 E.0255
G1 X83.009 Y88.273 E.03348
G1 X82.466 Y87.577 E.03889
G1 X82.042 Y86.81 E.03863
G1 X81.745 Y85.99 E.03844
G1 X81.58 Y85.127 E.03873
G1 X81.545 Y84.295 E.03668
G1 X81.868 Y79.526 E.21068
G1 X82.026 Y78.865 E.02993
G1 X82.162 Y78.544 E.01541
G1 X82.315 Y78.298 E.01275
M204 S6000
G1 X82.694 Y78.526 F42000
G1 F4301.562
M204 S15000
G1 X82.746 Y78.441 E.00442
G1 X82.983 Y78.154 E.01641
G1 X83.134 Y78.017 E.009
G1 X83.618 Y77.698 E.02554
G1 X83.778 Y77.616 E.00792
G1 X84.119 Y77.504 E.0158
G1 X84.574 Y77.437 E.02027
G1 X85.755 Y77.417 E.05207
G1 X86.853 Y77.437 E.0484
G1 X87.369 Y77.525 E.02304
G1 X87.636 Y77.618 E.01249
G1 X88.147 Y77.901 E.02573
G1 X88.386 Y78.101 E.01372
G1 X88.653 Y78.401 E.0177
G1 X88.85 Y78.71 E.01618
G1 X88.959 Y78.94 E.01118
G1 X89.134 Y79.671 E.03315
G1 X89.438 Y84.395 E.20861
G1 X89.393 Y85.187 E.03498
G1 X89.23 Y85.959 E.03477
G1 X89.014 Y86.554 E.02792
G1 X88.729 Y87.111 E.02757
G1 X88.058 Y88.007 E.04933
G1 X87.518 Y88.505 E.03238
G1 X86.904 Y88.924 E.03276
G1 X86.461 Y89.117 E.0213
G1 X85.916 Y89.237 E.0246
G1 X85.67 Y89.245 E.01085
G1 X85.331 Y89.209 E.015
G1 X84.855 Y89.076 E.0218
G1 X84.637 Y88.987 E.01036
G1 X84.245 Y88.755 E.02008
G1 X83.821 Y88.436 E.02342
G1 X83.312 Y87.945 E.03115
G1 X82.814 Y87.297 E.03601
G1 X82.43 Y86.589 E.03551
G1 X82.162 Y85.832 E.03537
G1 X82.026 Y85.116 E.03215
G1 X81.99 Y84.333 E.03453
G1 X82.315 Y79.545 E.2115
G1 X82.436 Y79.04 E.02289
G1 X82.54 Y78.781 E.01229
G1 X82.663 Y78.578 E.01048
M204 S6000
G1 X83.039 Y78.813 F42000
G1 F4301.562
M204 S15000
G1 X83.128 Y78.671 E.00741
G1 X83.327 Y78.439 E.01344
G1 X83.429 Y78.352 E.00594
G1 X83.866 Y78.069 E.02293
G1 X83.979 Y78.014 E.00554
G1 X84.259 Y77.928 E.01293
G1 X84.573 Y77.883 E.01395
G1 X85.765 Y77.863 E.05257
G1 X86.855 Y77.883 E.04804
G1 X87.297 Y77.965 E.01979
G1 X87.419 Y78.007 E.00569
G1 X87.858 Y78.241 E.02194
G1 X88.055 Y78.401 E.01119
G1 X88.271 Y78.631 E.01387
G1 X88.478 Y78.957 E.01703
G1 X88.556 Y79.131 E.00843
G1 X88.688 Y79.688 E.02522
G1 X88.993 Y84.431 E.20947
G1 X88.947 Y85.169 E.03256
G1 X88.812 Y85.802 E.02853
G1 X88.62 Y86.344 E.02534
G1 X88.327 Y86.919 E.02845
G1 X87.761 Y87.674 E.04159
G1 X87.269 Y88.134 E.02969
G1 X86.724 Y88.515 E.02929
G1 X86.367 Y88.681 E.01739
G1 X85.912 Y88.79 E.02059
G1 X85.645 Y88.8 E.01181
G1 X85.381 Y88.765 E.01171
G1 X84.975 Y88.646 E.01865
G1 X84.805 Y88.574 E.00815
G1 X84.473 Y88.371 E.01712
G1 X84.085 Y88.076 E.02152
G1 X83.617 Y87.619 E.0288
G1 X83.209 Y87.09 E.02947
G1 X82.852 Y86.446 E.03243
G1 X82.602 Y85.754 E.03242
G1 X82.472 Y85.101 E.02933
G1 X82.434 Y84.371 E.03224
G1 X82.761 Y79.564 E.21234
G1 X82.87 Y79.146 E.01906
G1 X82.954 Y78.95 E.00939
G1 X83.007 Y78.864 E.00446
M204 S6000
G1 X83.378 Y79.105 F42000
G1 F4301.562
M204 S15000
G1 X83.506 Y78.907 E.01039
G1 X83.664 Y78.731 E.01042
G1 X84.115 Y78.439 E.02369
G1 X84.321 Y78.37 E.00957
G1 X84.572 Y78.33 E.01119
G1 X85.775 Y78.309 E.05304
G1 X86.858 Y78.33 E.04771
G1 X87.213 Y78.403 E.016
G1 X87.567 Y78.58 E.01745
G1 X87.782 Y78.754 E.01216
G1 X87.945 Y78.935 E.01075
G1 X88.099 Y79.192 E.01319
G1 X88.146 Y79.308 E.00554
G1 X88.242 Y79.706 E.01801
G1 X88.548 Y84.468 E.21034
G1 X88.511 Y85.071 E.02662
G1 X88.395 Y85.644 E.02579
G1 X88.197 Y86.203 E.02612
G1 X87.926 Y86.721 E.02577
G1 X87.46 Y87.343 E.03425
G1 X87.017 Y87.766 E.02702
G1 X86.532 Y88.112 E.02622
G1 X86.261 Y88.247 E.01335
G1 X85.898 Y88.344 E.01659
G1 X85.691 Y88.356 E.0091
G1 X85.517 Y88.34 E.00772
G1 X85.093 Y88.216 E.01946
G1 X84.987 Y88.167 E.00515
G1 X84.706 Y87.99 E.01464
G1 X84.35 Y87.717 E.01976
G1 X83.924 Y87.296 E.0264
G1 X83.559 Y86.813 E.02668
G1 X83.274 Y86.299 E.02592
G1 X83.04 Y85.672 E.02949
G1 X82.918 Y85.085 E.02643
G1 X82.879 Y84.409 E.02983
G1 X83.207 Y79.582 E.21324
G1 X83.3 Y79.265 E.01454
G1 X83.349 Y79.157 E.00523
M204 S6000
G1 X83.731 Y79.381 F42000
G1 F4301.562
M204 S15000
G1 X83.886 Y79.142 E.01258
G1 X83.986 Y79.04 E.0063
G1 X84.263 Y78.86 E.01456
G1 X84.398 Y78.809 E.00635
G1 X84.57 Y78.776 E.00772
G1 X85.785 Y78.756 E.05357
G1 X86.858 Y78.776 E.0473
G1 X87.024 Y78.808 E.00745
G1 X87.28 Y78.922 E.01233
G1 X87.51 Y79.108 E.01302
G1 X87.603 Y79.223 E.00654
G1 X87.714 Y79.418 E.00988
G1 X87.796 Y79.723 E.01392
G1 X88.103 Y84.505 E.21122
G1 X88.066 Y85.049 E.024
G1 X87.957 Y85.559 E.02301
G1 X87.775 Y86.058 E.02339
G1 X87.528 Y86.52 E.02309
G1 X87.156 Y87.016 E.02734
G1 X86.762 Y87.4 E.02425
G1 X86.32 Y87.72 E.02405
G1 X86.147 Y87.816 E.00871
G1 X85.857 Y87.9 E.01329
G1 X85.742 Y87.913 E.0051
G1 X85.545 Y87.894 E.00874
G1 X85.227 Y87.79 E.01475
G1 X84.983 Y87.64 E.01263
G1 X84.616 Y87.358 E.02041
G1 X84.235 Y86.975 E.0238
G1 X83.913 Y86.541 E.02384
G1 X83.662 Y86.079 E.02317
G1 X83.478 Y85.585 E.02323
G1 X83.364 Y85.065 E.02345
G1 X83.324 Y84.446 E.02732
G1 X83.633 Y79.714 E.209
G1 X83.714 Y79.439 E.01265
M204 S6000
G1 X84.116 Y79.605 F42000
G1 F4301.562
M204 S15000
G1 X84.196 Y79.463 E.00718
G1 X84.311 Y79.346 E.00722
G1 X84.411 Y79.281 E.00526
G1 X84.566 Y79.223 E.00733
G1 X85.775 Y79.202 E.05326
G1 X86.861 Y79.223 E.0479
G1 X87.015 Y79.28 E.00726
G1 X87.155 Y79.379 E.00753
G1 X87.265 Y79.514 E.00765
G1 X87.317 Y79.621 E.00527
G1 X87.362 Y79.824 E.00918
G1 X87.658 Y84.542 E.20832
G1 X87.62 Y85.021 E.0212
G1 X87.52 Y85.469 E.02022
G1 X87.354 Y85.908 E.02068
G1 X87.132 Y86.313 E.02037
G1 X86.848 Y86.694 E.02096
G1 X86.508 Y87.033 E.02115
G1 X86.051 Y87.363 E.02483
G1 X85.932 Y87.425 E.00594
G1 X85.752 Y87.467 E.00811
G1 X85.67 Y87.466 E.00365
G1 X85.463 Y87.411 E.00943
G1 X85.26 Y87.29 E.01039
G1 X84.88 Y86.999 E.02111
G1 X84.549 Y86.658 E.02095
G1 X84.269 Y86.272 E.021
G1 X84.053 Y85.863 E.02039
G1 X83.895 Y85.426 E.0205
G1 X83.799 Y84.965 E.02073
G1 X83.769 Y84.483 E.02128
G1 X84.066 Y79.825 E.20573
G1 X84.103 Y79.664 E.00727
; WIPE_START
G1 X84.196 Y79.463 E-.084
G1 X84.311 Y79.346 E-.06223
G1 X84.411 Y79.281 E-.04536
G1 X84.566 Y79.223 E-.0632
G1 X85.775 Y79.202 E-.45923
G1 X85.896 Y79.204 E-.04598
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X85.613 Y83.643 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X85.683 Y83.782 E.00683
G1 X85.67 Y84.05 E.01182
; LINE_WIDTH: 0.52739
G1 F4052.856
G1 X85.527 Y84.266 E.01212
; LINE_WIDTH: 0.57149
G1 F3707.709
G1 X85.337 Y84.354 E.01073
G1 X85.228 Y84.329 E.00568
; LINE_WIDTH: 0.53574
G1 F3982.659
G1 X85.12 Y84.304 E.00529
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.948 Y84.2 E.00888
G1 X84.871 Y84.079 E.00633
G1 X84.826 Y83.848 E.01036
; LINE_WIDTH: 0.49964
G1 F4305.029
G1 X84.926 Y83.622 E.01088
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.081 Y83.511 E.00841
G1 X85.393 Y83.476 E.01383
G1 X85.565 Y83.607 E.00956
; WIPE_START
G1 X85.683 Y83.782 E-.08005
G1 X85.67 Y84.05 E-.10191
G1 X85.527 Y84.266 E-.09845
G1 X85.337 Y84.354 E-.07976
G1 X85.228 Y84.329 E-.04219
G1 X85.12 Y84.304 E-.04219
G1 X84.948 Y84.2 E-.07654
G1 X84.871 Y84.079 E-.05455
G1 X84.826 Y83.848 E-.0893
G1 X84.926 Y83.622 E-.0939
G1 X84.928 Y83.621 E-.00116
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X85.759 Y84.923 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.534965
G1 F3989.072
M204 S15000
G1 X85.655 Y84.879 E.00538
; LINE_WIDTH: 0.56994
G1 F3718.84
G1 X85.551 Y84.835 E.00577
G1 X85.46 Y84.873 E.00504
; LINE_WIDTH: 0.56271
G1 F3771.658
G1 X85.116 Y85.047 E.01933
; LINE_WIDTH: 0.53135
G1 F4019.259
G1 X84.773 Y85.22 E.01814
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.77 Y85.295 E.00329
; LINE_WIDTH: 0.452914
G1 F4808.856
G1 X84.767 Y85.37 E.00295
; LINE_WIDTH: 0.405837
G1 F5451.654
G1 X84.763 Y85.444 E.0026
; LINE_WIDTH: 0.39722
G1 F5588.381
G1 X84.779 Y85.491 E.00166
; LINE_WIDTH: 0.43568
G1 F5025.784
G1 X84.794 Y85.537 E.00185
; LINE_WIDTH: 0.47414
G1 F4566.101
G1 X84.81 Y85.584 E.00203
G1 X84.928 Y85.61 E.00501
; LINE_WIDTH: 0.433895
G1 F5049.376
G1 X85.045 Y85.637 E.00453
; LINE_WIDTH: 0.426955
G1 F5143.248
G1 X84.968 Y85.669 E.00309
; LINE_WIDTH: 0.46026
G1 F4721.97
G1 X84.891 Y85.702 E.00336
; LINE_WIDTH: 0.46891
G1 F4623.609
G1 X84.895 Y86.189 E.01997
; LINE_WIDTH: 0.47414
G1 F4566.101
G1 X84.685 Y85.845 E.01674
G1 X84.639 Y85.797 E.00273
; LINE_WIDTH: 0.43937
G1 F4977.704
G1 X84.593 Y85.75 E.00251
; LINE_WIDTH: 0.4046
G1 F5470.865
G1 X84.548 Y85.703 E.00228
; LINE_WIDTH: 0.36983
G1 F6072.491
G1 X84.473 Y85.537 E.00567
; LINE_WIDTH: 0.405837
G1 F5451.654
G1 X84.437 Y85.266 E.00952
; LINE_WIDTH: 0.452914
G1 F4808.856
G1 X84.401 Y84.995 E.01079
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.365 Y84.723 E.01206
G3 X84.441 Y82.941 I22.149 J.056 E.07863
G1 X84.559 Y81.1 E.0813
; LINE_WIDTH: 0.5452
G1 F3906.012
G1 X84.59 Y80.962 E.0069
; LINE_WIDTH: 0.59041
G1 F3577.018
G1 X84.622 Y80.823 E.00753
; LINE_WIDTH: 0.63562
G1 F3299.139
G1 X84.653 Y80.684 E.00817
; LINE_WIDTH: 0.68083
G1 F3061.322
G1 X84.685 Y80.546 E.0088
G1 X84.73 Y79.875 E.04165
; LINE_WIDTH: 0.66844
G1 F3123.018
G1 X85.317 Y79.865 E.03567
; LINE_WIDTH: 0.68083
G1 F3061.322
G1 X85.311 Y80.566 E.04341
G1 X85.352 Y80.607 E.00359
; LINE_WIDTH: 0.63562
G1 F3299.139
G1 X85.393 Y80.648 E.00333
; LINE_WIDTH: 0.59041
G1 F3577.018
G1 X85.434 Y80.689 E.00307
; LINE_WIDTH: 0.5452
G1 F3906.012
G1 X85.474 Y80.73 E.00281
; LINE_WIDTH: 0.50917
G1 F4214.964
G1 X85.625 Y80.793 E.00733
; LINE_WIDTH: 0.5502
G1 F3866.68
G1 X85.787 Y80.792 E.00795
; LINE_WIDTH: 0.59123
G1 F3571.561
G1 X85.949 Y80.791 E.00861
G1 X85.839 Y80.922 E.00913
; LINE_WIDTH: 0.5502
G1 F3866.68
G1 X85.728 Y81.054 E.00844
; LINE_WIDTH: 0.50917
G1 F4214.964
G1 X85.649 Y81.205 E.00766
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.746 Y81.419 E.01039
G1 X86.245 Y81.736 E.02605
G1 X86.507 Y81.521 E.01494
; LINE_WIDTH: 0.46198
G1 F4702.079
G1 X86.497 Y80.827 E.02801
; LINE_WIDTH: 0.484924
G1 F4451.926
G1 X86.47 Y80.766 E.00283
; LINE_WIDTH: 0.531178
G1 F4020.707
G1 X86.443 Y80.705 E.00313
; LINE_WIDTH: 0.577432
G1 F3665.647
G1 X86.416 Y80.645 E.00344
; LINE_WIDTH: 0.623686
G1 F3368.208
G1 X86.389 Y80.584 E.00374
; LINE_WIDTH: 0.66994
G1 F3115.417
G1 X86.362 Y80.523 E.00404
G1 X86.137 Y80.588 E.01425
; LINE_WIDTH: 0.63646
G1 F3294.384
G1 X85.985 Y80.76 E.01323
G1 X86.094 Y80.566 E.01284
; LINE_WIDTH: 0.66817
G1 F3124.39
G1 X86.11 Y79.859 E.04289
G1 X86.694 Y79.872 E.03544
; LINE_WIDTH: 0.66994
G1 F3115.417
G2 X86.757 Y80.323 I1.524 J.016 E.02784
; LINE_WIDTH: 0.623686
G1 F3368.208
G1 X86.789 Y80.446 E.00713
; LINE_WIDTH: 0.577432
G1 F3665.647
G1 X86.82 Y80.569 E.00655
; LINE_WIDTH: 0.531178
G1 F4020.707
G1 X86.851 Y80.692 E.00597
; LINE_WIDTH: 0.484924
G1 F4451.926
G1 X86.882 Y80.815 E.0054
; LINE_WIDTH: 0.46461
G1 F4671.988
G1 X86.917 Y81.552 E.02996
; LINE_WIDTH: 0.49999
G1 F4301.653
G2 X87.077 Y84.361 I201.367 J-10.085 E.12402
G1 X87.054 Y84.925 E.02487
G1 X86.91 Y85.481 E.02532
G1 X86.67 Y85.965 E.02382
G2 X86.354 Y86.392 I10.528 J8.148 E.0234
; LINE_WIDTH: 0.46105
G1 F4712.813
G1 X86.196 Y86.609 E.01079
G1 X86.223 Y86.347 E.01057
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.249 Y86.086 E.01157
G2 X86.116 Y85.885 I-.223 J.004 E.01122
G1 X85.924 Y85.891 E.00845
G1 X85.853 Y85.986 E.00525
; LINE_WIDTH: 0.464544
G1 F4672.746
G1 X85.781 Y86.082 E.00483
; LINE_WIDTH: 0.429097
G1 F5113.909
G1 X85.71 Y86.177 E.00442
; LINE_WIDTH: 0.430175
G1 F5099.263
G1 X85.74 Y86.079 E.0038
; LINE_WIDTH: 0.4667
G1 F4648.348
G1 X85.77 Y85.981 E.00417
; LINE_WIDTH: 0.49662
G1 F4334.38
G1 X85.748 Y85.912 E.00319
G1 X85.572 Y85.788 E.00941
G1 X85.716 Y85.74 E.00662
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.757 Y85.619 E.00564
G1 X85.82 Y85.02 E.02654
G1 X85.791 Y84.974 E.0024
M204 S6000
G1 X85.045 Y85.637 F42000
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X85.138 Y85.64 E.00313
G1 X85.437 Y85.759 E.01078
; WIPE_START
G1 X85.138 Y85.64 E-.58913
G1 X85.045 Y85.637 E-.17087
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X86.135 Y86.697 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.439734
G1 F4973.02
M204 S15000
G1 X86.065 Y86.712 E.00274
; LINE_WIDTH: 0.485817
G1 F4442.73
G1 X85.995 Y86.727 E.00306
; LINE_WIDTH: 0.5319
G1 F4014.637
G1 X85.925 Y86.742 E.00339
; LINE_WIDTH: 0.577984
G1 F3661.793
G1 X85.854 Y86.757 E.00372
; LINE_WIDTH: 0.624067
G1 F3365.96
G1 X85.784 Y86.772 E.00404
; LINE_WIDTH: 0.67015
G1 F3114.355
G1 X85.714 Y86.787 E.00437
G1 X85.338 Y86.545 E.02721
; LINE_WIDTH: 0.62575
G1 F3356.057
G1 X85.277 Y86.527 E.00362
; LINE_WIDTH: 0.57933
G1 F3652.412
G1 X85.215 Y86.51 E.00332
; LINE_WIDTH: 0.53291
G1 F4006.176
G1 X85.154 Y86.493 E.00303
; LINE_WIDTH: 0.48649
G1 F4435.819
G1 X85.092 Y86.475 E.00274
; LINE_WIDTH: 0.44007
G1 F4968.687
G1 X85.031 Y86.458 E.00244
G1 X85.092 Y86.475 E.00244
; LINE_WIDTH: 0.48649
G1 F4435.819
G1 X85.154 Y86.493 E.00274
; LINE_WIDTH: 0.53291
G1 F4006.176
G1 X85.215 Y86.51 E.00303
; LINE_WIDTH: 0.57933
G1 F3652.412
G1 X85.277 Y86.527 E.00332
; LINE_WIDTH: 0.62575
G1 F3356.057
G1 X85.338 Y86.545 E.00362
G1 X85.35 Y86.501 E.00254
; LINE_WIDTH: 0.57933
G1 F3652.412
G1 X85.361 Y86.458 E.00233
; LINE_WIDTH: 0.53291
G1 F4006.176
G1 X85.372 Y86.414 E.00213
; LINE_WIDTH: 0.48649
G1 F4435.819
G1 X85.383 Y86.371 E.00192
; LINE_WIDTH: 0.44007
G1 F4968.687
G1 X85.395 Y86.327 E.00171
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.71 Y86.177 E.01172
; WIPE_START
G1 X85.395 Y86.327 E-.13271
G1 X85.383 Y86.371 E-.01707
G1 X85.372 Y86.414 E-.01707
G1 X85.361 Y86.458 E-.01707
G1 X85.35 Y86.501 E-.01707
G1 X85.338 Y86.545 E-.01707
G1 X85.277 Y86.527 E-.02432
G1 X85.215 Y86.51 E-.02432
G1 X85.154 Y86.493 E-.02432
G1 X85.092 Y86.475 E-.02432
G1 X85.031 Y86.458 E-.02432
G1 X85.092 Y86.475 E-.02432
G1 X85.154 Y86.493 E-.02432
G1 X85.215 Y86.51 E-.02432
G1 X85.277 Y86.527 E-.02432
G1 X85.338 Y86.545 E-.02432
G1 X85.714 Y86.787 E-.16988
G1 X85.784 Y86.772 E-.02728
G1 X85.854 Y86.757 E-.02728
G1 X85.925 Y86.742 E-.02728
G1 X85.995 Y86.727 E-.02728
G1 X86.046 Y86.716 E-.01973
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X84.751 Y81.24 F42000
G1 E.8 F2400
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50457
G1 F4257.961
M204 S15000
G1 X85.252 Y81.24 E.02229
G1 X85.242 Y81.322 E.00366
G1 X85.467 Y81.691 E.01926
G1 X84.923 Y81.691 E.02421
G1 X84.894 Y82.142 E.02012
G1 X86.552 Y82.142 E.07381
G1 X86.566 Y82.593 E.02009
G1 X84.864 Y82.593 E.07575
G1 X84.835 Y83.044 E.02012
G1 X86.593 Y83.044 E.07829
G1 X86.623 Y83.495 E.02012
G1 X85.973 Y83.495 E.02894
G1 X86.08 Y83.709 E.01065
G1 X86.096 Y83.946 E.01059
G1 X86.652 Y83.946 E.02475
G3 X86.674 Y84.397 I-2.117 J.329 E.02014
G1 X85.922 Y84.397 E.03347
G1 X85.851 Y84.505 E.00576
G1 X86.069 Y84.66 E.01191
G1 X86.178 Y84.848 E.00965
G1 X86.655 Y84.848 E.02127
G1 X86.543 Y85.299 E.02069
G1 X85.992 Y85.299 E.02452
; WIPE_START
G1 X86.543 Y85.299 E-.2093
G1 X86.655 Y84.848 E-.17661
G1 X86.178 Y84.848 E-.18156
G1 X86.069 Y84.66 E-.08235
G1 X85.851 Y84.505 E-.10163
G1 X85.863 Y84.486 E-.00855
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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




G1 X144.786 Y89.331 F42000
M204 S6000
G1 Z.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y79.581  E0.4987
G1 E-0.8000 F2400
M204 S6000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
M204 S6000
G1  X145.732 Y90.777  
M204 S15000
G1  X109.840  E1.6652
G1  Y77.385  E0.6213
G1  X145.732  E1.6652
G1  Y90.777  E0.6213
M204 S6000
G1  X146.179 Y91.224  
M204 S15000
G1  X109.393  E1.7066
G1  Y76.938  E0.6627
G1  X146.179  E1.7066
G1  Y91.224  E0.6627
M204 S6000
G1  X146.625 Y91.670  
M204 S15000
G1  X108.947  E1.7480
G1  Y76.492  E0.7041
G1  X146.625  E1.7480
G1  Y91.670  E0.7041
M204 S6000
G1  X147.071 Y92.116  
M204 S15000
G1  X108.501  E1.7894
G1  Y76.046  E0.7456
M73 P6 R85
G1  X147.071  E1.7894
G1  Y92.116  E0.7456
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
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
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z3.25 F1200

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
M73 E30
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
M73 P7 R85
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
M73 P8 R84
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
G1 Z3.25
M106 P1 S0

M204 S15000



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
G1 X106.5 Y78.331 F42000
G1 Z.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.575000
M204 S15000
G1  X113.786 Y78.331  E0.1601 F1782
G1 E-0.8000 F2400
M204 S6000
M73 P9 R84
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
M73 P9 R83
G1  X144.786  E1.6539 F1782
G1  Y78.831  E0.0267
G1  X110.786  E1.8140 F2025
G1  Y79.331  E0.0267
G1  X144.786  E1.8140 F2473
G1  Y79.831  E0.0267
G1  X110.786  E1.8140 F3740
G1  Y80.331  E0.0267
G1  X144.786  E1.8140
G1  Y80.831  E0.0267
G1  X110.786  E1.8140
G1  Y81.331  E0.0267
G1  X144.786  E1.8140
G1  Y81.831  E0.0267
G1  X110.786  E1.8140
G1  Y82.331  E0.0267
G1  X144.786  E1.8140
G1  Y82.831  E0.0267
G1  X110.786  E1.8140
G1  Y83.331  E0.0267
G1  X144.786  E1.8140
G1  Y83.831  E0.0267
G1  X110.786  E1.8140
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S6000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #2
M204 S15000
G1  Y84.831  E0.0232
G1  X144.286  E1.5078
G1  Y85.331  E0.0232
G1  X111.286  E1.5310
G1  Y85.831  E0.0232
G1  X144.286  E1.5310
G1  Y86.331  E0.0232
G1  X111.286  E1.5310
G1  Y86.831  E0.0232
G1  X144.286  E1.5310
G1  Y87.331  E0.0232
G1  X111.286  E1.5310
G1  Y87.831  E0.0232
G1  X144.286  E1.5310
G1  Y88.331  E0.0232
G1  X111.286  E1.5310
G1  Y88.831  E0.0232
G1  X144.286  E1.5310
G1  Y89.331  E0.0232
G1  X111.286  E1.5310
G1  Y89.831  E0.0232
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F4257.961
M204 S15000
G1 X111.119 Y87.838 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S6000
G1 X85.894 Y86.315 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.83 Y86.352 E.00247
G1 X85.894 Y86.389 E.00247
G1 X85.915 Y86.352 E.00143
M204 S6000
G1 X85.276 Y86.017 F42000
G1 F5647.059
M204 S15000
G1 X85.212 Y86.054 E.00247
G1 X85.276 Y86.091 E.00247
G1 X85.297 Y86.054 E.00143
M204 S6000
G1 X85.401 Y85.342 F42000
G1 F5647.059
M204 S15000
G1 X85.338 Y85.379 E.00247
G1 X85.401 Y85.416 E.00247
G1 X85.423 Y85.379 E.00143
; WIPE_START
G1 X85.401 Y85.416 E-.17025
G1 X85.338 Y85.379 E-.29487
G1 X85.401 Y85.342 E-.29487
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X85.284 Y83.859 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X85.22 Y83.896 E.00247
G1 X85.284 Y83.933 E.00247
G1 X85.305 Y83.896 E.00143
; WIPE_START
G1 X85.284 Y83.933 E-.17025
G1 X85.22 Y83.896 E-.29487
G1 X85.284 Y83.859 E-.29487
; WIPE_END
G1 E-.04 F2400
M204 S6000
G1 X86.162 Y81.175 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.098 Y81.212 E.00247
G1 X86.162 Y81.249 E.00247
G1 X86.183 Y81.212 E.00143
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 2/37
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

; open powerlost recovery
M1003 S1
; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X86.162 Y81.249 E-.17025
G1 X86.098 Y81.212 E-.29487
G1 X86.162 Y81.175 E-.29487
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.428 Y85.374 Z.5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.407 Y85.411 E.00143
G1 X85.343 Y85.374 E.00247
G1 X85.407 Y85.337 E.00247
; WIPE_START
G1 X85.343 Y85.374 E-.29487
G1 X85.407 Y85.411 E-.29487
G1 X85.428 Y85.374 E-.17025
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.303 Y83.896 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X85.282 Y83.933 E.00143
G1 X85.218 Y83.896 E.00247
G1 X85.282 Y83.86 E.00247
; WIPE_START
G1 X85.218 Y83.896 E-.29487
G1 X85.282 Y83.933 E-.29487
G1 X85.303 Y83.896 E-.17025
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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




; LAYER_HEIGHT: 0.250000
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
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z3.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E29
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
M73 P10 R82
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P11 R82
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
M73 P11 R81
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
M73 P12 R81
G1 Z3.5
M106 P1 S0

M204 S15000



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
M106 S0
M106 P2 S0
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
M73 P12 R80
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #3
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
M204 S10000
G1  X145.732 Y90.777  
M204 S15000
G1  X109.840  E1.6652
G1  Y77.385  E0.6213
G1  X145.732  E1.6652
G1  Y90.777  E0.6213
M204 S10000
G1  X146.179 Y91.224  
M204 S15000
G1  X109.393  E1.7066
G1  Y76.938  E0.6627
G1  X146.179  E1.7066
G1  Y91.224  E0.6627
M204 S10000
G1  X146.625 Y91.670  
M204 S15000
G1  X108.947  E1.7480
G1  Y76.492  E0.7041
G1  X146.625  E1.7480
G1  Y91.670  E0.7041
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X146.625 Y89.67 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X86.331 Y81.07 F42000
M73 P13 R80
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F4301.653
M204 S15000
G1 X86.561 Y80.63 E.02192
G1 X86.583 Y81.233 E.0266
G1 X86.709 Y82.936 E.07524
; LINE_WIDTH: 0.548665
G1 F3878.67
G1 X86.716 Y83.35 E.02026
; LINE_WIDTH: 0.59734
G1 F3531.424
G1 X86.722 Y83.764 E.02225
; LINE_WIDTH: 0.64191
G1 F3263.863
G1 X86.739 Y84.317 E.0321
G1 X86.75 Y84.598 E.01637
; LINE_WIDTH: 0.59807
G1 F3526.689
G1 X86.76 Y84.88 E.01515
; LINE_WIDTH: 0.55423
G1 F3835.551
G1 X86.716 Y85.13 E.01256
; LINE_WIDTH: 0.524125
G1 F4080.982
G1 X86.671 Y85.38 E.0118
; LINE_WIDTH: 0.49402
G1 F4359.97
G1 X86.583 Y85.617 E.011
; LINE_WIDTH: 0.459965
G1 F4725.398
G1 X86.494 Y85.854 E.01015
; LINE_WIDTH: 0.42591
G1 F5157.685
G1 X86.179 Y86.323 E.02077
; LINE_WIDTH: 0.422985
G1 F5198.533
G1 X85.949 Y86.505 E.01071
; LINE_WIDTH: 0.45355
G1 F4801.2
G1 X85.718 Y86.688 E.01159
G1 X85.547 Y86.568 E.00827
G1 X85.172 Y86.18 E.02126
G1 X85.647 Y86.256 E.01896
G1 X85.797 Y86.165 E.00693
; LINE_WIDTH: 0.422985
G1 F5198.533
G1 X85.948 Y86.075 E.0064
; LINE_WIDTH: 0.42591
G1 F5157.685
G1 X86.159 Y85.718 E.01525
; LINE_WIDTH: 0.459965
G1 F4725.398
G1 X86.207 Y85.479 E.00977
; LINE_WIDTH: 0.49402
G1 F4359.97
G1 X86.255 Y85.24 E.01059
; LINE_WIDTH: 0.524125
G1 F4080.982
G1 X86.266 Y85.067 E.00807
; LINE_WIDTH: 0.55423
G1 F3835.551
G1 X86.276 Y84.893 E.00859
; LINE_WIDTH: 0.58999
G1 F3579.819
G1 X86.246 Y84.799 E.00523
; LINE_WIDTH: 0.62575
G1 F3356.057
G1 X86.217 Y84.705 E.00558
; LINE_WIDTH: 0.66151
G1 F3158.622
G1 X86.187 Y84.611 E.00592
G1 X86.03 Y84.468 E.01272
G1 X86.167 Y84.213 E.01736
; LINE_WIDTH: 0.64191
G1 F3263.863
G1 X86.177 Y83.754 E.0267
; LINE_WIDTH: 0.59669
G1 F3535.651
G1 X86.047 Y83.535 E.01364
; LINE_WIDTH: 0.54834
G1 F3881.219
G1 X85.917 Y83.316 E.01243
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.793 Y83.201 E.00745
G1 X85.489 Y83.04 E.01518
G1 X85.002 Y83.072 E.02151
G1 X84.694 Y83.277 E.01629
G1 X84.848 Y81.231 E.09041
G1 X84.868 Y80.629 E.02656
G1 X85.116 Y81.107 E.02374
G1 X85.509 Y81.235 E.01823
G1 X85.918 Y81.235 E.018
G1 X86.294 Y81.113 E.01742
; WIPE_START
G1 X86.561 Y80.63 E-.20983
G1 X86.583 Y81.233 E-.22938
G1 X86.645 Y82.075 E-.32079
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.081 Y84.667 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.3605
G1 F6257.129
M204 S15000
G1 X84.819 Y84.795 E.00884
G1 X84.613 Y85.1 E.01114
G3 X84.551 Y84.263 I3.882 J-.71 E.02547
G1 X84.592 Y84.363 E.00327
G1 X84.826 Y84.576 E.00961
G1 X85.024 Y84.646 E.00637
M204 S10000
G1 X85.779 Y84.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X85.824 Y85.138 E.00873
G2 X85.716 Y85.748 I12.522 J2.526 E.02732
G1 X85.573 Y85.839 E.00747
; LINE_WIDTH: 0.548875
G1 F3877.026
G1 X85.32 Y85.773 E.01278
; LINE_WIDTH: 0.59776
G1 F3528.698
G1 X85.067 Y85.708 E.01404
G1 X84.917 Y85.406 E.01812
; LINE_WIDTH: 0.58517
G1 F3612.282
G1 X84.923 Y85.324 E.0043
; LINE_WIDTH: 0.55248
G1 F3849.007
G1 X84.929 Y85.242 E.00403
; LINE_WIDTH: 0.51979
G1 F4118.934
G1 X85.064 Y85.088 E.00947
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.522 Y84.88 E.02217
G1 X85.686 Y84.878 E.00722
G1 X85.731 Y84.91 E.00242
M204 S10000
G1 X85.04 Y84.265 F42000
; LINE_WIDTH: 0.54468
G1 F3910.148
M204 S15000
G1 X84.835 Y84.048 E.01446
; LINE_WIDTH: 0.58709
G1 F3599.28
G1 X84.785 Y83.82 E.01232
G1 X84.859 Y83.715 E.00676
; LINE_WIDTH: 0.54354
G1 F3919.248
G1 X84.933 Y83.61 E.00621
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.081 Y83.511 E.00785
G1 X85.393 Y83.476 E.01382
G1 X85.613 Y83.643 E.01222
G1 X85.684 Y83.79 E.00719
G1 X85.668 Y84.07 E.01233
G1 X85.471 Y84.284 E.01282
G1 X85.216 Y84.326 E.01141
G1 X85.096 Y84.284 E.00557
; WIPE_START
G1 X84.835 Y84.048 E-.13397
G1 X84.785 Y83.82 E-.08891
G1 X84.859 Y83.715 E-.04875
G1 X84.933 Y83.61 E-.04876
G1 X85.081 Y83.511 E-.06767
G1 X85.393 Y83.476 E-.11915
G1 X85.613 Y83.643 E-.10533
G1 X85.684 Y83.79 E-.06195
G1 X85.671 Y84.015 E-.08551
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.049 Y80.746 F42000
G1 E.8 F2400
G1 F4301.653
M204 S15000
G1 X86.141 Y80.566 E.00893
G1 X86.141 Y79.658 E.04001
G1 X86.843 Y79.672 E.03093
G1 X86.923 Y79.784 E.00608
G3 X87.256 Y84.333 I-303.306 J24.524 E.20102
G1 X87.238 Y84.917 E.02575
G1 X87.106 Y85.493 E.02603
G1 X86.863 Y86.042 E.02646
G1 X86.52 Y86.525 E.02612
G1 X86.138 Y86.904 E.0237
G1 X85.707 Y87.189 E.0228
G1 X85.288 Y86.908 E.02222
G1 X84.868 Y86.479 E.02648
; LINE_WIDTH: 0.52727
G1 F4053.883
G1 X84.755 Y86.292 E.01019
; LINE_WIDTH: 0.56211
G1 F3776.108
G1 X84.633 Y86.06 E.01315
; LINE_WIDTH: 0.59695
G1 F3533.959
G3 X84.385 Y85.522 I2.856 J-1.644 E.03184
; LINE_WIDTH: 0.55837
G1 F3804.09
G1 X84.258 Y85.216 E.01652
; LINE_WIDTH: 0.51979
G1 F4118.934
G1 X84.163 Y84.528 E.03195
; LINE_WIDTH: 0.542195
G1 F3930.037
G1 X84.203 Y84.215 E.01524
; LINE_WIDTH: 0.5844
G1 F3617.523
G2 X84.241 Y83.64 I-2.159 J-.432 E.0303
; LINE_WIDTH: 0.542195
G1 F3930.037
G1 X84.239 Y83.378 E.01263
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.512 Y79.736 E.16095
G1 X84.605 Y79.66 E.00529
G1 X85.286 Y79.658 E.03001
G1 X85.286 Y80.566 E.04001
G1 X85.378 Y80.746 E.00893
G2 X85.73 Y80.789 I.242 J-.521 E.01589
G1 X85.99 Y80.754 E.01153
M204 S10000
G1 X86.542 Y80.059 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.44585
G1 F4895.462
M204 S15000
G1 X86.56 Y80.566 E.01962
; LINE_WIDTH: 0.45379
G1 F4798.321
G1 X86.561 Y80.63 E.00253
; WIPE_START
G1 X86.56 Y80.566 E-.08534
G1 X86.542 Y80.059 E-.67466
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.888 Y80.057 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.44217
G1 F4941.831
M204 S15000
G1 X84.869 Y80.566 E.01952
; LINE_WIDTH: 0.45007
G1 F4843.348
G1 X84.868 Y80.629 E.00249
M204 S10000
G1 X86.257 Y83.03 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X86.263 Y82.957 E.00322
G2 X86.163 Y81.613 I-1886.293 J139.206 E.05939
G1 X85.918 Y81.681 E.01123
G1 X85.44 Y81.671 E.02105
G1 X85.267 Y81.614 E.00805
G1 X85.194 Y82.59 E.04315
G1 X85.644 Y82.625 E.01991
G1 X86.097 Y82.874 E.02278
G1 X86.214 Y82.988 E.00721
M204 S10000
G1 X85.761 Y82.1 F42000
; LINE_WIDTH: 0.55159
G1 F3855.886
M204 S15000
G2 X85.762 Y82.206 I-.026 J.053 E.01179
; CHANGE_LAYER
; Z_HEIGHT: 0.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 3/37
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; WIPE_START
G1 F3855.886
G1 X85.699 Y82.208 E-.1926
G1 X85.668 Y82.154 E-.18913
G1 X85.699 Y82.1 E-.18913
G1 X85.761 Y82.1 E-.18914
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786 Y89.331  E1.5774 F4302
G1  Y78.331  E0.5103
G1  X144.786  E1.5774
G1  Y89.331  E0.5103
M204 S10000
G1  X111.786 Y78.331  
;--------------------
; CP EMPTY GRID START
; layer #4
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X119.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X135.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.331  E0.5103
; CP EMPTY GRID END
;------------------






M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
M204 S10000
G1  X145.732 Y90.777  
M204 S15000
G1  X109.840  E1.6652
G1  Y77.385  E0.6213
G1  X145.732  E1.6652
G1  Y90.777  E0.6213
M204 S10000
G1  X146.179 Y91.224  
M204 S15000
G1  X109.393  E1.7066
G1  Y76.938  E0.6627
G1  X146.179  E1.7066
G1  Y91.224  E0.6627
; WIPE_TOWER_END

; WIPE_START
G1 F3855.886
M204 S15000
G1 X146.178 Y89.224 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.799 Y79.991 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F1200
M204 S15000
G1 X86.629 Y79.989 E.08068
G1 X86.987 Y84.378 E.19404
G1 X86.978 Y84.799 E.01857
G3 X85.717 Y86.962 I-2.972 J-.284 E.11385
G1 X85.487 Y86.8 E.01239
G3 X84.479 Y84.968 I1.96 J-2.272 E.09411
G1 X84.438 Y84.332 E.02807
G1 X84.794 Y80.051 E.18935
M204 S10000
G1 X84.483 Y79.545 F42000
; FEATURE: Outer wall
G1 F1200
M204 S15000
G1 X86.896 Y79.543 E.10634
G3 X87.048 Y79.635 I.009 J.156 E.00831
G1 X87.433 Y84.386 E.21011
G1 X87.424 Y84.845 E.02019
G1 X87.313 Y85.441 E.02672
G1 X87.096 Y86.017 E.02716
G1 X86.772 Y86.557 E.02773
G1 X86.315 Y87.067 E.03016
G1 X85.863 Y87.412 E.02505
G1 X85.698 Y87.494 E.00814
G1 X85.197 Y87.141 E.02698
G3 X84.018 Y84.829 I2.389 J-2.675 E.11704
G1 X83.992 Y84.307 E.02304
G1 X84.38 Y79.642 E.20632
G1 X84.439 Y79.586 E.0036
; WIPE_START
G1 F4301.653
G1 X86.439 Y79.551 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.463 Y80.416 F42000
G1 E.8 F2400
; FEATURE: Bridge
; LINE_WIDTH: 0.55016
G1 F3866.992
M204 S15000
G1 X85.166 Y80.417 E.06357
G1 X85.125 Y80.914 E.02443
G1 X86.303 Y80.913 E.05774
G1 X86.344 Y81.409 E.02442
G1 X85.084 Y81.411 E.06178
G1 X85.05 Y81.823 E.0203
G1 X85.322 Y81.907 E.01396
G1 X86.587 Y81.906 E.06201
M204 S10000
G1 X86.54 Y84.369 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49999
G1 F1200
M204 S15000
G1 X86.372 Y82.293 E.0918
G1 X85.906 Y82.378 E.02091
G1 X85.341 Y82.362 E.02488
G1 X85.056 Y82.282 E.01305
G1 X84.884 Y84.358 E.09183
G1 X84.924 Y84.927 E.02512
G1 X85.048 Y85.416 E.02225
G2 X85.717 Y86.397 I2.629 J-1.076 E.05271
G1 X86.071 Y85.991 E.02373
G1 X86.309 Y85.574 E.02115
G1 X86.487 Y84.998 E.02659
G2 X86.539 Y84.429 I-3.764 J-.63 E.0252
M204 S10000
G1 X86.015 Y84.359 F42000
; LINE_WIDTH: 0.65713
G1 F1200
M204 S15000
G1 X86.014 Y84.328 E.00184
; LINE_WIDTH: 0.639795
G1 X85.997 Y83.91 E.0242
; LINE_WIDTH: 0.605125
G1 X85.98 Y83.492 E.02277
; LINE_WIDTH: 0.558517
G2 X85.944 Y82.846 I-7.798 J.113 E.03227
G1 X85.485 Y82.839 E.0229
G1 X85.465 Y83.075 E.01178
; LINE_WIDTH: 0.570455
G1 X85.448 Y83.492 E.02133
; LINE_WIDTH: 0.605125
G1 X85.43 Y83.91 E.02277
; LINE_WIDTH: 0.646546
G2 X85.441 Y84.878 I5.259 J.427 E.05676
G1 X85.613 Y85.399 E.03213
G1 X85.711 Y85.582 E.0121
G1 X85.94 Y85.079 E.03232
G2 X86.015 Y84.419 I-1.761 J-.535 E.03914
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 4/37
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

M106 S229.5
; WIPE_START
G1 F3238.342
G1 X86.015 Y84.676 E-.09777
G1 X85.94 Y85.079 E-.15589
G1 X85.711 Y85.582 E-.20979
G1 X85.613 Y85.399 E-.07856
G1 X85.441 Y84.878 E-.20856
G1 X85.44 Y84.853 E-.00943
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z1
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786 Y89.331  E1.5774 F4302
G1  Y78.331  E0.5103
G1  X144.786  E1.5774
G1  Y89.331  E0.5103
M204 S10000
G1  X111.786 Y78.331  
;--------------------
; CP EMPTY GRID START
; layer #5
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X119.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X135.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.331  E0.5103
; CP EMPTY GRID END
;------------------






M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
M204 S10000
G1  X145.732 Y90.777  
M204 S15000
G1  X109.840  E1.6652
G1  Y77.385  E0.6213
G1  X145.732  E1.6652
G1  Y90.777  E0.6213
; WIPE_TOWER_END

; WIPE_START
G1 F3238.342
M204 S15000
G1 X145.732 Y88.777 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.673 Y79.88 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F1200
M204 S15000
G1 X86.755 Y79.879 E.09176
G1 X87.151 Y84.322 E.19657
G1 X87.145 Y84.841 E.02288
G1 X87.036 Y85.42 E.02597
G1 X86.823 Y85.981 E.02647
G3 X86.212 Y86.849 I-3.328 J-1.694 E.04692
G1 X85.707 Y87.262 E.02878
G1 X85.407 Y87.03 E.01672
G1 X84.924 Y86.492 E.03186
G1 X84.61 Y85.97 E.02683
G1 X84.405 Y85.424 E.02571
G1 X84.283 Y84.803 E.0279
G1 X84.273 Y84.277 E.02319
G1 X84.668 Y79.94 E.19192
M204 S10000
G1 X84.369 Y79.434 F42000
; FEATURE: Outer wall
G1 F1200
M204 S15000
M73 P13 R79
G1 X87.011 Y79.433 E.11643
G3 X87.171 Y79.526 I.011 J.165 E.00868
G1 X87.598 Y84.327 E.21243
G1 X87.59 Y84.885 E.02458
G1 X87.467 Y85.541 E.02941
G1 X87.226 Y86.177 E.02999
G3 X85.756 Y87.771 I-3.564 J-1.812 E.09676
G1 X85.697 Y87.774 E.00259
G1 X85.133 Y87.388 E.03011
G1 X84.686 Y86.932 E.02818
G1 X84.331 Y86.421 E.02742
G1 X84.068 Y85.869 E.02695
G3 X83.827 Y84.256 I4.474 J-1.494 E.07225
G1 X84.27 Y79.511 E.21001
G1 X84.322 Y79.471 E.00289
; WIPE_START
G1 F4301.653
G1 X86.322 Y79.442 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.705 Y84.316 F42000
G1 E.8 F2400
; FEATURE: Internal solid infill
G1 F1200
M204 S15000
G1 X86.347 Y80.326 E.17656
G1 X85.081 Y80.326 E.05583
G1 X84.719 Y84.298 E.17576
G1 X84.736 Y84.822 E.02314
G1 X84.886 Y85.484 E.02989
G1 X85.105 Y85.971 E.02356
G1 X85.406 Y86.388 E.02262
G1 X85.721 Y86.687 E.01914
G1 X86.148 Y86.237 E.02736
G2 X86.699 Y84.796 I-2.697 J-1.857 E.06861
G1 X86.704 Y84.376 E.01853
M204 S10000
G1 X86.255 Y84.629 F42000
G1 F1200
M204 S15000
G2 X86.257 Y84.253 I-3.611 J-.207 E.01654
G1 X85.94 Y80.772 E.15406
G1 X85.488 Y80.772 E.01991
G1 X85.165 Y84.319 E.15694
G1 X85.2 Y84.935 E.02719
G1 X85.339 Y85.424 E.02245
G1 X85.706 Y86.054 E.03209
G1 X86.001 Y85.615 E.02328
G1 X86.181 Y85.136 E.02255
G1 X86.246 Y84.688 E.01996
M204 S10000
G1 X85.873 Y84.347 F42000
; LINE_WIDTH: 0.374089
G1 F1200
M204 S15000
G1 X85.714 Y82.528 E.05777
G1 X85.554 Y84.288 E.05593
G1 X85.578 Y84.887 E.01895
G1 X85.711 Y85.319 E.0143
G1 X85.838 Y84.894 E.01401
G1 X85.869 Y84.406 E.01547
; CHANGE_LAYER
; Z_HEIGHT: 1.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 5/37
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; WIPE_START
G1 F5991.78
G1 X85.838 Y84.894 E-.18574
G1 X85.711 Y85.319 E-.16826
G1 X85.578 Y84.887 E-.17179
G1 X85.554 Y84.288 E-.22759
G1 X85.555 Y84.271 E-.00662
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z1.65 F4000
            G39.3 S1
            G0 Z1.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z1.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786 Y89.331  E1.5774 F4302
G1  Y78.331  E0.5103
G1  X144.786  E1.5774
G1  Y89.331  E0.5103
M204 S10000
G1  X111.786 Y78.331  
;--------------------
; CP EMPTY GRID START
; layer #6
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X119.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X135.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.331  E0.5103
; CP EMPTY GRID END
;------------------






M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
; WIPE_TOWER_END

; WIPE_START
G1 F5991.78
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.258 Y80.26 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F1200
M204 S15000
G1 X85.36 Y80.351 E.00603
G1 X85.727 Y80.439 E.0166
G1 X86.056 Y80.356 E.01494
G1 X86.205 Y80.274 E.00751
G1 X86.519 Y79.893 E.02176
G1 X86.564 Y79.755 E.00641
G1 X86.872 Y79.755 E.01358
G1 X87.31 Y84.313 E.20181
G3 X85.716 Y87.541 I-3.703 J.179 E.16568
G1 X85.521 Y87.406 E.01048
G1 X85.053 Y86.976 E.02799
G3 X84.459 Y86.084 I2.414 J-2.249 E.04747
G1 X84.216 Y85.391 E.03234
G1 X84.119 Y84.811 E.02593
G1 X84.12 Y84.203 E.02679
G1 X84.557 Y79.765 E.19654
G1 X84.857 Y79.755 E.01324
G1 X84.968 Y80.006 E.0121
G1 X85.213 Y80.221 E.01434
M204 S10000
G1 X85.501 Y79.927 F42000
; FEATURE: Outer wall
G1 F1200
M204 S15000
G1 X85.731 Y79.992 E.01053
G1 X85.99 Y79.883 E.01239
G2 X86.075 Y79.308 I-.275 J-.334 E.02804
G1 X86.962 Y79.309 E.0391
G1 X87.201 Y79.352 E.0107
G1 X87.289 Y79.426 E.00506
G1 X87.757 Y84.312 E.2163
G3 X85.752 Y88.056 I-4.1 J.213 E.19672
G1 X85.481 Y87.932 E.01312
G3 X83.672 Y84.843 I2.328 J-3.437 E.16313
G1 X83.674 Y84.181 E.02917
G1 X84.081 Y80.041 E.18334
G1 X84.159 Y79.396 E.02861
G1 X84.264 Y79.328 E.00551
G3 X85.365 Y79.303 I1.126 J24.582 E.0485
; LINE_WIDTH: 0.49423
G1 X85.344 Y79.327 E.00138
; LINE_WIDTH: 0.49999
G1 X85.282 Y79.621 E.01326
G1 X85.37 Y79.812 E.00929
G1 X85.456 Y79.888 E.00503
; WIPE_START
G1 F4301.653
G1 X85.731 Y79.992 E-.11176
G1 X85.99 Y79.883 E-.10683
G1 X86.095 Y79.756 E-.06253
G1 X86.144 Y79.605 E-.06034
G1 X86.136 Y79.446 E-.06037
G1 X86.075 Y79.308 E-.05711
G1 X86.867 Y79.309 E-.30106
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.767 Y80.747 F42000
G1 E.8 F2400
; FEATURE: Top surface
; LINE_WIDTH: 0.52141
G1 F1200
M204 S15000
G1 X84.864 Y80.747 E.08793
G1 X84.818 Y81.214 E.02171
G1 X86.611 Y81.214 E.08284
G1 X86.657 Y81.682 E.02171
G1 X84.772 Y81.682 E.08708
G1 X84.726 Y82.15 E.02171
G1 X86.703 Y82.15 E.09131
G1 X86.748 Y82.618 E.02171
G1 X84.68 Y82.618 E.09555
G1 X84.633 Y83.085 E.02171
G1 X86.794 Y83.085 E.09978
G1 X86.84 Y83.553 E.02171
G1 X84.587 Y83.553 E.10402
G1 X84.548 Y83.958 E.01876
G1 X84.81 Y84.021 E.01248
G1 X87.087 Y84.021 E.10515
M204 S10000
G1 X84.93 Y84.478 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49999
G1 F1200
M204 S15000
G1 X84.566 Y84.41 E.01635
G1 X84.58 Y84.883 E.02087
G1 X84.721 Y85.538 E.02949
G2 X85.543 Y86.816 I3.137 J-1.115 E.06757
G1 X85.72 Y86.977 E.01057
G1 X86.083 Y86.623 E.02235
G1 X86.447 Y86.116 E.02749
G2 X86.858 Y84.414 I-2.603 J-1.528 E.07829
G1 X86.559 Y84.475 E.01344
G1 X84.99 Y84.478 E.06912
M204 S10000
G1 X85.748 Y85.373 F42000
; LINE_WIDTH: 0.63373
G1 F1200
M204 S15000
G2 X85.755 Y85.488 I-.033 J.059 E.0165
M204 S10000
G1 X86.389 Y84.922 F42000
; LINE_WIDTH: 0.49999
G1 F1200
M204 S15000
G1 X85.037 Y84.924 E.0596
G1 X85.15 Y85.417 E.02229
G1 X85.349 Y85.858 E.02132
G1 X85.713 Y86.367 E.02759
G1 X86.072 Y85.875 E.02685
G1 X86.262 Y85.456 E.02027
G1 X86.375 Y84.98 E.02157
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 6/37
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; WIPE_START
G1 F4301.653
G1 X86.262 Y85.456 E-.18595
G1 X86.072 Y85.875 E-.17475
G1 X85.713 Y86.367 E-.23152
G1 X85.456 Y86.008 E-.16778
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z1.9 F4000
            G39.3 S1
            G0 Z1.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z1.5
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786 Y89.331  E1.5774 F4302
G1  Y78.331  E0.5103
G1  X144.786  E1.5774
G1  Y89.331  E0.5103
M204 S10000
G1  X111.786 Y78.331  
;--------------------
; CP EMPTY GRID START
; layer #7
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X119.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X135.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.331  E0.5103
; CP EMPTY GRID END
;------------------






M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
; WIPE_TOWER_END

; WIPE_START
G1 F4301.653
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.271 Y81.209 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.51427
; LAYER_HEIGHT: 0.25
G1 F1200
M204 S15000
G1 X84.317 Y80.964 E.01132
; LINE_WIDTH: 0.55565
G1 X84.363 Y80.719 E.01234
; LINE_WIDTH: 0.59703
G1 X84.409 Y80.475 E.01335
; LINE_WIDTH: 0.63841
G2 X84.506 Y79.73 I-4.417 J-.956 E.04342
G1 X84.825 Y79.73 E.01842
G1 X84.83 Y79.806 E.00438
G1 X84.98 Y80.085 E.01828
G1 X85.077 Y80.126 E.00609
; LINE_WIDTH: 0.590243
G1 X85.174 Y80.168 E.00559
; LINE_WIDTH: 0.542075
G1 X85.271 Y80.21 E.00509
; LINE_WIDTH: 0.493908
G1 X85.368 Y80.251 E.00459
; LINE_WIDTH: 0.44574
G1 X85.733 Y80.314 E.01435
; LINE_WIDTH: 0.423105
G1 X85.888 Y80.287 E.00574
; LINE_WIDTH: 0.44907
G1 X86.043 Y80.261 E.00614
; LINE_WIDTH: 0.496043
G1 X86.146 Y80.215 E.00493
; LINE_WIDTH: 0.543015
G1 X86.249 Y80.169 E.00546
; LINE_WIDTH: 0.589988
G1 X86.353 Y80.124 E.00598
; LINE_WIDTH: 0.63696
G1 X86.456 Y80.078 E.0065
G1 X86.62 Y79.729 E.0222
G1 X86.921 Y79.729 E.01734
G2 X87.019 Y80.476 I4.561 J-.217 E.04341
; LINE_WIDTH: 0.596013
G1 X87.064 Y80.72 E.0133
; LINE_WIDTH: 0.555065
G1 X87.11 Y80.964 E.0123
; LINE_WIDTH: 0.514118
G1 X87.156 Y81.208 E.01129
G1 X87.025 Y81.043 E.00957
; LINE_WIDTH: 0.555065
G1 X86.894 Y80.879 E.01043
; LINE_WIDTH: 0.596013
G1 X86.763 Y80.714 E.01128
; LINE_WIDTH: 0.63696
G1 X86.632 Y80.549 E.01213
G1 X86.568 Y80.564 E.0038
; LINE_WIDTH: 0.595595
G1 X86.503 Y80.579 E.00353
; LINE_WIDTH: 0.55423
G1 X86.345 Y80.598 E.00788
; LINE_WIDTH: 0.516453
G1 X86.187 Y80.617 E.00728
; LINE_WIDTH: 0.478675
G1 X86.029 Y80.636 E.00669
; LINE_WIDTH: 0.440898
G1 X85.87 Y80.655 E.00609
; LINE_WIDTH: 0.44574
G1 X85.306 Y80.633 E.02189
; LINE_WIDTH: 0.493908
G1 X85.178 Y80.612 E.00561
; LINE_WIDTH: 0.542075
G1 X85.051 Y80.591 E.00623
; LINE_WIDTH: 0.590243
G1 X84.924 Y80.569 E.00684
; LINE_WIDTH: 0.63841
G1 X84.796 Y80.548 E.00745
G1 X84.665 Y80.713 E.01218
; LINE_WIDTH: 0.59703
G1 X84.534 Y80.878 E.01132
; LINE_WIDTH: 0.55565
G1 X84.403 Y81.044 E.01046
; LINE_WIDTH: 0.51427
G1 X84.309 Y81.162 E.00687
; WIPE_START
G1 F4168.295
G1 X84.317 Y80.964 E-.07517
G1 X84.363 Y80.719 E-.09458
G1 X84.409 Y80.475 E-.09458
G1 X84.455 Y80.23 E-.09458
G1 X84.506 Y79.73 E-.19107
G1 X84.825 Y79.73 E-.12123
G1 X84.83 Y79.806 E-.02881
G1 X84.905 Y79.945 E-.05998
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.193 Y82.718 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.62599
G1 F1200
M204 S15000
G1 X84.307 Y82.882 E.01127
; LINE_WIDTH: 0.58399
G1 X84.42 Y83.046 E.01044
; LINE_WIDTH: 0.54199
G1 X84.533 Y83.21 E.00961
; LINE_WIDTH: 0.49999
G1 X84.924 Y83.335 E.01808
G1 X86.503 Y83.335 E.06962
G1 X86.904 Y83.203 E.01859
; LINE_WIDTH: 0.54235
G1 X87.014 Y83.041 E.00944
; LINE_WIDTH: 0.58471
G1 X87.124 Y82.879 E.01026
; LINE_WIDTH: 0.62707
G1 X87.235 Y82.718 E.01108
G1 X87.28 Y82.947 E.01326
; LINE_WIDTH: 0.58471
G1 X87.325 Y83.177 E.01228
; LINE_WIDTH: 0.54235
G1 X87.37 Y83.407 E.0113
; LINE_WIDTH: 0.49999
G1 X87.451 Y84.219 E.03597
G3 X85.716 Y87.81 I-3.936 J.313 E.18427
G3 X83.99 Y84.968 I2.219 J-3.293 E.15122
G1 X83.97 Y84.271 E.03075
G1 X84.057 Y83.424 E.03751
; LINE_WIDTH: 0.54199
G1 X84.103 Y83.189 E.01156
; LINE_WIDTH: 0.58399
G1 X84.148 Y82.953 E.01255
; LINE_WIDTH: 0.62599
G1 X84.182 Y82.777 E.01015
; WIPE_START
G1 F3354.649
G1 X84.307 Y82.882 E-.06196
G1 X84.42 Y83.046 E-.07574
G1 X84.533 Y83.21 E-.07574
G1 X84.924 Y83.335 E-.15585
G1 X85.952 Y83.335 E-.3907
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.418 Y79.805 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.49999
G1 F1200
M204 S15000
G1 X85.733 Y79.919 E.01476
G1 X86.029 Y79.783 E.01436
G1 X86.144 Y79.527 E.01235
G2 X86.061 Y79.217 I-.413 J-.056 E.0145
G3 X87.291 Y79.25 I.294 J11.984 E.05425
G1 X87.396 Y79.323 E.00564
G3 X87.898 Y84.205 I-602.968 J64.348 E.21629
G3 X85.738 Y88.315 I-4.39 J.315 E.21554
G1 X85.666 Y88.313 E.00317
G3 X84.467 Y87.267 I2.469 J-4.041 E.07046
G1 X84.056 Y86.647 E.03277
G3 X83.636 Y85.544 I3.371 J-1.915 E.05224
G1 X83.544 Y84.997 E.02441
G1 X83.525 Y84.24 E.03339
G1 X84.002 Y79.6 E.20557
G1 X84.067 Y79.274 E.01464
G1 X84.188 Y79.231 E.00569
G3 X85.375 Y79.213 I.908 J20.215 E.05229
G1 X85.284 Y79.416 E.0098
G1 X85.295 Y79.583 E.00735
G1 X85.389 Y79.752 E.00855
; WIPE_START
G1 F4301.653
G1 X85.733 Y79.919 E-.14522
G1 X86.029 Y79.783 E-.12382
G1 X86.144 Y79.527 E-.1065
G1 X86.135 Y79.369 E-.06028
G1 X86.061 Y79.217 E-.06393
G1 X86.746 Y79.215 E-.26025
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.924 Y82.889 F42000
G1 E.8 F2400
G1 F1200
M204 S15000
G1 X84.794 Y82.847 E.00602
G1 X84.701 Y82.666 E.00898
G1 X84.701 Y81.276 E.06127
G1 X84.885 Y81.056 E.01265
G1 X85.476 Y81.053 E.02604
G1 X86.503 Y81.053 E.04528
G1 X86.725 Y81.253 E.01318
G1 X86.727 Y82.666 E.06228
G1 X86.637 Y82.845 E.00882
G1 X86.503 Y82.889 E.0062
G1 X84.984 Y82.889 E.06697
; WIPE_START
G1 F4301.653
G1 X84.794 Y82.847 E-.07398
G1 X84.701 Y82.666 E-.07744
G1 X84.701 Y81.276 E-.52825
G1 X84.837 Y81.114 E-.08033
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.156 Y81.208 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.47665
G1 F1200
M204 S15000
G1 X87.161 Y81.276 E.00283
; LINE_WIDTH: 0.524404
G1 X87.185 Y81.739 E.02157
; LINE_WIDTH: 0.572157
G1 X87.209 Y82.202 E.02376
; LINE_WIDTH: 0.61991
G1 X87.233 Y82.666 E.02594
; LINE_WIDTH: 0.62707
G1 X87.235 Y82.718 E.00293
; WIPE_START
G1 F3348.331
G1 X87.233 Y82.666 E-.02604
G1 X87.209 Y82.202 E-.23331
G1 X87.185 Y81.739 E-.23331
G1 X87.161 Y81.276 E-.23332
G1 X87.156 Y81.208 E-.03401
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.193 Y82.718 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.62599
G1 F1200
M204 S15000
G1 X84.195 Y82.666 E.00295
; LINE_WIDTH: 0.61881
G1 X84.219 Y82.202 E.02589
; LINE_WIDTH: 0.571317
G1 X84.242 Y81.739 E.02372
; LINE_WIDTH: 0.523824
G1 X84.266 Y81.276 E.02154
; LINE_WIDTH: 0.47633
G1 X84.271 Y81.209 E.00281
; WIPE_START
G1 F4542.444
G1 X84.266 Y81.276 E-.03382
G1 X84.242 Y81.739 E-.23332
G1 X84.219 Y82.202 E-.23331
G1 X84.195 Y82.666 E-.23331
G1 X84.193 Y82.718 E-.02624
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.232 Y84.022 F42000
G1 E.8 F2400
; FEATURE: Top surface
; LINE_WIDTH: 0.5443
G1 F1200
M204 S15000
G1 X84.4 Y84.022 E.1372
G2 X84.364 Y84.512 I3.591 J.509 E.02385
G1 X87.059 Y84.512 E.13057
G3 X87.022 Y85.003 I-1.815 J.109 E.02391
G1 X84.395 Y85.003 E.12727
G2 X84.414 Y85.11 I.421 J-.022 E.00527
G1 X84.669 Y85.124 E.01235
G1 X84.468 Y85.384 E.01591
G2 X84.495 Y85.494 I.48 J-.059 E.0055
G1 X86.928 Y85.494 E.11784
G3 X86.754 Y85.984 I-2.021 J-.44 E.02529
G1 X84.675 Y85.984 E.1007
G2 X84.938 Y86.475 I2.341 J-.939 E.02702
G1 X86.486 Y86.475 E.075
G3 X86.095 Y86.966 I-2.089 J-1.264 E.03049
G1 X85.054 Y86.966 E.05043
M204 S10000
G1 X85.734 Y87.318 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39365
G1 F1200
M204 S15000
G1 X85.67 Y87.354 E.00247
G1 X85.719 Y87.382 E.00188
; CHANGE_LAYER
; Z_HEIGHT: 1.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 7/37
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

M106 S102
; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X85.67 Y87.354 E-.32873
G1 X85.734 Y87.318 E-.43127
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.133 Y86.131 Z1.75 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F4301.653
M204 S15000
G1 X84.589 Y86.291 E.02129
G1 X86.839 Y86.292 E.09916
G1 X87.284 Y86.142 E.02071
G1 X87.015 Y86.698 E.0272
G1 X86.732 Y87.117 E.0223
G1 X86.14 Y87.742 E.03792
G1 X85.721 Y88.06 E.02321
G1 X85.142 Y87.614 E.03219
G1 X84.705 Y87.13 E.02872
G1 X84.349 Y86.586 E.02866
G1 X84.159 Y86.185 E.01957
M204 S10000
G1 X83.502 Y85.545 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.50869
G1 F4219.41
M204 S15000
G1 X83.407 Y84.901 E.02924
; LINE_WIDTH: 0.51001
G1 F4207.205
G1 X83.404 Y84.255 E.02909
; LINE_WIDTH: 0.51349
G1 F4175.366
G1 X83.922 Y79.359 E.22354
; LINE_WIDTH: 0.54019
G1 F3946.233
G1 X83.993 Y79.195 E.0086
G1 X84.148 Y79.156 E.00764
; LINE_WIDTH: 0.50845
G1 F4221.636
G1 X85.344 Y79.155 E.05373
; LINE_WIDTH: 0.50731
G1 F4232.245
G1 X85.464 Y79.12 E.00561
; LINE_WIDTH: 0.469424
G1 F4617.901
G1 X85.584 Y79.085 E.00514
; LINE_WIDTH: 0.431537
G1 F5080.888
G1 X85.705 Y79.05 E.00467
; LINE_WIDTH: 0.44227
G1 F4940.559
G1 X85.884 Y79.099 E.00713
; LINE_WIDTH: 0.49089
G1 F4391.181
G1 X86.064 Y79.147 E.00802
; LINE_WIDTH: 0.50729
G1 F4232.431
G1 X86.076 Y79.155 E.00067
; LINE_WIDTH: 0.50837
G1 F4222.379
G1 X87.28 Y79.156 E.05404
; LINE_WIDTH: 0.53989
G1 F3948.667
G1 X87.429 Y79.191 E.00735
G1 X87.506 Y79.359 E.00888
; LINE_WIDTH: 0.51099
G1 F4198.19
G1 X88.022 Y84.231 E.22121
; LINE_WIDTH: 0.51163
G1 F4192.323
G1 X88.025 Y84.866 E.02875
; LINE_WIDTH: 0.51253
G1 F4184.101
G1 X87.941 Y85.493 E.02864
; LINE_WIDTH: 0.51877
G1 F4127.967
G1 X87.925 Y85.56 E.00315
; WIPE_START
G1 X87.941 Y85.493 E-.02609
G1 X88.025 Y84.866 E-.24021
G1 X88.022 Y84.231 E-.24162
G1 X87.952 Y83.571 E-.25208
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.648 Y85.677 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.50339
G1 F4269.134
M204 S15000
G1 X84.212 Y85.685 E.02503
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.368 Y85.618 E.00749
G1 X84.428 Y85.777 E.00749
G1 X84.589 Y85.845 E.00769
G1 X86.839 Y85.845 E.09916
G1 X86.983 Y85.792 E.00677
G1 X87.06 Y85.618 E.0084
G1 X87.164 Y85.679 E.00533
; LINE_WIDTH: 0.50273
G1 F4275.408
G1 X87.714 Y85.686 E.02438
; LINE_WIDTH: 0.51877
G1 F4127.967
G1 X87.925 Y85.56 E.01129
G1 X87.808 Y86.026 E.02205
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X85.746 Y88.554 I-4.337 J-1.432 E.14704
G1 X85.649 Y88.549 E.00425
G3 X84.31 Y87.341 I2.615 J-4.247 E.07996
G1 X83.932 Y86.753 E.03078
G1 X83.708 Y86.27 E.02346
; LINE_WIDTH: 0.50869
G1 F4219.41
G1 X83.502 Y85.545 E.0339
G1 X83.603 Y85.637 E.00617
; WIPE_START
G1 X84.212 Y85.685 E-.23182
G1 X84.368 Y85.618 E-.0646
G1 X84.428 Y85.777 E-.06461
G1 X84.589 Y85.845 E-.06634
G1 X85.464 Y85.845 E-.33263
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.076 Y79.155 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.50729
G1 F4232.431
M204 S15000
G1 X86.014 Y79.304 E.00722
; LINE_WIDTH: 0.46941
G1 F4618.049
G1 X85.952 Y79.453 E.00662
; LINE_WIDTH: 0.43153
G1 F5080.978
G1 X85.89 Y79.602 E.00602
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.665 Y79.667 E.00785
G1 X85.509 Y79.575 E.00611
; LINE_WIDTH: 0.431537
G1 F5080.888
G1 X85.454 Y79.435 E.00561
; LINE_WIDTH: 0.469424
G1 F4617.901
G1 X85.399 Y79.295 E.00617
; LINE_WIDTH: 0.50731
G1 F4232.245
G1 X85.344 Y79.155 E.00673
; WIPE_START
G1 X85.399 Y79.295 E-.08459
G1 X85.454 Y79.435 E-.08459
G1 X85.509 Y79.575 E-.08459
G1 X85.665 Y79.667 E-.10235
G1 X85.89 Y79.602 E-.1316
G1 X85.952 Y79.453 E-.09076
G1 X86.014 Y79.304 E-.09076
G1 X86.076 Y79.155 E-.09076
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.01 Y83.847 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.878 Y83.855 E.00443
G1 X86.804 Y83.754 E.00418
G1 X86.772 Y83.371 E.0129
G1 X86.731 Y83.307 E.00255
; WIPE_START
G1 X86.772 Y83.371 E-.0805
G1 X86.804 Y83.754 E-.40739
G1 X86.878 Y83.855 E-.13221
G1 X87.01 Y83.847 E-.1399
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.237 Y82.986 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.40507
G1 F5463.548
M204 S15000
G1 X85.059 Y82.83 E.00823
; LINE_WIDTH: 0.40808
G1 F5417.149
G2 X85.938 Y82.843 I.622 J-11.972 E.03078
; LINE_WIDTH: 0.43734
G1 F5004.04
G1 X85.971 Y82.858 E.00137
; LINE_WIDTH: 0.46659
G1 F4649.586
G1 X86.004 Y82.872 E.00147
G1 X86.146 Y82.863 E.00582
; LINE_WIDTH: 0.43012
G1 F5100.008
G1 X86.289 Y82.853 E.00531
; LINE_WIDTH: 0.422865
G1 F5200.222
G1 X86.233 Y82.896 E.00258
; LINE_WIDTH: 0.45208
G1 F4818.914
G1 X86.177 Y82.94 E.00279
; LINE_WIDTH: 0.46659
G1 F4649.586
G1 X86.152 Y83.025 E.00363
G1 X86.235 Y83.168 E.00673
G1 X86.086 Y83.183 E.00608
; LINE_WIDTH: 0.43734
G1 F5004.04
G1 X85.938 Y83.197 E.00565
; LINE_WIDTH: 0.40809
G1 F5416.996
G1 X85.161 Y83.184 E.02718
G1 X85.216 Y83.042 E.00534
M204 S10000
G1 X85.059 Y82.83 F42000
; LINE_WIDTH: 0.39565
G1 F5614.035
M204 S15000
G1 X84.855 Y82.822 E.0069
G1 X84.804 Y82.666 E.00555
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.804 Y81.275 E.0467
G1 X84.871 Y81.174 E.00407
G1 X84.924 Y81.156 E.00188
G1 X86.51 Y81.156 E.05326
G1 X86.614 Y81.229 E.00424
G1 X86.623 Y82.666 E.04826
; LINE_WIDTH: 0.39553
G1 F5616.006
G1 X86.573 Y82.822 E.00555
G1 X86.289 Y82.853 E.00964
; WIPE_START
G1 X86.573 Y82.822 E-.1085
G1 X86.623 Y82.666 E-.06248
G1 X86.614 Y81.229 E-.5462
G1 X86.521 Y81.164 E-.04282
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.714 Y83.306 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.686 Y83.313 E.00095
G1 X84.624 Y83.746 E.0147
G1 X84.569 Y83.855 E.00409
G1 X84.418 Y83.847 E.0051
; WIPE_START
G1 X84.569 Y83.855 E-.15607
G1 X84.624 Y83.746 E-.12508
G1 X84.686 Y83.313 E-.44973
G1 X84.714 Y83.306 E-.02912
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z2.15 F4000
            G39.3 S1
            G0 Z2.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z1.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
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
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z4.75 F1200

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
M73 E28
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
M73 P14 R79
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4.75
M106 P1 S0

M204 S15000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
M73 P15 R78
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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z1.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
M73 P15 R77
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
M73 P16 R77
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #8
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.497 Y83.149 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.443 Y83.607 E.01551
; WIPE_START
G1 X84.497 Y83.149 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.984 Y83.608 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.926 Y83.145 E.01566
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 8/37
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 254
M204 S10000
G1 X86.99 Y83.601 Z2 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.933 Y83.138 E.01566
; WIPE_START
G1 X86.99 Y83.601 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.437 Y83.601 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.491 Y83.142 E.01552
; WIPE_START
G1 X84.437 Y83.601 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
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
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E27
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
M73 P17 R76
G1 E9.54599 F199
G1 E1.06067 F50
; FLUSH_END
M73 P17 R75
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
M73 P18 R75
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
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z5
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z2
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
M73 P18 R74
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
M73 P19 R74
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #9
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.098 Y86.376 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F4301.653
M204 S15000
G1 X84.581 Y86.311 E.02148
G3 X86.994 Y86.33 I.881 J40.86 E.10636
G1 X87.335 Y86.375 E.01514
G3 X86.298 Y87.817 I-4.126 J-1.873 E.07878
G1 X85.718 Y88.283 E.03279
G3 X84.455 Y87.04 I2.319 J-3.62 E.07867
G1 X84.126 Y86.428 E.03059
M204 S10000
G1 X84.562 Y85.863 F42000
; FEATURE: Outer wall
G1 F4301.653
M204 S15000
G1 X84.581 Y85.865 E.00084
G1 X86.856 Y85.865 E.10025
G1 X86.945 Y85.791 E.0051
; LINE_WIDTH: 0.47477
G1 F4559.271
G1 X87.034 Y85.717 E.00481
G1 X87.077 Y85.807 E.00415
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X87.12 Y85.897 E.0044
G1 X87.237 Y85.929 E.00535
G1 X87.861 Y85.897 E.02753
; LINE_WIDTH: 0.48492
G1 F4451.967
G1 X87.959 Y85.796 E.00597
; LINE_WIDTH: 0.457605
G1 F4753.005
G1 X88.057 Y85.696 E.0056
G1 X88.009 Y85.841 E.00611
; LINE_WIDTH: 0.48492
G1 F4451.967
G1 X87.961 Y85.987 E.00652
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X85.773 Y88.768 I-4.752 J-1.488 E.15944
G1 X85.655 Y88.777 E.00522
G3 X83.418 Y85.795 I2.547 J-4.24 E.16843
; LINE_WIDTH: 0.48714
G1 F4429.168
G1 X83.457 Y85.842 E.00261
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X83.695 Y85.929 E.01119
G1 X84.272 Y85.914 E.02543
G1 X84.333 Y85.816 E.0051
; LINE_WIDTH: 0.474795
G1 F4559
G1 X84.393 Y85.717 E.00481
G1 X84.463 Y85.788 E.00415
; LINE_WIDTH: 0.49999
G1 F4301.653
G2 X84.506 Y85.846 I.105 J-.034 E.0032
; WIPE_START
G1 X84.581 Y85.865 E-.0295
G1 X86.503 Y85.865 E-.7305
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.329 Y85.539 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41561
G1 F5304.454
M204 S15000
G1 X83.238 Y84.816 E.02604
; LINE_WIDTH: 0.42537
G1 F5165.178
G3 X83.265 Y84.049 I7.837 J-.103 E.0282
; LINE_WIDTH: 0.41645
G1 F5292.172
G1 X83.415 Y82.626 E.05125
; LINE_WIDTH: 0.44338
G1 F4926.488
G1 X83.417 Y82.484 E.00548
; LINE_WIDTH: 0.47031
G1 F4608.074
G1 X83.419 Y82.341 E.00586
G1 X83.622 Y80.66 E.06966
; LINE_WIDTH: 0.42781
G1 F5131.495
G1 X83.77 Y79.296 E.0507
; LINE_WIDTH: 0.44833
G1 F4864.701
G1 X83.811 Y79.152 E.00584
; LINE_WIDTH: 0.46843
G1 F4628.96
G1 X83.885 Y79.066 E.00463
G1 X84.076 Y79.007 E.00818
; LINE_WIDTH: 0.43647
G1 F5015.412
G1 X85.415 Y79.007 E.05062
G1 X85.757 Y78.962 E.01304
; LINE_WIDTH: 0.43661
G1 F5013.579
G1 X86.006 Y79.007 E.00955
; LINE_WIDTH: 0.43717
G1 F5006.258
G1 X87.337 Y79.006 E.05043
; LINE_WIDTH: 0.48175
G1 F4484.934
G1 X87.542 Y79.064 E.00899
G1 X87.593 Y79.166 E.00482
; LINE_WIDTH: 0.44731
G1 F4877.306
G1 X87.644 Y79.268 E.00443
; LINE_WIDTH: 0.42589
G1 F5157.963
G1 X87.716 Y79.874 E.02245
; LINE_WIDTH: 0.43009
G1 F5100.415
G1 X87.804 Y80.66 E.02939
; LINE_WIDTH: 0.46867
G1 F4626.283
G1 X88.016 Y82.432 E.07314
G1 X88.017 Y82.569 E.0056
; LINE_WIDTH: 0.44051
G1 F4963.036
G1 X88.017 Y82.706 E.00522
; LINE_WIDTH: 0.41235
G1 F5352.663
G1 X88.161 Y84.034 E.04732
; LINE_WIDTH: 0.42639
G1 F5151.044
G1 X88.184 Y84.837 E.02956
; LINE_WIDTH: 0.43485
G1 F5036.726
G3 X88.057 Y85.696 I-4.11 J-.167 E.03274
; WIPE_START
G1 X88.115 Y85.435 E-.10154
G1 X88.184 Y84.837 E-.22873
G1 X88.161 Y84.034 E-.30525
G1 X88.126 Y83.708 E-.12448
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.996 Y79.407 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X85.975 Y79.444 E.00143
G1 X85.911 Y79.407 E.00247
G1 X85.975 Y79.37 E.00247
; WIPE_START
G1 X85.911 Y79.407 E-.29487
G1 X85.975 Y79.444 E-.29487
G1 X85.996 Y79.407 E-.17025
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.016 Y83.841 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.884 Y83.848 E.00443
G1 X86.81 Y83.748 E.00419
G1 X86.778 Y83.365 E.0129
G1 X86.727 Y83.3 E.00278
M204 S10000
G1 X86.32 Y83.193 F42000
; LINE_WIDTH: 0.40481
G1 F5467.593
M204 S15000
G1 X85.155 Y83.193 E.0404
G1 X85.231 Y83.019 E.00656
G1 X85.174 Y82.904 E.00448
; LINE_WIDTH: 0.39895
G1 F5560.382
G1 X85.02 Y82.826 E.00588
; LINE_WIDTH: 0.40481
G1 F5467.593
G2 X86.379 Y82.827 I.691 J-12.515 E.04715
; LINE_WIDTH: 0.39666
G1 F5597.505
G1 X86.29 Y82.87 E.00334
; LINE_WIDTH: 0.40481
G1 F5467.593
G1 X86.199 Y83.018 E.00604
G1 X86.286 Y83.143 E.00528
; WIPE_START
G1 X85.155 Y83.193 E-.4302
G1 X85.231 Y83.019 E-.07193
G1 X85.174 Y82.904 E-.04905
G1 X85.02 Y82.826 E-.06558
G1 X85.397 Y82.841 E-.14324
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.02 Y82.826 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39897
G1 F5560.06
M204 S15000
G1 X84.835 Y82.814 E.00634
G1 X84.793 Y82.666 E.00524
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.794 Y81.276 E.04667
G1 X84.855 Y81.161 E.00435
G1 X84.924 Y81.145 E.00238
G1 X86.503 Y81.145 E.05303
G1 X86.608 Y81.19 E.00383
G1 X86.635 Y81.276 E.003
G1 X86.635 Y82.666 E.04667
; LINE_WIDTH: 0.39907
G1 F5558.451
G1 X86.593 Y82.814 E.00524
G1 X86.379 Y82.827 E.0073
; WIPE_START
G1 X86.593 Y82.814 E-.08133
G1 X86.635 Y82.666 E-.05833
G1 X86.635 Y81.276 E-.52825
G1 X86.608 Y81.19 E-.03399
G1 X86.503 Y81.145 E-.0433
G1 X86.465 Y81.145 E-.0148
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.707 Y83.299 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.678 Y83.306 E.00103
G1 X84.618 Y83.74 E.01469
G1 X84.563 Y83.848 E.00409
G1 X84.411 Y83.841 E.0051
; CHANGE_LAYER
; Z_HEIGHT: 2.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 9/37
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.563 Y83.848 E-.15559
G1 X84.618 Y83.74 E-.12477
G1 X84.678 Y83.306 E-.4482
G1 X84.707 Y83.299 E-.03144
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.315 Y87.519 Z2.25 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F4301.653
M204 S15000
G1 X85.367 Y87.499 E.00247
G1 X85.465 Y87.355 E.00768
; LINE_WIDTH: 0.472685
G1 F4581.956
G1 X85.562 Y87.211 E.00721
; LINE_WIDTH: 0.44538
G1 F4901.335
G1 X85.551 Y86.746 E.01798
; LINE_WIDTH: 0.42861
G1 F5120.546
G1 X85.488 Y86.528 E.0084
; LINE_WIDTH: 0.4594
G1 F4731.978
G1 X85.424 Y86.311 E.00908
G1 X86.014 Y86.311 E.02362
G1 X85.945 Y86.519 E.00879
; LINE_WIDTH: 0.43281
G1 F5063.825
G1 X85.877 Y86.727 E.00821
; LINE_WIDTH: 0.44538
G1 F4901.335
G1 X85.865 Y87.21 E.01868
; LINE_WIDTH: 0.472685
G1 F4581.956
G1 X85.949 Y87.343 E.00648
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.032 Y87.475 E.00691
G1 X86.379 Y87.622 E.01658
G1 X86.741 Y87.576 E.0161
G1 X86.459 Y87.885 E.01843
G1 X85.711 Y88.483 E.04219
G3 X84.697 Y87.582 I2.744 J-4.11 E.05998
G1 X85.026 Y87.627 E.01464
G1 X85.258 Y87.54 E.01091
; WIPE_START
G1 X85.367 Y87.499 E-.0441
G1 X85.465 Y87.355 E-.06621
G1 X85.562 Y87.211 E-.0662
G1 X85.551 Y86.746 E-.17667
G1 X85.488 Y86.528 E-.08616
G1 X85.424 Y86.311 E-.08616
G1 X86.014 Y86.311 E-.22405
G1 X86.005 Y86.337 E-.01045
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.115 Y85.512 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.965 Y85.522 E.00504
G1 X86.912 Y85.691 E.00595
; WIPE_START
G1 X86.965 Y85.522 E-.41145
G1 X87.115 Y85.512 E-.34855
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.103 Y87.139 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X85.176 Y87.047 E.00521
G1 X85.181 Y86.882 E.00725
G1 X84.922 Y86.18 E.03297
G1 X84.772 Y85.996 E.0105
; LINE_WIDTH: 0.46873
G1 F4625.615
G1 X84.621 Y85.811 E.00976
G1 X84.845 Y85.848 E.00931
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X85.069 Y85.885 E.01001
G1 X86.513 Y85.885 E.06364
G1 X86.655 Y85.838 E.00656
; LINE_WIDTH: 0.46852
G1 F4627.956
G1 X86.796 Y85.791 E.0061
G1 X86.695 Y85.897 E.006
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.594 Y86.003 E.00646
G1 X86.233 Y86.977 E.04575
G1 X86.315 Y87.13 E.00763
G1 X86.43 Y87.179 E.00553
G1 X86.895 Y87.078 E.02099
G1 X87.333 Y86.855 E.02162
; LINE_WIDTH: 0.45759
G1 F4753.181
G1 X87.441 Y86.672 E.00848
; LINE_WIDTH: 0.47327
G1 F4575.569
G1 X87.457 Y86.39 E.01169
; LINE_WIDTH: 0.50583
G1 F4246.097
G1 X87.473 Y86.109 E.01259
G1 X87.889 Y86.094 E.01857
G1 X87.993 Y86.014 E.00585
; LINE_WIDTH: 0.476285
G1 F4542.927
G1 X88.098 Y85.935 E.00547
G1 X88.046 Y86.072 E.00611
; LINE_WIDTH: 0.50583
G1 F4246.097
G2 X87.904 Y86.477 I5.149 J2.034 E.01914
; LINE_WIDTH: 0.47327
G1 F4575.569
G1 X87.814 Y86.744 E.0117
; LINE_WIDTH: 0.44071
G1 F4960.471
G1 X87.694 Y87.002 E.01088
; LINE_WIDTH: 0.46267
G1 F4694.147
G1 X87.548 Y87.219 E.01053
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X85.719 Y88.984 I-4.236 J-2.559 E.11333
G1 X85.485 Y88.869 E.01148
G3 X83.914 Y87.253 I2.824 J-4.316 E.10013
; LINE_WIDTH: 0.45913
G1 F4735.129
G1 X83.695 Y86.925 E.01578
; LINE_WIDTH: 0.464005
G1 F4678.876
G1 X83.603 Y86.663 E.01127
; LINE_WIDTH: 0.50974
G1 F4209.695
G2 X83.398 Y86.113 I-8.668 J2.912 E.02644
; LINE_WIDTH: 0.463325
G1 F4686.642
G1 X83.286 Y85.825 E.0125
; LINE_WIDTH: 0.45874
G1 F4739.687
G1 X83.373 Y85.948 E.00601
; LINE_WIDTH: 0.50057
G1 F4296.071
G1 X83.459 Y86.07 E.00663
; LINE_WIDTH: 0.50974
G1 F4209.695
G1 X83.952 Y86.103 E.02224
G1 X83.97 Y86.388 E.01286
; LINE_WIDTH: 0.47493
G1 F4557.539
G1 X83.987 Y86.673 E.01188
; LINE_WIDTH: 0.4594
G1 F4731.978
G1 X84.097 Y86.858 E.00863
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.546 Y87.082 E.02211
G1 X84.918 Y87.176 E.01691
G1 X85.044 Y87.151 E.00567
; WIPE_START
G1 X85.176 Y87.047 E-.06402
G1 X85.181 Y86.882 E-.06248
G1 X84.922 Y86.18 E-.28427
G1 X84.772 Y85.996 E-.09052
G1 X84.621 Y85.811 E-.09052
G1 X84.845 Y85.848 E-.08633
G1 X85.058 Y85.883 E-.08185
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.313 Y85.512 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.463 Y85.522 E.00504
G1 X84.516 Y85.691 E.00595
; WIPE_START
G1 X84.463 Y85.522 E-.41133
G1 X84.313 Y85.512 E-.34867
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.273 Y85.792 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.40797
G1 F5418.831
M204 S15000
G1 X83.261 Y85.751 E.00152
; LINE_WIDTH: 0.40857
G1 F5409.67
G3 X83.139 Y84.638 I4.893 J-1.101 E.03929
; LINE_WIDTH: 0.4309
G1 F5089.463
G1 X83.15 Y84.265 E.01392
; LINE_WIDTH: 0.45771
G1 F4751.77
G1 X83.162 Y83.891 E.01491
G1 X83.285 Y82.982 E.0366
; LINE_WIDTH: 0.42568
G1 F5160.874
G1 X83.408 Y82.073 E.0337
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X83.411 Y82.055 E.00064
; WIPE_START
G1 X83.408 Y82.073 E-.0072
G1 X83.285 Y82.982 E-.34856
G1 X83.162 Y83.891 E-.34856
G1 X83.157 Y84.038 E-.05568
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.155 Y85.796 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41107
G1 F5371.831
M204 S15000
G1 X88.171 Y85.736 E.00218
; LINE_WIDTH: 0.41057
G1 F5379.357
G1 X88.263 Y85.144 E.02114
; LINE_WIDTH: 0.40041
G1 F5536.971
G1 X88.286 Y84.552 E.02028
; LINE_WIDTH: 0.4279
G1 F5130.261
G1 X88.275 Y84.215 E.01247
; LINE_WIDTH: 0.45853
G1 F4742.146
G2 X88.204 Y83.44 I-3.763 J-.044 E.03117
; LINE_WIDTH: 0.43335
G1 F5056.624
G1 X88.143 Y83.002 E.01657
; LINE_WIDTH: 0.40817
G1 F5415.774
G1 X88.009 Y82.04 E.03399
; WIPE_START
G1 X88.143 Y83.002 E-.369
G1 X88.204 Y83.44 E-.16792
G1 X88.264 Y83.877 E-.16791
G1 X88.269 Y84.022 E-.05517
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.773 Y87.909 F42000
G1 E.8 F2400
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.52201
G1 F4099.411
M204 S15000
G3 X85.685 Y87.86 I-.058 J0 E.01121
; WIPE_START
G1 X85.656 Y87.909 E-.18645
G1 X85.686 Y87.96 E-.19119
G1 X85.744 Y87.96 E-.19118
G1 X85.773 Y87.909 E-.19119
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.022 Y83.834 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.89 Y83.842 E.00443
G1 X86.816 Y83.741 E.00419
G1 X86.784 Y83.358 E.0129
G1 X86.735 Y83.292 E.00276
M204 S10000
G1 X86.339 Y83.188 F42000
; LINE_WIDTH: 0.40154
G1 F5518.986
M204 S15000
G1 X85.13 Y83.188 E.04152
G1 X85.204 Y83.016 E.00641
G1 X85.147 Y82.902 E.00437
; LINE_WIDTH: 0.39745
G1 F5584.643
G1 X84.992 Y82.823 E.00593
; LINE_WIDTH: 0.40154
G1 F5518.986
G2 X86.408 Y82.824 I.718 J-11.933 E.04868
; LINE_WIDTH: 0.39575
G1 F5612.394
G1 X86.32 Y82.866 E.00329
; LINE_WIDTH: 0.40155
G1 F5518.827
G1 X86.223 Y83.016 E.00615
G1 X86.305 Y83.138 E.00505
; WIPE_START
G1 X85.13 Y83.188 E-.44692
G1 X85.204 Y83.016 E-.07095
G1 X85.147 Y82.902 E-.04829
G1 X84.992 Y82.823 E-.06642
G1 X85.327 Y82.838 E-.12742
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.992 Y82.823 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.40483
G1 F5467.282
M204 S15000
G1 X84.816 Y82.804 E.00614
G1 X84.782 Y82.666 E.00494
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.783 Y81.276 E.04668
G1 X84.824 Y81.162 E.00405
G1 X84.924 Y81.134 E.00347
G1 X86.503 Y81.134 E.05303
G1 X86.605 Y81.164 E.00356
G1 X86.644 Y81.276 E.00397
G1 X86.645 Y82.666 E.04667
; LINE_WIDTH: 0.40477
G1 F5468.216
G1 X86.612 Y82.804 E.00494
G1 X86.408 Y82.824 E.00708
; WIPE_START
G1 X86.612 Y82.804 E-.07763
G1 X86.645 Y82.666 E-.0541
G1 X86.644 Y81.276 E-.52825
G1 X86.605 Y81.164 E-.0449
G1 X86.503 Y81.134 E-.0403
G1 X86.464 Y81.134 E-.01481
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.701 Y83.291 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.669 Y83.3 E.00111
G1 X84.612 Y83.733 E.01468
G1 X84.557 Y83.842 E.00409
G1 X84.405 Y83.834 E.0051
; WIPE_START
G1 X84.557 Y83.842 E-.15513
G1 X84.612 Y83.733 E-.12439
G1 X84.669 Y83.3 E-.44673
M73 P19 R73
G1 X84.701 Y83.291 E-.03375
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.898 Y79.034 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X85.835 Y79.071 E.00247
G1 X85.835 Y78.997 E.00247
G1 X85.484 Y79.138 E.01267
G1 X85.484 Y79.064 E.00247
G1 X85.713 Y78.987 E.00809
M204 S10000
G1 X85.801 Y79.511 F42000
G1 F5647.059
M204 S15000
G1 X85.738 Y79.548 E.00247
G1 X85.738 Y79.474 E.00247
G1 X85.61 Y79.494 E.00433
G1 X85.585 Y79.475 E.00107
; WIPE_START
G1 X85.61 Y79.494 E-.07832
G1 X85.738 Y79.474 E-.3182
G1 X85.738 Y79.548 E-.18175
G1 X85.801 Y79.511 E-.18173
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z2.65 F4000
            G39.3 S1
            G0 Z2.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z2.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
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
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z5.25 F1200

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
M73 E26
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z5.25
M106 P1 S0

M204 S15000



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
M73 P21 R72
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
G1 X106.5 Y78.331 F42000
G1 Z2.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
M73 P22 R72
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
M73 P22 R71
G1  Y83.331  E0.0232
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #10
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.541 Y86.492 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.54559
; LAYER_HEIGHT: 0.25
G1 F3902.915
M204 S15000
G3 X84.511 Y86.439 I-.058 J-.002 E.01446
; WIPE_START
G1 X84.449 Y86.439 E-.15198
G1 X84.418 Y86.492 E-.15201
G1 X84.449 Y86.545 E-.152
G1 X84.511 Y86.545 E-.15201
G1 X84.541 Y86.492 E-.15201
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.014 Y86.489 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.52849
G1 F4043.468
M204 S15000
G3 X86.984 Y86.438 I-.056 J-.002 E.01347
; WIPE_START
G1 X86.925 Y86.438 E-.15198
G1 X86.895 Y86.489 E-.15201
G1 X86.925 Y86.54 E-.152
G1 X86.984 Y86.54 E-.152
G1 X87.014 Y86.489 E-.15201
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.941 Y83.134 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.996 Y83.594 E.01557
; WIPE_START
G1 X86.941 Y83.134 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.431 Y83.594 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.487 Y83.133 E.0156
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 10/37
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.431 Y83.594 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.584 Y86.892 Z2.5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.35722
; LAYER_HEIGHT: 0.25
G1 F6324.736
M204 S15000
G2 X87.045 Y86.038 I-64.438 J-35.355 E.0291
G1 X87.057 Y86.723 E.02054
G1 X86.64 Y86.872 E.01325
; WIPE_START
G1 X87.045 Y86.038 E-.35226
G1 X87.057 Y86.723 E-.2604
G1 X86.691 Y86.853 E-.14734
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.588 Y86.813 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.38072
G1 F5870.303
M204 S15000
G3 X84.381 Y86.719 I.374 J-1.096 E.00738
G1 X84.381 Y86.061 E.02124
G1 X84.656 Y86.468 E.01587
G1 X84.844 Y86.869 E.0143
G3 X84.646 Y86.831 I.118 J-1.152 E.00654
; WIPE_START
G1 X84.381 Y86.719 E-.10929
G1 X84.381 Y86.061 E-.2499
G1 X84.656 Y86.468 E-.1867
G1 X84.844 Y86.869 E-.1683
G1 X84.726 Y86.847 E-.04581
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.002 Y83.589 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.943 Y83.135 E.01536
; WIPE_START
G1 X87.002 Y83.589 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.483 Y83.125 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.425 Y83.588 E.01565
; WIPE_START
G1 X84.483 Y83.125 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z2.9 F4000
            G39.3 S1
            G0 Z2.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
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
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z5.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E25
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
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
M73 P23 R70
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
M73 P24 R70
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
M73 P24 R69
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z5.5
M106 P1 S0

M204 S15000



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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z2.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
M73 P25 R69
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
M73 P25 R68
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #11
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.711 Y87.733 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.69716
; LAYER_HEIGHT: 0.25
G1 F2983.637
M204 S15000
G1 X85.855 Y87.853 E.0119
; LINE_WIDTH: 0.69779
G1 F2980.718
G1 X86.305 Y87.928 E.029
G1 X86.474 Y87.898 E.01092
G1 X86.352 Y88.033 E.01155
G1 X85.714 Y88.535 E.05167
G1 X85.382 Y88.301 E.02585
; LINE_WIDTH: 0.69716
G1 F2983.637
G1 X84.95 Y87.905 E.03724
G1 X85.466 Y87.894 E.03283
G1 X85.661 Y87.766 E.01481
M204 S10000
G1 X85.716 Y86.792 F42000
; LINE_WIDTH: 0.36951
G1 F6078.642
M204 S15000
G1 X85.478 Y86.285 E.01747
G1 X85.992 Y86.285 E.01605
G1 X85.744 Y86.74 E.01614
; WIPE_START
G1 X85.478 Y86.285 E-.25687
G1 X85.992 Y86.285 E-.25084
G1 X85.744 Y86.74 E-.25229
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.915 Y85.708 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.973 Y85.542 E.00591
G1 X87.122 Y85.532 E.00503
; WIPE_START
G1 X86.973 Y85.542 E-.34962
G1 X86.915 Y85.708 E-.41038
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.173 Y86.056 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45761
G1 F4752.946
M204 S15000
G1 X88.11 Y86.194 E.00609
; LINE_WIDTH: 0.49655
G1 F4335.064
G2 X87.936 Y86.637 I2.647 J1.293 E.02081
; LINE_WIDTH: 0.46922
G1 F4620.16
G1 X87.826 Y86.941 E.01326
; LINE_WIDTH: 0.46462
G1 F4671.874
G1 X87.602 Y87.354 E.01909
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X86.201 Y88.865 I-4.924 J-3.161 E.09129
G1 X85.715 Y89.157 E.02497
G1 X85.518 Y89.064 E.00962
G1 X85.018 Y88.706 E.02709
G1 X84.391 Y88.093 E.03863
G3 X83.857 Y87.38 I5.342 J-4.555 E.03932
; LINE_WIDTH: 0.46154
G1 F4707.152
G1 X83.674 Y87.113 E.01302
; LINE_WIDTH: 0.468065
G1 F4633.037
G1 X83.582 Y86.857 E.01116
; LINE_WIDTH: 0.51304
G1 F4179.456
G2 X83.373 Y86.328 I-4.547 J1.487 E.0258
; LINE_WIDTH: 0.463615
G1 F4683.327
G1 X83.257 Y86.056 E.01198
; LINE_WIDTH: 0.44862
G1 F4861.129
G1 X83.333 Y86.16 E.00504
; LINE_WIDTH: 0.48083
G1 F4494.593
G1 X83.451 Y86.225 E.0057
; LINE_WIDTH: 0.51304
G1 F4179.456
G1 X83.57 Y86.289 E.00613
G1 X83.934 Y86.289 E.0165
G2 X83.967 Y86.73 I1.417 J.115 E.02012
; LINE_WIDTH: 0.468065
G1 F4633.037
G1 X84 Y86.941 E.00874
; LINE_WIDTH: 0.448765
G1 F4859.345
G1 X84.07 Y87.008 E.0038
; LINE_WIDTH: 0.47444
G1 F4562.846
G1 X84.14 Y87.076 E.00404
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.577 Y87.267 E.02102
G1 X85.067 Y87.37 E.02205
G1 X85.323 Y87.365 E.0113
; LINE_WIDTH: 0.54383
G1 F3916.929
G1 X85.467 Y87.187 E.01109
G1 X85.421 Y87.038 E.00758
; LINE_WIDTH: 0.51944
G1 F4122.03
G1 X85.039 Y86.249 E.0403
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.768 Y85.888 E.0199
G2 X86.639 Y85.9 I1.164 J-34.253 E.08245
; LINE_WIDTH: 0.49748
G1 F4325.981
G1 X86.618 Y85.941 E.00199
; LINE_WIDTH: 0.51944
G1 F4122.03
G1 X85.995 Y87.055 E.05871
; LINE_WIDTH: 0.54383
G1 F3916.929
G1 X85.956 Y87.188 E.0067
G1 X86.1 Y87.366 E.01109
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.239 Y87.386 E.0062
G1 X86.868 Y87.269 E.02821
G1 X87.345 Y87.044 E.02325
; LINE_WIDTH: 0.46462
G1 F4671.874
G1 X87.458 Y86.855 E.00892
; LINE_WIDTH: 0.47899
G1 F4514.036
G1 X87.476 Y86.573 E.01188
; LINE_WIDTH: 0.51609
G1 F4151.89
G1 X87.495 Y86.291 E.01292
G1 X87.858 Y86.291 E.01657
G1 X87.977 Y86.226 E.00619
; LINE_WIDTH: 0.48456
G1 F4455.687
G1 X88.096 Y86.162 E.00576
; LINE_WIDTH: 0.45303
G1 F4807.452
G1 X88.138 Y86.104 E.00281
; WIPE_START
G1 X88.11 Y86.194 E-.03592
G1 X87.936 Y86.637 E-.18066
G1 X87.826 Y86.941 E-.12279
G1 X87.602 Y87.354 E-.17877
G1 X87.226 Y87.868 E-.24186
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.281 Y83.796 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41779
G1 F5272.697
M204 S15000
G1 X88.361 Y84.321 E.01912
; LINE_WIDTH: 0.44478
G1 F4908.854
G1 X88.38 Y84.599 E.01074
; LINE_WIDTH: 0.47177
G1 F4591.983
G3 X88.352 Y85.184 I-1.309 J.229 E.02438
; LINE_WIDTH: 0.43432
G1 F5043.739
G1 X88.304 Y85.491 E.0117
; LINE_WIDTH: 0.41597
G1 F5299.183
G1 X88.181 Y86.028 E.0197
; LINE_WIDTH: 0.41867
G1 F5259.986
G1 X88.173 Y86.056 E.00103
; WIPE_START
G1 X88.181 Y86.028 E-.01084
G1 X88.304 Y85.491 E-.20926
G1 X88.352 Y85.184 E-.1183
G1 X88.399 Y84.876 E-.11829
G1 X88.38 Y84.599 E-.10566
G1 X88.361 Y84.321 E-.10565
G1 X88.324 Y84.082 E-.09199
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.305 Y85.532 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.455 Y85.542 E.00503
G1 X84.518 Y85.717 E.00625
; WIPE_START
G1 X84.455 Y85.542 E-.42093
G1 X84.305 Y85.532 E-.33907
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.257 Y86.056 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41419
G1 F5325.345
M204 S15000
G1 X83.144 Y85.605 E.01652
; LINE_WIDTH: 0.43939
G1 F4977.446
G1 X83.089 Y85.256 E.01346
; LINE_WIDTH: 0.47471
G1 F4559.92
G1 X83.035 Y84.907 E.01469
G1 X83.058 Y84.405 E.0209
; LINE_WIDTH: 0.43065
G1 F5092.838
G1 X83.136 Y83.797 E.02283
; WIPE_START
G1 X83.058 Y84.405 E-.23303
G1 X83.035 Y84.907 E-.19104
G1 X83.089 Y85.256 E-.1343
G1 X83.144 Y85.605 E-.13429
G1 X83.187 Y85.777 E-.06734
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.028 Y83.828 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.897 Y83.835 E.00443
G1 X86.823 Y83.735 E.00419
G1 X86.79 Y83.352 E.0129
G1 X86.743 Y83.285 E.00274
M204 S10000
G1 X86.365 Y83.183 F42000
; LINE_WIDTH: 0.3981
G1 F5574.104
M204 S15000
G1 X85.106 Y83.183 E.04281
G1 X85.177 Y83.013 E.00626
G1 X85.12 Y82.901 E.00426
; LINE_WIDTH: 0.39581
G1 F5611.41
G1 X84.963 Y82.819 E.00597
; LINE_WIDTH: 0.3981
G1 F5574.104
G1 X85.349 Y82.838 E.01313
G1 X86.437 Y82.821 E.03703
; LINE_WIDTH: 0.39482
G1 F5627.693
G1 X86.35 Y82.861 E.00323
; LINE_WIDTH: 0.39813
G1 F5573.619
G1 X86.251 Y83.013 E.00616
G1 X86.331 Y83.133 E.00492
; WIPE_START
G1 X85.106 Y83.183 E-.46603
G1 X85.177 Y83.013 E-.06996
G1 X85.12 Y82.901 E-.0476
G1 X84.963 Y82.819 E-.06716
G1 X85.25 Y82.833 E-.10926
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.963 Y82.819 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41267
G1 F5347.892
M204 S15000
G1 X84.798 Y82.794 E.00594
G1 X84.771 Y82.666 E.00463
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.772 Y81.276 E.04668
G1 X84.812 Y81.153 E.00432
G1 X84.924 Y81.123 E.00389
G1 X86.503 Y81.123 E.05303
G1 X86.618 Y81.155 E.00398
G1 X86.655 Y81.276 E.00423
G1 X86.656 Y82.666 E.04667
; LINE_WIDTH: 0.41263
G1 F5348.487
G1 X86.63 Y82.794 E.00463
G1 X86.437 Y82.821 E.00688
; WIPE_START
G1 X86.63 Y82.794 E-.07378
G1 X86.656 Y82.666 E-.0496
G1 X86.655 Y81.276 E-.52825
G1 X86.618 Y81.155 E-.04788
G1 X86.503 Y81.123 E-.04509
G1 X86.463 Y81.123 E-.01541
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.695 Y83.282 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.661 Y83.293 E.0012
G1 X84.605 Y83.727 E.01468
G1 X84.551 Y83.835 E.00409
G1 X84.399 Y83.828 E.0051
; WIPE_START
G1 X84.551 Y83.835 E-.15455
G1 X84.605 Y83.727 E-.12396
G1 X84.661 Y83.293 E-.4451
G1 X84.695 Y83.282 E-.03639
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.825 Y79.432 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X85.761 Y79.469 E.00247
G1 X85.761 Y79.396 E.00247
G1 X85.933 Y79.309 E.00647
G1 X85.87 Y79.346 E.00247
G1 X85.933 Y79.383 E.00247
G1 X85.955 Y79.346 E.00143
; CHANGE_LAYER
; Z_HEIGHT: 2.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 11/37
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X85.933 Y79.383 E-.061
G1 X85.87 Y79.346 E-.10564
G1 X85.933 Y79.309 E-.10564
G1 X85.761 Y79.396 E-.27643
G1 X85.761 Y79.469 E-.10565
G1 X85.825 Y79.432 E-.10564
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.922 Y85.727 Z2.75 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.98 Y85.561 E.00591
G1 X87.13 Y85.551 E.00503
; WIPE_START
G1 X86.98 Y85.561 E-.34944
G1 X86.922 Y85.727 E-.41056
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.424 Y84.96 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.44181
G1 F4946.414
M204 S15000
G1 X88.424 Y85.166 E.00787
; LINE_WIDTH: 0.46983
G1 F4613.389
G1 X88.425 Y85.371 E.00844
G1 X88.395 Y85.444 E.00324
; LINE_WIDTH: 0.43375
G1 F5051.303
G1 X88.365 Y85.517 E.00296
; LINE_WIDTH: 0.41269
G1 F5347.594
G1 X88.197 Y86.241 E.02634
; WIPE_START
G1 X88.365 Y85.517 E-.43052
G1 X88.395 Y85.444 E-.0457
G1 X88.425 Y85.371 E-.04571
G1 X88.424 Y85.166 E-.11904
G1 X88.424 Y84.96 E-.11904
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.663 Y88.025 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.65635
G1 F3185.665
M204 S15000
G1 X85.71 Y88.016 E.00282
G1 X85.857 Y88.068 E.00928
G1 X86.515 Y88.045 E.03918
G3 X85.707 Y88.714 I-3.116 J-2.942 E.06255
G3 X84.9 Y88.037 I2.625 J-3.95 E.06285
G1 X85.387 Y88.08 E.02913
G1 X85.604 Y88.037 E.01318
M204 S10000
G1 X85.584 Y87.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.542364
G1 F3928.684
M204 S15000
G1 X85.521 Y87.012 E.00565
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.95 Y86.105 E.04724
G1 X84.754 Y85.902 E.01245
G1 X84.987 Y85.924 E.01032
G2 X86.667 Y85.906 I.368 J-45.585 E.07406
G1 X86.475 Y86.109 E.01232
G1 X86.139 Y86.665 E.02861
; LINE_WIDTH: 0.542364
G1 F3928.684
G1 X85.996 Y86.879 E.01244
; LINE_WIDTH: 0.584737
G1 F3615.229
G1 X85.853 Y87.094 E.01352
; LINE_WIDTH: 0.62711
G1 F3348.098
G1 X85.71 Y87.309 E.0146
G1 X85.647 Y87.21 E.00663
; LINE_WIDTH: 0.584737
G1 F3615.229
G1 X85.617 Y87.162 E.00299
; WIPE_START
G1 X85.521 Y87.012 E-.06729
G1 X84.95 Y86.105 E-.40735
G1 X84.754 Y85.902 E-.10739
G1 X84.987 Y85.924 E-.08899
G1 X85.221 Y85.921 E-.08898
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.297 Y85.551 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.447 Y85.561 E.00503
G1 X84.51 Y85.736 E.00625
; WIPE_START
G1 X84.447 Y85.561 E-.42108
G1 X84.297 Y85.551 E-.33892
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.188 Y86.128 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X83.18 Y86.098 E.00105
; LINE_WIDTH: 0.43652
G1 F5014.757
G1 X83.091 Y85.733 E.01423
; LINE_WIDTH: 0.47939
G1 F4509.795
G3 X82.994 Y85.037 I1.524 J-.566 E.02977
; WIPE_START
G1 X83.001 Y85.367 E-.22541
G1 X83.091 Y85.733 E-.25667
G1 X83.18 Y86.098 E-.25668
G1 X83.188 Y86.128 E-.02123
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.197 Y86.241 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.446114
G1 F4892.177
M204 S15000
G1 X88.115 Y86.423 E.00775
; LINE_WIDTH: 0.479537
G1 F4508.242
G1 X88.032 Y86.605 E.00841
; LINE_WIDTH: 0.51296
G1 F4180.184
G2 X87.853 Y87.045 I3.177 J1.549 E.02154
; LINE_WIDTH: 0.46744
G1 F4640.035
G1 X87.757 Y87.302 E.01123
; LINE_WIDTH: 0.460955
G1 F4713.912
G1 X87.6 Y87.522 E.01087
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X86.505 Y88.775 I-5.924 J-4.069 E.07348
G1 X85.996 Y89.151 E.0279
G1 X85.705 Y89.307 E.01457
G1 X85.425 Y89.158 E.01393
G3 X83.808 Y87.506 I3.616 J-5.159 E.10249
; LINE_WIDTH: 0.46081
G1 F4715.591
G1 X83.587 Y87.11 E.01823
; LINE_WIDTH: 0.48444
G1 F4456.928
G1 X83.318 Y86.394 E.03252
; LINE_WIDTH: 0.51518
G1 F4160.076
G1 X83.428 Y86.446 E.00551
G1 X83.916 Y86.466 E.02229
G2 X83.935 Y86.773 I2.065 J.031 E.01403
; LINE_WIDTH: 0.477715
G1 F4527.608
G1 X83.953 Y87.024 E.01051
; LINE_WIDTH: 0.44666
G1 F4885.372
G1 X84.034 Y87.186 E.00703
; LINE_WIDTH: 0.473325
G1 F4574.969
G1 X84.259 Y87.301 E.01049
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X84.484 Y87.417 E.01116
G1 X85.071 Y87.536 E.02637
G1 X85.485 Y87.548 E.01828
; LINE_WIDTH: 0.542357
G1 F3928.737
G1 X85.56 Y87.485 E.00473
; LINE_WIDTH: 0.584724
G1 F3615.32
G1 X85.635 Y87.422 E.00514
; LINE_WIDTH: 0.62709
G1 F3348.215
G1 X85.71 Y87.359 E.00555
G1 X85.765 Y87.413 E.00435
; LINE_WIDTH: 0.584724
G1 F3615.32
G1 X85.819 Y87.467 E.00403
; LINE_WIDTH: 0.542357
G1 F3928.737
G1 X85.874 Y87.521 E.00371
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.012 Y87.556 E.0063
G1 X86.53 Y87.514 E.02287
G1 X87.162 Y87.334 E.02897
G1 X87.373 Y87.2 E.01103
; LINE_WIDTH: 0.45252
G1 F4813.599
G1 X87.475 Y87.024 E.00801
; LINE_WIDTH: 0.4786
G1 F4518.179
G1 X87.492 Y86.745 E.01173
; LINE_WIDTH: 0.51296
G1 F4180.184
G1 X87.51 Y86.466 E.01268
G1 X87.887 Y86.466 E.01711
G1 X87.987 Y86.43 E.00481
; LINE_WIDTH: 0.48925
G1 F4407.714
G1 X88.092 Y86.335 E.00608
; LINE_WIDTH: 0.45097
G1 F4832.377
G1 X88.153 Y86.281 E.00319
; WIPE_START
G1 X88.115 Y86.423 E-.05591
G1 X88.032 Y86.605 E-.07602
G1 X87.853 Y87.045 E-.18038
G1 X87.757 Y87.302 E-.10446
G1 X87.6 Y87.522 E-.10268
G1 X87.443 Y87.742 E-.10269
G1 X87.212 Y88.022 E-.13786
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.787 Y86.412 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.58437
G1 F3617.727
M204 S15000
G3 X85.754 Y86.355 I-.062 J-.002 E.01683
; WIPE_START
G1 X85.688 Y86.355 E-.152
G1 X85.655 Y86.412 E-.152
G1 X85.688 Y86.47 E-.152
G1 X85.754 Y86.47 E-.152
G1 X85.787 Y86.412 E-.152
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.034 Y83.821 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.883 Y83.829 E.0051
G1 X86.764 Y83.277 E.01894
M204 S10000
G1 X86.396 Y83.178 F42000
; LINE_WIDTH: 0.39499
G1 F5624.89
M204 S15000
G1 X85.067 Y83.178 E.04478
G1 X85.149 Y83.009 E.00631
G1 X85.096 Y82.902 E.00403
; LINE_WIDTH: 0.39432
G1 F5635.953
G1 X84.936 Y82.816 E.0061
; LINE_WIDTH: 0.39499
G1 F5624.89
G1 X85.32 Y82.837 E.01293
G1 X86.465 Y82.817 E.0386
; LINE_WIDTH: 0.394
G1 F5641.252
G1 X86.376 Y82.86 E.00331
; LINE_WIDTH: 0.39499
G1 F5624.89
G1 X86.278 Y83.009 E.00602
G1 X86.361 Y83.129 E.0049
; WIPE_START
G1 X85.067 Y83.178 E-.49222
G1 X85.149 Y83.009 E-.07114
G1 X85.096 Y82.902 E-.04539
G1 X84.936 Y82.816 E-.06891
G1 X85.153 Y82.828 E-.08234
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.936 Y82.816 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.42253
G1 F5204.945
M204 S15000
G1 X84.781 Y82.782 E.0058
G1 X84.76 Y82.666 E.00431
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.761 Y81.275 E.04668
; LINE_WIDTH: 0.41589
G1 F5300.354
G1 X84.799 Y81.144 E.0049
G1 X84.924 Y81.112 E.0046
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.503 Y81.112 E.05303
; LINE_WIDTH: 0.41307
G1 F5341.94
G1 X86.635 Y81.153 E.00487
G1 X86.667 Y81.276 E.00451
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.667 Y82.666 E.04667
; LINE_WIDTH: 0.42267
G1 F5202.97
G1 X86.647 Y82.782 E.00431
G1 X86.465 Y82.817 E.00676
; WIPE_START
G1 X86.647 Y82.782 E-.07046
G1 X86.667 Y82.666 E-.04491
G1 X86.667 Y81.276 E-.52825
G1 X86.635 Y81.153 E-.04833
G1 X86.503 Y81.112 E-.05218
G1 X86.462 Y81.112 E-.01588
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.631 Y83.342 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.599 Y83.72 E.01273
G1 X84.545 Y83.829 E.00409
G1 X84.393 Y83.821 E.0051
; WIPE_START
G1 X84.545 Y83.829 E-.17677
G1 X84.599 Y83.72 E-.14176
G1 X84.631 Y83.342 E-.44147
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z3.15 F4000
            G39.3 S1
            G0 Z3.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z2.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
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
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z5.75 F1200

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
M73 E24
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z5.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
M73 P27 R67
G1 Z2.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
M73 P27 R66
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
M73 P28 R66
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #12
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X86.574 Y86.79 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.37449
; LAYER_HEIGHT: 0.25
G1 F5984.291
M204 S15000
G1 X86.725 Y86.514 E.00996
; LINE_WIDTH: 0.34674
G1 F6550.889
G1 X86.968 Y86.193 E.01166
; LINE_WIDTH: 0.3423
G1 F6651.654
G1 X87.065 Y86.015 E.00578
G1 X87.079 Y86.426 E.01173
; LINE_WIDTH: 0.37227
G1 F6025.987
G1 X87.018 Y86.586 E.00539
; LINE_WIDTH: 0.40224
G1 F5507.903
G1 X86.957 Y86.746 E.0059
G1 X87.052 Y86.852 E.00491
G1 X86.858 Y86.958 E.00761
G1 X86.424 Y87.066 E.01539
G1 X86.545 Y86.843 E.00876
; WIPE_START
G1 X86.725 Y86.514 E-.14231
G1 X86.968 Y86.193 E-.15308
G1 X87.065 Y86.015 E-.07703
G1 X87.079 Y86.426 E-.15643
G1 X87.018 Y86.586 E-.06509
G1 X86.957 Y86.746 E-.06509
G1 X87.052 Y86.852 E-.0542
G1 X86.944 Y86.911 E-.04678
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.013 Y87.058 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.40874
G1 F5407.08
M204 S15000
G1 X84.801 Y87.033 E.00748
G1 X84.393 Y86.892 E.01515
G1 X84.466 Y86.743 E.00581
G1 X84.415 Y86.627 E.00444
; LINE_WIDTH: 0.376505
G1 F5946.942
G1 X84.364 Y86.511 E.00403
; LINE_WIDTH: 0.34427
G1 F6606.565
G1 X84.363 Y86.018 E.01415
; LINE_WIDTH: 0.35164
G1 F6443.169
G1 X84.697 Y86.502 E.01729
; LINE_WIDTH: 0.38019
G1 F5879.831
G1 X84.855 Y86.78 E.01031
; LINE_WIDTH: 0.40874
G1 F5407.08
G1 X84.983 Y87.006 E.0091
; WIPE_START
G1 X84.801 Y87.033 E-.06995
G1 X84.393 Y86.892 E-.16416
G1 X84.466 Y86.743 E-.06298
G1 X84.415 Y86.627 E-.04807
G1 X84.364 Y86.511 E-.04807
G1 X84.363 Y86.018 E-.18739
G1 X84.631 Y86.407 E-.17937
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.009 Y83.581 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.953 Y83.121 E.01557
; WIPE_START
G1 X87.009 Y83.581 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.418 Y83.581 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.475 Y83.12 E.01559
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 12/37
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.418 Y83.581 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.96 Y83.114 Z3 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X87.015 Y83.575 E.01557
; WIPE_START
G1 X86.96 Y83.114 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.412 Y83.575 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.468 Y83.114 E.01559
M204 S10000
G1 X84.777 Y82.772 F42000
; LINE_WIDTH: 0.41603
G1 F5298.306
M204 S15000
G1 X84.76 Y82.666 E.00386
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.761 Y81.276 E.04667
; LINE_WIDTH: 0.41601
G1 F5298.598
G1 X84.8 Y81.144 E.00491
G1 X84.924 Y81.112 E.00459
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.503 Y81.112 E.05303
; LINE_WIDTH: 0.39853
G1 F5567.154
G1 X86.578 Y81.12 E.00256
; LINE_WIDTH: 0.40009
G1 F5542.085
G1 X86.658 Y81.198 E.00381
G1 X86.667 Y81.276 E.00268
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.667 Y82.666 E.04667
; LINE_WIDTH: 0.41623
G1 F5295.383
G1 X86.65 Y82.772 E.00386
G1 X86.503 Y82.81 E.00542
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.924 Y82.81 E.05303
; LINE_WIDTH: 0.41603
G1 F5298.306
G1 X84.835 Y82.787 E.00326
; WIPE_START
G1 X84.76 Y82.666 E-.05428
G1 X84.761 Y81.276 E-.52825
G1 X84.8 Y81.144 E-.05219
G1 X84.924 Y81.112 E-.04874
G1 X85.125 Y81.112 E-.07655
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.009 Y86.296 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.50787
G1 F4227.027
M204 S15000
G1 X86.923 Y86.316 E.00401
; LINE_WIDTH: 0.46732
G1 F4641.381
G1 X86.836 Y86.337 E.00365
; LINE_WIDTH: 0.42779
G1 F5131.769
G1 X86.069 Y86.337 E.0283
; LINE_WIDTH: 0.43151
G1 F5081.247
G1 X85.391 Y86.336 E.02532
; LINE_WIDTH: 0.43598
G1 F5021.84
G1 X85.549 Y86.16 E.00894
G1 X85.547 Y85.75 E.01548
; LINE_WIDTH: 0.4004
G1 F5537.131
G1 X85.88 Y85.75 E.01142
; LINE_WIDTH: 0.40903
G1 F5402.668
G1 X85.891 Y86.14 E.0137
; LINE_WIDTH: 0.42779
G1 F5131.769
G1 X86.029 Y86.293 E.00759
M204 S10000
G1 X85.391 Y86.336 F42000
; LINE_WIDTH: 0.43151
G1 F5081.247
M204 S15000
G1 X85.358 Y86.338 E.00122
; LINE_WIDTH: 0.42957
G1 F5107.47
G1 X84.592 Y86.338 E.02845
; LINE_WIDTH: 0.46846
G1 F4628.625
G1 X84.506 Y86.319 E.00359
; LINE_WIDTH: 0.50735
G1 F4231.872
G1 X84.421 Y86.3 E.00392
; WIPE_START
G1 X84.506 Y86.319 E-.06831
G1 X84.592 Y86.338 E-.06831
G1 X85.358 Y86.338 E-.5979
G1 X85.391 Y86.336 E-.02548
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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




; LAYER_HEIGHT: 0.250000
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
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E23
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
M73 P29 R65
G1 X-3.5 F18000
M73 P29 R64
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
M73 P30 R64
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
G1 Z6
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z3
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
M73 P30 R63
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
M73 P31 R63
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #13
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F4231.872
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X87.041 Y83.815 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.889 Y83.822 E.0051
G1 X86.779 Y83.275 E.01873
G1 X86.407 Y83.175 E.01293
G1 X85.02 Y83.175 E.04655
G1 X84.649 Y83.275 E.01293
G1 X84.593 Y83.713 E.01483
G1 X84.538 Y83.822 E.00409
G1 X84.387 Y83.815 E.0051
; WIPE_START
G1 X84.538 Y83.822 E-.0577
G1 X84.593 Y83.713 E-.04628
G1 X84.649 Y83.275 E-.16784
G1 X85.02 Y83.175 E-.14639
G1 X85.92 Y83.175 E-.34178
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.116 Y85.908 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.43003
G1 F5101.228
M204 S15000
G1 X84.729 Y85.909 E.01439
G1 X84.55 Y85.8 E.00775
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.439 Y85.581 E.00826
G1 X84.29 Y85.571 E.00503
; WIPE_START
G1 X84.439 Y85.581 E-.11487
G1 X84.55 Y85.8 E-.18856
G1 X84.729 Y85.909 E-.15977
G1 X85.116 Y85.908 E-.2968
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.138 Y85.571 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.996 Y85.58 E.00476
G1 X86.933 Y85.738 E.00573
; LINE_WIDTH: 0.42999
G1 F5101.77
G1 X86.698 Y85.909 E.01078
G1 X86.311 Y85.908 E.01438
; WIPE_START
G1 X86.698 Y85.909 E-.29719
G1 X86.933 Y85.738 E-.22275
G1 X86.996 Y85.58 E-.13109
G1 X87.138 Y85.571 E-.10897
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.177 Y87.364 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X87.245 Y87.365 E.13522
M73 P31 R62
G3 X86.781 Y88.016 I-3.211 J-1.795 E.03528
G1 X86.177 Y88.6 E.03703
G1 X85.716 Y88.937 E.02517
G3 X84.208 Y87.415 I2.602 J-4.086 E.09523
M204 S10000
G1 X83.994 Y86.917 F42000
; FEATURE: Outer wall
G1 F4301.653
M204 S15000
G1 X87.787 Y86.919 E.16718
G1 X88.022 Y86.811 E.01137
G3 X86.764 Y88.68 I-4.771 J-1.851 E.10011
G1 X86.146 Y89.181 E.03508
G1 X85.711 Y89.44 E.02233
G3 X84.06 Y87.994 I2.423 J-4.431 E.09749
G3 X83.388 Y86.811 I6.51 J-4.482 E.06006
; LINE_WIDTH: 0.457125
G1 F4758.659
G1 X83.266 Y86.56 E.01109
G1 X83.374 Y86.718 E.00761
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X83.482 Y86.876 E.00842
G1 X83.619 Y86.917 E.00631
G1 X83.934 Y86.917 E.01387
; WIPE_START
G1 X85.934 Y86.918 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.23 Y86.372 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X88.388 Y85.705 E.02301
; LINE_WIDTH: 0.43583
G1 F5023.811
G1 X88.433 Y85.581 E.00499
; WIPE_START
G1 X88.388 Y85.705 E-.12286
G1 X88.23 Y86.372 E-.63714
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.252 Y86.528 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.40597
G1 F5449.592
M204 S15000
G1 X83.243 Y86.502 E.00096
; LINE_WIDTH: 0.43691
G1 F5009.654
G1 X83.002 Y85.586 E.03584
; WIPE_START
G1 X83.243 Y86.502 E-.73839
G1 X83.252 Y86.528 E-.02161
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.309 Y87.828 F42000
G1 E.8 F2400
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53442
G1 F3993.594
M204 S15000
G1 X85.106 Y87.828 E.05711
G2 X85.717 Y88.372 I3.118 J-2.889 E.0389
G1 X86.161 Y87.999 E.0275
G2 X86.27 Y87.874 I-.808 J-.811 E.0079
; CHANGE_LAYER
; Z_HEIGHT: 3.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 13/37
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F3993.594
G1 X86.161 Y87.999 E-.06317
G1 X85.717 Y88.372 E-.2201
G1 X85.57 Y88.259 E-.07025
G1 X85.106 Y87.828 E-.24093
G1 X85.541 Y87.828 E-.16555
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.9 Y88.279 Z3.25 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.66099
; LAYER_HEIGHT: 0.25
G1 F3161.327
M204 S15000
G1 X86.525 Y88.278 E.09749
G1 X86.337 Y88.472 E.01623
G1 X85.71 Y88.95 E.04724
G1 X85.381 Y88.718 E.02417
G1 X84.944 Y88.32 E.03545
; WIPE_START
G1 X86.525 Y88.278 E-.60108
G1 X86.337 Y88.472 E-.10283
G1 X86.219 Y88.562 E-.05609
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.776 Y87.537 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.43247
G1 F5068.37
M204 S15000
G1 X88.095 Y86.912 E.02622
; LINE_WIDTH: 0.39621
G1 F5604.858
G1 X88.369 Y86.001 E.0322
; LINE_WIDTH: 0.43071
G1 F5092.028
G1 X88.439 Y85.76 E.00933
; WIPE_START
G1 X88.369 Y86.001 E-.10011
G1 X88.095 Y86.912 E-.38006
G1 X87.776 Y87.537 E-.27984
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.974 Y87.753 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.49999
G1 F4301.653
M204 S15000
G1 X87.407 Y87.751 E.15128
G1 X87.597 Y87.698 E.00869
; LINE_WIDTH: 0.47391
G1 F4568.601
G1 X87.776 Y87.537 E.01002
; LINE_WIDTH: 0.46623
G1 F4653.643
G1 X87.638 Y87.732 E.00974
; LINE_WIDTH: 0.49999
G1 F4301.653
G3 X86.724 Y88.83 I-6.496 J-4.475 E.06307
G3 X85.709 Y89.546 I-3.002 J-3.181 E.0549
G1 X85.486 Y89.436 E.01096
G3 X83.981 Y87.981 I2.742 J-4.341 E.09292
; LINE_WIDTH: 0.4695
G1 F4617.05
G1 X83.686 Y87.576 E.02056
G1 X83.83 Y87.665 E.00694
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X83.923 Y87.722 E.0048
M204 S10000
G1 X83.652 Y87.536 F42000
; LINE_WIDTH: 0.42977
G1 F5104.754
M204 S15000
G1 X83.423 Y87.121 E.01761
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X83.224 Y86.619 E.01812
; LINE_WIDTH: 0.43645
G1 F5015.674
G1 X82.989 Y85.758 E.03373
; WIPE_START
G1 X83.224 Y86.619 E-.35579
G1 X83.423 Y87.121 E-.21519
G1 X83.652 Y87.536 E-.18902
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.145 Y85.591 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X87.024 Y85.597 E.00408
G1 X86.885 Y85.82 E.00882
; LINE_WIDTH: 0.43005
G1 F5100.957
G1 X86.651 Y85.928 E.00956
; WIPE_START
G1 X86.885 Y85.82 E-.3048
G1 X87.024 Y85.597 E-.31112
G1 X87.145 Y85.591 E-.14408
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.78 Y85.925 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.42281
G1 F5200.997
M204 S15000
G1 X84.708 Y85.923 E.00261
; LINE_WIDTH: 0.42001
G1 F5240.747
G1 X84.543 Y85.822 E.00702
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.432 Y85.601 E.0083
G1 X84.282 Y85.591 E.00503
; WIPE_START
G1 X84.432 Y85.601 E-.17183
G1 X84.543 Y85.822 E-.28345
G1 X84.708 Y85.923 E-.22252
G1 X84.78 Y85.925 E-.0822
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.532 Y85.891 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45111
G1 F4830.675
M204 S15000
G1 X85.908 Y85.886 E.01475
; WIPE_START
G1 X85.532 Y85.891 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.38 Y83.808 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.532 Y83.816 E.0051
G1 X84.587 Y83.707 E.00408
G1 X84.634 Y83.282 E.01437
G1 X84.711 Y83.267 E.00263
G1 X86.716 Y83.267 E.06731
G1 X86.793 Y83.282 E.00263
G1 X86.841 Y83.715 E.01465
G1 X86.915 Y83.816 E.00418
G1 X87.047 Y83.808 E.00442
; WIPE_START
G1 X86.915 Y83.816 E-.05006
G1 X86.841 Y83.715 E-.04736
G1 X86.793 Y83.282 E-.16581
G1 X86.716 Y83.267 E-.02972
G1 X85.487 Y83.267 E-.46704
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z3.65 F4000
            G39.3 S1
            G0 Z3.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z3.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
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
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z6.25 F1200

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
M73 E22
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z6.25
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y78.331 F42000
G1 Z3.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
M73 P33 R61
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
G1  Y83.331  E0.0232
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
M73 P33 R60
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


M73 P34 R60
G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #14
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X87.017 Y86.316 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.50793
; LAYER_HEIGHT: 0.25
G1 F4226.468
M204 S15000
G1 X86.93 Y86.336 E.00401
; LINE_WIDTH: 0.46738
G1 F4640.708
G1 X86.843 Y86.357 E.00365
; LINE_WIDTH: 0.45933
G1 F4732.794
G1 X86.548 Y86.341 E.01181
; LINE_WIDTH: 0.49183
G1 F4381.761
G1 X86.254 Y86.325 E.01276
G1 X86.278 Y86.107 E.0095
; LINE_WIDTH: 0.44274
G1 F4934.591
G1 X86.302 Y85.888 E.00843
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.268 Y85.732 E.00539
M204 S10000
G1 X86.254 Y86.325 F42000
; LINE_WIDTH: 0.49183
G1 F4381.761
M204 S15000
G1 X85.94 Y86.345 E.01362
; LINE_WIDTH: 0.49299
G1 F4370.192
G1 X85.173 Y86.326 E.03327
G1 X85.149 Y86.107 E.00955
; LINE_WIDTH: 0.44332
G1 F4927.246
G1 X85.125 Y85.888 E.00847
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.159 Y85.738 E.00517
M204 S10000
G1 X84.413 Y86.319 F42000
; LINE_WIDTH: 0.50737
G1 F4231.685
M204 S15000
G1 X84.498 Y86.339 E.00392
; LINE_WIDTH: 0.46849
G1 F4628.291
G1 X84.584 Y86.358 E.00359
; LINE_WIDTH: 0.4613
G1 F4709.923
G1 X84.879 Y86.342 E.01188
; LINE_WIDTH: 0.49299
G1 F4370.192
G1 X85.173 Y86.326 E.0128
; WIPE_START
G1 X84.879 Y86.342 E-.29302
G1 X84.584 Y86.358 E-.29303
G1 X84.498 Y86.339 E-.08697
G1 X84.413 Y86.319 E-.08697
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.406 Y83.568 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.463 Y83.105 E.01567
G1 X84.699 Y83.076 E.00798
G3 X86.903 Y83.093 I.797 J39.52 E.07402
G1 X86.969 Y83.111 E.00227
G1 X87.021 Y83.568 E.01545
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 14/37
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X86.969 Y83.111 E-.17492
G1 X86.903 Y83.093 E-.02575
G1 X86.297 Y83.076 E-.2307
G1 X85.432 Y83.076 E-.32862
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.786 Y89.072 Z3.5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.765 Y89.109 E.00143
G1 X84.701 Y89.072 E.00247
G1 X84.765 Y89.035 E.00247
; WIPE_START
G1 X84.701 Y89.072 E-.29487
G1 X84.765 Y89.109 E-.29487
G1 X84.786 Y89.072 E-.17025
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.726 Y89.072 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.705 Y89.109 E.00143
G1 X86.641 Y89.072 E.00247
G1 X86.705 Y89.035 E.00247
; WIPE_START
G1 X86.641 Y89.072 E-.29487
G1 X86.705 Y89.109 E-.29487
G1 X86.726 Y89.072 E-.17025
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.025 Y86.335 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.50781
G1 F4227.586
M204 S15000
G1 X86.954 Y86.355 E.00329
; LINE_WIDTH: 0.46863
G1 F4626.729
G1 X86.883 Y86.375 E.00301
; LINE_WIDTH: 0.46559
G1 F4660.873
G1 X86.445 Y86.357 E.01783
G1 X86.46 Y86.274 E.00345
; LINE_WIDTH: 0.42962
G1 F5106.791
G1 X86.475 Y86.19 E.00315
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.488 Y85.689 E.01682
M204 S10000
G1 X86.445 Y86.357 F42000
; LINE_WIDTH: 0.46559
G1 F4660.873
M204 S15000
G1 X86.266 Y86.365 E.00728
; LINE_WIDTH: 0.45219
G1 F4817.584
G1 X85.564 Y86.365 E.02765
; LINE_WIDTH: 0.46741
G1 F4640.371
G1 X84.982 Y86.358 E.02376
G1 X84.968 Y86.274 E.00348
; LINE_WIDTH: 0.43053
G1 F5094.46
G1 X84.953 Y86.19 E.00317
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.939 Y85.689 E.01682
M204 S10000
G1 X84.982 Y86.358 F42000
; LINE_WIDTH: 0.46741
G1 F4640.371
M204 S15000
G1 X84.863 Y86.377 E.00495
; LINE_WIDTH: 0.46829
G1 F4630.523
G1 X84.634 Y86.358 E.00939
; LINE_WIDTH: 0.50735
G1 F4231.872
G1 X84.405 Y86.339 E.01028
; WIPE_START
G1 X84.634 Y86.358 E-.30056
G1 X84.863 Y86.377 E-.30056
G1 X84.982 Y86.358 E-.15888
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.4 Y83.562 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.457 Y83.099 E.01567
G1 X84.693 Y83.069 E.00798
G3 X86.91 Y83.086 I.798 J40.455 E.07443
G1 X86.975 Y83.104 E.00227
G1 X87.027 Y83.562 E.01546
; WIPE_START
G1 X86.975 Y83.104 E-.17503
G1 X86.91 Y83.086 E-.02571
G1 X86.292 Y83.069 E-.23471
G1 X85.438 Y83.069 E-.32455
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z3.9 F4000
            G39.3 S1
            G0 Z3.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z6.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E21
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
M73 P35 R59
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
M73 P36 R59
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z6.5
M106 P1 S0

M204 S15000



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
M73 P36 R58
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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z3.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
M73 P37 R58
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
M73 P37 R57
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #15
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X88.438 Y85.926 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.42931
; LAYER_HEIGHT: 0.25
G1 F5111.005
M204 S15000
G1 X88.39 Y86.04 E.00459
; LINE_WIDTH: 0.39365
G1 F5647.059
G3 X87.665 Y87.866 I-5.853 J-1.269 E.06624
; LINE_WIDTH: 0.40853
G1 F5410.279
G1 X87.349 Y88.301 E.01886
; LINE_WIDTH: 0.45365
G1 F4800
G1 X87.25 Y88.383 E.00507
; LINE_WIDTH: 0.49877
G1 F4313.444
G1 X87.151 Y88.465 E.00564
; LINE_WIDTH: 0.54389
G1 F3916.45
G1 X87.052 Y88.547 E.00621
; LINE_WIDTH: 0.58901
G1 F3586.372
G1 X86.953 Y88.629 E.00679
G1 X86.786 Y88.613 E.00889
; LINE_WIDTH: 0.55692
G1 F3815.05
G1 X86.618 Y88.597 E.00836
; LINE_WIDTH: 0.52483
G1 F4074.876
G1 X86.502 Y88.66 E.00616
; LINE_WIDTH: 0.51568
G1 F4155.575
G1 X86.285 Y88.873 E.01387
; LINE_WIDTH: 0.49999
G1 F4301.653
G1 X86.214 Y89.05 E.0084
G1 X86.314 Y89.26 E.01025
G3 X85.739 Y89.638 I-3.295 J-4.387 E.03034
G1 X85.637 Y89.614 E.00459
G1 X85.11 Y89.266 E.02785
G1 X85.216 Y89.045 E.01078
G1 X85.142 Y88.865 E.00859
; LINE_WIDTH: 0.51078
G1 F4200.118
G1 X84.92 Y88.659 E.01365
; LINE_WIDTH: 0.51975
G1 F4119.288
G1 X84.767 Y88.596 E.00759
G1 X84.946 Y88.592 E.00821
; LINE_WIDTH: 0.51078
G1 F4200.118
G1 X85.72 Y88.586 E.03495
; LINE_WIDTH: 0.52483
G1 F4074.876
G1 X86.558 Y88.596 E.039
M204 S10000
G1 X85.788 Y89.08 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.59635
G1 F3537.866
M204 S15000
G3 X85.754 Y89.021 I-.064 J-.002 E.01759
; WIPE_START
G1 X85.687 Y89.021 E-.15198
G1 X85.653 Y89.08 E-.15201
G1 X85.687 Y89.139 E-.152
G1 X85.754 Y89.139 E-.15201
G1 X85.788 Y89.08 E-.15201
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.767 Y88.596 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.55385
G1 F3838.465
M204 S15000
G1 X84.687 Y88.614 E.00408
; LINE_WIDTH: 0.58795
G1 F3593.487
G1 X84.606 Y88.631 E.00436
; LINE_WIDTH: 0.62205
G1 F3377.903
G1 X84.525 Y88.648 E.00464
G1 X84.432 Y88.581 E.00645
; LINE_WIDTH: 0.57319
G1 F3695.577
G1 X84.338 Y88.514 E.0059
; LINE_WIDTH: 0.52433
G1 F4079.205
G1 X84.245 Y88.447 E.00534
; LINE_WIDTH: 0.47547
G1 F4551.705
G1 X84.151 Y88.38 E.00479
; LINE_WIDTH: 0.42661
G1 F5148.005
G1 X83.779 Y87.887 E.02277
; LINE_WIDTH: 0.39665
G1 F5597.668
G1 X83.488 Y87.371 E.02004
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X83.242 Y86.782 E.02144
; LINE_WIDTH: 0.43187
G1 F5076.411
G1 X82.999 Y85.939 E.03278
; WIPE_START
G1 X83.242 Y86.782 E-.33355
G1 X83.488 Y87.371 E-.24271
G1 X83.726 Y87.793 E-.18373
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.654 Y85.914 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.535 Y85.841 E.00469
G1 X84.424 Y85.62 E.0083
G1 X84.274 Y85.61 E.00503
; WIPE_START
G1 X84.424 Y85.62 E-.21228
G1 X84.535 Y85.841 E-.35011
G1 X84.654 Y85.914 E-.19761
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.153 Y85.61 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.011 Y85.619 E.00476
G1 X86.948 Y85.778 E.00573
G1 X86.772 Y85.913 E.00747
; WIPE_START
G1 X86.948 Y85.778 E-.31601
G1 X87.011 Y85.619 E-.24242
G1 X87.153 Y85.61 E-.20157
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.258 Y85.912 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45359
G1 F4800.72
M204 S15000
G1 X86.172 Y85.91 E.03609
; WIPE_START
G1 X85.258 Y85.912 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.053 Y83.802 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.921 Y83.809 E.00442
G1 X86.847 Y83.709 E.00418
G1 X86.799 Y83.275 E.01465
G1 X86.722 Y83.26 E.00263
G1 X84.705 Y83.26 E.06773
G1 X84.628 Y83.275 E.00263
G1 X84.581 Y83.701 E.01437
G1 X84.526 Y83.809 E.00408
G1 X84.374 Y83.802 E.0051
; CHANGE_LAYER
; Z_HEIGHT: 3.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 15/37
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.526 Y83.809 E-.05777
G1 X84.581 Y83.701 E-.04622
G1 X84.628 Y83.275 E-.16267
G1 X84.705 Y83.26 E-.02975
G1 X85.925 Y83.26 E-.46359
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.32 Y88.675 Z3.75 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G3 X83.17 Y86.621 I3.979 J-3.578 E.07971
; LINE_WIDTH: 0.43355
G1 F5053.962
G1 X83.016 Y86.113 E.01989
; WIPE_START
G1 X83.17 Y86.621 E-.20147
G1 X83.419 Y87.291 E-.27178
G1 X83.756 Y87.926 E-.27309
G1 X83.776 Y87.955 E-.01365
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.264 Y89.371 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.41826
G1 F5265.901
M204 S15000
G1 X85.315 Y89.38 E.00189
; LINE_WIDTH: 0.42043
G1 F5234.746
G1 X86.11 Y89.378 E.0288
G1 X86.216 Y89.459 E.00483
G1 X85.801 Y89.725 E.01788
G1 X85.661 Y89.741 E.00511
; LINE_WIDTH: 0.41826
G1 F5265.901
G1 X85.213 Y89.469 E.01885
G1 X85.236 Y89.424 E.00181
; WIPE_START
G1 X85.315 Y89.38 E-.0344
G1 X86.11 Y89.378 E-.30215
G1 X86.216 Y89.459 E-.05064
G1 X85.801 Y89.725 E-.1876
G1 X85.661 Y89.741 E-.05365
G1 X85.365 Y89.561 E-.13155
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.42 Y86.109 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.42871
G1 F5119.181
M204 S15000
G1 X88.373 Y86.212 E.00419
; LINE_WIDTH: 0.39365
G1 F5647.059
G3 X87.635 Y87.987 I-6.044 J-1.473 E.06481
G1 X87.107 Y88.676 E.02913
; WIPE_START
G1 X87.635 Y87.987 E-.32978
G1 X87.94 Y87.446 E-.23589
G1 X88.137 Y86.975 E-.19433
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.817 Y85.91 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.963 Y85.776 E.00664
G1 X87.019 Y85.639 E.00498
G1 X87.161 Y85.63 E.00477
; WIPE_START
G1 X87.019 Y85.639 E-.22108
G1 X86.963 Y85.776 E-.23097
G1 X86.817 Y85.91 E-.30795
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.609 Y85.911 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.527 Y85.861 E.00321
G1 X84.416 Y85.64 E.0083
G1 X84.267 Y85.63 E.00503
; WIPE_START
G1 X84.416 Y85.64 E-.23125
G1 X84.527 Y85.861 E-.38136
G1 X84.609 Y85.911 E-.14739
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.143 Y85.931 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45301
G1 F4807.692
M204 S15000
G1 X86.252 Y85.931 E.00431
; WIPE_START
G1 X86.143 Y85.931 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.175 Y85.931 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45299
G1 F4807.933
M204 S15000
G1 X85.284 Y85.931 E.00432
; WIPE_START
G1 X85.175 Y85.931 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.059 Y83.795 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.928 Y83.803 E.00442
G1 X86.854 Y83.702 E.00418
G1 X86.805 Y83.269 E.01465
G1 X86.729 Y83.254 E.00262
G1 X84.699 Y83.254 E.06815
G1 X84.622 Y83.269 E.00263
G1 X84.575 Y83.694 E.01437
G1 X84.52 Y83.803 E.00408
G1 X84.368 Y83.795 E.0051
; WIPE_START
G1 X84.52 Y83.803 E-.05777
G1 X84.575 Y83.694 E-.04623
G1 X84.622 Y83.269 E-.16267
G1 X84.699 Y83.254 E-.02975
G1 X85.919 Y83.254 E-.46359
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z4.15 F4000
            G39.3 S1
            G0 Z4.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z3.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #11
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z6.75 F1200

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
M73 E20
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z6.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z3.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
M73 P39 R56
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
M73 P39 R55
G1  X144.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
M73 P40 R55
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #16
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X87.032 Y86.357 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.50967
; LAYER_HEIGHT: 0.25
G1 F4210.342
M204 S15000
G1 X86.961 Y86.377 E.00329
; LINE_WIDTH: 0.47103
G1 F4600.125
G1 X86.891 Y86.396 E.00301
; LINE_WIDTH: 0.46365
G1 F4682.927
G2 X86.469 Y86.383 I-.27 J1.926 E.01712
; LINE_WIDTH: 0.45689
G1 F4761.432
G1 X85.891 Y86.385 E.02301
; LINE_WIDTH: 0.49093
G1 F4390.779
G1 X85.802 Y86.365 E.00392
; LINE_WIDTH: 0.52967
G1 F4033.444
G1 X85.714 Y86.346 E.00427
G1 X85.714 Y86.167 E.0084
; LINE_WIDTH: 0.486697
G1 F4433.702
G1 X85.714 Y85.988 E.00764
; LINE_WIDTH: 0.443724
G1 F4922.152
G1 X85.714 Y85.809 E.00689
M204 S10000
G1 X85.714 Y86.346 F42000
; LINE_WIDTH: 0.52967
G1 F4033.444
M204 S15000
G1 X85.625 Y86.365 E.00427
; LINE_WIDTH: 0.49067
G1 F4393.392
G1 X85.536 Y86.384 E.00392
; LINE_WIDTH: 0.46155
G1 F4707.036
G1 X84.908 Y86.379 E.02532
G1 X84.794 Y86.396 E.00463
; LINE_WIDTH: 0.46735
G1 F4641.044
G1 X84.594 Y86.375 E.00821
; LINE_WIDTH: 0.50785
G1 F4227.213
G1 X84.394 Y86.355 E.00901
; WIPE_START
G1 X84.594 Y86.375 E-.1151
G1 X84.794 Y86.396 E-.11509
G1 X84.908 Y86.379 E-.06579
G1 X85.536 Y86.384 E-.36004
G1 X85.625 Y86.365 E-.05199
G1 X85.714 Y86.346 E-.05199
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.034 Y83.555 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.981 Y83.097 E.01547
G1 X86.916 Y83.08 E.00227
G2 X84.687 Y83.063 I-1.43 J41.365 E.07484
G1 X84.451 Y83.092 E.00798
G1 X84.394 Y83.555 E.01567
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 16/37
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.451 Y83.092 E-.17735
G1 X84.687 Y83.063 E-.0903
G1 X85.982 Y83.063 E-.49235
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.095 Y86.164 Z4 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.42533
; LAYER_HEIGHT: 0.25
G1 F5165.734
M204 S15000
G1 X87.084 Y86.416 E.00924
G1 X86.942 Y86.449 E.00535
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.486 Y86.45 E.08246
; LINE_WIDTH: 0.42521
G1 F5167.403
G1 X84.347 Y86.419 E.00521
G1 X84.333 Y86.164 E.00937
; WIPE_START
G1 X84.347 Y86.419 E-.09709
G1 X84.486 Y86.45 E-.05399
G1 X86.088 Y86.449 E-.60891
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.765 Y85.782 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X85.663 Y85.782 E.00342
; WIPE_START
G1 X85.765 Y85.782 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.388 Y83.548 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.449 Y83.084 E.01573
G1 X84.68 Y83.056 E.00783
G1 X86.747 Y83.056 E.06937
G1 X86.99 Y83.097 E.00829
G1 X87.04 Y83.548 E.01525
; WIPE_START
G1 X86.99 Y83.097 E-.17259
G1 X86.747 Y83.056 E-.09385
G1 X85.448 Y83.056 E-.49356
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #12
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z7 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E19
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
M73 P41 R54
G1 E9.54599 F199
M73 P41 R53
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
M73 P42 R53
G1 X-13.5 F3000
M400
G1 Z7
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z4
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
M73 P42 R52
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


M73 P43 R52
G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #17
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.177 Y88.558 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G3 X83.39 Y87.275 I4.708 J-3.774 E.05067
; LINE_WIDTH: 0.40747
G1 F5426.488
G1 X83.16 Y86.682 E.02223
; LINE_WIDTH: 0.43973
G1 F4973.063
G1 X83.03 Y86.284 E.01595
; WIPE_START
G1 X83.16 Y86.682 E-.15899
G1 X83.39 Y87.275 E-.24177
G1 X83.647 Y87.79 E-.21863
G1 X83.845 Y88.103 E-.14061
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.126 Y89.599 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X85.831 Y89.793 E.01184
; LINE_WIDTH: 0.40055
G1 F5534.736
G1 X85.625 Y89.807 E.00706
G1 X85.299 Y89.596 E.01331
; WIPE_START
G1 X85.625 Y89.807 E-.31172
G1 X85.831 Y89.793 E-.16542
G1 X86.126 Y89.599 E-.28286
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.248 Y88.559 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X87.698 Y87.929 E.02598
G2 X88.188 Y86.89 I-4.671 J-2.84 E.03865
; LINE_WIDTH: 0.44085
G1 F4958.678
G1 X88.393 Y86.281 E.02457
; WIPE_START
G1 X88.188 Y86.89 E-.24422
G1 X87.971 Y87.422 E-.21825
G1 X87.698 Y87.929 E-.21904
G1 X87.578 Y88.097 E-.07849
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.168 Y85.65 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X87.047 Y85.656 E.00409
G2 X86.751 Y86.054 I5.637 J4.496 E.01665
G1 X86.473 Y86.102 E.00948
; LINE_WIDTH: 0.43138
G1 F5082.996
G1 X86.407 Y86.075 E.00265
; LINE_WIDTH: 0.46911
G1 F4621.384
G1 X86.341 Y86.049 E.00291
; LINE_WIDTH: 0.50684
G1 F4236.634
G1 X86.275 Y86.023 E.00317
; LINE_WIDTH: 0.54457
G1 F3911.024
G2 X86.149 Y86.023 I-.063 J.063 E.0068
; LINE_WIDTH: 0.50684
G1 F4236.634
G1 X86.088 Y86.049 E.00294
; LINE_WIDTH: 0.46911
M73 P43 R51
G1 F4621.384
G1 X86.028 Y86.075 E.00269
; LINE_WIDTH: 0.43138
G1 F5082.996
G1 X85.968 Y86.101 E.00245
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.484 Y86.102 E.01624
; LINE_WIDTH: 0.43138
G1 F5082.996
G1 X85.423 Y86.076 E.00247
; LINE_WIDTH: 0.46911
G1 F4621.384
G1 X85.363 Y86.049 E.00272
; LINE_WIDTH: 0.50684
G1 F4236.634
G1 X85.302 Y86.023 E.00296
; LINE_WIDTH: 0.54457
G1 F3911.024
G2 X85.181 Y86.023 I-.061 J.057 E.00658
; LINE_WIDTH: 0.50684
G1 F4236.634
G1 X85.12 Y86.049 E.00294
; LINE_WIDTH: 0.46911
G1 F4621.384
G1 X85.06 Y86.075 E.0027
; LINE_WIDTH: 0.43138
G1 F5082.996
G1 X85 Y86.101 E.00245
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.699 Y86.09 E.01011
G2 X84.52 Y85.881 I-.356 J.124 E.00946
G1 X84.409 Y85.66 E.0083
G1 X84.259 Y85.65 E.00503
; WIPE_START
G1 X84.409 Y85.66 E-.05699
G1 X84.52 Y85.881 E-.09396
G1 X84.616 Y85.953 E-.04577
G1 X84.699 Y86.09 E-.06065
G1 X85 Y86.101 E-.11439
G1 X85.06 Y86.075 E-.02498
G1 X85.12 Y86.049 E-.02498
G1 X85.181 Y86.023 E-.02498
G1 X85.241 Y85.997 E-.02498
G1 X85.302 Y86.023 E-.02518
G1 X85.363 Y86.049 E-.02517
G1 X85.423 Y86.076 E-.02518
G1 X85.484 Y86.102 E-.02517
G1 X85.968 Y86.101 E-.18383
G1 X85.977 Y86.097 E-.00379
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.065 Y83.788 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.934 Y83.796 E.00443
G1 X86.86 Y83.695 E.00419
G1 X86.812 Y83.262 E.01463
G1 X86.735 Y83.247 E.00264
G1 X84.692 Y83.247 E.06856
G1 X84.616 Y83.262 E.00263
G1 X84.568 Y83.687 E.01437
G1 X84.514 Y83.796 E.00408
G1 X84.362 Y83.788 E.0051
; CHANGE_LAYER
; Z_HEIGHT: 4.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 17/37
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.514 Y83.796 E-.05776
G1 X84.568 Y83.687 E-.04623
G1 X84.616 Y83.262 E-.16267
G1 X84.692 Y83.247 E-.02975
G1 X85.912 Y83.247 E-.46359
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.071 Y83.782 Z4.25 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.94 Y83.789 E.00443
G1 X86.866 Y83.689 E.00419
G1 X86.818 Y83.256 E.01463
G1 X86.741 Y83.241 E.00264
G1 X86.084 Y83.241 E.02207
; LINE_WIDTH: 0.43911
G1 F4981.062
G1 X85.891 Y83.116 E.00871
G1 X85.537 Y83.116 E.01349
G1 X85.347 Y83.241 E.00864
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.606 Y83.262 E.02487
G1 X84.562 Y83.681 E.01414
G1 X84.508 Y83.79 E.00408
G1 X84.356 Y83.782 E.0051
; WIPE_START
G1 X84.508 Y83.79 E-.05777
G1 X84.562 Y83.681 E-.04623
G1 X84.606 Y83.262 E-.1601
G1 X85.347 Y83.241 E-.28153
G1 X85.537 Y83.116 E-.08622
G1 X85.874 Y83.116 E-.12815
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X88.284 Y86.685 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.45121
G1 F4829.46
M204 S15000
G1 X88.095 Y87.248 E.02332
G1 X87.996 Y87.419 E.00775
; LINE_WIDTH: 0.42243
G1 F5206.356
G1 X87.897 Y87.59 E.00719
; LINE_WIDTH: 0.39365
G1 F5647.059
G3 X87.25 Y88.594 I-5.075 J-2.56 E.04019
; WIPE_START
G1 X87.6 Y88.109 E-.22724
G1 X87.897 Y87.59 E-.22749
G1 X87.996 Y87.419 E-.07501
G1 X88.095 Y87.248 E-.07502
G1 X88.225 Y86.861 E-.15524
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.176 Y85.669 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.045 Y85.677 E.00441
G1 X86.982 Y85.794 E.00445
G1 X86.985 Y86.348 E.01862
G1 X86.903 Y86.365 E.00281
G1 X84.524 Y86.365 E.07987
G3 X84.43 Y86.296 I-.017 J-.075 E.00445
G1 X84.445 Y85.794 E.01686
G1 X84.402 Y85.678 E.00413
G1 X84.251 Y85.669 E.00506
M204 S10000
G1 X85.106 Y85.836 F42000
G1 F5647.059
M204 S15000
G1 X86.291 Y85.84 E.03978
G1 X86.393 Y85.827 E.00347
G1 X86.393 Y85.901 E.00247
G1 X86.457 Y85.864 E.00247
; WIPE_START
G1 X86.393 Y85.901 E-.03898
G1 X86.393 Y85.827 E-.03898
G1 X86.291 Y85.84 E-.05468
G1 X85.106 Y85.836 E-.62736
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.182 Y88.595 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G3 X83.635 Y87.799 I3.645 J-3.093 E.03248
; LINE_WIDTH: 0.42081
G1 F5229.328
G1 X83.485 Y87.524 E.01135
; LINE_WIDTH: 0.44797
G1 F4869.142
G1 X83.334 Y87.25 E.01219
G1 X83.14 Y86.688 E.02316
; WIPE_START
G1 X83.334 Y87.25 E-.22603
G1 X83.485 Y87.524 E-.11898
G1 X83.635 Y87.799 E-.11898
G1 X83.965 Y88.32 E-.23424
G1 X84.066 Y88.447 E-.06178
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.248 Y89.61 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39529
G1 F5619.951
M204 S15000
G1 X85.682 Y89.873 E.01713
G1 X85.881 Y89.816 E.00698
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.177 Y89.609 E.01214
; WIPE_START
G1 X85.881 Y89.816 E-.2554
G1 X85.682 Y89.873 E-.14603
G1 X85.248 Y89.61 E-.35857
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z4.65 F4000
            G39.3 S1
            G0 Z4.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z4.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #13
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z7.25 F1200

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
M73 E18
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z7.25
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y78.331 F42000
G1 Z4.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
M73 P44 R50
G1  X144.786  E1.5774 F2473
M73 P45 R50
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
G1  Y83.331  E0.0232
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #18
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
M73 P45 R49
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
M73 P46 R49
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.381 Y83.542 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.443 Y83.077 E.01573
G1 X85.222 Y83.05 E.02618
M204 S10000
G1 X86.206 Y83.05 F42000
G1 F5647.059
M204 S15000
G1 X86.753 Y83.05 E.01837
G1 X86.996 Y83.09 E.00829
G1 X87.046 Y83.542 E.01525
; WIPE_START
G1 X86.996 Y83.09 E-.27659
G1 X86.753 Y83.05 E-.15025
G1 X86.206 Y83.05 E-.33316
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.18 Y85.909 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.178 Y86.517 E.02043
G1 X86.916 Y86.556 E.00888
G1 X84.511 Y86.554 E.08074
G1 X84.249 Y86.517 E.0089
G1 X84.247 Y85.909 E.02042
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 18/37
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.249 Y86.517 E-.23115
G1 X84.511 Y86.554 E-.10071
G1 X85.638 Y86.555 E-.42813
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.868 Y89.087 Z4.5 F42000
G1 E.8 F2400
; FEATURE: Overhang wall
; LINE_WIDTH: 0.44103
; LAYER_HEIGHT: 0.25
M106 S229.5
G1 F4956.374
M204 S15000
G1 X86.695 Y89.253 E.00914
M106 S102
; WIPE_START
G1 X86.868 Y89.087 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.24 Y85.928 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X84.241 Y86.537 E.02042
G1 X84.504 Y86.574 E.0089
G1 X86.924 Y86.576 E.08125
G1 X87.185 Y86.537 E.00888
G1 X87.188 Y85.928 E.02044
; WIPE_START
G1 X87.185 Y86.537 E-.2313
G1 X86.924 Y86.576 E-.10053
G1 X85.797 Y86.575 E-.42817
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.375 Y83.535 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.436 Y83.071 E.01572
G1 X84.82 Y83.046 E.01293
; WIPE_START
G1 X84.436 Y83.071 E-.34298
G1 X84.375 Y83.535 E-.41702
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.607 Y83.046 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87 Y83.078 E.01326
G1 X87.052 Y83.535 E.01545
; WIPE_START
G1 X87 Y83.078 E-.40898
G1 X86.607 Y83.046 E-.35102
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z4.9 F4000
            G39.3 S1
            G0 Z4.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #14
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z7.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E17
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


M629

M400
M106 P1 S60
M109 S255
M73 P47 R48
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
G1 Z7.5
M106 P1 S0

M204 S15000



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
M73 P48 R48
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z4.5
M73 P48 R47
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
M73 P49 R47
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #19
M204 S15000
M73 P49 R46
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X86.362 Y89.503 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.009 Y89.771 E.01487
; LINE_WIDTH: 0.39729
G1 F5587.242
G1 X85.763 Y89.904 E.00952
G1 X85.629 Y89.888 E.00458
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.068 Y89.507 E.02277
M204 S10000
G1 X84.395 Y88.866 F42000
; LINE_WIDTH: 0.43027
G1 F5097.977
M204 S15000
G1 X84.107 Y88.52 E.01676
; LINE_WIDTH: 0.46689
G1 F4646.211
G1 X83.818 Y88.174 E.01839
G1 X83.468 Y87.535 E.02972
; WIPE_START
G1 X83.818 Y88.174 E-.3397
G1 X84.107 Y88.52 E-.21015
G1 X84.395 Y88.866 E-.21015
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.974 Y87.509 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.43641
G1 F5016.198
M204 S15000
G1 X87.904 Y87.657 E.00622
; LINE_WIDTH: 0.46729
G1 F4641.718
G1 X87.611 Y88.174 E.02425
G1 X87.528 Y88.269 E.00516
; LINE_WIDTH: 0.43047
G1 F5095.271
G1 X87.444 Y88.363 E.0047
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X87.124 Y88.76 E.0171
; WIPE_START
G1 X87.444 Y88.363 E-.25469
G1 X87.528 Y88.269 E-.06311
G1 X87.611 Y88.174 E-.06311
G1 X87.904 Y87.657 E-.29677
G1 X87.974 Y87.509 E-.08232
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.184 Y85.689 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.052 Y85.696 E.00441
G1 X86.99 Y85.813 E.00445
G1 X86.993 Y86.368 E.01862
G1 X86.911 Y86.384 E.00281
G1 X84.516 Y86.384 E.08038
G3 X84.422 Y86.315 I-.017 J-.075 E.00445
G1 X84.437 Y85.813 E.01686
G1 X84.394 Y85.698 E.00413
G1 X84.244 Y85.689 E.00506
; WIPE_START
G1 X84.394 Y85.698 E-.05731
G1 X84.437 Y85.813 E-.0467
G1 X84.422 Y86.315 E-.19079
G1 X84.465 Y86.378 E-.02884
G1 X84.516 Y86.384 E-.01987
G1 X85.612 Y86.384 E-.41649
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.975 Y85.859 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G3 X85.452 Y85.859 I-.262 J-7.122 E.01758
; WIPE_START
G1 X85.975 Y85.859 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.267 Y83.11 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.43913
G1 F4980.803
M204 S15000
G1 X85.138 Y83.11 E.00492
G1 X84.958 Y83.234 E.00832
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.6 Y83.254 E.01203
G1 X84.556 Y83.674 E.01417
G1 X84.501 Y83.783 E.00409
G1 X84.35 Y83.775 E.0051
; WIPE_START
G1 X84.501 Y83.783 E-.08232
G1 X84.556 Y83.674 E-.06607
G1 X84.6 Y83.254 E-.22875
G1 X84.958 Y83.234 E-.19428
G1 X85.138 Y83.11 E-.11856
G1 X85.267 Y83.11 E-.07003
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.078 Y83.775 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.946 Y83.783 E.00443
G1 X86.872 Y83.682 E.00419
G1 X86.827 Y83.254 E.01445
G1 X86.477 Y83.234 E.01177
; LINE_WIDTH: 0.43911
G1 F4981.062
G1 X86.289 Y83.11 E.00857
G1 X86.16 Y83.11 E.00492
; CHANGE_LAYER
; Z_HEIGHT: 4.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 19/37
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F4981.062
G1 X86.289 Y83.11 E-.0706
G1 X86.477 Y83.234 E-.12294
G1 X86.827 Y83.254 E-.19146
G1 X86.872 Y83.682 E-.23492
G1 X86.946 Y83.783 E-.0681
G1 X87.078 Y83.775 E-.07198
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X83.951 Y88.354 Z4.75 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.44379
; LAYER_HEIGHT: 0.25
G1 F4921.31
M204 S15000
G1 X84.302 Y88.823 E.02255
G1 X84.521 Y89.031 E.01165
; LINE_WIDTH: 0.41872
G1 F5259.266
G1 X84.739 Y89.24 E.0109
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X85.243 Y89.664 E.02212
G1 X85.661 Y89.929 E.0166
G1 X85.887 Y89.877 E.00779
G2 X86.771 Y89.161 I-3.237 J-4.896 E.03823
; LINE_WIDTH: 0.4288
G1 F5117.953
G1 X86.879 Y89.073 E.0052
; LINE_WIDTH: 0.46395
G1 F4679.503
G1 X86.988 Y88.984 E.00568
G1 X87.388 Y88.487 E.02584
; LINE_WIDTH: 0.42919
G1 F5112.638
G1 X87.492 Y88.336 E.0068
; WIPE_START
G1 X87.388 Y88.487 E-.06968
G1 X86.988 Y88.984 E-.24233
G1 X86.879 Y89.073 E-.05331
G1 X86.771 Y89.161 E-.05331
G1 X86.371 Y89.52 E-.20399
G1 X86.08 Y89.735 E-.13738
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.191 Y85.709 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X87.06 Y85.716 E.00441
G1 X86.998 Y85.833 E.00445
G1 X87.013 Y86.332 E.01676
; LINE_WIDTH: 0.44025
G1 F4966.374
G1 X86.781 Y86.528 E.0116
G1 X84.646 Y86.528 E.0815
G1 X84.462 Y86.404 E.00848
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.415 Y86.335 E.00279
G1 X84.429 Y85.833 E.01686
G1 X84.387 Y85.718 E.00412
G1 X84.236 Y85.709 E.00507
; WIPE_START
G1 X84.387 Y85.718 E-.05734
G1 X84.429 Y85.833 E-.04667
G1 X84.415 Y86.335 E-.19085
G1 X84.462 Y86.404 E-.03161
G1 X84.646 Y86.528 E-.08446
G1 X85.564 Y86.528 E-.34907
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.343 Y83.769 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.495 Y83.776 E.0051
G1 X84.55 Y83.667 E.00409
G1 X84.595 Y83.246 E.01425
G2 X84.901 Y83.145 I.041 J-.391 E.01116
G1 X84.9 Y83.061 E.0028
; WIPE_START
G1 X84.901 Y83.145 E-.05704
G1 X84.762 Y83.227 E-.1107
G1 X84.595 Y83.246 E-.11489
G1 X84.55 Y83.667 E-.29019
G1 X84.495 Y83.776 E-.08338
G1 X84.343 Y83.769 E-.1038
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.084 Y83.769 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.952 Y83.776 E.00443
G1 X86.878 Y83.676 E.00419
G1 X86.832 Y83.246 E.01452
G3 X86.539 Y83.158 I-.037 J-.413 E.01053
G1 X86.527 Y83.061 E.00328
; WIPE_START
G1 X86.539 Y83.158 E-.06752
G1 X86.668 Y83.227 E-.10162
G1 X86.832 Y83.246 E-.1141
G1 X86.878 Y83.676 E-.29925
G1 X86.952 Y83.776 E-.08629
G1 X87.084 Y83.769 E-.09121
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z5.15 F4000
            G39.3 S1
            G0 Z5.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z4.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #15
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z7.75 F1200

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
M73 E16
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z7.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z4.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
M73 P50 R45
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
M73 P51 R45
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
M73 P51 R44
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #20
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
M73 P52 R44
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.496 Y85.831 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.931 Y85.831 E.01463
; WIPE_START
G1 X85.496 Y85.831 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.233 Y86.552 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.232 Y85.948 E.02029
; WIPE_START
G1 X84.233 Y86.552 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.195 Y85.948 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G3 X87.192 Y86.558 I-2.131 J.293 E.02055
; WIPE_START
G1 X87.215 Y86.295 E-.32796
G1 X87.195 Y85.948 E-.43204
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.369 Y83.529 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.425 Y83.067 E.01563
G1 X84.622 Y83.042 E.00667
; WIPE_START
G1 X84.425 Y83.067 E-.22741
G1 X84.369 Y83.529 E-.53259
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.802 Y83.045 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.004 Y83.08 E.00689
G1 X87.058 Y83.53 E.01521
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 20/37
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X87.004 Y83.08 E-.52313
G1 X86.802 Y83.045 E-.23687
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.203 Y85.968 Z5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X87.198 Y86.578 E.0205
; WIPE_START
G1 X87.203 Y85.968 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.225 Y85.967 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.234 Y86.572 E.02032
; WIPE_START
G1 X84.225 Y85.967 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.363 Y83.522 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.418 Y83.061 E.01561
; WIPE_START
G1 X84.363 Y83.522 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.064 Y83.523 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.003 Y83.065 E.01552
; WIPE_START
G1 X87.064 Y83.523 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #16
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z8 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E15
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
M73 P53 R43
G1 X-3.5 F18000
M73 P53 R42
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z8
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z5
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
M73 P54 R42
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
M73 P54 R41
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #21
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
M73 P55 R41
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X86.802 Y89.165 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.42737
; LAYER_HEIGHT: 0.25
G1 F5137.536
M204 S15000
G1 X86.488 Y89.46 E.01591
; LINE_WIDTH: 0.44087
G1 F4958.422
G1 X86.068 Y89.803 E.02072
G1 X85.717 Y89.959 E.01469
; LINE_WIDTH: 0.43344
G1 F5055.426
G1 X85.558 Y89.895 E.00645
; LINE_WIDTH: 0.46657
G1 F4649.811
G1 X85.398 Y89.83 E.00701
G1 X85.038 Y89.548 E.01865
; LINE_WIDTH: 0.44533
G1 F4901.961
G1 X84.651 Y89.185 E.02054
; WIPE_START
G1 X85.038 Y89.548 E-.20185
G1 X85.398 Y89.83 E-.17383
G1 X85.558 Y89.895 E-.06534
G1 X85.717 Y89.959 E-.06533
G1 X86.068 Y89.803 E-.14597
G1 X86.288 Y89.624 E-.10768
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.858 Y86.625 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.39365
G1 F5647.059
M204 S15000
G1 X86.859 Y86.472 E.00517
G1 X87.006 Y86.411 E.00534
G1 X87.005 Y85.853 E.01874
G1 X87.068 Y85.736 E.00445
G1 X87.199 Y85.729 E.00441
; WIPE_START
G1 X87.068 Y85.736 E-.08795
G1 X87.005 Y85.853 E-.08877
G1 X87.006 Y86.411 E-.3737
G1 X86.859 Y86.472 E-.10655
G1 X86.858 Y86.625 E-.10302
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.228 Y85.729 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.379 Y85.738 E.00506
G1 X84.422 Y85.853 E.00413
G1 X84.407 Y86.355 E.01685
G2 X84.569 Y86.494 I.245 J-.12 E.00739
G1 X84.569 Y86.625 E.0044
; WIPE_START
G1 X84.569 Y86.494 E-.08848
G1 X84.455 Y86.423 E-.09124
G1 X84.407 Y86.355 E-.05624
G1 X84.422 Y85.853 E-.33913
G1 X84.379 Y85.738 E-.08304
G1 X84.228 Y85.729 E-.10187
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.768 Y83.029 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.768 Y83.148 E.00399
G1 X84.605 Y83.228 E.00611
G1 X84.544 Y83.661 E.01468
G1 X84.489 Y83.77 E.00409
G1 X84.337 Y83.762 E.0051
; WIPE_START
G1 X84.489 Y83.77 E-.11404
G1 X84.544 Y83.661 E-.09155
G1 X84.605 Y83.228 E-.32849
G1 X84.768 Y83.148 E-.13662
M73 P55 R40
G1 X84.768 Y83.029 E-.0893
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.09 Y83.762 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.938 Y83.77 E.0051
G1 X86.835 Y83.233 E.01834
G1 X86.659 Y83.164 E.00636
G1 X86.66 Y83.029 E.00451
; CHANGE_LAYER
; Z_HEIGHT: 5.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 21/37
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X86.659 Y83.164 E-.09997
G1 X86.835 Y83.233 E-.1408
G1 X86.938 Y83.77 E-.40629
G1 X87.09 Y83.762 E-.11294
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.331 Y83.756 Z5.25 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.483 Y83.763 E.0051
G1 X84.537 Y83.654 E.00409
G1 X84.595 Y83.221 E.01468
G1 X84.716 Y83.146 E.00478
G1 X84.715 Y83.014 E.00443
; WIPE_START
G1 X84.716 Y83.146 E-.10177
G1 X84.595 Y83.221 E-.10991
G1 X84.537 Y83.654 E-.3372
G1 X84.483 Y83.763 E-.09397
G1 X84.331 Y83.756 E-.11714
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.096 Y83.756 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.945 Y83.763 E.0051
G1 X86.84 Y83.224 E.01843
G1 X86.713 Y83.165 E.0047
G1 X86.713 Y83.014 E.00507
; WIPE_START
G1 X86.713 Y83.165 E-.11564
G1 X86.84 Y83.224 E-.10722
G1 X86.945 Y83.763 E-.42076
G1 X87.096 Y83.756 E-.11639
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.858 Y86.645 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.859 Y86.491 E.00516
G1 X87.014 Y86.43 E.00559
G1 X87.013 Y85.872 E.01872
G1 X87.075 Y85.756 E.00445
G1 X87.207 Y85.748 E.00442
; WIPE_START
G1 X87.075 Y85.756 E-.08757
G1 X87.013 Y85.872 E-.08815
G1 X87.014 Y86.43 E-.37109
G1 X86.859 Y86.491 E-.11088
G1 X86.858 Y86.645 E-.10231
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.221 Y85.748 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.371 Y85.757 E.00506
G1 X84.414 Y85.872 E.00413
G1 X84.399 Y86.374 E.01685
G2 X84.569 Y86.515 I.245 J-.123 E.00761
G1 X84.569 Y86.645 E.00437
; WIPE_START
G1 X84.569 Y86.515 E-.08744
G1 X84.448 Y86.442 E-.09505
G1 X84.399 Y86.374 E-.05605
G1 X84.414 Y85.872 E-.33745
G1 X84.371 Y85.757 E-.08265
G1 X84.221 Y85.748 E-.10135
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.679 Y89.99 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X85.818 Y89.98 E.00468
; WIPE_START
G1 X85.679 Y89.99 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z5.65 F4000
            G39.3 S1
            G0 Z5.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z5.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #17
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z8.25 F1200

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
M73 E14
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z8.25
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y78.331 F42000
G1 Z5.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
M73 P56 R39
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
M73 P57 R39
G1  X110.786  E1.5774
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
G1  Y83.331  E0.0232
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #22
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
M73 P57 R38
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.414 Y83.054 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.356 Y83.516 E.01561
; WIPE_START
G1 X84.414 Y83.054 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.071 Y83.516 F42000
G1 E.8 F2400
M73 P58 R38
G1 F5647.059
M204 S15000
G1 X87.014 Y83.053 E.01564
; WIPE_START
G1 X87.071 Y83.516 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.21 Y85.987 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.206 Y86.598 E.0205
; WIPE_START
G1 X87.21 Y85.987 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.227 Y86.592 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.218 Y85.987 E.02031
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 22/37
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

; OBJECT_ID: 254
M204 S10000
G1 X84.218 Y86.61 Z5.5 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.211 Y85.983 E.02103
; WIPE_START
G1 X84.218 Y86.61 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.217 Y85.984 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G3 X87.213 Y86.619 I-2.23 J.305 E.02139
; WIPE_START
G1 X87.237 Y86.354 E-.31661
G1 X87.217 Y85.984 E-.44339
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.95 Y83.037 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.022 Y83.058 E.00251
G1 X87.077 Y83.522 E.01569
; WIPE_START
G1 X87.022 Y83.058 E-.65505
G1 X86.95 Y83.037 E-.10495
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.35 Y83.522 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.406 Y83.048 E.01602
; WIPE_START
G1 X84.35 Y83.522 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z5.9 F4000
            G39.3 S1
            G0 Z5.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #18
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z8.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E13
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
M73 P59 R37
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z8.5
M106 P1 S0

M204 S15000



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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z5.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
M73 P59 R36
G1  X141.786  F240
M73 P60 R36
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #23
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
M73 P61 R35
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.569 Y86.665 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.568 Y86.511 E.00515
G1 X84.441 Y86.461 E.00459
G1 X84.392 Y86.394 E.0028
G1 X84.408 Y85.869 E.01762
G1 X84.365 Y85.753 E.00415
G1 X84.215 Y85.744 E.00503
; WIPE_START
G1 X84.365 Y85.753 E-.09719
G1 X84.408 Y85.869 E-.08007
G1 X84.392 Y86.394 E-.34044
G1 X84.441 Y86.461 E-.05411
G1 X84.568 Y86.511 E-.08863
G1 X84.569 Y86.665 E-.09956
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.859 Y86.665 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.86 Y86.511 E.00514
G1 X87.022 Y86.45 E.00583
G1 X87.019 Y85.869 E.0195
G1 X87.082 Y85.751 E.00446
G1 X87.212 Y85.744 E.00439
; WIPE_START
G1 X87.082 Y85.751 E-.08488
G1 X87.019 Y85.869 E-.0862
G1 X87.022 Y86.45 E-.37678
G1 X86.86 Y86.511 E-.11273
G1 X86.859 Y86.665 E-.09941
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.102 Y83.763 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.971 Y83.77 E.00439
G1 X86.898 Y83.668 E.00421
G1 X86.847 Y83.219 E.01518
G1 X86.7 Y83.159 E.00532
G1 X86.699 Y83.009 E.00504
; WIPE_START
G1 X86.7 Y83.159 E-.11218
G1 X86.847 Y83.219 E-.1184
G1 X86.898 Y83.668 E-.33801
G1 X86.971 Y83.77 E-.09372
G1 X87.102 Y83.763 E-.09768
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.728 Y83.009 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.728 Y83.138 E.00431
G1 X84.591 Y83.215 E.00528
G1 X84.53 Y83.66 E.01509
G1 X84.475 Y83.77 E.00413
G1 X84.325 Y83.763 E.00503
; CHANGE_LAYER
; Z_HEIGHT: 5.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 23/37
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.475 Y83.77 E-.11296
G1 X84.53 Y83.66 E-.0928
G1 X84.591 Y83.215 E-.33887
G1 X84.728 Y83.138 E-.11851
G1 X84.728 Y83.009 E-.09685
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.223 Y85.674 Z5.75 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.353 Y85.682 E.00436
G1 X84.405 Y85.81 E.00461
G1 X84.384 Y86.413 E.02027
G1 X84.434 Y86.481 E.00281
G1 X84.568 Y86.531 E.0048
G1 X84.569 Y86.684 E.00514
; WIPE_START
G1 X84.568 Y86.531 E-.09304
G1 X84.434 Y86.481 E-.08693
G1 X84.384 Y86.413 E-.05083
G1 X84.405 Y85.81 E-.36682
G1 X84.353 Y85.682 E-.08345
G1 X84.223 Y85.674 E-.07893
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.858 Y86.684 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.86 Y86.531 E.00515
G1 X87.051 Y86.424 E.00735
G1 X87.023 Y85.813 E.02054
G1 X87.084 Y85.682 E.00485
G1 X87.204 Y85.674 E.00405
; WIPE_START
G1 X87.084 Y85.682 E-.07335
G1 X87.023 Y85.813 E-.08792
G1 X87.051 Y86.424 E-.37219
G1 X86.86 Y86.531 E-.13324
G1 X86.858 Y86.684 E-.09329
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.102 Y83.833 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X86.982 Y83.839 E.00404
G1 X86.908 Y83.727 E.0045
G1 X86.871 Y83.267 E.01551
G1 X86.619 Y83.14 E.00946
G1 X86.618 Y83.015 E.00419
; WIPE_START
G1 X86.619 Y83.14 E-.08441
G1 X86.871 Y83.267 E-.1907
G1 X86.908 Y83.727 E-.31274
G1 X86.982 Y83.839 E-.09066
G1 X87.102 Y83.833 E-.08149
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.809 Y83.015 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.808 Y83.14 E.00418
G1 X84.572 Y83.217 E.00834
G1 X84.521 Y83.719 E.01693
G1 X84.455 Y83.839 E.00461
G1 X84.325 Y83.833 E.00436
; WIPE_START
G1 X84.455 Y83.839 E-.08625
G1 X84.521 Y83.719 E-.09112
G1 X84.572 Y83.217 E-.33494
G1 X84.808 Y83.14 E-.16499
G1 X84.809 Y83.015 E-.0827
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z6.15 F4000
            G39.3 S1
            G0 Z6.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z5.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #19
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z8.75 F1200

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
M73 E12
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z8.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z5.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
M73 P62 R34
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
M73 P63 R34
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
M73 P63 R33
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #24
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.211 Y86.631 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.208 Y85.923 E.02375
; WIPE_START
G1 X84.211 Y86.631 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.222 Y86.638 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G2 X87.22 Y85.924 I-2.524 J-.351 E.02404
; WIPE_START
G1 X87.244 Y86.374 E-.47882
G1 X87.222 Y86.638 E-.28118
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.879 Y83.02 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.032 Y83.047 E.00524
G1 X87.088 Y83.581 E.01801
; WIPE_START
G1 X87.032 Y83.047 E-.58884
G1 X86.879 Y83.02 E-.17116
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.339 Y83.581 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.406 Y83.038 E.01835
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 24/37
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.339 Y83.581 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.21 Y86.656 Z6 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
M73 P64 R33
G1 X84.183 Y86.396 E.00878
G1 X84.208 Y85.796 E.02013
; WIPE_START
G1 X84.183 Y86.396 E-.52926
G1 X84.21 Y86.656 E-.23074
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.22 Y85.797 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.253 Y86.394 E.02005
G1 X87.23 Y86.657 E.00887
; WIPE_START
G1 X87.253 Y86.394 E-.23306
G1 X87.22 Y85.797 E-.52694
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.735 Y83.009 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.031 Y83.043 E.01
G1 X87.103 Y83.709 E.02251
; WIPE_START
G1 X87.031 Y83.043 E-.52622
G1 X86.735 Y83.009 E-.23378
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.691 Y83.008 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.397 Y83.033 E.00988
G1 X84.376 Y83.085 E.00191
G1 X84.324 Y83.709 E.021
; WIPE_START
G1 X84.376 Y83.085 E-.48665
G1 X84.397 Y83.033 E-.04425
G1 X84.691 Y83.008 E-.2291
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #20
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z9 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E11
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
G1 Z9
M106 P1 S0

M204 S15000



M622.1 S0
M9833 F3.33333 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
M73 P65 R32
  G1 X0 F18000
M73 P65 R31
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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z6
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
M73 P66 R31
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
M73 P66 R30
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #25
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
M73 P67 R30
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.256 Y85.518 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.344 Y85.545 E.0031
G1 X84.405 Y85.686 E.00513
G1 X84.366 Y86.391 E.02371
G1 X84.383 Y86.484 E.00318
G1 X84.568 Y86.551 E.0066
G1 X84.569 Y86.704 E.00515
; WIPE_START
G1 X84.568 Y86.551 E-.08353
G1 X84.383 Y86.484 E-.10706
G1 X84.366 Y86.391 E-.05148
G1 X84.405 Y85.686 E-.38451
G1 X84.344 Y85.545 E-.08321
G1 X84.256 Y85.518 E-.0502
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.171 Y85.518 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.103 Y85.523 E.00228
G1 X87.022 Y85.686 E.00611
G1 X87.058 Y86.443 E.02546
G1 X86.86 Y86.551 E.00758
G1 X86.858 Y86.704 E.00515
; WIPE_START
G1 X86.86 Y86.551 E-.08408
G1 X87.058 Y86.443 E-.12365
G1 X87.022 Y85.686 E-.4154
G1 X87.103 Y85.523 E-.09973
G1 X87.171 Y85.518 E-.03714
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.086 Y83.992 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.018 Y83.994 E.00227
G1 X86.92 Y83.844 E.00604
G1 X86.863 Y83.214 E.02122
G1 X86.604 Y83.195 E.00872
G1 X86.473 Y83.126 E.00496
G1 X86.442 Y83.046 E.00289
; WIPE_START
G1 X86.473 Y83.126 E-.04771
G1 X86.604 Y83.195 E-.0818
G1 X86.863 Y83.214 E-.14373
G1 X86.92 Y83.844 E-.34976
G1 X87.018 Y83.994 E-.09954
G1 X87.086 Y83.992 E-.03747
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.985 Y83.046 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.984 Y83.096 E.00168
G1 X84.829 Y83.194 E.00617
G1 X84.558 Y83.217 E.00914
G1 X84.538 Y83.294 E.00268
G1 X84.507 Y83.841 E.01838
G1 X84.432 Y83.974 E.00512
G1 X84.341 Y83.992 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 6.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 25/37
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.432 Y83.974 E-.05098
G1 X84.507 Y83.841 E-.08411
G1 X84.538 Y83.294 E-.30187
G1 X84.558 Y83.217 E-.04398
G1 X84.829 Y83.194 E-.15014
G1 X84.984 Y83.096 E-.10136
G1 X84.985 Y83.046 E-.02756
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.859 Y86.724 Z6.25 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X86.86 Y86.571 E.00514
G1 X87.03 Y86.514 E.00602
G1 X87.069 Y86.411 E.0037
G1 X87.016 Y85.458 E.03205
; LINE_WIDTH: 0.439
G1 F4982.484
M73 P67 R29
G1 X87.129 Y85.258 E.00873
G1 X87.123 Y85.134 E.00471
; FEATURE: Overhang wall
; LINE_WIDTH: 0.43902
M106 S229.5

G1 X87.081 Y84.378 E.02881
M106 S102
; FEATURE: Outer wall
; LINE_WIDTH: 0.43903
G1 X87.074 Y84.255 E.00472
G1 X86.939 Y84.071 E.00867
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X86.869 Y83.209 E.02902
G1 X86.356 Y83.189 E.01724
; LINE_WIDTH: 0.43961
G1 F4974.609
G1 X86.166 Y83.064 E.00866
G1 X86.047 Y83.064 E.00453
; FEATURE: Overhang wall
; LINE_WIDTH: 0.43948
M106 S229.5
G1 F4976.285
G1 X85.38 Y83.064 E.02543
M106 S102
; FEATURE: Outer wall
; LINE_WIDTH: 0.43932
G1 F4978.35
G1 X85.261 Y83.064 E.00453
G1 X85.071 Y83.188 E.00865
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.551 Y83.212 E.01748
G1 X84.531 Y83.288 E.00263
G1 X84.488 Y84.069 E.02625
; LINE_WIDTH: 0.43905
G1 F4981.837
G1 X84.354 Y84.255 E.00874
G1 X84.347 Y84.378 E.00472
; FEATURE: Overhang wall
; LINE_WIDTH: 0.43904
M106 S229.5

G1 X84.305 Y85.134 E.02881
M106 S102
; FEATURE: Outer wall
; LINE_WIDTH: 0.43901
G1 F4982.354
G1 X84.298 Y85.258 E.00471
G1 X84.411 Y85.458 E.00873
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.361 Y86.463 E.0338
G1 X84.567 Y86.571 E.0078
G1 X84.569 Y86.724 E.00513
; WIPE_START
G1 X84.567 Y86.571 E-.05801
G1 X84.361 Y86.463 E-.08826
G1 X84.411 Y85.458 E-.38261
G1 X84.298 Y85.258 E-.0872
G1 X84.305 Y85.134 E-.04701
G1 X84.319 Y84.88 E-.09692
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z6.65 F4000
            G39.3 S1
            G0 Z6.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z6.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #21
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z9.25 F1200

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
M73 E10
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z9.25
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y78.331 F42000
G1 Z6.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
G1  Y83.331  E0.0232
M73 P68 R28
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
M73 P69 R28
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #26
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.185 Y86.667 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.167 Y86.413 E.00855
G1 X84.214 Y85.569 E.02839
; WIPE_START
G1 X84.167 Y86.413 E-.58404
G1 X84.185 Y86.667 E-.17596
; WIPE_END
G1 E-.04 F2400
M204 S10000
M73 P69 R27
G1 X87.214 Y85.569 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.26 Y86.414 E.0284
G1 X87.237 Y86.677 E.00889
; WIPE_START
G1 X87.26 Y86.414 E-.18122
G1 X87.214 Y85.569 E-.57878
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.484 Y83 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X87.043 Y83.031 E.01882
G1 X87.123 Y83.936 E.03049
; WIPE_START
G1 X87.043 Y83.031 E-.46996
G1 X86.484 Y83 E-.29004
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.304 Y83.936 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.342 Y83.265 E.02256
G1 X84.393 Y83.025 E.00825
G1 X84.943 Y82.999 E.01849
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 26/37
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.393 Y83.025 E-.285
G1 X84.342 Y83.265 E-.12716
G1 X84.304 Y83.936 E-.34784
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X87.187 Y84.969 Z6.5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X87.267 Y86.433 E.04924
G1 X87.244 Y86.698 E.00891
; WIPE_START
G1 X87.267 Y86.433 E-.11647
G1 X87.187 Y84.969 E-.64353
; WIPE_END
G1 E-.04 F2400
M204 S10000
M73 P70 R27
G1 X84.179 Y86.691 F42000
G1 E.8 F2400
G1 F5647.059
M204 S15000
G1 X84.159 Y86.433 E.00869
G1 X84.24 Y84.969 E.04923
M204 S10000
G1 X84.265 Y84.533 F42000
G1 F5647.059
M204 S15000
G1 X84.336 Y83.259 E.04285
G1 X84.382 Y83.02 E.00814
G1 X84.618 Y82.991 E.00799
G1 X86.809 Y82.991 E.07353
G1 X87.048 Y83.021 E.00809
G1 X87.092 Y83.259 E.0081
G1 X87.163 Y84.533 E.04284
; WIPE_START
G1 X87.092 Y83.259 E-.48495
G1 X87.048 Y83.021 E-.09171
G1 X86.809 Y82.991 E-.09162
G1 X86.567 Y82.991 E-.09172
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z6.9 F4000
            G39.3 S1
            G0 Z6.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #22
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z9.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
M620.10 A0 F199
T0
M73 E9
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
G1 Z9.5
M106 P1 S0

M204 S15000



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
M73 P71 R26
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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z6.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
M73 P71 R25
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
M73 P72 R25
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #27
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
M73 P72 R24
G1 E0.8000 F2400
M204 S15000
M73 P73 R24
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.569 Y86.743 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.567 Y86.59 E.00514
G1 X84.354 Y86.483 E.00803
G1 X84.438 Y84.857 E.05465
G3 X84.448 Y84.666 I.126 J-.089 E.00695
G1 X84.526 Y83.281 E.04655
G1 X84.572 Y83.19 E.00346
G1 X84.63 Y83.182 E.00197
G1 X86.797 Y83.182 E.07273
G1 X86.88 Y83.199 E.00284
G1 X86.902 Y83.281 E.00285
G1 X86.979 Y84.665 E.04654
G3 X86.99 Y84.857 I-.115 J.103 E.00697
G1 X87.077 Y86.431 E.0529
G1 X87.037 Y86.533 E.0037
G1 X86.86 Y86.591 E.00623
G1 X86.859 Y86.743 E.00513
; CHANGE_LAYER
; Z_HEIGHT: 6.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 27/37
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X86.86 Y86.591 E-.05801
G1 X87.037 Y86.533 E-.07055
G1 X87.077 Y86.431 E-.04193
G1 X86.991 Y84.882 E-.5895
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X84.343 Y86.45 Z6.75 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.519 Y83.275 E.10677
G1 X84.544 Y83.188 E.00305
G1 X84.624 Y83.172 E.00273
G1 X86.803 Y83.172 E.07314
G1 X86.883 Y83.188 E.00273
G1 X86.908 Y83.275 E.00305
G1 X87.085 Y86.45 E.10677
G1 X87.068 Y86.542 E.00312
G1 X86.958 Y86.565 E.00378
; LINE_WIDTH: 0.44035
G1 F4965.089
G1 X86.781 Y86.686 E.00818
G1 X86.515 Y86.686 E.01015
; FEATURE: Overhang wall
M106 S229.5

G1 X84.912 Y86.686 E.06123
M106 S102
; FEATURE: Outer wall
G1 X84.646 Y86.686 E.01016
G1 X84.596 Y86.636 E.00271
; LINE_WIDTH: 0.39365
G1 F5647.059
G1 X84.359 Y86.542 E.00854
G1 X84.353 Y86.509 E.00112
; WIPE_START
G1 X84.456 Y84.512 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z7.15 F4000
            G39.3 S1
            G0 Z7.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z6.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #23
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z9.75 F1200

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
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z9.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z6.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
M73 P74 R23
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
M73 P75 R23
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #28
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
M73 P75 R22
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.322 Y86.739 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X84.169 Y86.703 E.00529
G1 X84.151 Y86.453 E.00843
G1 X84.328 Y83.252 E.10762
G1 X84.379 Y83.003 E.00853
G1 X84.612 Y82.975 E.00788
G1 X86.815 Y82.975 E.07394
G1 X87.06 Y83.018 E.00836
G1 X87.1 Y83.252 E.00797
G1 X87.274 Y86.453 E.10762
G1 X87.251 Y86.717 E.00891
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 28/37
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 254
M204 S10000
G1 X87.262 Y86.736 Z7 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X87 Y86.772 E.00886
G1 X84.485 Y86.771 E.08444
G1 X84.166 Y86.733 E.0108
G1 X84.143 Y86.469 E.00889
G2 X84.147 Y84.253 I-13.095 J-1.127 E.0745
G3 X84.224 Y82.966 I8.652 J-.122 E.04331
G1 X84.272 Y82.88 E.0033
G1 X84.606 Y82.826 E.01138
G1 X86.821 Y82.826 E.07436
G1 X87.16 Y82.884 E.01155
G1 X87.245 Y83.237 E.01219
G1 X87.276 Y83.806 E.0191
G1 X87.282 Y84.103 E.00999
G2 X87.284 Y86.472 I14.223 J1.172 E.07963
G1 X87.267 Y86.677 E.00688
; WIPE_START
G1 X87 Y86.772 E-.10765
G1 X85.284 Y86.771 E-.65235
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #24
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z10 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
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
M73 P76 R22
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
G1 Z10
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
M73 P77 R21
G1 Z7
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
M73 P77 R20
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
M73 P78 R20
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #29
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
M73 P78 R19
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y85.081  E0.2436 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.335 Y86.466 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G2 X84.466 Y83.271 I-1785.862 J-74.557 E.10737
G1 X84.506 Y83.143 E.0045
G1 X84.622 Y83.118 E.00399
G1 X86.805 Y83.118 E.07327
M73 P79 R19
G1 X86.921 Y83.143 E.00398
G1 X86.962 Y83.271 E.00451
G2 X87.092 Y86.47 I1936.35 J-77.528 E.1075
G1 X87.076 Y86.561 E.0031
G1 X86.987 Y86.581 E.00308
G1 X84.484 Y86.58 E.08402
G1 X84.353 Y86.559 E.00446
G1 X84.347 Y86.525 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 7.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 29/37
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 254
; WIPE_START
G1 F5647.059
G1 X84.42 Y84.526 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.186 Y84.428 Z7.25 F42000
G1 E.8 F2400
; FEATURE: Overhang wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
M106 S229.5
G1 F600
M204 S15000
G1 X86.261 Y85.789 E.06007
G1 X85.166 Y85.789 E.04828
G1 X85.241 Y84.439 E.05959
G1 X85.685 Y84.567 E.02036
G1 X85.874 Y84.553 E.00837
G1 X86.13 Y84.451 E.01214
M106 S102
M204 S10000
G1 X86.125 Y83.597 F42000
; LINE_WIDTH: 0.39365
M106 S229.5
G1 F5647.059
M204 S15000
G1 X86.086 Y83.464 E.00466
M106 S102
; FEATURE: Outer wall
G1 X86.064 Y83.387 E.00269
G1 X85.902 Y83.231 E.00755
G1 X85.721 Y83.183 E.00628
G1 X85.504 Y83.247 E.00761
G1 X85.361 Y83.396 E.00694
G1 X85.347 Y83.464 E.00233
; FEATURE: Overhang wall
M106 S229.5

G1 X85.309 Y83.66 E.00669
M106 S102
M204 S10000
G1 X85.308 Y83.847 F42000
; LINE_WIDTH: 0.49999
M106 S229.5
G1 F600
M204 S15000
G1 X85.364 Y83.996 E.00701
G1 X85.66 Y84.121 E.01413
G1 X85.966 Y84.058 E.0138
G1 X86.111 Y83.92 E.00882
G1 X86.231 Y83.947 E.00542
G1 X86.606 Y83.947 E.01653
G1 X86.626 Y84.313 E.01613
G1 X86.733 Y86.235 E.08486
G1 X84.694 Y86.235 E.08986
G1 X84.821 Y83.947 E.10101
G1 X85.176 Y83.946 E.01565
G1 X85.26 Y83.883 E.00464
M106 S102
M204 S10000
G1 X85.67 Y84.76 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.58926
M106 S229.5
G1 F3584.698
M204 S15000
G1 X85.624 Y85.588 E.04385
M106 S102
; WIPE_START
G1 X85.67 Y84.76 E-.76
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.65
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z7.65 F4000
            G39.3 S1
            G0 Z7.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X110.786 Y89.331 F42000
M204 S10000
G1 Z7.25
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y79.581  E0.4987 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X111.036 Y77.831   F600
G1 E0.8000 F2400
M204 S15000
G1  X145.286  E1.5889 F4302
G1  Y90.331  E0.5799
G1  X110.286  E1.6237
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #25
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z10.25 F1200

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
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z10.25
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y78.331 F42000
G1 Z7.25
G1 X110.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
M73 P79 R18
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y82.331  E0.0232
G1  X144.786  E1.5774
G1  Y82.831  E0.0232
G1  X110.786  E1.5774
G1  Y83.331  E0.0232
G1  X144.786  E1.5774
G1  Y83.831  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  Y84.331  E0.2552 F4302
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M73 P80 R17
G1  X110.786  E1.5774
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #30
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
M73 P81 R17
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F3584.698
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X87.127 Y83.656 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.57189
; LAYER_HEIGHT: 0.25
G1 F3704.847
M204 S15000
G1 X87.127 Y83.656 E.00003
; LINE_WIDTH: 0.57731
G1 F3666.501
G1 X87.282 Y86.406 E.14238
; LINE_WIDTH: 0.60625
G1 F3474.484
G1 X87.265 Y86.553 E.00809
; LINE_WIDTH: 0.63519
G1 F3301.579
G1 X87.248 Y86.7 E.00851
G1 X87.174 Y86.717 E.00436
; LINE_WIDTH: 0.600804
G1 F3509.071
G1 X87.1 Y86.734 E.0041
; LINE_WIDTH: 0.566417
G1 F3744.393
G1 X87.026 Y86.751 E.00384
; LINE_WIDTH: 0.53203
G1 F4013.546
G1 X84.401 Y86.75 E.12396
; LINE_WIDTH: 0.56539
M73 P81 R16
G1 F3751.905
G1 X84.325 Y86.731 E.00397
; LINE_WIDTH: 0.60207
G1 F3500.966
G1 X84.249 Y86.713 E.00425
; LINE_WIDTH: 0.63875
G1 F3281.49
G1 X84.173 Y86.694 E.00454
G1 X84.159 Y86.552 E.00827
; LINE_WIDTH: 0.60797
G1 F3463.703
G1 X84.145 Y86.41 E.00783
; LINE_WIDTH: 0.57719
G1 F3667.342
G1 X84.301 Y83.656 E.14256
; LINE_WIDTH: 0.57019
G1 F3717.04
G1 X84.301 Y83.656 E.00003
; WIPE_START
G1 X84.301 Y83.656 E-.00025
G1 X84.188 Y85.652 E-.75975
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.124 Y83.044 F42000
G1 E.8 F2400
; LINE_WIDTH: 0.54733
G1 F3889.159
M204 S15000
G1 X84.934 Y83.398 E.0196
; LINE_WIDTH: 0.54747
G1 F3888.057
G1 X84.566 Y83.424 E.01799
; LINE_WIDTH: 0.57019
G1 F3717.04
G1 X84.301 Y83.656 E.01793
G1 X84.33 Y82.964 E.0353
; LINE_WIDTH: 0.54747
G1 F3888.057
G1 X84.359 Y82.93 E.00219
G1 X85.271 Y82.93 E.04445
; LINE_WIDTH: 0.54733
G1 F3889.159
G1 X85.171 Y83.007 E.00615
M204 S10000
G1 X85.698 Y82.858 F42000
; LINE_WIDTH: 0.41691
G1 F5285.47
M204 S15000
G1 X85.865 Y82.864 E.00602
M204 S10000
G1 X86.267 Y83.008 F42000
; LINE_WIDTH: 0.54776
G1 F3885.775
M204 S15000
G1 X86.114 Y82.917 E.00867
G2 X87.048 Y82.93 I.562 J-7.259 E.04561
G1 X87.1 Y82.978 E.00345
; LINE_WIDTH: 0.57187
G1 F3704.99
G1 X87.127 Y83.656 E.03471
G1 X86.868 Y83.424 E.01778
; LINE_WIDTH: 0.54776
G1 F3885.775
G1 X86.489 Y83.423 E.01852
G1 X86.47 Y83.319 E.0052
G1 X86.3 Y83.058 E.01517
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 30/37
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; WIPE_START
G1 F3885.775
G1 X86.114 Y82.917 E-.08858
G1 X87.048 Y82.93 E-.35496
G1 X87.1 Y82.978 E-.0269
G1 X87.127 Y83.656 E-.25774
G1 X87.064 Y83.6 E-.03182
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z7.9 F4000
            G39.3 S1
            G0 Z7.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #26
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z10.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
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
M73 P82 R16
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
G1 Z10.5
M106 P1 S0

M204 S15000



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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z7.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
M73 P83 R15
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
M73 P83 R14
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
M73 P84 R14
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  X110.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X110.286 Y90.331  
M204 S15000
G1  Y77.831  E0.5799 F4302
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y88.581  E0.1624 F4302
G1 E-0.8000 F2400
M204 S10000
G1  X144.536 Y90.331   F600
G1 E0.8000 F2400
M204 S15000
G1  X110.286  E1.5889 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F3885.775
M204 S15000
G1 X112.286 Y90.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.971 Y83.903 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.836 Y83.985 E.00531
G1 X85.599 Y83.985 E.00794
G1 X85.424 Y83.889 E.00671
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #27
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
G1 F5400
G1 X85.599 Y83.985 E-.63822
G1 X85.836 Y83.985 E-.756
G1 X85.971 Y83.903 E-.50578
; WIPE_END
G1 E-.1 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z10.5 F1200

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
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 E0.765938 F50
M73 P84 R13
G1 E8.80828 F199
G1 E0.765938 F50
G1 E8.80828 F199
G1 E0.765938 F50
M73 P85 R13
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
G1 Z10.5
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y89.879 F42000
M204 S10000
G1 Z7.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y89.831
G1 X144.786 Y89.831

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y89.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y89.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y88.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y88.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y87.831  E0.0232
G1  X110.786  E1.5774
G1  Y87.331  E0.0232
G1  X144.786  E1.5774
G1  Y86.831  E0.0232
G1  X110.786  E1.5774
G1  Y86.331  E0.0232
G1  X144.786  E1.5774
G1  Y85.831  E0.0232
G1  X110.786  E1.5774
G1  Y85.331  E0.0232
G1  X144.786  E1.5774
G1  Y84.831  E0.0232
G1  X110.786  E1.5774
G1  Y84.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S15000
G1 X142.786 Y84.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
M73 P86 R12
G1 X84.559 Y86.345 F42000
G1 E.8 F2400
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
; LAYER_HEIGHT: 0.25
G1 F4301.653
M204 S15000
G3 X84.672 Y84.397 I174.621 J9.153 E.08599
G1 X84.788 Y84.418 E.00518
G1 X85.185 Y84.704 E.02157
G1 X85.465 Y84.802 E.01309
G1 X85.935 Y84.813 E.0207
G1 X86.348 Y84.649 E.01957
G1 X86.63 Y84.424 E.01592
G1 X86.758 Y84.394 E.00578
G3 X86.872 Y86.345 I-42.311 J3.457 E.08613
G1 X84.619 Y86.345 E.09929
M204 S10000
G1 X84.089 Y86.758 F42000
; FEATURE: Outer wall
G1 F4301.653
M204 S15000
G1 X84.206 Y84.676 E.09192
G1 X84.274 Y83.948 E.03222
G1 X85.072 Y83.947 E.03516
G1 X85.128 Y84.129 E.00839
M73 P87 R11
G1 X85.422 Y84.326 E.01562
G1 X85.818 Y84.375 E.01758
G1 X86.16 Y84.245 E.01611
G1 X86.314 Y84.109 E.00904
G1 X86.378 Y83.947 E.00769
G1 X87.144 Y83.948 E.03373
G1 X87.21 Y84.444 E.02204
G1 X87.335 Y86.749 E.10177
G1 X87.288 Y86.791 E.00273
G1 X84.159 Y86.791 E.13793
G1 X84.143 Y86.784 E.00077
; WIPE_START
G1 X84.203 Y84.784 E-.76
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X86.646 Y85.921 F42000
G1 E.8 F2400
; FEATURE: Top surface
; LINE_WIDTH: 0.544881
G1 F3908.556
M204 S15000
G1 X84.985 Y85.921 E.08057
G1 X85.013 Y85.429 E.02386
G1 X86.618 Y85.429 E.07785
; CHANGE_LAYER
; Z_HEIGHT: 7.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 31/37
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change

M106 S229.5
; WIPE_START
G1 F3908.556
G1 X85.013 Y85.429 E-.60993
G1 X84.991 Y85.824 E-.15007
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z8.15 F4000
            G39.3 S1
            G0 Z8.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z7.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786 Y89.331  E1.5774 F4302
G1  Y78.331  E0.5103
G1  X144.786  E1.5774
G1  Y89.331  E0.5103
M204 S10000
G1  X111.786 Y78.331  
;--------------------
; CP EMPTY GRID START
; layer #32
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X119.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X127.786 
M204 S15000
G1  Y89.331  E0.5103
M204 S10000
G1  X135.786 
M204 S15000
G1  Y78.331  E0.5103
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.331  E0.5103
; CP EMPTY GRID END
;------------------






M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
; WIPE_TOWER_END

; WIPE_START
G1 F3908.556
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X84.061 Y86.797 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.38754
; LAYER_HEIGHT: 0.25
G1 F1200
M204 S15000
G1 X84.086 Y86.489 E.01021
G1 X84.228 Y86.489 E.00468
; LINE_WIDTH: 0.38791
G1 X87.343 Y86.488 E.10281
G1 X87.379 Y86.769 E.00934
G1 X87.292 Y86.823 E.00337
G1 X84.228 Y86.822 E.10114
; LINE_WIDTH: 0.38754
G1 X84.121 Y86.806 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 8.5
; LAYER_HEIGHT: 0.75
; layer num/total_layer_count: 32/37
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change

M106 S102
; OBJECT_ID: 254
; WIPE_START
G1 F5750.397
G1 X84.086 Y86.489 E-.1214
G1 X84.228 Y86.489 E-.05393
G1 X85.767 Y86.488 E-.58467
; WIPE_END
G1 E-.04 F2400
M204 S10000
G1 X85.275 Y83.799 Z8.5 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.228 Y83.557 E.00828
M204 S10000
G1 X85.771 Y84.075 F42000
G1 F5647.059
M204 S15000
G1 X85.797 Y84.075 E.00086
G1 X85.993 Y83.94 E.008
G1 X85.993 Y84.014 E.00247
G1 X86.057 Y83.977 E.00247
; WIPE_START
G1 X85.993 Y84.014 E-.13614
G1 X85.993 Y83.94 E-.13615
G1 X85.797 Y84.075 E-.44054
G1 X85.771 Y84.075 E-.04718
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.9
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z8.9 F4000
            G39.3 S1
            G0 Z8.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #28
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z11.5 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
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
G1 Z11.5
M106 P1 S0

M204 S15000



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
G1 X106.5 Y85.593 F42000
M204 S10000
G1 Z8.5
G1 X106.5 Y94.116
G1 X149.071 Y94.116
G1 X149.071 Y83.831
G1 X144.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
M73 P89 R10
G1  X146.286  F600
G1  X141.786  F240
M73 P89 R9
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y82.831  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y82.331  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X110.786  E1.5774
G1  Y81.331  E0.0232
G1  X144.786  E1.5774
G1  Y80.831  E0.0232
G1  X110.786  E1.5774
G1  Y80.331  E0.0232
G1  X144.786  E1.5774
G1  Y79.831  E0.0232
G1  X110.786  E1.5774
G1  Y79.331  E0.0232
G1  X144.786  E1.5774
G1  Y78.831  E0.0232
G1  X110.786  E1.5774
G1  Y78.331  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #35
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X127.786 
M204 S15000
M73 P90 R9
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END
G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
M73 P90 R8
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X145.286  E1.6237
G1  Y82.581  E0.2204
G1 E-0.8000 F2400
M204 S10000
G1  Y85.081  F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.2436 F4302
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.407 Y83.583 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.386 Y83.62 E.00143
G1 X85.322 Y83.583 E.00247
G1 X85.386 Y83.546 E.00247
; CHANGE_LAYER
; Z_HEIGHT: 8.75
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 33/37
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change

; OBJECT_ID: 254
M204 S10000
G1 X85.352 Y83.683 Z8.75 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.369 Y83.448 E.00789
G1 X85.485 Y83.295 E.00647
G1 X85.682 Y83.217 E.00711
G1 X85.846 Y83.241 E.00558
G1 X86.014 Y83.366 E.00701
G1 X86.091 Y83.568 E.00726
G1 X86.043 Y83.776 E.00718
G1 X85.864 Y83.933 E.00799
G1 X85.651 Y83.959 E.0072
G1 X85.46 Y83.865 E.00713
G1 X85.382 Y83.734 E.00512
; WIPE_START
G1 X85.369 Y83.448 E-.10879
G1 X85.485 Y83.295 E-.07318
G1 X85.682 Y83.217 E-.08045
G1 X85.846 Y83.241 E-.06313
G1 X86.014 Y83.366 E-.07931
M73 P91 R8
G1 X86.091 Y83.568 E-.08218
G1 X86.043 Y83.776 E-.08126
G1 X85.864 Y83.933 E-.0904
G1 X85.651 Y83.959 E-.08153
G1 X85.604 Y83.936 E-.01977
; WIPE_END
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.15
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z9.15 F4000
            G39.3 S1
            G0 Z9.15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X144.786 Y89.331 F42000
M204 S10000
G1 Z8.75
G1 E.8 F2400
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X110.286  E1.6237 F4302
G1  Y77.831  E0.5799
G1  X144.536  E1.5889
G1 E-0.8000 F2400
M204 S10000
G1  X145.286 Y79.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y90.331  E0.4987 F4302
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #29
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z11.75 F1200

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
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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
G1 Z11.75
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y81.663 F42000
G1 Z8.75
G1 X106.5 Y74.045
G1 X149.071 Y74.045
G1 X149.071 Y78.331
G1 X144.786 Y78.331

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X141.786 Y78.331  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X146.286  F600
G1  X141.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X110.786  E1.4382 F1782
G1  Y78.831  E0.0232
G1  X144.786  E1.5774 F2025
G1  Y79.331  E0.0232
G1  X110.786  E1.5774 F2473
G1  Y79.831  E0.0232
G1  X144.786  E1.5774 F4302
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y82.331  E0.0232
G1  X110.786  E1.5774
G1  Y82.831  E0.0232
G1  X144.786  E1.5774
G1  Y83.331  E0.0232
G1  X110.786  E1.5774
G1  Y83.831  E0.0232
G1  X144.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y89.831  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S15000
G1  X110.786  E1.5774 F4302
G1  Y84.331  E0.2552
G1  X144.786  E1.5774
G1  Y89.831  E0.2552
M204 S10000
G1  X111.786 Y84.331  
;--------------------
; CP EMPTY GRID START
; layer #36
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X119.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
M73 P92 R6
G1  X127.786 
M204 S15000
G1  Y89.831  E0.2552
M204 S10000
G1  X135.786 
M204 S15000
G1  Y84.331  E0.2552
M204 S10000
G1  X143.786 
M204 S15000
G1  Y89.831  E0.2552
; CP EMPTY GRID END
;------------------






; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X143.786 Y87.831 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.423 Y84.071 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.254 Y83.916 E.00772
G3 X85.162 Y83.482 I.459 J-.324 E.01533
G1 X85.308 Y83.204 E.01053
G3 X85.922 Y83.065 I.422 J.441 E.02218
G1 X86.148 Y83.234 E.00948
G1 X86.256 Y83.432 E.00758
G1 X86.275 Y83.658 E.0076
M73 P93 R6
G1 X86.188 Y83.903 E.00873
G1 X86.033 Y84.061 E.00743
G1 X85.727 Y84.153 E.01072
G1 X85.481 Y84.087 E.00855
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 34/37
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change

; WIPE_START
G1 F5647.059
G1 X85.254 Y83.916 E-.10813
G1 X85.163 Y83.709 E-.08603
G1 X85.162 Y83.482 E-.08627
G1 X85.308 Y83.204 E-.11917
G1 X85.497 Y83.072 E-.08773
G1 X85.705 Y83.024 E-.08088
G1 X85.922 Y83.065 E-.08376
G1 X86.148 Y83.234 E-.1073
G1 X86.149 Y83.235 E-.00073
; WIPE_END
M73 P93 R5
G1 E-.04 F2400
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y83.3357 F18000 ; move to safe pos
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
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #30
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F2400
; filament end gcode 
M400 U1 ; C1E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z12 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S255


G1 X180 F18000


M620.11 S0

M400

M620.1 E F199 T270
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
G1 Z12
M106 P1 S0

M204 S15000



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
G1 X106.5 Y83.831 F42000
M204 S10000
G1 Z9
G1 X110.786 Y83.831

; filament start gcode
M106 P3 S180



M400 U1 ; C4S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y83.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y83.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y82.831  E0.0232
M73 P94 R4
G1  X144.786  E1.5774 F2473
M73 P95 R4
G1  Y82.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y81.831  E0.0232
G1  X144.786  E1.5774
G1  Y81.331  E0.0232
G1  X110.786  E1.5774
G1  Y80.831  E0.0232
G1  X144.786  E1.5774
G1  Y80.331  E0.0232
G1  X110.786  E1.5774
G1  Y79.831  E0.0232
G1  X144.786  E1.5774
G1  Y79.331  E0.0232
G1  X110.786  E1.5774
G1  Y78.831  E0.0232
G1  X144.786  E1.5774
G1  Y78.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  X144.786 Y89.331  F5400.000000
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X145.286 Y90.331  
M204 S15000
G1  X111.036  E1.5889 F4302
G1 E-0.8000 F2400
M204 S10000
M73 P95 R3
G1  X110.286 Y88.581   F600
G1 E0.8000 F2400
M204 S15000
G1  Y85.081  E0.1624 F4302
G1 E-0.8000 F2400
M204 S10000
G1  Y82.581  F600
G1 E0.8000 F2400
M204 S15000
G1  Y77.831  E0.2204 F4302
G1  X145.286  E1.6237
G1  Y90.331  E0.5799
; WIPE_TOWER_END

; WIPE_START
G1 F5647.059
M204 S15000
G1 X145.286 Y88.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.354 Y83.681 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
M73 P96 R3
G1 X85.371 Y83.449 E.00783
G1 X85.488 Y83.298 E.00642
G1 X85.682 Y83.217 E.00704
G1 X85.928 Y83.285 E.00856
G1 X86.061 Y83.454 E.00721
G1 X86.083 Y83.569 E.00393
G1 X86.037 Y83.775 E.00709
G1 X85.882 Y83.923 E.00722
G1 X85.653 Y83.959 E.00777
G1 X85.461 Y83.864 E.00719
G1 X85.384 Y83.733 E.0051
; LAYER_HEIGHT: 0.250000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #31
; material : PETG -> PETG
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
G1 F5400
G1 X85.371 Y83.449 E-.27045
G1 X85.488 Y83.298 E-.18155
G1 X85.682 Y83.217 E-.1993
G1 X85.928 Y83.285 E-.24225
G1 X86.061 Y83.454 E-.20417
G1 X86.083 Y83.569 E-.11107
G1 X86.037 Y83.775 E-.20051
G1 X85.882 Y83.923 E-.20432
G1 X85.653 Y83.959 E-.21974
G1 X85.59 Y83.928 E-.06664
; WIPE_END
G1 E-.1 F2400
; filament end gcode 
M400 U1 ; C4E

;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S1A
M204 S9000
G1 Z12 F1200

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
M620.1 E F199 T270
M620.10 A1 F199 L123.994 H0.4 T270

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

M73 P96 R2
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
M73 P97 R2
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
G1 Z12
M106 P1 S0

M204 S15000



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
M106 S102
M106 P2 S0
G1 X106.5 Y89.831 F42000
M204 S10000
G1 Z9
G1 X110.786 Y89.831

; filament start gcode
M106 P3 S180



M400 U1 ; C1S
G1 E2 F2400

G4 S0
; CP TOOLCHANGE WIPE
M204 S15000
G1  X113.786 Y89.831  E0.1392 F1782
G1 E-0.8000 F2400
M204 S10000
G1  X109.286  F600
G1  X113.786  F240
G1 E0.8000 F2400
M204 S15000
G1  X144.786  E1.4382 F1782
G1  Y89.331  E0.0232
G1  X110.786  E1.5774 F2025
G1  Y88.831  E0.0232
G1  X144.786  E1.5774 F2473
G1  Y88.331  E0.0232
G1  X110.786  E1.5774 F4302
G1  Y87.831  E0.0232
G1  X144.786  E1.5774
G1  Y87.331  E0.0232
G1  X110.786  E1.5774
G1  Y86.831  E0.0232
G1  X144.786  E1.5774
G1  Y86.331  E0.0232
G1  X110.786  E1.5774
G1  Y85.831  E0.0232
G1  X144.786  E1.5774
G1  Y85.331  E0.0232
G1  X110.786  E1.5774
G1  Y84.831  E0.0232
G1  X144.786  E1.5774
G1  Y84.331  E0.0232
G1  X110.786  E1.5774
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
M204 S15000
G1 X112.786 Y84.331 E-.76
; WIPE_END
G1 E-.04 F2400
; OBJECT_ID: 254
M204 S10000
G1 X85.612 Y84.146 F42000
G1 E.8 F2400
; FEATURE: Outer wall
; LINE_WIDTH: 0.39365
; LAYER_HEIGHT: 0.25
G1 F5647.059
M204 S15000
G1 X85.33 Y84.008 E.01053
G1 X85.194 Y83.818 E.00783
G3 X85.192 Y83.372 I.517 J-.226 E.01539
G1 X85.389 Y83.126 E.0106
G1 X85.679 Y83.023 E.0103
G1 X85.988 Y83.1 E.0107
G1 X86.158 Y83.246 E.00752
G1 X86.271 Y83.489 E.00898
M73 P98 R1
G1 X86.273 Y83.7 E.00708
G1 X86.125 Y83.983 E.01075
G1 X85.845 Y84.139 E.01075
G1 X85.671 Y84.144 E.00582
; CHANGE_LAYER
; Z_HEIGHT: 9.25
; LAYER_HEIGHT: 0.25
; layer num/total_layer_count: 35/37
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change

M106 S229.5
; OBJECT_ID: 254
M204 S10000
G1 X85.26 Y83.709 Z9.25 F42000
G1 F1200
M204 S15000
G1 X85.276 Y83.437 E.00915
G1 X85.411 Y83.232 E.00822
G1 X85.597 Y83.139 E.00698
G1 X85.863 Y83.149 E.00894
G1 X86.051 Y83.268 E.00745
G1 X86.162 Y83.463 E.00754
G1 X86.182 Y83.574 E.00377
G1 X86.115 Y83.838 E.00915
G1 X85.925 Y84.007 E.00855
G1 X85.659 Y84.055 E.00907
G1 X85.412 Y83.953 E.00896
G1 X85.292 Y83.76 E.00765
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.65
G1 X0 Y83.3357 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P98 R0
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
            G0 Z9.65 F4000
            G39.3 S1
            G0 Z9.65 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; close powerlost recovery
M1003 S0
; WIPE_START
G1 F5647.059
M73 P99 R0
G1 X85.276 Y83.437 E-.12288
G1 X85.411 Y83.232 E-.09308
G1 X85.597 Y83.139 E-.07902
G1 X85.863 Y83.149 E-.10124
G1 X86.051 Y83.268 E-.08437
G1 X86.162 Y83.463 E-.08539
G1 X86.182 Y83.574 E-.04269
G1 X86.115 Y83.838 E-.10356
G1 X86.021 Y83.921 E-.04777
; WIPE_END
G1 E-.04 F2400
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
M400 U1 ; C1E
;===== date: 20231229 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z9.75 F900 ; lower z a little
G1 X0 Y83.3357 F18000 ; move to safe pos
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

    G1 Z109.25 F600
    G1 Z107.25

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

