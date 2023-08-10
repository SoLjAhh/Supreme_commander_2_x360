--[[
This file contains a table which defines options available to the user in the options dialog

tab data is what populates each tab and defines each option in a tab
Each tab has:
    .title - the text that will appear on the tab
    .key - the key that will group the options (ie in the prefs file gameplay.help_prompts or video.resolution)
    .items - an array of the items for this key (this is an array rather than a genericly keyed table so display order can be imposed)
        .title - the text that will label the option line item
        .tip - the text that will appear in the tooltip for the item
        .key - the prefs key to identify this property
        .default - the default value of the property
        .restart - if true, setting the option will require a restart and the user will be notified
        .verify - if true, prompts the user to veryfiy the change for 15 seconds, otherwise defaults back to prior setting
        .populate - an optional function which when called, will repopulate the options custom data. The value passed in is the current value of the control (function(value))
        .set - an optional function that takes a value parameter and is responsible for determining what happens when the option is applied (function(key, value))
        .ignore - an optional function called when the option is set, checks the value, and wont change it from its former setting, and if former setting is invalid, uses return value for new value (function(value))
        .cancel - called when the option is cancelled
        .beginChange - an option function for sliders when user begins modification
        .endChange - an option function for sliders when user ends modification
        .update - a optional function that is called when the control has a new value, also receives the control (function(control, value)), not always used,
                  but if you need additonal control (say of other controls) when this value changes (for example one control may change other controls) you can
                  set up that behavior here
        .type - the type of control used to display this property
            valid types are:
            toggle - multi state toggle button (TODO - add list to replace more than 2 states?)
            button - momentary button (usually open another dialog)
            slider - a value slider
        .custom - a table of data required by the control type, different for each control type.
            slider
                .min - the minimum value for the slider
                .max - the maximum value for the slider
                .inc - the increment between slider detents, if 0 its "analog"
            toggle
                .states - table of states the toggle switch can have
                    .text = text for each state
                    .key = the key or value for each state to be stored in the pref
            button
                .text - the text label of the button

the optionsOrder table is just an array of keys in to the option table, and their order will determine what
order the tabs show in the dialog
--]]

local Prefs = import('/lua/user/prefs.lua')

optionsOrder = {
    "controls",
    "ui",
    "video",
    "sound",
}

local savedMasterVol = false
local savedFXVol = false
local savedMusicVol = false
local savedVOVol = false

function PlayTestSound()
    PlaySound('SC2/SC2/Interface/Frontend/snd_UI_PC_Frontend_Select')
end

local voiceHandle = false
function PlayTestVoice()
    if not voiceHandle then
        local sound = 'SC2/VOC/COMPUTER/VOC_SC2_COMPUTER'
        ForkThread(
            function()
                WaitSeconds(0.5)
                voiceHandle = false
            end
        )
        if voiceHandle then
            StopSound(voiceHandle)
        end
        voiceHandle = PlayVoice(sound)
    end
end

