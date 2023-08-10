--------------------------------------------------------------------------
-- File: lua/ui/ui_strings.lua
-- Author: Chad Queen
-- Summary: All UI strings that aren't included already in the interface
--			files will be accessible here.
--
-- Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
--------------------------------------------------------------------------

ui_strings = {
	dialog_ok = '<LOC DIALOG_OK>OK',
	dialog_cancel = '<LOC DIALOG_CANCEL>CANCEL',
	dialog_yes = '<LOC DIALOG_YES>YES',
	dialog_no = '<LOC DIALOG_NO>NO',
	dialog_key_continue = '<LOC DIALOG_KEY_CONTINUE>Press any key to continue',
	dialog_button_continue = '<LOC DIALOG_BUTTON_CONTINUE>Press any button to continue',

	main_menu = {
		version = 'version: ',
	},

	main_menu_tooltips = {
		b_continue_campaign = '<LOC TT_MM_CONTINUE>Load your last saved game',
		b_campaign = '<LOC TT_MM_CAMPAIGN>Select a campaign',
		b_skirmish = '<LOC TT_MM_SKIRMISH>Start a skirmish match against or with AI opponents',
		b_xbox_live = '<LOC TT_MM_LIVE>Join or create a multiplayer game, view player rankings, and more',
		b_credits = '<LOC TT_MM_EXTRAS>Access game extras',
		--b_extras = '<LOC TT_MM_EXTRAS>Access game extras',
		b_options = '<LOC TT_MM_OPTIONS>Change and view controller, interface, and audio settings',
		b_party = '<LOC TT_MM_PARTY>Access the Xbox Live Party menu',
	},

	select_campaign_tooltips = {
		b_tutorial = '<LOC TT_SC_TUTORIAL>Play the Tutorial',
		b_uef = '<LOC TT_SC_UEF>Play the UEF campaign',
		b_illuminate = '<LOC TT_SC_ILLUMINATE>Play the Illuminate campaign',
		b_cybran = '<LOC TT_SC_CYBRAN>Play the Cybran campaign',
	},

	campaign_menu = {
		campaign_locked = '<LOC campaign_locked>Campaign Locked',
	},

	difficulty = {
		easy = "<LOC diff_easy>EASY",
		medium = "<LOC diff_medium>NORMAL",
		hard = "<LOC diff_hard>HARD",
		difficulty_title = "<LOC difficulty_title>DIFFICULTY: ",
	},

	live_menu_tooltips = {
		b_private_match = '<LOC match_private>Play a custom game with your Xbox LIVE Party and friends',
		b_standard_match = '<LOC match_standard>Pick a faction and jump into a public game',
		b_ranked_match = '<LOC match_ranked>Play 1v1 against an opponent for Leaderboard rank',
		b_leaderboards= '<LOC live_leaderboards>View Supreme Commander 2 Leaderboards',
	},

	option_select_tooltips = { -- note: first two LOC tags are accidentally reversed
		tt_option_select_controls = '<LOC option_select_interface>Set camera options and view the controller layout',
		tt_option_select_interface = '<LOC option_select_controls>Change user interface options',
		tt_option_select_audiovideo = '<LOC option_select_audiovideo>Adjust sound volume levels and subtitle settings',
		tt_change_storage = '<LOC option_change_storage>Change current storage device',
	},

	options = {
		--tt_option_test = 'This is a test option',
		controls_options_reset = '<LOC options_reset>Are you sure you want to reset the control settings?',
		interface_options_reset = '<LOC interface_options_reset>Are you sure you want to reset the interface options?',
		sound_options_reset = '<LOC sound_options_reset>Are you sure you want to reset the sound options?',
		video_options_reset = '<LOC video_options_reset>Are you sure you want to reset the video settings?',
		advanced_video_options_reset = '<LOC advanced_video_options_reset>Are you sure you want to reset the advanced video settings?',
		options_cancel = '<LOC options_cancel>Cancel and discard changes?',
	},

	skirmish_player_options = {
		set_player_options = '<LOC set_player_options>Set Player Options',
		option_faction = '<LOC option_faction>Faction',
		option_team = '<LOC option_team>Team',
		option_color = '<LOC option_color>Color',
		option_ai = '<LOC option_ai>AI Profile',
		faction_armada = '<LOC faction_armada_0000>Armada', --uef
		faction_cortex = '<LOC faction_cortex_0000>Cortex', --cybran
		faction_sepluge = '<LOC faction_sepluge_0000>Sepluge', --aeon/seraphim
		faction_observer = '<LOC faction_observer_0000>Observer',
		faction_random = '<LOC faction_random_0000>Random',
		ai_none = '<LOC ai_none>None',
	},

	skirmish_exclusions = {
		title = '<LOC skrimish_exclusions_title>Change Exclusions',
	},

	skirmish_menu = {
		title_skirmish = '<LOC title_skirmish>SKIRMISH',
		title_multiplayer = '<LOC title_multiplayer>MULTIPLAYER LOBBY',
		player_unassigned = '<LOC player_unassigned>Unassigned',
		player_remove = '<LOC player_remove>Remove',
		player_no_sandbox_warning = '<LOC player_no_sandbox_warning>This victory condition requires at least one opponent.',
		player_not_enough_start_spots = '<LOC player_not_enough_start_spots>Game can\'t be started because there are more players than starting spots.',
		change_game_type = '<LOC change_game_type>Change Game Type',
		change_map = '<LOC change_map>Change the Map',
		setup_players = '<LOC setup_players>Setup Players',
		map_tag = '<LOC map_tag>MAP: ',
		gametype_tag = '<LOC gametype_tag>TYPE: ',
		delay_combat_tag = '<LOC delay_combat>RUSH TIMER: ',
		delay_combat_yes = '<LOC delay_combat_yes>Yes',
		delay_combat_no = '<LOC delay_combat_no>No',
		view_gamercard = '<LOC view_gamercard>View Gamer Card',
		show_exclusions = '<LOC show_exclusions>Show Exclusions',
		player_options = '<LOC player_options>Player Options',
		pos_1 = '<LOC start_position_a>A',
		pos_2 = '<LOC start_position_b>B',
		pos_3 = '<LOC start_position_c>C',
		pos_4 = '<LOC start_position_d>D',
		player_same_start_pos = '<LOC player_same_start_pos>Players are not allowed to share the same starting location.',
		player_same_color = '<LOC player_same_color>Players are not allowed to share the same team color.',
		player_not_ready = '<LOC player_not_ready>Not all players are ready',
		x360_exclusion_toggle = '<LOC x360_exclusion_toggle>Toggle on/off',
	},

	multiplayer_general = {
		player_adjust_game_speed = '<LOC player_adjust_game_speed>%PLAYER has adjusted the game speed',
		you_were_ejected_connectivity = '<LOC you_were_ejected_connectivity>You have been ejected due to connectivity issues',
		player_ejected_connectivity = '<LOC player_ejected_connectivity>%PLAYER  has been ejected due to connectivity issues',
		choose_valid_game_name = '<LOC choose_valid_game_name>Please choose a valid game name',
		unable_to_start_game = '<LOC unable_to_start_game>Unable to start game',
		multiplayer_none = '<LOC multiplayer_none>None',
		multiplayer_rejected = '<LOC multiplayer_rejected>You were rejected by the host',
		multiplayer_kicked = '<LOC multiplayer_kicked>You were kicked out of the game by the host',
		multiplayer_SlotUnavailable = '<LOC multiplayer_SlotUnavailable>There are no available multiplayer slots',
		multiplayer_SlotClosed = '<LOC multiplayer_SlotClosed>The available slot has closed',
		multiplayer_ChangeNotAllowed = '<LOC multiplayer_ChangeNotAllowed>That change is not allowed',
		multiplayer_PlayerQuit = '<LOC multiplayer_PlayerQuit>A Player has quit',
		multiplayer_PlayerNotFound = '<LOC multiplayer_PlayerNotFound>Unable to find that player',
		multiplayer_ConnectionFailed = '<LOC multiplayer_ConnectionFailed>Connection failed',
		multiplayer_UIDInUse = '<LOC multiplayer_UIDInUse>That user ID is already in use',
		multiplayer_ConnectionLostFromMatch = '<LOC multiplayer_ConnectionLostFromMatch>Match connection lost',
		multiplayer_HostAbandonedLobby = '<LOC multiplayer_HostAbandonedLobby>The host has abandoned the lobby',
		multiplayer_NetworkProblemOthers = '<LOC multiplayer_NetworkProblemOthers>Network interruption detected. This might be temporary. You can wait for this to resolve or you can quit.',
		multiplayer_NetworkProblemSelf1 = '<LOC multiplayer_NetworkProblemSelf1>Network interruption detected',
		multiplayer_NetworkProblemSelf2 = '<LOC multiplayer_NetworkProblemSelf2>Waiting for players:',
	},

	desync_menu = {
		desync_menu_DesyncMsg = '<LOC desync_menu_DesyncMsg>Desync Detected',
		desync_menu_DesyncQuit = '<LOC desync_menu_DesyncQuit>Quit',
		desync_menu_DesyncResume = '<LOC desync_menu_DesyncResume>Resume',
	},

	search_options = {
		standardgame = "<LOC options_standardgame> Standard Game",
		rankedgame = "<LOC options_rankedgame> Ranked Game",
		searching = "<LOC options_searching>Searching...",
		waiting = "<LOC options_waiting>Waiting for Players",
		starting = "<LOC options_starting>Starting Game",
		searchplayer = "<LOC options_search_player>Waiting for Players...",
		Assasination = "<LOC options_assassination>Assassination",
		Supremacy = "<LOC options_supremacy>Supremacy",
		demoralization = "<LOC options_demoralization>Assassination",
		domination = "<LOC options_domination>Supremacy",
        help0 = "<LOC SC2_ttp_type_option0000>Select a type of game to play",
        help1 = "<LOC SC2_ttp_faction_option0000>Select your Faction",
        help2 = "<LOC SC2_ttp_opponent_option0000>Select a type of map to play",
	},

	host_game = {
		host_in_progress = '<LOC host_game_hosting>Hosting a game',
		host_failed = '<LOC host_failed>Unable to host a game',
		loading = '<LOC loading>Loading',
		waiting_for_player = '<LOC waiting_for_player>Waiting for %PLAYER',
		player_disconnected = '<LOC player_disconnected>%PLAYER disconnected',
		lost_connection_to_player = '<LOC lost_connection_to_player>Lost connection to %PLAYER',
	},

	join_game = {
		connecting = '<LOC connecting>Connecting...',
		join_in_progress = '<LOC join_game_hosting>Joining Game',
		attempting_to_join = '<LOC attempting_to_join>Attempting to Join',
		connection_to_player_established = '<LOC connection_to_player_established>Connection to %PLAYER established',
		connecting_to_player = '<LOC connecting_to_player>Connecting to %PLAYER...',
		game_join_full = '<LOC game_join_full>The game you attempted to join is full',
		join_general_fail = '<LOC join_general_fail>Unable to join game',
		connect = '<LOC connect>Connect',
		failpassword = '<LOC failpw>Incorrect password',
	},

	game_browser_menu = {
		all_servers		= '<LOC gb_all_servers>PUBLIC GAMES',
		friends			= '<LOC gb_friends>FRIENDS',
		search_results	= '<LOC gb_search_results>SEARCH RESULTS',
		servers_scanned = '<LOC gb_servers_scanned>Servers Scanned',
	},

	exit_dialog = {
		message = '<LOC EXIT_CONFIRM>Are you sure you want to exit?',
		message_restart = '<LOC EXIT_RESTART>Are you sure you want to restart?',
		message_end = '<LOC EXIT_END>Are you sure you want to end the current game?',
		endgame_sp = '<LOC endgame_sp>Are you sure you want to leave the game? Any unsaved progress will be lost.',
	    restart_sp = '<LOC restart_sp>Are you sure you want to restart the game? Any unsaved progress will be lost.',
	},

	x360_warning = {
	    profile_changed = '<LOC profile_changed>The active player sign-in status has changed. Returning to the Main Menu.',
	    profile_nolive = '<LOC profile_nolive>Your gamer profile is not signed into Xbox LIVE. Do you want to sign in now?',
	    signin_options = '<LOC signin_options>You are not signed in. In order to save changes to your preferences, you will need to be signed in. Do you want to sign in now?',
	    signin_sp = '<LOC signin_sp>You are not signed in. In order to save progress, you will need to be signed in. Do you want to sign in now?',
	    signin_live = '<LOC signin_live>You are not signed in. In order to access Xbox LIVE features, you must be signed in. Do you want to sign in now?',
	    signin_live_perm = '<LOC signin_live_perm>An Xbox LIVE Gold Membership or permission for online gameplay is required. Do you want to sign in to an appropriate gamer profile now?',
	    signin_leaderboards = '<LOC signin_leaderboards>In order to post your Campaign scores to the Leaderboards, you must be signed into Xbox LIVE. Do you want to sign in now?',
	    signout_sp = '<LOC signout_sp>You are about to sign out. If you sign out, any unsaved progress will be lost. Do you want to sign out now?',
	    signout_mp = '<LOC signout_mp>You are about to sign out. If you sign out, you will leave this game and return to the Main Menu. Do you want to sign out now?',
	    signout_ranked = '<LOC signout_ranked>You are about to sign out. If you sign out, this game will end and be counted as a loss. Do you want to sign out now?',
	    save_existing = '<LOC save_existing>You are about to overwrite an existing save. Continue?',
	    save_full = '<LOC save_full>There is not enough space on your storage device to save your game. Please choose a different storage device or free up space in order to save your progress.',
	    save_long = '<LOC save_long>Saving content. Please don\'t turn off your console or sign out of your current gamer profile.',
	    save_cancel = '<LOC save_cancel>You have not selected a storage device. Any unsaved progress will be lost. Do you want to select a storage device?',
	    network_lost = '<LOC network_lost>You have lost your network connection.',
		invitation_rejected = '<LOC invitation_rejected>Invitation can not be accepted from the same console.',
		leaderboard_empty = '<LOC leaderboard_empty>There are no entries on this Leaderboard.',
		prefs_corrupted_overwrite = '<LOC prefs_corrupted_overwrite>Unable to read your current player status file. Do you want to overwrite this file? If you do not, your settings and progress will not be saved.',
		prefs_corrupted = '<LOC prefs_corrupted>Your player status file cannot be loaded.',
		unable_to_load = '<LOC unable_to_load>Unable to load the file.',
		unable_to_load_dlc = '<LOC unable_to_load_dlc>Unable to load your DLC. Please re-download the content and try again.',
	},

	multiplayer_over = {
		you_have_won = '<LOC you_have_won>You have won the match!',
		victory = '<LOC victory>Victory!',
		defeated = '<LOC defeated>You have been defeated!',
		draw = '<LOC draw>The match has ended in a draw.',
	},

	Summary_Menu = {
		match_time							= '<LOC summary_match_time>Match Time',
		multiplayer_summary					= '<LOC multiplayer_summary>SUMMARY',
		label_score							= '<LOC summary_score>SCORE',
		Enemies_Killed						= '<LOC summary_kills>KILLS',
		Units_Killed						= '<LOC summary_losses>LOSSES',
		Units_History						= '<LOC summary_built>BUILT',
		Enemies_Experimentals_Destroyed		= '<LOC summary_experimental_kills>EXPERIMENTAL KILLS',
		Enemies_Commanders_Destroyed		= '<LOC summary_acu_kills>ACU KILLS',
		Economy_TotalProduced_Mass			= '<LOC summary_mass>MASS',
		Economy_TotalConsumed_Mass			= '<LOC summary_mass_spent>MASS SPENT',
		Economy_Reclaimed_Mass				= '<LOC summary_reclaimed_mass>RECLAIMED MASS',
		Economy_TotalProduced_Energy		= '<LOC summary_energy>ENERGY',
		Economy_TotalConsumed_Energy		= '<LOC summary_energy_spent>ENERGY SPENT',
		Economy_TotalProduced_Research		= '<LOC summary_income_research>POINTS EARNED',
		Economy_Research_Units_Unlocked		= '<LOC summary_units_unlocked>UNITS UNLOCKED',
		Economy_Research_Learned_Count		= '<LOC summary_learned_count>LEARNED COUNT',
		Experience_Earned					= '<LOC summary_experience_earned>EXPERIENCE EARNED',
	},

	campaign_summary = {
		title_prefix = '<LOC title_prefix>OPERATION: ',
		elapsed_time_prefix = '<LOC elapsed_time_prefix>Elapsed Time > ',
		objectives_prefix = '<LOC objectives_prefix>OBJECTIVES: ',
		objectives_postfix = '<LOC objectives_postfix>Completed',

		units_stat_1 = '<LOC units_stat_1>Kills',
		units_stat_2 = '<LOC units_stat_2>Losses',
		units_stat_3 = '<LOC units_stat_3>Built',
		units_stat_4 = '<LOC units_stat_4>Experimental Kills',
		units_stat_5 = '<LOC units_stat_5>ACU Kills',

		resources_stat_1 = '<LOC resources_stat_1>Mass',
		resources_stat_2 = '<LOC resources_stat_2>Mass Spent',
		resources_stat_3 = '<LOC resources_stat_3>Energy',
		resources_stat_4 = '<LOC resources_stat_4>Energy Spent',
		resources_stat_5 = '<LOC resources_stat_5>Reclaimed Mass',

		research_stat_1 = '<LOC research_stat_1>Items Researched',
		research_stat_2 = '<LOC research_stat_2>Units Unlocked',
		research_stat_3 = '<LOC research_stat_3>Points Earned',
		research_stat_4 = '<LOC research_stat_4>Experience Earned',
	},

	leaderboards = {
		sbt_annihilation = '<LOC SKILL_BOARD_001>Assassination',
		sbt_supremacy = '<LOC SKILL_BOARD_002>Supremacy',
		wbt_annihilation_monthly = '<LOC WINS_BOARD_001>Assassination (Monthly)',
		wbt_annihilation_lifetime = '<LOC WINS_BOARD_002>Assassination (Lifetime)',
		wbt_supremacy_monthly = '<LOC WINS_BOARD_003>Supremacy (Monthly)',
		wbt_supremacy_lifetime = '<LOC WINS_BOARD_004>Supremacy (Lifetime)',
		wbt_cybran_wins_monthly = '<LOC WINS_BOARD_005>Cybran Wins (Monthly)',
		wbt_uef_wins_monthly = '<LOC WINS_BOARD_006>UEF Wins (Monthly)',
		wbt_illuminate_wins_monthly = '<LOC WINS_BOARD_007>Illuminate Wins (Monthly)',
		cbt_easy = '<LOC CAMPAIGN_BOARD_001>Easy',
		cbt_medium = '<LOC CAMPAIGN_BOARD_002>Normal',
		cbt_hard = '<LOC CAMPAIGN_BOARD_003>Hard',
	},

	save_load_menu = {
		saving = '<LOC saving_game>Saving game...',
		loading = '<LOC loading_game>Loading game...',
		save_title = '<LOC save_title>SAVE GAME',
		load_title = '<LOC load_title>LOAD GAME',
		button_save = '<LOC button_save>SAVE',
		button_load = '<LOC button_load>LOAD',
		button_close = '<LOC button_save_loc_close>BACK',
		button_delete = '<LOC button_save_delete>DELETE',
		overwrite_save = '<LOC overwrite_save>A file already exists with that name. Are you sure you want to overwrite it?',
		WrongVersion = '<LOC uisaveload_0005>Wrong version for savegame "%s"',
		CantOpen = '<LOC uisaveload_0004>Couldn\'t open savegame "%s"',
		InvalidFormat = '<LOC uisaveload_0006>"%s" is not a valid savegame',
		InternalError = '<LOC uisaveload_0007>Internal error loading savegame "%s": %s',
		eof = "<LOC Engine0027>EOF reached during serialization.",
		noread = "<LOC Engine0028>Error reading file stream during serialization.",
		nowrite = "<LOC Engine0026>Error writing data during serialization. Possibly out of disk space.",
		confirm_delete = "<LOC file_0001>Are you sure you want to move this file to the recycle bin?",
		confirm_x360_delete = "<LOC x360_file_delete_0001>Are you sure you want to delete this file?",
		save_failed = "<LOC save_game_failed>Failed to save game: %s",
		no_saves = "<LOC no_save_games>No save game files are available.",
		save_prefix = "<LOC save_prefix>Campaign",
		change_device = "<LOC save_change_device>CHANGE DEVICE",
		load_failed = "<LOC generic_load_failed>Failed to load saved game.",
	},

	replay_menu = {
		replay_mode = '<LOC replay_mode>Replay Mode',
		replay_finished = '<LOC replay_finished>Replay finished',
		replay_pause = '<LOC replay_pause>Pause',
		replay_speedup = '<LOC replay_speedup>Increase Playback Speed',
		replay_slowdown = '<LOC replay_slowdown>Descrease Playback Speed',
		replay_end = '<LOC replay_end>End the Replay and Exit',
        replay_failed = "<LOC replay_failed>Failed to load replay.",
		replay_save_title = '<LOC replay_save_title>SAVE REPLAY',
		replay_load_title = '<LOC replay_load_title>LOAD REPLAY',
	},

    x360_select_units_menu = {
	    select_land = '<LOC select_land>Select Land',
	    select_air = '<LOC select_air>Select Air',
	    select_sea = '<LOC select_sea>Select Sea',
	},

	unit_tracking = {
		tracking_unit = '<LOC tracking_unit>Tracking Unit',
		tracking_hover = '<LOC tracking_hover>Press T to stop tracking',
	},

	worldview = {
		coordinated_attack_left_pc = '<LOC coordinated_attack_left_pc>Double left-click for coordinated attack',
		coordinated_attack_right_pc = '<LOC coordinated_attack_right_pc>Double right-click for coordinated attack',
		coordinated_attack_left_360 = '<LOC coordinated_attack_left_360>Double tap A for coordinated attack',

		patrol_convert_left_pc = '<LOC patrol_convert_left_pc>Left-click to convert moves into patrol',
		patrol_convert_right_pc = '<LOC patrol_convert_right_pc>Right-click to convert moves into patrol',
		patrol_convert_360 = '<LOC patrol_convert_360>Press A to convert moves into patrol',
	},

	commands_menu = {
		firemode_return_fire = '<LOC firemode_return_fire>Return Fire',
		firemode_hold_fire = '<LOC firemode_hold_fire>Hold Fire',
		firemode_hold_ground = '<LOC firemode_hold_ground>Ground Fire',
	},

	chat_menu = {
		all_players = "<LOC all_players>All Players",
		team_only_players = "<LOC team_only_players>Team Players Only",
		friends_only_players = "<LOC friends_only_players>Friend Players Only",
		private = "<LOC chat_private>Private",
	},

	research_tip = {
		prerequisite = "<LOC RESEARCH_TIP_0000>Prerequisite:",
		prerequisites = "<LOC RESEARCH_TIP_0001>Prerequisites:",
		prerequisite_or = "<LOC RESEARCH_TIP_PREREQ_OR>or",
	},

	research_tooltips = {
		research_land =  '<LOC research_land>Non-Experimental Land Units',
		research_air = '<LOC research_air>Non-Experimental Air Units',
		research_naval = '<LOC research_naval>Non-Experimental Naval Units',
		research_structures = '<LOC research_structures>Non-Experimental Structures',
		research_acu = '<LOC research_acu>Armored Command Unit',
	},

	construction_menu = {
		basic_units = "<LOC construction_basic_units>BASIC",
		advanced_units = "<LOC construction_advanced_units>ADVANCED",
		units = "<LOC construction_units>UNITS",
		upgrades = "<LOC construction_upgrade>ADD-ONS",
		experimentals = "<LOC construction_experimentals>EXPERIMENTALS",
		storage = "<LOC construction_storage>STORAGE",
		repeat_queue = '<LOC repeat_queue>Repeat the Build Queue',
		pause_queue = '<LOC pause_queue>Pause the Build Queue',
		build_queue_paused = '<LOC build_queue_paused>Build Queue Paused',
		unable_to_afford_queue = '<LOC unable_to_afford_queue>Unable to afford item in build queue',
	},

	pc_econ_tooltips = {
		access_research = '<LOC access_research>Access Research',
		available_mass = '<LOC available_mass>Available Mass (rate/sec)',
		available_energy = '<LOC available_energy>Available Energy (rate/sec)',
		unit_cap = '<LOC unit_cap>Total Units/Unit Cap',
	},

	pc_idle_tooltips = {
		acu_select = '<LOC acu_select>Select Your ACU',
		idle_engineers = '<LOC idle_engineers>Cycle Between Idle Engineers',
		idle_landfactories = '<LOC idle_landfactories>Cycle Between Idle Land Factories',
		idle_airfactories = '<LOC idle_airfactories>Cycle Between Idle Air Factories',
		idle_seafactories = '<LOC idle_seafactories>Cycle Between Idle Sea Factories',
		idle_expfactories = '<LOC idle_expfactories>Cycle Between Idle Experimental Factories',
	},

	hud_selection_menu = {
		storage = "<LOC selection_storage>Storage",
	},

	objectives_menu = {
		primary		= '<LOC primary_obj_menu>Primary',
		secondary	= '<LOC secondary_obj_menu>Secondary',
		hidden		= '<LOC hidden_obj_menu>Hidden',
	},

	-- 360 XLAST strings that require localization (nothing calls these, we just need to get them into the loc spreadsheet)
	xlast_strings = {
	    xlast_lobby_private = '<LOC xlast_lobby_private>Private Lobby',
	    xlast_lobby_standard = '<LOC xlast_lobby_standard>Quick Lobby',
	    xlast_lobby_ranked = '<LOC xlast_lobby_ranked>Ranked Lobby',
	    xlast_mode_frontend = '<LOC xlast_mode_frontend>In the Menus',
	    xlast_info_developer = '<LOC xlast_info_developer>Gas Powered Games',
	    xlast_info_genre = '<LOC xlast_info_genre>Real-Time Strategy',
	    xlast_info_publisher = '<LOC xlast_info_publisher>Square Enix',
	    xlast_info_sellText = '<LOC xlast_info_sellText>Supreme Commander 2 delivers real-time strategy on an epic scale. Take the role of three enigmatic commanders--former friends from each of the unique factions--as they are dragged into a conflict that could plunge the galaxy into another civil war. Command hundreds of land, air, and sea units in spectacular environments, upgrade your armies with new weapons and technologies, and deploy enormous experimental war machines that can change the balance of power at any moment.',
	},
}