options = {
    controls = {
        title = "<LOC _Controls>",
        key = 'controls',
        items = {
            {
                title = "<LOC OPTIONS_0001>Zoom Wheel Sensitivity",
                key = 'wheel_sensitivity',
                type = 'slider',
                default = 40,
                ui_control = 'controls_1_statusbar',               
                -- tooltip_key = 'tt_option_test',
                set = function(key,value,startup)
					ConExecute("cam_ZoomAmount " .. tostring(value / 100))					
                end,
                custom = {
                    min = 1,
                    max = 100,
                    inc = 0,
                },
            },
            {                
                key = 'joystick_zoom_speed',
                type = 'slider',
                default = 16,                
                joy_control = 'sel03_statusbar',
                -- tooltip_key = 'tt_option_test',
                set = function(key,value,startup)
					ConExecute("joy_cameraZoomRate " .. tostring(value/1000000))											
					LOG( "Zoom speed: "..value )
                end,
                custom = {
                    min = 10,
                    max = 40,
                    inc = 3,
                },
            },
            {
                title = "<LOC OPTIONS_0109>Always Render Strategic Icons",
                key = 'strat_icons_always_on',
                type = 'toggle',
                default = 0,
                set = function(key,value,startup)
                    ConExecute("ui_AlwaysRenderStrategicIcons " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0107>Construction Tooltip Information",
                tip = "<LOC OPTIONS_0108>Change the layout that information is displayed in the rollover window for units in the construction manager.",
                key = 'uvd_format',
                type = 'toggle',
                default = 'full',
                ui_control = 'interface_1_value',
                set = function(key,value,startup)
                    -- needs logic to set priority (do we really want to do this though?)
                end,
                custom = {
                    states = {
                        {text = "<LOC _Full>Full", key = 'full'},
                        {text = "<LOC _Limited>Limited", key = 'limited'},
                        {text = "<LOC _Off>Off", key = 'off'},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0076>Economy Warnings",
                key = 'econ_warnings',
                type = 'toggle',
                default = true,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true,},
                        {text = "<LOC _Off>Off", key = false,},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0215>Show Waypoint ETAs",
                key = 'display_eta',
                type = 'toggle',
                default = true,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true,},
                        {text = "<LOC _Off>Off", key = false,},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0102>Multiplayer Taunts",
                tip = "<LOC OPTIONS_0103>Enable or Disable displaying taunts in multiplayer.",
                key = 'mp_taunt_head_enabled',
                type = 'toggle',
                default = 'false',
                set = function(key,value,startup)
                    -- needs logic to set priority (do we really want to do this though?)
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = 'true'},
                        {text = "<LOC _Off>Off", key = 'false'},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0158>Screen Edge Pans Main View",
                key = 'screen_edge_pans_main_view',
                type = 'toggle',
                default = 1,
                ui_control = 'controls_2_value',
                set = function(key,value,startup)
                    ConExecute("ui_ScreenEdgeScrollView " .. tostring(value))
                end,
                ui_control = 'controls_2_value',
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0159>Arrow Keys Pan Main View",
                key = 'arrow_keys_pan_main_view',
                type = 'toggle',
                default = 1,
                set = function(key,value,startup)
                    ConExecute("ui_ArrowKeysScrollView " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0160>Pan Speed",
                key = 'keyboard_pan_speed',
                type = 'slider',
                -- Set default to 20*60 for PC when this is separated from 360: SB 12.4.09
                default = 90*60,
                ui_control = 'controls_3_statusbar',                
                set = function(key,value,startup)					
					ConExecute("ui_KeyboardPanSpeed " .. tostring(value))					
                end,
                custom = {
                    min = 1*60,
                    max = 200*60,
                    inc = 0,
                },
            },
            {                
                key = 'joystick_pan_speed',
                type = 'slider',                
                default = 215,                
                joy_control = 'sel02_statusbar',
                set = function(key,value,startup)					
					ConExecute("cam_JoyPanSpeed " .. tostring(value/100))											
					LOG( "Pan speed: "..value )
                end,
                custom = {
                    min = 100,
                    max = 300,
                    inc = 20,
                },
            },
            {
                title = "<LOC OPTIONS_0161>Accelerated Pan Speed Multiplier",
                key = 'keyboard_pan_accelerate_multiplier',
                type = 'slider',
                default = 4,
                set = function(key,value,startup)
                    ConExecute("ui_KeyboardPanAccelerateMultiplier " .. tostring(value))
                end,
                custom = {
                    min = 1,
                    max = 10,
                    inc = 1,
                },
            },
            {
                title = "<LOC OPTIONS_0174>Keyboard Rotation Speed",
                key = 'keyboard_rotate_speed',
                type = 'slider',
                default = 10,                
                set = function(key,value,startup)					
					ConExecute("ui_KeyboardRotateSpeed " .. tostring(value))										
                end,
                custom = {
                    min = 1,
                    max = 100,
                    inc = 0,
                },
            },
            {                
                key = 'joystick_rotate_speed',
                type = 'slider',
                default = 15,
                joy_control = 'sel04_statusbar',
                set = function(key,value,startup)
					ConExecute("joy_cameraRotateRate " .. tostring(value/1000))											
					LOG( "Rotate speed: "..value )
                end,
                custom = {
                    min = 10,
                    max = 20,
                    inc = 1,
                },
            },
            {
                title = "<LOC OPTIONS_0163>Accelerated Keyboard Rotate Speed Multiplier",
                key = 'keyboard_rotate_accelerate_multiplier',
                type = 'slider',
                default = 2,
                set = function(key,value,startup)
                    ConExecute("ui_KeyboardRotateAccelerateMultiplier " .. tostring(value))
                end,
                custom = {
                    min = 1,
                    max = 10,
                    inc = 1,
                },
            },
            {
                title = "<LOC OPTIONS_0224>Camera Rotation",
                key = 'joystick_camera_rotation',
                type = 'toggle',
                default = true,
                joy_control = 'value01',
                set = function(key,value,startup)
					ConExecute("joy_CameraStandardRotateEnabled " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true },
                        {text = "<LOC _Off>Off", key = false },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0225>Invert Y-Axis (Zoom)",
                key = 'joystick_invert_zoom',
                type = 'toggle',
                default = true,
                joy_control = 'value05',
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true },
                        {text = "<LOC _Off>Off", key = false },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0226>Invert X-Axis (Rotate)",
                key = 'joystick_invert_rotation',
                type = 'toggle',
                default = false,
                joy_control = 'value06',
                set = function(key,value,startup)
					ConExecute("joy_CameraInvertXRotate " .. tostring(value))                
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true },
                        {text = "<LOC _Off>Off", key = false },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0227>Controller Vibration",
                key = 'joystick_vibration',
                type = 'toggle',
                default = true,
                joy_control = 'value07',
                set = function(key,value,startup)
					if value == false then
						DisableVibrations()
					else
						EnableVibrations()
					end
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true },
                        {text = "<LOC _Off>Off", key = false },
                    },
                },
            },
        },
    },
    ui = {
        title = "<LOC OPTIONS_0164>Interface",
        key = 'ui',
        items = {
            {
                title = "<LOC OPTIONS_0151>In-game Subtitles",
                key = 'subtitles',
                type = 'toggle',
                default = true,
                ui_control = 'interface_3_value',
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true},
                        {text = "<LOC _Off>Off", key = false},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0005>Display Tooltips",
                key = 'tooltips',
                type = 'toggle',
                default = true,
                joy_control = 'value01',
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true},
                        {text = "<LOC _Off>Off", key = false},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0078>Tooltip Delay",
                key = 'tooltip_delay',
                type = 'slider',
                default = 0,
                ui_control = 'interface_2_value',
                set = function(key,value,startup)
                end,

				custom = {
                    states = {
						{text = "<LOC _TooltipDelayHalf>1 Second", key = 2},
                        {text = "<LOC _TooltipDelay1>0.5 Seconds", key = 1},
                        {text = "<LOC _TooltipDelayOff>Off", key = 0},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0125>Quick Exit",
                tip = "<LOC OPTIONS_0126>When close box or alt-f4 are pressed, no confirmation dialog is shown",
                key = 'quick_exit',
                type = 'toggle',
                default = 'false',
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = 'true'},
                        {text = "<LOC _Off>Off", key = 'false'},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0165>Lock Fullscreen Cursor To Window",
                key = 'lock_fullscreen_cursor_to_window',
                type = 'toggle',
                default = 0,
                ui_control = 'interface_5_value',
                set = function(key,value,startup)
                    ConExecute("SC_ToggleCursorClip " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0207>Main Menu Background Movie",
                key = 'mainmenu_bgmovie',
                type = 'toggle',
                default = true,
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0228>Unit Health Bars",
                key = 'unit_health_bars',
                type = 'toggle',
                default = true,
                ui_control = 'interface_4_value',
                joy_control = 'value02',
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0210>Show Lifebars of Attached Units",
                key = 'show_attached_unit_lifebars',
                type = 'toggle',
                default = true,
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0211>Use Factional UI Skin",
                key = 'skin_change_on_start',
                type = 'toggle',
                default = 'yes',
                set = function(key,value,startup)
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = 'yes' },
                        {text = "<LOC _Off>Off", key = 'no' },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0229>Range Overlays",
                key = 'allintel',
                type = 'toggle',
                default = false,
                joy_control = 'value01',
                set = function(key,value,startup)
					local filters = {}
					table.insert( filters, 'WaypointAbility' )
					if ( value == true ) then
						table.insert( filters, 'Radar' )
						table.insert( filters, 'Sonar' )
						table.insert( filters, 'AllIntel' )
						table.insert( filters, 'Maximum' )
					end
					SetOverlayFilters( filters )
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0230>Show Intel Range Circles",
                key = 'allintel',
                type = 'toggle',
                default = false,
                ui_control = 'interface_6_value',
                set = function(key,value,startup)
					local filters = {}
					table.insert( filters, 'WaypointAbility' )
					if ( Prefs.GetOption('allmilitary') == true ) then
						table.insert( filters, 'Maximum' )
					end
					if ( value == true ) then
						table.insert( filters, 'Radar' )
						table.insert( filters, 'Sonar' )
						table.insert( filters, 'AllIntel' )
					end
					SetOverlayFilters( filters )
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0231>Show Weapon Range Circles",
                key = 'allmilitary',
                type = 'toggle',
                default = false,
                ui_control = 'interface_7_value',
                set = function(key,value,startup)
					local filters = {}
					table.insert( filters, 'WaypointAbility' )
					if ( Prefs.GetOption('allintel') == true ) then
							table.insert( filters, 'Radar' )
							table.insert( filters, 'Sonar' )
							table.insert( filters, 'AllIntel' )
					end
					if ( value == true ) then
						table.insert( filters, 'Maximum' )
					end
					SetOverlayFilters( filters )
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = false },
                        {text = "<LOC _On>On", key = true },
                    },
                },
            },
        },
    },
    video = {
        title = "<LOC _Video>",
        key = 'video',
        items = {
			 {
                title = "<LOC OPTIONS_0151>In-game Subtitles",
                key = 'subtitles',
                type = 'toggle',
                default = true,
                ui_control = 'interface_3_value',
                joy_control = 'value06',
                set = function(key,value,startup)                    
                    UIMoviePlaybackEnableSubtitles(value)
                end,
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true},
                        {text = "<LOC _Off>Off", key = false},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0232>Cinematic Subtitles",
                key = 'cinematic_subtitles',
                type = 'toggle',
                default = false,
                joy_control = 'value07',
                custom = {
                    states = {
                        {text = "<LOC _On>On", key = true},
                        {text = "<LOC _Off>Off", key = false},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0010>Primary Adapter",
                key = 'primary_adapter',
                type = 'toggle',
                default = '1024,768,60',
                ui_control = 'video_1_value',
                verify = true,
                populate = function(value)
                    -- this is a bit odd, but the value of the primary determines how to populate the value of the secondary
                    ConExecute("SC_SecondaryAdapter " .. tostring( 'windowed' == value ))
                end,
                update = function(value)
                    ConExecute("SC_SecondaryAdapter " .. tostring( 'windowed' == value ))
                end,
                ignore = function(value)
                    if value == 'overridden' then
                        return '1024,768,60'
                    end
                    return value
                end,
                set = function(key,value,startup)
                    if not startup then
                        ConExecute("SC_PrimaryAdapter " .. tostring(value))
                    end
                    ConExecute("SC_SecondaryAdapter " .. tostring( 'windowed' == value ))
                end,
                -- the remaining values are populated at runtime from device caps
                -- what follows is just an example of the data which will be encountered
                custom = {
                    states = {
                        { text = "<LOC _Command_Line_Override>Command Line Override", key = 'overridden' },
                        { text = "<LOC _Windowed>Windowed", key = 'windowed' },
                        { text =  "1024x768(60)", key = '1024,768,60' },
                        { text = "1152x864(60)", key = '1152,864,60' },
                        { text = "1280x768(60)", key = '1280,768,60' },
                        { text = "1280x800(60)", key = '1280,800,60' },
                        { text = "1280x1024(60)", key = '1280,1024,60' },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0147>Secondary Adapter",
                key = 'secondary_adapter',
                type = 'toggle',
                default = 'disabled',
                restart = true,
                ignore = function(value)
                    if value == 'overridden' then
                        return 'disabled'
                    end
                    return value
                end,
                custom = {
                    states = {
                        { text = "<LOC _Command_Line_Override>Command Line Override", key = 'overridden' },
                        { text = "<LOC _Disabled>Disabled", key = 'disabled' },
                        -- the remaining values are populated at runtime from device caps
                        -- what follows is just an example of the data which will be encountered
                        { text = "1024x768(60)", key = '1024,768,60' },
                        { text = "1152x864(60)", key = '1152,864,60' },
                        { text = "1280x768(60)", key = '1280,768,60' },
                        { text = "1280x800(60)", key = '1280,800,60' },
                        { text = "1280x1024(60)", key = '1280,1024,60' },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_001>Fidelity Presets",
                key = 'fidelity_presets',
                type = 'toggle',
                default = 2,
                ui_control = 'video_2_value',
                update = function(value)
                    logic = import('/lua/ui/options/optionsLogic.lua')

                    LOG( "Fidelity Value: "..value )

                    if 0 == value then
                        UIOptionsSetValue('model_detail',1,true)
                        UIOptionsSetValue('shadow_quality',1,true)
                        UIOptionsSetValue('texture_level',2,true)
                        UIOptionsSetValue('water_fidelity',1,true)
                        UIOptionsSetValue('anisotropic_filtering',1,true)
                        UIOptionsSetValue('depth_of_field',0,true)
                        UIOptionsSetValue('antialiasing',0,true)
                    elseif 1 == value then
                        UIOptionsSetValue('model_detail',0,true)
                        UIOptionsSetValue('shadow_quality',2,true)
                        UIOptionsSetValue('texture_level',1,true)
                        UIOptionsSetValue('water_fidelity',2,true)
                        UIOptionsSetValue('anisotropic_filtering',4,true)
                        UIOptionsSetValue('depth_of_field',0,true)
                        UIOptionsSetValue('antialiasing',0,true)
                    elseif 2 == value then
                        UIOptionsSetValue('model_detail',0,true)
                        UIOptionsSetValue('shadow_quality',3,true)
                        UIOptionsSetValue('texture_level',0,true)
                        UIOptionsSetValue('water_fidelity',3,true)
                        UIOptionsSetValue('anisotropic_filtering',8,true)
                        UIOptionsSetValue('depth_of_field',1,true)
                        UIOptionsSetValue('antialiasing',0,true)
                    end

                    ConExecute("graphics_Fidelity " .. tostring(value))
                end,
                set = function(key,value,startup)
					ConExecute("graphics_Fidelity " .. tostring(value))
                end,
                custom = {
                    states = {
                        { text = "<LOC _Low>Low", key = 0 },
                        { text = "<LOC _Medium>Medium", key = 1 },
                        { text = "<LOC _High>High", key = 2 },
                        { text = "<LOC _Custom>Custom", key = 3 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0168>Render Sky",
                key = 'render_skydome',
                type = 'toggle',
                default = 1,
                update = function(value)
                end,
                set = function(key,value,startup)
                    ConExecute("ren_Skydome " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
        },
     },

	video_advanced = {
		title = "<LOC _Video>",
		key = 'video_advanced',
			items = {
            {
                title = "Model Detail",
                key = 'model_detail',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_1_value',
                update = function(value)
					UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    ConExecute("ren_LODReduction " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Low>Low", key = 1},
                        {text = "<LOC _High>High", key = 0},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0019>Texture Detail",
                key = 'texture_level',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_2_value',
                update = function(value)
                    UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    ConExecute("ren_MipSkipLevels " .. tostring(value))
                end,
                custom = {
                    states = {
                        { text = "<LOC OPTIONS_0112>Low", key = 2 },
                        { text = "<LOC OPTIONS_0111>Medium", key = 1 },
                        { text = "<LOC OPTIONS_0110>High", key = 0 },
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0024>Shadow Fidelity",
                key = 'shadow_quality',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_3_value',
                update = function(value)
                    UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    ConExecute("shadow_Fidelity " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0},
                        {text = "<LOC _Low>Low", key = 1},
                        {text = "<LOC _Medium>Medium", key = 2},
                        {text = "<LOC _High>High", key = 3},
                        {text = "<LOC _Extreme>Extreme", key = 4},
                    },
                },
            },
            {
                title = "Water Fidelity",
                key = 'water_fidelity',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_4_value',
                update = function(value)
                    UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    ConExecute("water_Fidelity " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Low>Low", key = 1},
                        {text = "<LOC _Medium>Medium", key = 2},
                        {text = "<LOC _High>High", key = 3},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0015>Anti-Aliasing",
                key = 'antialiasing',
                type = 'toggle',
                default = 0,
                ui_control = 'videoadv_5_value',
                update = function(value)
                    UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    if not startup then
                        ConExecute("SC_AntiAliasingSamples " .. tostring(value))
                    end
                end,
                custom = {
                    states = {
                        {text = "<LOC OPTIONS_0029>Off", key = 0},
                        -- the remaining values are populated at runtime from device caps
                        -- what follows is just an example of the data which will be encountered
                        {text =  "2", key =  2},
                        {text =  "4", key =  4},
                        {text =  "8", key =  8},
                        {text = "16", key = 16},
                    },
                },
            },
            {
                title = "Anisotropic Filtering",
                key = 'anisotropic_filtering',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_6_value',
                update = function(value)
                    UIOptionsSetValue('fidelity_presets',4,false)
                end,
                set = function(key,value,startup)
                    ConExecute("d3d_SetAnisotropicFiltering " .. tostring(value))
                end,
                custom = {
                    states = {
                        {text = "<LOC _Low>Low", key = 1},
                        {text = "<LOC _Medium>Medium", key = 2},
                        {text = "<LOC _High>High", key = 3},
                    },
                },
            },
            {
                title = "<LOC OPTIONS_0148>Vertical Sync",
                key = 'vsync',
                type = 'toggle',
                default = 0,
                ui_control = 'videoadv_7_value',
                set = function(key,value,startup)
                    if not startup then
                        ConExecute("SC_VerticalSync " .. tostring(value))
                    end
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
            {
                title = "Depth of field",
                key = 'depth_of_field',
                type = 'toggle',
                default = 1,
                ui_control = 'videoadv_8_value',
                set = function(key,value,startup)
                    if not startup then
                        ConExecute("ren_DepthOfField " .. tostring(value))
                    end
                end,
                custom = {
                    states = {
                        {text = "<LOC _Off>Off", key = 0 },
                        {text = "<LOC _On>On", key = 1 },
                    },
                },
            },
        },
    },
    sound = {
        title = "<LOC _Sound>",
        items = {
            {
                title = "<LOC OPTIONS_0028>Master Volume",
                key = 'master_volume',
                type = 'slider',
                default = 100,
                ui_control = 'sound_1_statusbar',
                joy_control = 'sel01_statusbar',

                set = function(key,value,startup)
                    SetVolume("master", value / 100)
                end,
                
                update = function(value)
                    SetVolume("master", value / 100)
                end,

                custom = {
                    min = 0,
                    max = 100,
                    inc = 10,
                    inc_360 = 10,
                },
            },
            {
                title = "<LOC OPTIONS_0026>FX Volume",
                key = 'fx_volume',
                type = 'slider',
                default = 100,
                ui_control = 'sound_2_statusbar',
                joy_control = 'sel02_statusbar',


                set = function(key,value,startup)
                    SetVolume("SoundFX", value / 100)
                    SetVolume("UI", value / 100)
                    savedFXVol = value/100
                end,

                update = function(value)
                    SetVolume("SoundFX", value / 100)
                    SetVolume("UI", value / 100)
                    PlayTestSound()
                end,

                custom = {
                    min = 0,
                    max = 100,
                    inc = 10,
                    inc_360 = 10,
                },
            },
            {
                title = "<LOC OPTIONS_0027>Music Volume",
                key = 'music_volume',
                type = 'slider',
                default = 100,
                ui_control = 'sound_3_statusbar',
                joy_control = 'sel03_statusbar',


                set = function(key,value,startup)
                    SetVolume("music", value / 100)
                end,

                update = function(value)
                    SetVolume("music", value / 100)
                end,

                custom = {
                    min = 0,
                    max = 100,
                    inc = 10,
                    inc_360 = 10,
                },
            },
            {
                title = "<LOC OPTIONS_0066>VO Volume",
                key = 'vo_volume',
                type = 'slider',
                default = 100,
                ui_control = 'sound_4_statusbar',
                joy_control = 'sel04_statusbar',

                set = function(key,value,startup)
                    SetVolume("VO", value / 100)
                end,
                
                update = function(value)
                    SetVolume("VO", value / 100)
                    PlayTestVoice()
                end,
                custom = {
                    min = 0,
                    max = 100,
                    inc = 10,
                    inc_360 = 10,
                },
            },
            {
                title = "<LOC OPTIONS_0018>Fidelity",
                key = 'fidelity',
                type = 'toggle',
                default = 1,
                ui_control = 'sound_6_value',
                set = function(key, value, startup)
                    SetAudioLOD(value)
                end,
                custom = {
                    states = {
                        { text = "<LOC _Low>Low", key = 3, },
                        { text = "<LOC _Medium>Medium", key = 2, },
                        { text = "<LOC _High>High", key = 1, },
                    },
                },
            },
        },
    },
}


