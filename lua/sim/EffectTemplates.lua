-----------------------------------------------------------------------------
--  File     : /data/lua/effecttemplates.lua
--  Author(s): Aaron Lundquist, Matt Vainio, Gordon Duclos
--  Summary  : Effect templates
--  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

EffectTemplates = {
	Wreckage = {
		Small = {
			Fire = {
				{
					-- large fire
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_01_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
				{
					-- small fire
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_02_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
				{
					-- sparks
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_07_emit.bp',
				},
			},
			Plume = {
				{
					-- dark plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_01_emit.bp',
				},
				{
					-- light small plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_02_emit.bp',
				},
				{
					-- light large plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_07_emit.bp',
				},
			},
			Smoke = {
				{
					-- grey smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_01_emit.bp',
				},
				{
					-- dark smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_02_emit.bp',
				},
				{
					-- white smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_07_emit.bp',
				},
			},
		},
		Medium = {
			Fire = {
				{
					-- slow fire
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_03_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
				{
					-- fast fire
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_04_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
				{
					-- sparks
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_07_emit.bp',
				},
			},
			Plume = {
				{
					-- small dark plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_03_emit.bp',
				},
				{
					-- small light plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_04_emit.bp',
				},
				{
					-- light large plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_07_emit.bp',
				},
				{
					-- white large plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_08_emit.bp',
				},
			},
			Smoke = {
				{
					-- light smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_03_emit.bp',
				},
				{
					-- dark smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_04_emit.bp',
				},
			},
		},
		Large = {
			Fire = {
				{
					-- large fire
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_05_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
					-- fast fire
				{
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_06_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_glow_01_emit.bp',
				},
			},
			Plume = {
				{
					-- dark plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_05_emit.bp',
				},
				{
					-- light plume
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_06_emit.bp',
				},
					-- plume with fire
				{
					'/effects/emitters/units/general/event/wreckage/wreckage_fire_08_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_09_emit.bp',
					'/effects/emitters/units/general/event/wreckage/wreckage_plume_10_emit.bp',
				},
			},
			Smoke = {
				{
					-- light smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_05_emit.bp',
				},
				{
					-- large grey smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_06_emit.bp',
				},
				{
					-- large white smoke
					'/effects/emitters/units/general/event/wreckage/wreckage_smoke_08_emit.bp',
				},
			},
		},
		AirSmokeTrail01 = {
			'/effects/emitters/ambient/impact/destruction_air_smoke_01_emit.bp',
		},
		AirSmokeTrail02 = {
			'/effects/emitters/ambient/impact/destruction_air_smoke_02_emit.bp',
			'/effects/emitters/ambient/impact/destruction_air_fire_01_emit.bp',
		},
		AirWaterBubbleTrail01 = {
			'/effects/emitters/ambient/impact/destruction_air_bubbles_01_emit.bp',
		},
	},
    Units = {
        Cybran = {
            Air = {
				General = {
				},
			},
            Experimental = {
                UCX0101 = {
                    Death01 = {
						'/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_01_flash_emit.bp',
			            '/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_02_halfflash_emit.bp',
			            '/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_03_faintfire_emit.bp',
						'/effects/emitters/ambient/impact/explosion_fire_sparks_02_emit.bp',
                    },
                    Death02 = {
						'/effects/emitters/units/general/event/death/destruction_explosion_concussion_ring_03_emit.bp',
						'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_01_flatflash_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_03_halfflash_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_04_sparks_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_05_groundglow_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_09_plasma_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_10_debris_emit.bp',
			            '/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_04_fastfire_emit.bp',
			            '/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_05_lines_emit.bp',
                    },
                },
                UCX0103 = {
                	Ambient01 = {
						'/effects/emitters/units/cybran/ucx0103/ambient/ucx0103_amb_01_glow_emit.bp',
						'/effects/emitters/units/cybran/ucx0103/ambient/ucx0103_amb_02_electricity_emit.bp',
						'/effects/emitters/units/cybran/ucx0103/ambient/ucx0103_amb_03_core_emit.bp',
					},
                    Charged01 = {
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_01_glow_emit.bp',
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_02_flatglow_emit.bp',
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_03_spin_emit.bp',
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_04_elec_emit.bp',
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_05_spread_emit.bp',
						'/effects/emitters/units/cybran/experimental/0103/event/charged/ucx0103_evt_ch_06_distort_emit.bp',
                    },
                    MainAttack01 = {
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_01_flash_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_02_rings_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_03_lines_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_04_flatelec_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_05_plasma_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_06_smallring_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_07_eleclines_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_08_flateleclines_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_09_shockwave_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_10_sparks_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_11_smoke_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_12_singeline_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_13_elecring_emit.bp',
                        '/effects/emitters/units/cybran/experimental/0103/event/mainattack/ucx0103_evt_ma_14_flatdebris_emit.bp',
                    },
                },
                UCX0114 = {
                    Pull01 = {
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_02_centerdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_06_dust_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_10_glow_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_11_sparks_emit.bp',
                    },
                    Pull02 = {
                    	'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_01_ring_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_03_lines_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_04_outerdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_05_largeouterdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_07_cameraring_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_08_flatdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_09_wisps_emit.bp',
                    },
                    Push01 = {
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_01_ring_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_03_lines_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_04_outerdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_05_largeouterdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_06_cameraring_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_07_flatdebris_emit.bp',
                    },
                    Push02 = {
						'/effects/emitters/units/cybran/ucx0114/event/pull/ucx0114_pull_02_centerdebris_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/event/push/ucx0114_push_02_dust_emit.bp',
                    },
                    OnUnitDestroy01 = {
						'/effects/emitters/units/cybran/ucx0114/ambient/ucx0114_amb_03_sparks_emit.bp',
						'/effects/emitters/units/cybran/ucx0114/ambient/ucx0114_amb_04_debris_emit.bp',
                    },
                },
                UCX0115 = {
                    Ambient01 = { -- brain grow fx
						'/effects/emitters/units/cybran/ucx0115/ambient/ucx0115_amb_01_ring_emit.bp',
						'/effects/emitters/units/cybran/ucx0115/ambient/ucx0115_amb_02_mist_emit.bp',
                    },
                },
                UCX0116 = {
                    Ambient01 = {
                        '/effects/emitters/units/cybran/experimental/0116/ambient/ucx0116_amb_05_electricity_emit.bp',
                    },
                    BuffEffectsFlying = {
						Small = {
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_01_small_inward_emit.bp',
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_02_small_outward_emit.bp',
                        },
                        Medium = {
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_03_med_inward_emit.bp',
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_04_med_outward_emit.bp',
                        },
                        Large = {
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_05_lrg_inward_emit.bp',
						    '/effects/emitters/units/cybran/ucx0115/event/buff/ucx0115_evt_b_06_lrg_outward_emit.bp',
                        },
                    },
                    Death01 = {
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_03_core_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_04_electricity_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_05_flat_electricity_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_07_smokecloud_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_08_leftover_electricity_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_10_energy_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_11_energyb_emit.bp',
						'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_12_energyc_emit.bp',
						'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_01_flatflash_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_02_groundburn_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_03_halfflash_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_04_sparks_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_05_groundglow_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_06_shockwaves_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_07_electricity_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_08_velocitylines_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_09_plasma_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_10_debris_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_11_fastsmoke_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_12_leftoverelec_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_13_fill_emit.bp',
			            '/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_14_fill_emit.bp',
                    },
                    DeathTrail01 = {
						'/effects/emitters/units/cybran/experimental/0116/event/death/ucx0116_evt_d_01_firetrail_emit.bp',
						'/effects/emitters/units/cybran/experimental/0116/event/death/ucx0116_evt_d_02_smoketrail_emit.bp',
                    },
                    Thrust01 = {
						'/effects/emitters/units/cybran/experimental/0116/ambient/ucx0116_amb_01_smoke_emit.bp',
						'/effects/emitters/units/cybran/experimental/0116/ambient/ucx0116_amb_02_glow_emit.bp',
						'/effects/emitters/units/cybran/experimental/0116/ambient/ucx0116_amb_03_thrust_emit.bp',
						'/effects/emitters/units/cybran/experimental/0116/ambient/ucx0116_amb_04_distort_emit.bp',
						'/effects/emitters/ambient/units/dirty_exhaust_sparks_01_emit.bp',
                    },
                },
            },
            Land = {
                General = {
                },
            },
            Water = {
				General = {
				},
			},
        },
        Illuminate = {
			Air = {
				General = {
				},
			},
			Base = {
				UIB0702 = {
					ShockAmbient01 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_01_elec_emit.bp',
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_02_glow_emit.bp',
                    },
                    ShockAmbient02 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_03_clawelec_emit.bp',
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_04_clawglow_emit.bp',
                    },
                    ShockAmbient03 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_05_bigclawelec_emit.bp',
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_06_bigclawglow_emit.bp',
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_07_bigclawplasma_emit.bp',
                    },
                    ShockAmbient04 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_08_clawstart_emit.bp',
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_09_clawelecstart_emit.bp',
                    },
                    ShockAmbient05 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_10_glowstart_emit.bp',
                    },
                    ShockAmbient06 = {
						'/effects/emitters/units/illuminate/uib0702/event/shock/uib0702_evt_s_11_opensmoke_emit.bp',
                    },
				},
			},
            Experimental = {
                UIX0101 = {
                    Death01 = {
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_01_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_02_sparks_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_03_faintplasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_04_fastplasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_05_lines_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_06_fire_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_07_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_08_smoke_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_09_debris_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_10_dustgroundring_emit.bp',
						'/effects/emitters/units/illuminate/uix0101/event/death/uix0101_evt_d_11_sparks_emit.bp',
                    },
                },
                UIX0111 = {
                    Death01 = {
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_01_flash_emit.bp', -- blue sparks
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_02_sparks_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_03_faintplasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_04_fastplasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_05_lines_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_06_distortring_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_07_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_08_fastflash_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_09_debris_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_10_firecloud_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_11_fire_emit.bp',
                    },
                    Death02 = {
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_12_dustburst_emit.bp', -- light fire cloud
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_13_plasma_emit.bp', -- fire cloud
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_14_plasmalines_emit.bp', -- fire flash
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_15_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_16_flashlines_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_17_smokecloud_01_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_18_smokelines_01_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_19_sparks_emit.bp',
                    },
                    Death03 = {
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_20_debris_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_21_dirt_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_22_dirtlines_01_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_23_dustburst_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_24_dustgroundring_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_25_dustgroundring_02_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_25_smokecloud_01_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_26_smokecloud_02_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_27_smokecloud_03_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_28_smokelines_01_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_29_smokelines_02_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_30_endflash_emit.bp',
                    },
                    Death04 = {
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_31_prering_emit.bp',
						'/effects/emitters/units/illuminate/uix0111/event/death/uix0111_evt_d_32_preflash_emit.bp',
                    },
                },
                UIX0112 = {
                    Death01 = {
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_01_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_02_core_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_03_sparks_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_04_plasmacloud_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_05_fastplasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_06_lines_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_07_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_08_distortring_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_09_singleray_emit.bp',
                    },
                    Death02 = {
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_11_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_12_flashflat_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_13_core_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_14_plasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_15_plasmalines_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_16_groundring_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_17_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_18_smokecloud_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_19_splat_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_20_wave_emit.bp',
						'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_21_singleray_emit.bp',
						--'/effects/emitters/units/illuminate/uix0112/event/death/uix0112_evt_d_22_darkplasma_emit.bp',
                    },
                },
                UIX0113 = {
                    Ambient01 = {
                        '/effects/emitters/units/illuminate/uix0113/ambient/uix0113_amb_04_light_emit.bp',
                    },
                    Ambient02 = {
						'/effects/emitters/units/illuminate/uix0113/ambient/uix0113_amb_06_plasma_emit.bp',
                    },
                    Ambient03 = {
						'/effects/emitters/units/illuminate/uix0113/ambient/uix0113_amb_07_upwardlight_emit.bp',
                    },
                    Ambient04 = {
                        '/effects/emitters/units/illuminate/uix0113/ambient/uix0113_amb_05_light_emit.bp',
                    },
                    Deatht01 = {
                        '/effects/emitters/units/illuminate/uix0113/event/death/uix0113_e_d_01_plasma_emit.bp',
                    },
                },
                UIX0115 = {
                    Activate01 = {
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_01_glow_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_02_plasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_04_ring_emit.bp',
                    },
					Activate02 = {
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_15_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_16_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_03_lines_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_05_outerring_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_06_upwardring_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_07_darkcore_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_08_electricity_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_09_distortion_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_12_flatdebris_emit.bp',
                    },
                    Activate03 = {
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_10_smoke_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_11_debris_emit.bp',
                    },
                    Activate04 = {
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_13_plasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/activate/illuminate_uix0115_14_glow_emit.bp',
                    },
                    PulledUnitDebris01 = {
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_10_pulldebris_emit.bp',
                    },
                    PulledUnitLines01 = {
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_09_lines_emit.bp',
                    },
                    PulledUnitDestroy01 = {
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_01_flash_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_02_darkcloud_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_03_plasma_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_04_sparks_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_05_shockwave_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_06_debris_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_07_ring_emit.bp',
						'/effects/emitters/units/illuminate/uix0115/event/destroy/uix0015_e_d_08_groundring_emit.bp',
                    },
                },
            },
			Land = {
				General = {
				},
				UIL0202 = {
					UIL0202BuffEffectsMed01 = {
						'/effects/emitters/units/illuminate/uil0202/buff/uil0202_buff_02_ring_emit.bp',
						'/effects/emitters/units/illuminate/uil0202/buff/uil0202_buff_03_ringflat_emit.bp',
                    },
				},
			},
        },
        UEF = {
        	Air = {
				General = {
				},
			},
            Base = {
                UUB0104 = {
                    BaseLaunch01 = {
                        '/effects/emitters/units/uef/base/0104/event/launch/uub0104_evt_l_01_basedust_emit.bp',
                        '/effects/emitters/units/uef/base/0104/event/launch/uub0104_evt_l_02_flatflash_emit.bp',
                    },
                },
                UUB0105 = {
                    BaseLaunch01 = {
                        '/effects/emitters/units/uef/base/0105/event/launch/uub0105_evt_l_01_basedust_emit.bp',
                        '/effects/emitters/units/uef/base/0105/event/launch/uub0105_evt_l_02_flatflash_emit.bp',
                    },
                },
                UUB0704 = {
                    ConvertMass01 = {
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_01_glow_emit.bp',
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_02_flatglow_emit.bp',
                        --'/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_03_massicon_emit.bp',  removed icon per request.  AL.
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_04_line_emit.bp',
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_05_ring_emit.bp',
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_06_sparkle_emit.bp',
                        '/effects/emitters/units/uef/uub0704/event/convert/uub0704_evt_cv_07_ring_emit.bp',
                    },
                },
            },
            Experimental = {
                UUX0111 = {
                    Death01 = {
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_01_flash_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_03_flashlines_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_04_firecloud_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_06_dirt_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_10_smokecloud_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_12_sparks_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_13_ring_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_14_ringflat_emit.bp',
						'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_15_dirtmask_emit.bp',
                    },
                },
                UUX0114 = {
                    UnitBuild01 = {
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_01_steam_emit.bp',
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_02_steam_emit.bp',
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_03_sparks_emit.bp',
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_04_sparks_emit.bp',
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_05_glow_emit.bp',
						'/effects/emitters/units/uef/uux0114/event/build/uux0114_e_b_06_glow_emit.bp',
                    },
                    UnitLaunch01 = {
						'/effects/emitters/units/uef/uux0114/event/launch/uux0114_e_l_01_ring_emit.bp',
                    },
                },
                UUX0115 = {
                    Activate01 = {
						'/effects/emitters/units/uef/uux0115/event/activate/uux0115_evt_a_01_energy_emit.bp',
						'/effects/emitters/units/uef/uux0115/event/activate/uux0115_evt_a_02_flash_emit.bp',
						'/effects/emitters/units/uef/uux0115/event/activate/uux0115_evt_a_03_ring_emit.bp',
                    },
                    BaseLaunch01 = {
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_01_basedust_emit.bp',
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_02_baseflash_emit.bp',
                    },
                    BaseLaunch02 = {
                        '/effects/emitters/units/uef/uux0115/ambient/uux0115_amb_02_smoke_emit.bp',
                    },
                    Reload01 = {
                        '/effects/emitters/units/uef/uux0115/ambient/uux0115_amb_01_reload_emit.bp',
                    },
                    MuzzleFlashSingle01 = {
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_03_muzzlestreak_emit.bp',
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_04_largeflash_emit.bp',
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_05_ring_emit.bp',
                        '/effects/emitters/units/uef/uux0115/event/launch/uux0115_evt_l_06_shockwave_emit.bp',
                    },
                },
            },
            Land = {
                General = {
                },
                UUL0101 = {
					-- Need to move these into the general folder - AL 6/03/09
                    UnitDestroyDebrisEffectsTrail01 = {
                        '/effects/emitters/units/uef/land/0101/event/death/uul0101_evt_d_debristrail_01_emit.bp',
                        '/effects/emitters/units/uef/land/0101/event/death/uul0101_evt_d_debristrail_02_emit.bp',
                    },
                    UnitDestroyDebrisEffectsTrail02 = {
                        '/effects/emitters/units/uef/land/0101/event/death/uul0101_evt_d_debristrail_03_emit.bp',
                    },
                    UnitDestroyDebrisEffectsTrail03 = {
                        '/effects/emitters/units/uef/land/0101/event/death/uul0101_evt_d_debristrail_04_emit.bp',
                    },
                },
                UUL0102 = {
                    BaseLaunch01 = {
                        '/effects/emitters/units/uef/land/0102/event/launch/uul0102_evt_l_01_basedust_emit.bp',
                        '/effects/emitters/units/uef/land/0102/event/launch/uul0102_evt_l_02_shockwave_emit.bp',
                        '/effects/emitters/units/uef/land/0102/event/launch/uul0102_evt_l_03_flatflash_emit.bp',
                    },
                },
            },
            Sub = {
				General = {
				},
			},
            Water = {
				General = {
				},
			},
        },
    },

    -----------------------------------------------------------------
    -- Weapons
    -----------------------------------------------------------------
    Weapons = {
        Cybran_AntiAir01_Launch01 = {
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_02_laserline_emit.bp', --muzzle flash
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_05_laserdisolve_emit.bp',
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_06_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/antiair01/launch/w_c_aa01_l_07_ring_emit.bp',
        },
        Cybran_AntiAir01_Impact01 = {
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_04_glows_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_05_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_07_redlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_09_redsmoke_emit.bp',
        },
        Cybran_AntiAir01_Trails01 = {
			'/effects/emitters/weapons/cybran/antiair01/projectile/w_c_aa01_p_01_glow_emit.bp',
        },
        Cybran_AntiAir01_Polytrails01 = {
			'/effects/emitters/weapons/cybran/antiair01/projectile/w_c_aa01_p_03_polytrail_emit.bp',
        },
        Cybran_AntiAir02_Trails01 = {
			'/effects/emitters/weapons/cybran/antiair02/projectile/w_c_aa02_p_03_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/projectile/w_c_aa02_p_04_glow_emit.bp',
        },
        Cybran_AntiAir02_Polytrails01 = {
			'/effects/emitters/weapons/cybran/antiair02/projectile/w_c_aa02_p_01_polytrail_emit.bp',
        },
        Cybran_AntiAir02_Impact01 = {
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_03_trails_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_05_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_06_shrapnel_emit.bp',
			'/effects/emitters/weapons/cybran/antiair02/impact/airunit/w_c_aa02_i_a_08_electricity_emit.bp',
        },
        Cybran_Artillery01_Beam01 = {
			'/effects/emitters/weapons/cybran/artillery01/projectile/w_c_art01_p_05_beam_emit.bp',
        },
        Cybran_Artillery01_Launch01 = {
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_01_specks_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_02_glow_emit.bp',
        },
        Cybran_Artillery01_Polytrails01 = {
			'/effects/emitters/weapons/cybran/artillery01/projectile/w_c_art01_pj_01_polytrail_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/projectile/w_c_art01_pj_02_polytrail_emit.bp',
        },
        Cybran_Artillery01_Trails01 = {
			'/effects/emitters/weapons/cybran/artillery01/projectile/w_c_art01_pj_04_glow_emit.bp',
        },
        Cybran_Artillery01_Launch02 = {
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_03_flash_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_04_laserline_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_05_sparks_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_06_smoke_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_07_laserdisolve_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_08_velocitylines_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_09_flair_emit.bp',
            '/effects/emitters/weapons/cybran/artillery01/launch/w_c_art01_l_10_ring_emit.bp',
        },
        Cybran_Artillery01_Impact01 = {
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/artillery01/impact/unit/w_u_art01_i_13_fill_emit.bp',
        },
        Cybran_Artillery02_Launch01 = {
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_02_laserline_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_03_muzzleflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_05_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_07_ring_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_08_spikelines_emit.bp',
        },
        Cybran_Artillery02_Launch02 = {
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_09_groundring_emit.bp',
        },
        Cybran_Artillery02_Launch03 = {
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_10_ventsmoke_emit.bp',
        },
        Cybran_Artillery02_Launch04 = {
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_11_afterglow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_12_aftershock_emit.bp',
        },
        Cybran_Artillery02_Launch05 = {
			'/effects/emitters/weapons/cybran/artillery02/launch/w_c_art02_l_13_cooldownsmoke_emit.bp',
        },
		Cybran_Artillery02_Trails01 = {
			'/effects/emitters/weapons/cybran/artillery02/projectile/w_c_art02_p_03_glow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/projectile/w_c_art02_p_04_glow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/projectile/w_c_art02_p_05_glow_emit.bp',
        },
        Cybran_Artillery02_Polytrails01 = {
			'/effects/emitters/weapons/cybran/artillery02/projectile/w_c_art02_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/projectile/w_c_art02_p_02_polytrail_emit.bp',
        },
        Cybran_Artillery02_Impact01 = {
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_12_leftoverelec_emit.bp',
			'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_13_fill_emit.bp',
        },
        Cybran_Artillery03_Launch01 = {
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_02_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_03_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_04_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_05_flair_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/launch/w_c_art03_l_06_ring_emit.bp',
        },
		Cybran_Artillery03_Trails01 = {
			'/effects/emitters/weapons/cybran/artillery03/projectile/w_c_art03_p_03_core_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/projectile/w_c_art03_p_04_glow_emit.bp',
        },
        Cybran_Artillery03_Polytrails01 = {
			'/effects/emitters/weapons/cybran/artillery03/projectile/w_c_art03_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/projectile/w_c_art03_p_02_polytrail_emit.bp',
        },
        Cybran_Artillery03_Impact01 = {
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_13_fill_emit.bp',
        },
        Cybran_Artillery03_Impact02 = {
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/artillery03/impact/unit/w_u_art03_i_13_fill_emit.bp',
        },
        Cybran_Bomb01_Trails01 = {
			'/effects/emitters/weapons/cybran/bomb01/projectile/w_c_bomb01_p_02_glow_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/projectile/w_c_bomb01_p_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/projectile/w_c_bomb01_p_04_blueglow_emit.bp',
        },
        Cybran_Bomb01_Polytrails01 = {
			'/effects/emitters/weapons/cybran/bomb01/projectile/w_c_bomb01_p_01_polytrail_emit.bp',
        },
        Cybran_Bomb01_Split01 = {
			'/effects/emitters/weapons/cybran/bomb01/event/split/w_c_bomb01_e_s_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/event/split/w_c_bomb01_e_s_02_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/event/split/w_c_bomb01_e_s_03_shrapnel_emit.bp',
        },
        Cybran_Bomb01_Impact01 = {
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_09_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/bomb01/impact/unit/w_u_bomb01_i_u_11_smoke_emit.bp',
        },
        Cybran_Cannon04_Launch01 = {
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_02_largeflash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_03_streak_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_04_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_05_line_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_06_flashdetail_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_07_inward_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_08_leftoverelec_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_09_leftoversmoke_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_10_leftoversmokeflicker_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_11_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_12_leftoverelecbarrel_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_13_exhaustsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_13_rearelec_emit.bp',
        },
        Cybran_Cannon04_Launch02 = {
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_14_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_15_lines_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/launch/w_c_can04_l_16_core_emit.bp',
        },
        Cybran_Cannon04_Trails01 = {
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_02_beam_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_06_wisps_emit.bp',
        },
        Cybran_Cannon04_Polytrails01 = {
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_04_polytrail_emit.bp',  -- blue polytrail
			'/effects/emitters/weapons/cybran/cannon04/projectile/w_c_can04_p_05_polytrail_emit.bp', -- squigly lines
        },
        Cybran_Cannon04_Impact01 = {
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_12_electricity02_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_13_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_14_plasmaflash_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_15_smokering_emit.bp',
			'/effects/emitters/weapons/cybran/cannon04/impact/unit/w_c_can04_i_u_16_refraction_emit.bp',
        },
        Cybran_Flamethrower01_Impact01 = {
			'/effects/emitters/weapons/cybran/flamethrower01/impact/unit/w_c_fthr01_i_u_01_flashflat_emit.bp',
        },
        Cybran_Flamethrower01_Impact02 = {
			'/effects/emitters/weapons/cybran/flamethrower01/impact/unit/w_c_fthr01_i_u_02_fireflat_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/impact/unit/w_c_fthr01_i_u_03_fire_emit.bp',
		    '/effects/emitters/weapons/cybran/flamethrower01/impact/unit/w_c_fthr01_i_u_04_smoke_emit.bp',
        },
        Cybran_Flamethrower01_Launch01 = {
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_02_firewisps_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_03_flatglow_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_05_right_firewisps_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/launch/w_c_fthr01_l_06_left_firewisps_emit.bp',
		},
		Cybran_Flamethrower01_Trails01 = {
			'/effects/emitters/weapons/cybran/flamethrower01/projectile/w_c_fthr01_p_01_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/projectile/w_c_fthr01_p_02_stream_emit.bp',
			'/effects/emitters/weapons/cybran/flamethrower01/projectile/w_c_fthr01_p_03_distort_emit.bp',
		},
		Cybran_Laser01_Launch01 = {
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_02_flashlong_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_03_flashlarge_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_04_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_05_lines_emit.bp', --white flash
			'/effects/emitters/weapons/cybran/laser01/launch/w_c_las01_l_06_sparks_emit.bp',
        },
        Cybran_Laser01_Trails01 = {
			'/effects/emitters/weapons/cybran/laser01/projectile/w_c_las01_p_02_trail_emit.bp', --glow
        },
        Cybran_Laser01_Polytrails01 = {
            '/effects/emitters/weapons/cybran/laser01/projectile/w_c_las01_p_01_polytrail_emit.bp',
        },
        Cybran_Laser01_Impact01 = {
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_04_glows_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_05_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_07_redlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_08_glowflicker_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_09_redsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_10_groundring_emit.bp',
        },
        Cybran_Laser01_AirImpact01 = {
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_04_glows_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_05_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_07_redlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_09_redsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_11_ring_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_12_airflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser01/impact/unit/w_c_las01_i_u_13_airflicker_emit.bp',
        },
        Cybran_Laser02_Launch01 = {
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_02_glow_emit.bp', --specks
        },
        Cybran_Laser02_Launch02 = {
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_04_laserline_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_05_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_06_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_07_laserdisolve_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_09_flair_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_10_ring_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_11_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/launch/w_c_las02_l_12_distortwave_emit.bp',
        },
        Cybran_Laser02_Trails01 = {
			'/effects/emitters/weapons/cybran/laser02/projectile/w_c_las02_p_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/projectile/w_c_las02_p_02_beam_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/projectile/w_c_las02_p_03_sparks_emit.bp',
        },
        Cybran_Laser02_Polytrails01 = {
            '/effects/emitters/weapons/cybran/laser02/projectile/w_c_las02_p_03_polytrail_emit.bp',
            '/effects/emitters/weapons/cybran/laser02/projectile/w_c_las02_p_04_polytrail_emit.bp',
        },
        Cybran_Laser02_Impact01 = {
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser02/impact/unit/w_u_las02_i_u_12_fill_emit.bp',
        },
        Cybran_Laser03_Launch01 = {
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_02_largeflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_03_streak_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_04_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_05_line_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_06_flashdetail_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_07_inward_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_08_leftoverelec_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_09_leftoversmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_10_leftoversmokeflicker_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_11_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_12_leftoverelecbarrel_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/launch/w_c_las03_l_13_exhaustsmoke_emit.bp',
        },
        Cybran_Laser03_Trails01 = {
			'/effects/emitters/weapons/cybran/laser03/projectile/w_c_las03_p_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/projectile/w_c_las03_p_02_beam_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/projectile/w_c_las03_p_03_sparks_emit.bp',
        },
        Cybran_Laser03_Polytrails01 = {
			'/effects/emitters/weapons/cybran/laser03/projectile/w_c_las03_p_04_polytrail_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/projectile/w_c_las03_p_05_polytrail_emit.bp',
        },
        Cybran_Laser03_Impact01 = {
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_12_electricity02_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_13_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_14_plasmaflash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss01/impact/terrain/w_u_hvg01_i_t_01_fastdirt_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/terrain/w_u_hvg01_i_t_02_darkring_emit.bp',
        },
        Cybran_Laser03_ImpactUnit01 = {
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_05_groundglow_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_11_fastsmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_12_electricity02_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_13_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser03/impact/unit/w_u_las03_i_u_14_plasmaflash_emit.bp',
        },
        Cybran_Laser05_Launch01 = {
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_02_fire_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/launch/w_c_las05_l_06_smoke_emit.bp',
        },
        Cybran_Laser05_Trails01 = {
			'/effects/emitters/weapons/cybran/laser05/projectile/w_c_las05_p_03_brightglow_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/projectile/w_c_las05_p_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/projectile/w_c_las05_p_05_darkcore_emit.bp',
        },
        Cybran_Laser05_Polytrails01 = {
			'/effects/emitters/weapons/cybran/laser05/projectile/w_c_las05_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/projectile/w_c_las05_p_02_polytrails_emit.bp',
        },
        Cybran_Laser05_Impact01 = {
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_03_flatfirecloud_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_06_dirtchunks_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_07_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_08_leftoverfire_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_09_firelines_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_10_dirtlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_11_lightdirtlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser05/impact/unit/w_c_las05_i_u_12_darkflash_emit.bp',
        },
        Cybran_Laser07_Launch01 = {
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_02_fire_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_06_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/launch/w_c_las07_l_07_smoke_emit.bp',
        },
        Cybran_Laser07_Trails01 = {
			'/effects/emitters/weapons/cybran/laser07/projectile/w_c_las07_p_03_brightglow_emit.bp',
        },
        Cybran_Laser07_Polytrails01 = {
			'/effects/emitters/weapons/cybran/laser07/projectile/w_c_las07_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/projectile/w_c_las07_p_02_polytrails_emit.bp',
        },
        Cybran_Laser07_Impact01 = {
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_03_flatfirecloud_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_06_dirtchunks_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_07_shockwave_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_08_leftoverfire_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_09_firelines_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_10_dirtlines_emit.bp',
			'/effects/emitters/weapons/cybran/laser07/impact/unit/w_c_las07_i_u_11_lightdirtlines_emit.bp',
        },
        Cybran_Laser08_Launch01 = {
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_02_flashlong_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_03_ring_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_04_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_05_lines_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/launch/w_c_las08_l_06_sparks_emit.bp',
        },
        Cybran_Laser08_Trails01 = {
			'/effects/emitters/weapons/cybran/laser08/projectile/w_c_las08_p_02_trail_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/projectile/w_c_las08_p_03_glow_emit.bp',
        },
        Cybran_Laser08_Polytrails01 = {
			'/effects/emitters/weapons/cybran/laser08/projectile/w_c_las08_p_01_polytrail_emit.bp',
        },
        Cybran_Laser08_Impact01 = {
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_04_glows_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_05_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_06_darklines_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_08_glowflicker_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_09_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_10_groundring_emit.bp',
			'/effects/emitters/weapons/cybran/laser08/impact/unit/w_c_las08_i_u_11_ring_emit.bp',
        },
		Cybran_Missile01_Launch01 = {
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_02_flashlong_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_03_flashlarge_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_06_sparks_emit.bp',
        },
        Cybran_Missile01_Trails01 = {
			--'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_02_glow_emit.bp',
        },
        Cybran_Missile01_Trails02 = {
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_05_glowline_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_06_flickerglow_emit.bp',
        },
        Cybran_Missile01_Launch02 = {
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_07_flash_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_08_flashlong_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_09_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/launch/w_c_rkt01_l_10_flashdetail_emit.bp',
        },
        Cybran_Missile01_Polytrails01 = {
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_07_polytrail_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_08_polytrail_emit.bp',
        },
        Cybran_Missile01_Polytrails02 = {
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_01_polytrail_emit.bp',
        },
        Cybran_Missile01_Polytrails03 = {
			'/effects/emitters/weapons/cybran/rocket01/projectile/w_c_rkt01_p_09_polytrail_emit.bp',
        },
        Cybran_Missile01_Split01 = {
			'/effects/emitters/weapons/cybran/rocket01/event/split/w_c_rkt01_e_s_01_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/event/split/w_c_rkt01_e_s_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/event/split/w_c_rkt01_e_s_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/event/split/w_c_rkt01_e_s_04_shrapnel_emit.bp',
        },
        Cybran_Missile01_Impact01 = {
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_02_flash_emit.bp', -- ground lines
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_05_whitesmoke_emit.bp',  -- core flash
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_06_lines_emit.bp', --ground electricity
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_07_redlines_emit.bp', --camera electricity
        },
        Cybran_Missile01_Impact02 = {
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_08_flash_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_09_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_10_elec_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_11_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_12_ring_emit.bp',
			'/effects/emitters/weapons/cybran/rocket01/impact/unit/w_c_rkt01_i_u_13_glow_emit.bp',
        },
        Cybran_Missile02_Launch01 = {
			'/effects/emitters/weapons/cybran/missile01/launch/w_c_mis01_l_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/launch/w_c_mis01_l_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/launch/w_c_mis01_l_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/launch/w_c_mis01_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/launch/w_c_mis01_l_05_velocitylines_emit.bp',
        },
        Cybran_Missile02_Trails02 = {
			'/effects/emitters/weapons/cybran/missile01/projectile/w_c_mis01_pj_02_glow_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/projectile/w_c_mis01_pj_03_core_emit.bp',
        },
        Cybran_Missile02_Polytrails02 = {
			'/effects/emitters/weapons/cybran/missile01/projectile/w_c_mis01_pj_01_polytrail_emit.bp',
        },
        Cybran_Missile02_Split01 = {
			'/effects/emitters/weapons/cybran/missile01/event/split/w_u_mis01_e_s_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/event/split/w_u_mis01_e_s_02_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/event/split/w_u_mis01_e_s_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/event/split/w_u_mis01_e_s_04_ring_emit.bp',
        },
        Cybran_Missile02_Impact01 = {
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_05_dirtlines_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_06_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_09_smokecloud_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_11_ringflat_emit.bp',
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_12_fill_emit.bp', -- ground smoke ring
			'/effects/emitters/weapons/cybran/missile01/impact/unit/w_u_mis01_i_13_fill_emit.bp',
        },
        Cybran_Missile03_Launch01 = {
			'/effects/emitters/weapons/cybran/missile03/launch/w_c_mis03_l_01_glow_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/launch/w_c_mis03_l_02_flash_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/launch/w_c_mis03_l_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/launch/w_c_mis03_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/launch/w_c_mis03_l_05_velocitylines_emit.bp',
        },
        Cybran_Missile03_Trails01 = {
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_02_glow_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_03_core_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_05_fire_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_06_flash_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_07_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_09_fire_emit.bp',
        },
        Cybran_Missile03_Trails02 = {
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_08_smoke_emit.bp',
        },
        Cybran_Missile03_Polytrails01 = {
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_01_polytrail_emit.bp',
        },
        Cybran_Missile03_Polytrails02 = {
			'/effects/emitters/weapons/cybran/missile03/projectile/w_c_mis03_p_04_polytrail_emit.bp',
        },
        Cybran_Missile03_Impact01 = {
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_02_groundburn_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_03_halfflash_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_05_dirtlines_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_06_firecloud_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_07_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_08_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_09_smokecloud_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_10_debris_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_11_ringflat_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_12_fill_emit.bp',
			'/effects/emitters/weapons/cybran/missile03/impact/unit/w_u_mis03_i_13_fill_emit.bp',
        },
        Cybran_Nanobot01_Launch01 = {
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_02_core_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_03_ring_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_05_lines_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_06_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/launch/w_c_nan01_l_07_flash_emit.bp',
        },
        Cybran_Nanobot01_Trails01 = {
			'/effects/emitters/weapons/cybran/nanobot01/projectile/w_c_nan01_p_02_glow_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/projectile/w_c_nan01_p_03_distortwake_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/projectile/w_c_nan01_p_04_debris_emit.bp',
        },
        Cybran_Nanobot01_Trails02 = {
			'/effects/emitters/weapons/cybran/nanobot01/projectile/w_c_nan01_p_01_nanotrail_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/projectile/w_c_nan01_p_05_nanoglow_emit.bp',
        },
        Cybran_Nanobot01_Polytrails01 = {
        },
        Cybran_Nanobot01_Impact01 = {
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_02_flash_emit.bp',  -- flat glow
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_04_core_emit.bp',  -- ring, camera
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_06_darklines_emit.bp',  -- red lines
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_08_plasma_emit.bp',  -- glow
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_09_electricity_emit.bp',  -- distorted plasma lines
			'/effects/emitters/weapons/cybran/nanobot01/impact/unit/w_c_nan01_i_u_10_groundring_emit.bp',
        },
        Cybran_Nanobot01_Impact02 = {
			'/effects/emitters/weapons/cybran/nanobot01/impact/secondary/w_c_nan01_i_s_04_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/nanobot01/impact/secondary/w_c_nan01_i_s_05_flash_emit.bp',
        },
        Cybran_Shield_Impact_Small01 = {
			'/effects/emitters/weapons/cybran/shield/impact/small/w_c_s_i_s_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/small/w_c_s_i_s_02_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/small/w_c_s_i_s_03_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/small/w_c_s_i_s_04_lines_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/small/w_c_s_i_s_05_glowflicker_emit.bp',
        },
        Cybran_Shield_Impact_Medium01 = {
			'/effects/emitters/weapons/cybran/shield/impact/medium/w_c_s_i_m_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/medium/w_c_s_i_m_02_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/medium/w_c_s_i_m_03_whitesmoke_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/medium/w_c_s_i_m_04_lines_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/medium/w_c_s_i_m_05_glowflicker_emit.bp',
        },
        Cybran_Shield_Impact_Large01 = {
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_02_sparks_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_03_shockwaves_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_04_electricity_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_05_velocitylines_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_06_debris_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_07_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/shield/impact/large/w_c_s_i_l_08_fill_emit.bp',
        },
        Cybran_Torpedo01_Launch01 = {
			'/effects/emitters/weapons/cybran/torpedo01/launch/w_c_tor01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/cybran/torpedo01/launch/w_c_tor01_l_02_fireline_emit.bp',
        },
        Cybran_Torpedo01_Trails01 = {
			'/effects/emitters/weapons/cybran/torpedo01/projectile/w_c_tor01_p_01_smoke_emit.bp',
			'/effects/emitters/weapons/cybran/torpedo01/projectile/w_c_tor01_p_02_smallsmoke_emit.bp',
        },
        Cybran_Torpedo01_Impact01 = {
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_02_flatripple_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_03_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_05_firelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_06_smokelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_07_mist_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_09_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_10_waterlines_emit.bp',
        },
        Generic_Nuke01_Base01 = {
            -- low, med
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_01_flatflash_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_02_flash_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_03_baseflatglow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_04_baseglow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_05_flatinwardflash_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_06_ovalflash_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_07_flatglow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_08_glow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_09_flatshockwave_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_10_flatshockdistort_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_11_fastflatglow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_12_flatdustring_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_13_flatdistortring_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_15_origindust_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_19_faintorigindust_emit.bp',
			-- high
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_20_originbacklighting_emit.bp',
        },
        Generic_Nuke01_Base02 = {
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_14_inwardrings_emit.bp',
        },
        Generic_Nuke01_Column01 = {
            -- low, med
            '/effects/emitters/weapons/generic/nuke01/column/w_g_nuk01_c_01_glow_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/column/w_g_nuk01_c_02_smoke_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/column/w_g_nuk01_c_03_cloudshadows_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/column/w_g_nuk01_c_05_cloudrings_emit.bp',
			-- high
			'/effects/emitters/weapons/generic/nuke01/column/w_g_nuk01_c_04_backlighting_emit.bp',
        },
        Generic_Nuke01_Inward01 = {
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_01_smoke_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_02_debris_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_03_flatdebris_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_04_slowdustring_emit.bp',
        },
        Generic_Nuke01_Leftover01 = {
			'/effects/emitters/weapons/generic/nuke01/leftover/w_g_nuk01_l_01_steam_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/leftover/w_g_nuk01_l_02_ash_emit.bp',
        },
        Generic_Nuke01_Rolls01 = {
            -- low, med
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_01_fire_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_02_inwardfire_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_03_smoke_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_04_mushroomcloud_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_05_cloudlayer_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_06_cloudlayeredge_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_07_faintmushroomcloud_emit.bp',
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_08_smokefingers_emit.bp',
			-- high
			'/effects/emitters/weapons/generic/nuke01/rolls/w_g_nuk01_r_10_topbacklighting_emit.bp',
        },
        Generic_Nuke01_Shockwave01 = {
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_05_polytrail_emit.bp',
        },
        Generic_Nuke01_Shockwave02 = {
			'/effects/emitters/weapons/generic/nuke01/shockwave/w_g_nuk01_s_02_dust_emit.bp',
        },
        Generic_Nuke01_Shockwave03 = {
			'/effects/emitters/weapons/generic/nuke01/inwardbase/w_g_nuk01_i_04_slowdustring_emit.bp',
        },
        Generic_Nuke01_Topfuzz01 = {
			'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_18_topfuzz_emit.bp',
        },
        Illuminate_AntiAir01_Launch01 = {
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_02_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_03_plasmaline_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_06_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/launch/w_i_aa01_l_07_flatglow_emit.bp',
        },
        Illuminate_AntiAir01_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/antiair01/projectile/w_i_aa01_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/projectile/w_i_aa01_p_02_polytrails_emit.bp',
        },
        Illuminate_AntiAir01_Trails01 = {
			'/effects/emitters/weapons/illuminate/antiair01/projectile/w_i_aa01_p_03_brightglow_emit.bp',
        },
        Illuminate_AntiAir01_Impact01 = {
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_02_darkcloud_emit.bp', -- light cloud
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_03_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_04_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_06_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair01/impact/unit/w_i_aa01_i_u_07_plasmalines_emit.bp',
        },
        Illuminate_AntiAir02_Launch01 = {
			'/effects/emitters/weapons/illuminate/antiair02/launch/w_i_aa02_l_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/launch/w_i_aa02_l_02_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/launch/w_i_aa02_l_03_plasmaline_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/launch/w_i_aa02_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/launch/w_i_aa02_l_05_shockwave_emit.bp',
        },
        Illuminate_AntiAir02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/antiair02/projectile/w_i_aa02_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/projectile/w_i_aa02_p_02_polytrails_emit.bp',
        },
        Illuminate_AntiAir02_Impact01 = {
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_03_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_04_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_06_fwdsparks_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair02/impact/unit/w_i_aa02_i_u_07_plasmalines_emit.bp',
        },
        Illuminate_AntiAir02_Trails01 = {
			'/effects/emitters/weapons/illuminate/antiair02/projectile/w_i_aa02_p_03_glow_emit.bp',
        },
        Illuminate_AntiAir03_Launch01 = {
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_02_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_03_plasmaline_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_06_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/launch/w_i_aa03_l_07_flatglow_emit.bp',
        },
        Illuminate_AntiAir03_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/antiair03/projectile/w_i_aa03_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/projectile/w_i_aa03_p_02_polytrails_emit.bp',
        },
        Illuminate_AntiAir03_Trails01 = {
			'/effects/emitters/weapons/illuminate/antiair03/projectile/w_i_aa03_p_03_brightglow_emit.bp',
			'/effects/emitters/weapons/illuminate/antiair03/projectile/w_i_aa03_p_04_plasma_emit.bp',
        },
        Illuminate_Artillery01_Launch01 = {
			'/effects/emitters/weapons/illuminate/artillery01/launch/w_i_art01_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/launch/w_i_art01_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/launch/w_i_art01_l_03_flash_emit.bp',
        },
        Illuminate_Artillery01_Polytrails01 = {
        },
        Illuminate_Artillery01_Trails01 = {
        	'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_02_fxtrail_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_03_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_04_plasmaspots_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_05_grit_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_06_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_07_frontplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/projectile/w_i_art01_p_08_trailglow_emit.bp',
        },
        Illuminate_Artillery01_Impact01 = {
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_02_groundplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_03_smallflash_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_04_darkcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_05_plasmaglow_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_06_darkring_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_07_lightring_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_08_groundlines_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_10_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery01/impact/unit/w_i_art01_i_u_11_ring_emit.bp',
        },
        Illuminate_Artillery02_Launch01 = {
			'/effects/emitters/weapons/illuminate/artillery02/launch/w_i_art02_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/launch/w_i_art02_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/launch/w_i_art02_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/launch/w_i_art02_l_04_splatter_emit.bp',
        },
        Illuminate_Artillery02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/artillery02/projectile/w_i_art02_p_01_polytrail_emit.bp',
        },
        Illuminate_Artillery02_Trails01 = {
			'/effects/emitters/weapons/illuminate/artillery02/projectile/w_i_art02_p_02_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/projectile/w_i_art02_p_03_plasma_emit.bp',
        },
        Illuminate_Artillery02_Impact01 = {
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_03_smallflash_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_04_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_10_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/artillery02/impact/unit/w_i_art02_i_u_11_ring_emit.bp',
        },
		IlluminateBaseProjectileDestroyEffects01 = {
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_02_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_flash_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_flashflat_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ring_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ringflat_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_debris_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirt_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirtlines_01_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustburst_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokecloud_01_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokecloud_02_emit.bp',
			'/effects/emitters/units/uef/land/general/event/death/general_evt_d_sparks_emit.bp',
        },
        Illuminate_Beam01_CustomMuzzle01 = {
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_06_backenergy_emit.bp',     --back left
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_07_backglow_emit.bp',       --back left
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_14_backlines_emit.bp',      --back left
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_15_backlinesglow_emit.bp',  --back left
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_08_backenergy_emit.bp',     --back left of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_09_backglow_emit.bp',       --back left of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_16_backlines_emit.bp',      --back left of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_17_backlinesglow_emit.bp',  --back left of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_10_backenergy_emit.bp',     --back right of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_11_backglow_emit.bp',       --back right of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_18_backlines_emit.bp',      --back right of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_19_backlinesglow_emit.bp',  --back right of center
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_12_backenergy_emit.bp',     --back right
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_13_backglow_emit.bp',       --back right
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_20_backlines_emit.bp',      --back right
			'/effects/emitters/weapons/illuminate/beam01/launch/w_i_bem01_l_21_backlinesglow_emit.bp',  --back right
        },
        Illuminate_Bomb01_Launch01 = {
			'/effects/emitters/weapons/illuminate/bomb01/launch/w_i_bom01_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/launch/w_i_bom01_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/launch/w_i_bom01_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/launch/w_i_bom01_l_04_splatter_emit.bp',
        },
        Illuminate_Bomb01_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_01_polytrail_emit.bp',
        },
        Illuminate_Bomb01_Trails01 = {
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_02_fxtrail_emit.bp',  -- large outer glow
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_03_fxtrail_emit.bp', -- ring
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_04_plasmaspots_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_05_grit_emit.bp', -- core
        },
        Illuminate_Bomb01_Impact01 = {
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_02_groundplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_04_plasmasmoke_emit.bp',  -- alpha blended smoke
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_05_plasmaglow_emit.bp', -- flat blue debis texture
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_07_core_emit.bp',  -- upward core
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_09_lightcloud_emit.bp',  -- downward core
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_10_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_11_ring_emit.bp',
        },
        Illuminate_Bomb01_Impact02 = {
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_03_smallflash_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_04_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_07_core_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/impact/unit/w_i_bom01_i_u_10_sparks_emit.bp',
        },
        Illuminate_Bomb02_Trails01 = {
			'/effects/emitters/weapons/illuminate/scorchbomb01/projectile/w_i_sb01_p_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_02_fxtrail_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_03_fxtrail_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_04_plasmaspots_emit.bp',
			'/effects/emitters/weapons/illuminate/bomb01/projectile/w_i_bom01_p_05_grit_emit.bp',
        },
        Illuminate_Bomb02_Impact01 = {
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_02_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_03_smallplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_04_thinsmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_05_plasmaflash_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_06_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_07_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/scorchbomb01/impact/unit/w_i_sb01_i_u_08_thicksmoke_emit.bp',
        },
        Illuminate_Cannon01_Launch01 = {
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_02_flashline_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_03_flashlong_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_04_endflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_05_smoke_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_06_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_07_lightplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/launch/w_i_can01_l_08_movingglow_emit.bp',
        },
        Illuminate_Cannon01_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/cannon01/projectile/w_i_can01_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/projectile/w_i_can01_p_02_polytrail_emit.bp',
        },
        Illuminate_Cannon01_Trails01 = {
			'/effects/emitters/weapons/illuminate/cannon01/projectile/w_i_can01_p_05_glow_emit.bp',
        },
        Illuminate_Cannon01_Impact01 = {
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_02_cameraflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_04_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_06_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_07_glowflicker_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_08_whitesmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_10_dark_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_11_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_12_groundglow_emit.bp',
        },
        Illuminate_Cannon01_ImpactUnit01 = {
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_02_cameraflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_04_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_07_glowflicker_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_08_whitesmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_10_dark_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_11_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon01/impact/unit/w_i_can01_i_u_13_cameraring_emit.bp',
        },
        Illuminate_Cannon02_Launch01 = {
			'/effects/emitters/weapons/illuminate/cannon02/launch/w_i_can02_l_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/launch/w_i_can02_l_02_flashline_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/launch/w_i_can02_l_03_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/launch/w_i_can02_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/launch/w_i_can02_l_05_splash_emit.bp',
        },
        Illuminate_Cannon02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/cannon02/projectile/w_i_can02_p_01_polytrail_emit.bp',
        },
        Illuminate_Cannon02_Trails01 = {
			'/effects/emitters/weapons/illuminate/cannon02/projectile/w_i_can02_p_02_core_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/projectile/w_i_can02_p_03_glow_emit.bp',
        },
        Illuminate_Cannon02_Impact01 = {
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_02_cameraflash_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_04_plasma_emit.bp', -- core
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_05_plasmasmoke_emit.bp', -- light plasma
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_06_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/cannon02/impact/unit/w_i_can02_i_u_07_lines_emit.bp',
        },
        Illuminate_ChronCannon02_Launch01 = {
			'/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_04_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_05_shockwave_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_06_flashline_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_07_column_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_08_plasma_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_09_sparks_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_10_flashdetail_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_11_distort_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_12_shockleft_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_13_shockright_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_14_leftoverflicker_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_15_exhaustsmoke_emit.bp',
        },
        Illuminate_ChronCannon02_Launch02 = {
			'/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_01_preplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_02_preglow_emit.bp',
			'/effects/emitters/weapons/illuminate/chroncannon02/launch/w_i_chr02_l_03_prelines_emit.bp',
        },
        Illuminate_ChronCannon02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_02_polytrail_emit.bp',
        },
        Illuminate_ChronCannon02_Trails01 = {
            '/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_03_wisps_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_04_glow_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_05_plasma_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/projectile/w_i_chr02_p_06_distort_emit.bp',
        },
        Illuminate_ChronCannon02_Impact01 = {
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_01_groundflash_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_02_flash_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_03_ring_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_04_plasma_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_05_leftoverflash_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_06_leftovergroundflash_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_07_debris_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_08_fastdebris_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_10_sparks_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_11_groundsmoke_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_12_smokeplasma_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_13_lines_emit.bp',
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_14_distort_emit.bp',
        },
        Illuminate_ChronCannon02_Impact02 = {
            '/effects/emitters/weapons/illuminate/chroncannon02/impact/w_i_chr02_i_09_flatwave_emit.bp',
        },
        Illuminate_DeathClaw01_Launch01 = {
			'/effects/emitters/weapons/illuminate/deathclaw01/launch/w_i_dc01_l_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/launch/w_i_dc01_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/launch/w_i_dc01_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/launch/w_i_dc01_l_04_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/launch/w_i_dc01_l_05_refraction_emit.bp',
        },
        Illuminate_DeathClaw01_Impact01 = {
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_02_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_03_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_04_firelines_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_05_firecloud_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/impact/unit/w_i_dc01_i_u_06_smoke_emit.bp',
        },
        Illuminate_DeathClaw01_Pull01 = {
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_02_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_03_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_04_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_05_dots_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_06_inward_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_07_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_08_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/pull/w_i_dc01_p_09_largeglow_emit.bp',
        },
        Illuminate_DeathClaw01_Trails01 = {
			'/effects/emitters/weapons/illuminate/deathclaw01/projectile/w_i_dc01_p_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/projectile/w_i_dc01_p_02_dust_emit.bp',
			'/effects/emitters/weapons/illuminate/deathclaw01/projectile/w_i_dc01_p_03_debris_emit.bp',
        },
        Illuminate_Flair01_Trails01 = {
			'/effects/emitters/weapons/illuminate/flair01/projectile/w_i_fla01_p_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/flair01/projectile/w_i_fla01_p_02_flair_emit.bp',
        },
        Illuminate_Flair01_Impact01 = {
			'/effects/emitters/weapons/illuminate/flair01/projectile/w_i_fla01_p_03_smoke_emit.bp',  -- flash
			'/effects/emitters/weapons/illuminate/flair01/projectile/w_i_fla01_p_04_sparks_emit.bp',  -- ring
        },
        Illuminate_Missile02_Launch01 = {
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_05_flashline_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/launch/w_i_mis02_l_06_glow_emit.bp',
        },
        Illuminate_Missile02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/missile02/projectile/w_i_mis02_p_01_polytrail_emit.bp',
        },
        Illuminate_Missile02_Trails01 = {
			'/effects/emitters/weapons/illuminate/missile02/projectile/w_i_mis02_p_02_smoke_emit.bp',  -- refraction
			'/effects/emitters/weapons/illuminate/missile02/projectile/w_i_mis02_p_03_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/projectile/w_i_mis02_p_04_plasmaspots_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/projectile/w_i_mis02_p_05_grit_emit.bp',
        },
        Illuminate_Missile02_Impact01 = {
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_02_groundplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_03_smallflash_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_04_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_05_plasmaglow_emit.bp',  -- dark plasma cloud
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_07_core_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_10_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/missile02/impact/unit/w_i_mis02_i_u_11_ring_emit.bp',  -- half rings
        },
        Illuminate_Missile03_Launch01 = {
			'/effects/emitters/weapons/illuminate/missile03/launch/w_i_mis03_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/launch/w_i_mis03_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/launch/w_i_mis03_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/launch/w_i_mis03_l_04_flatflash_emit.bp',
        },
        Illuminate_Missile03_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/missile03/projectile/w_i_mis03_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/projectile/w_i_mis03_p_06_polytrail_emit.bp',
        },
        Illuminate_Missile03_Trails01 = {
			'/effects/emitters/weapons/illuminate/missile03/projectile/w_i_mis03_p_02_fxtrail_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/projectile/w_i_mis03_p_03_fxtrail_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/projectile/w_i_mis03_p_05_grit_emit.bp',
        },
        Illuminate_Missile03_Impact01 = {
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_02_groundplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_04_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_07_core_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_10_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/missile03/impact/unit/w_i_mis03_i_u_11_ring_emit.bp',
        },
        Illuminate_Nuke01_Launch01 = {
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_01_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_02_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_04_plasma_cloud_emit.bp',
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_05_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/nuke01/launch/w_i_nuke01_l_06_flashline_emit.bp',
        },
        Illuminate_Plasma01_Launch01 = {
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_02_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_03_plasmaline_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_06_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_07_flatglow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/launch/w_i_pla01_l_08_reversesmoke_emit.bp',
        },
        Illuminate_Plasma01_Polytrails01 = {
        	'/effects/emitters/weapons/illuminate/plasma01/projectile/w_i_pla01_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/projectile/w_i_pla01_p_02_polytrails_emit.bp',
        },
        Illuminate_Plasma01_Trails01 = {
        	'/effects/emitters/weapons/illuminate/plasma01/projectile/w_i_pla01_p_03_brightglow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/projectile/w_i_pla01_p_04_plasma_emit.bp',
        },
        Illuminate_Plasma01_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_02_darkcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_03_flatplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_04_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_06_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma01/impact/unit/w_i_pla01_i_u_07_plasmalines_emit.bp',
        },
        Illuminate_Plasma02_Launch01 = {
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_02_flashline_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_03_flashlong_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_04_endflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_05_plasmaflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_09_distortring_emit.bp',
        },
        Illuminate_Plasma02_Launch02 = {
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_07_preplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/launch/w_i_pla02_l_08_preglow_emit.bp',
        },
        Illuminate_Plasma02_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_01_polytrail_emit.bp',
        },
        Illuminate_Plasma02_Trails01 = {
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_02_trail_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_03_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_04_distortwake_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_05_debris_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/projectile/w_i_pla02_p_06_plasma_emit.bp',
        },
        Illuminate_Plasma02_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_02_cameraflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_04_plasmaflat_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_05_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_07_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_08_lines_emit.bp',
        },
        Illuminate_Plasma02_Impact02 = {
			'/effects/emitters/weapons/illuminate/plasma02/impact/unit/w_i_pla02_i_u_06_ring_emit.bp',
	    },
        Illuminate_Plasma03_Launch01 = {
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_02_splash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_03_plasmaline_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_04_splatter_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_06_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/launch/w_i_pla03_l_08_reversesmoke_emit.bp',
        },
        Illuminate_Plasma03_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/plasma03/projectile/w_i_pla03_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/projectile/w_i_pla03_p_02_polytrails_emit.bp',
        },
        Illuminate_Plasma03_Trails01 = {
			'/effects/emitters/weapons/illuminate/plasma03/projectile/w_i_pla03_p_03_brightglow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/projectile/w_i_pla03_p_04_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/projectile/w_i_pla03_p_05_glow_emit.bp',
        },
        Illuminate_Plasma03_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_02_darkcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_03_flatplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_04_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_06_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_07_plasmalines_emit.bp',
        },
        Illuminate_Plasma03_ImpactAir01 = {
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_08_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_09_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_10_darkcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_11_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_12_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_13_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma03/impact/unit/w_i_pla03_i_u_14_plasmalines_emit.bp',
        },
        Illuminate_Plasma04_Trails01 = {
			'/effects/emitters/weapons/illuminate/plasma04/projectile/w_i_pla04_p_01_brightglow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/projectile/w_i_pla04_p_02_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/projectile/w_i_pla04_p_03_glow_emit.bp',
        },
        Illuminate_Plasma04_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_02_darkcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_03_flatplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_04_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_06_shockwave_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma04/impact/unit/w_i_pla04_i_u_07_plasmalines_emit.bp',
        },
        Illuminate_Plasma05_Launch01 = {
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_02_flashline_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_03_flashlong_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_04_endflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_05_plasmaflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_06_sparkle_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_09_distortring_emit.bp',
        },
        Illuminate_Plasma05_Launch02 = {
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_07_preplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/launch/w_i_pla05_l_08_preglow_emit.bp',
        },
        Illuminate_Plasma05_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_01_polytrail_emit.bp',
        },
        Illuminate_Plasma05_Trails01 = {
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_02_trail_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_03_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_04_distortwake_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_05_debris_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/projectile/w_i_pla05_p_06_plasma_emit.bp',
        },
        Illuminate_Plasma05_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_01_groundflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_02_cameraflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_03_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_04_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_04_plasmaflat_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_05_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_06_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_07_glow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma05/impact/unit/w_i_pla05_i_u_08_lines_emit.bp',
        },
		Illuminate_Plasma06_Launch01 = {
			'/effects/emitters/weapons/illuminate/plasma06/launch/w_i_pla06_l_01_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/launch/w_i_pla06_l_02_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/launch/w_i_pla06_l_03_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/launch/w_i_pla06_l_04_splatter_emit.bp',
        },
        Illuminate_Plasma06_Polytrails01 = {
			'/effects/emitters/weapons/illuminate/plasma06/projectile/w_i_pla06_p_01_polytrail_emit.bp',
        },
        Illuminate_Plasma06_Trails01 = {
			'/effects/emitters/weapons/illuminate/plasma06/projectile/w_i_pla06_p_02_plasma_emit.bp',
        },
        Illuminate_Plasma06_Impact01 = {
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_02_groundplasma_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_03_smallflash_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_04_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_05_plasmaglow_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_06_lines_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_07_core_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_09_lightcloud_emit.bp',
			'/effects/emitters/weapons/illuminate/plasma06/impact/unit/w_i_pla06_i_u_10_sparks_emit.bp',
        },
        Illuminate_Shield_Impact_Small01 = {
			'/effects/emitters/weapons/illuminate/shield/impact/small/w_i_s_i_s_01_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/small/w_i_s_i_s_02_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/small/w_i_s_i_s_03_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/small/w_i_s_i_s_04_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/small/w_i_s_i_s_05_whitesmoke_emit.bp',
        },
        Illuminate_Shield_Impact_Medium01 = {
			'/effects/emitters/weapons/illuminate/shield/impact/medium/w_i_s_i_m_01_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/medium/w_i_s_i_m_02_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/medium/w_i_s_i_m_03_whitesmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/medium/w_i_s_i_m_04_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/medium/w_i_s_i_m_05_plasmasmoke_emit.bp',
        },
       Illuminate_Shield_Impact_Large01 = {
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_01_sparks_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_02_plasma_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_03_whitesmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_04_ring_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_05_plasmasmoke_emit.bp',
			'/effects/emitters/weapons/illuminate/shield/impact/large/w_i_s_i_l_06_debris_emit.bp',
        },
        UEF_Airmissile01_Polytrails01 = {
            '/effects/emitters/weapons/uef/airmissile01/projectile/w_u_arm01_p_01_polytrail_emit.bp',
            '/effects/emitters/weapons/uef/airmissile01/projectile/w_u_arm01_p_02_polytrail_emit.bp',
        },
        UEF_Airmissile01_Trails01 = {
			'/effects/emitters/weapons/uef/airmissile01/projectile/w_u_arm01_p_03_glow_emit.bp',
			'/effects/emitters/weapons/uef/airmissile01/projectile/w_u_arm01_p_04_ignitefire_emit.bp',
			'/effects/emitters/weapons/uef/airmissile01/projectile/w_u_arm01_p_05_flare_emit.bp',
        },
        UEF_AntiMissile01_Launch01 = {  -- Larger version, for base structures
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_02_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_03_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_04_flare_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_06_inward_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_07_line_emit.bp',
        },
        UEF_AntiMissile01_Launch02 = {  -- Smaller version for mobile units
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_08_flash_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_09_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_10_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_11_flare_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_12_sparks_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_13_inward_emit.bp',
            '/effects/emitters/weapons/uef/antimissile01/launch/w_u_am01_l_14_line_emit.bp',
        },
        UEF_AntiNuke01_Launch01 = {
			'/effects/emitters/weapons/uef/antinuke01/launch/w_u_an01_l_01_smoke_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/launch/w_u_an01_l_02_fire_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/launch/w_u_an01_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/launch/w_u_an01_l_04_flash_emit.bp',
        },
        UEF_AntiNuke01_Polytrails01 = {
			'/effects/emitters/weapons/uef/antinuke01/projectile/w_u_an01_p_01_polytrail_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/projectile/w_u_an01_p_06_polytrail_emit.bp',
        },
        UEF_AntiNuke01_Trails01 = {
			'/effects/emitters/weapons/uef/antinuke01/projectile/w_u_an01_p_02_fire_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/projectile/w_u_an01_p_03_glow_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/projectile/w_u_an01_p_04_smoke_emit.bp',
        },
        UEF_AntiNuke01_Impact01 = {
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_03_fire_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_04_smalldebris_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_05_darksmoke_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_06_sparks_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_07_shrapnel_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_08_ring_emit.bp',
			'/effects/emitters/weapons/uef/antinuke01/impact/unit/w_u_an01_i_u_09_refraction_emit.bp',
        },
        UEF_Artillery01_Launch01 = {
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_05_smokefront_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_06_smokeright_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_07_smokeleft_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/launch/w_u_art01_l_08_smokeflare_emit.bp',
        },
        UEF_Artillery01_Impact01 = {
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_02_smallflashes_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_03_halfflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_05_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_06_shockwaves_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_07_dust_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_08_dirtlines_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_09_darksmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/impact/unit/w_u_art01_i_u_10_debris_emit.bp',
        },
        UEF_Artillery01_Polytrails01 = {
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_06_polytrails_emit.bp',
        },
        UEF_Artillery01_Split01 = {
            '/effects/emitters/weapons/uef/artillery01/event/split/w_u_art01_e_s_01_smoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/event/split/w_u_art01_e_s_02_flash_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/event/split/w_u_art01_e_s_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/event/split/w_u_art01_e_s_04_shrapnel_emit.bp',
        },
        UEF_Artillery01_Trails01 = {
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_01_spiralsmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_02_glow_emit.bp',
        },
        UEF_Artillery01_Trails02 = {
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_03_smoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_04_glowline_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_05_flickerglow_emit.bp',
        },
        UEF_Artillery02_Polytrails01 = {
            '/effects/emitters/weapons/uef/artillery02/projectile/w_u_art02_p_01_polytrails_emit.bp',
        },
        UEF_Artillery02_Trails01 = {
            '/effects/emitters/weapons/uef/artillery02/projectile/w_u_art02_p_02_ringwake_emit.bp',
            '/effects/emitters/weapons/uef/artillery01/projectile/w_u_art01_p_02_glow_emit.bp',
        },
        UEF_Artillery03_Launch01 = {
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_05_smokefront_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_06_smokeright_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_07_smokeleft_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/launch/w_u_art03_l_08_smokeflare_emit.bp',
        },
        UEF_Artillery03_Impact01 = {
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_02_smallflashes_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_03_halfflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_05_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_06_shockwaves_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_07_dust_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_08_dirtlines_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_09_darksmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_10_debris_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_11_flatglow_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_12_shockring_emit.bp',
        },
        UEF_Artillery03_Polytrails01 = {
            '/effects/emitters/weapons/uef/artillery03/projectile/w_u_art03_p_01_polytrails_emit.bp',
        },
        UEF_Artillery03_Trails01 = {
            '/effects/emitters/weapons/uef/artillery03/projectile/w_u_art03_p_02_glow_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/projectile/w_u_art03_p_03_smoke_emit.bp',
        },
        UEF_Artillery04_Launch01 = {
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_05_smallsmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_06_largesmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_07_backsmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/launch/w_u_art04_l_08_largefirecloud_emit.bp',
        },
        UEF_Artillery04_Impact01 = {
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_02_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_03_halfflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_05_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_06_shockwaves_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_07_dust_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_08_flatdirt_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_09_darksmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_11_ring_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_12_lines_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_13_distortring_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/impact/unit/w_u_art04_i_u_14_dirtlines_emit.bp',
        },
        UEF_Artillery04_Polytrails01 = {
            '/effects/emitters/weapons/uef/artillery04/projectile/w_u_art04_p_01_polytrails_emit.bp',
        },
        UEF_Artillery04_Trails01 = {
            '/effects/emitters/weapons/uef/artillery04/projectile/w_u_art04_p_02_glow_emit.bp',
            '/effects/emitters/weapons/uef/artillery04/projectile/w_u_art04_p_03_smoke_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/projectile/w_u_art04_p_04_glowline_emit.bp',
			'/effects/emitters/weapons/uef/artillery04/projectile/w_u_art04_p_05_flickerglow_emit.bp',
        },
        UEF_Artillery05_Launch01 = {   -- King Kriptor artillery muzzle flash
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_05_smoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_06_glow_emit.bp',
            '/effects/emitters/weapons/uef/artillery05/launch/w_u_art05_l_07_firedetail_emit.bp',
        },
        UEF_Artillery06_Impact01 = {
			'/effects/emitters/weapons/uef/artillery06/impact/unit/w_u_art06_i_u_01_halfflash_emit.bp',
			'/effects/emitters/weapons/uef/artillery06/impact/unit/w_u_art06_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/artillery06/impact/unit/w_u_art06_i_u_03_lines_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_02_smallflashes_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_03_halfflash_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_05_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_06_shockwaves_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_07_dust_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_08_dirtlines_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_09_darksmoke_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_10_debris_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_11_flatglow_emit.bp',
            '/effects/emitters/weapons/uef/artillery03/impact/unit/w_u_art03_i_u_12_shockring_emit.bp',
        },
        UEF_Artillery06_Trails01 = {
			'/effects/emitters/weapons/uef/artillery06/projectile/w_u_art06_p_01_glow_emit.bp',
			'/effects/emitters/weapons/uef/artillery06/projectile/w_u_art06_p_02_flickerglow_emit.bp',
			'/effects/emitters/weapons/uef/artillery06/projectile/w_u_art06_p_03_smoke_emit.bp',
        },
        UEF_ClusterBomb01_Impact01 = {
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_02_smallflashes_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_03_halfflash_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_05_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_06_shockwaves_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_07_dust_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_08_dirtlines_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_09_smoke_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/impact/unit/w_u_cb01_i_u_11_smokelines_emit.bp',
	    },
        UEF_ClusterBomb01_Trails01 = {
			'/effects/emitters/weapons/uef/clusterbomb01/projectile/w_u_cb01_p_01_glow_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/projectile/w_u_cb01_p_02_smoke_emit.bp',
			'/effects/emitters/weapons/uef/clusterbomb01/projectile/w_u_cb01_p_03_glowline_emit.bp',
        },
        UEF_CruiseMissile01_Launch01 = {
            '/effects/emitters/weapons/uef/cruisemissile01/launch/w_u_crm01_l_01_smoke_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/launch/w_u_crm01_l_02_sparks_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/launch/w_u_crm01_l_03_fireline_emit.bp',
        },
        UEF_Cruisemissile01_Impact01 = {
            '/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_01_flashflat_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_03_fire_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_04_smalldebris_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_05_darksmoke_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_06_sparks_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/unit/w_u_crm01_i_u_07_shrapnel_emit.bp',
	    },
	    UEF_Cruisemissile01_Impact02 = { -- Ground impact
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_01_flashflat_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_03_fire_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_04_smalldebris_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_05_darksmoke_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_06_sparks_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile01/impact/ground/w_u_crm01_i_g_07_shrapnel_emit.bp',
	    },
        UEF_Cruisemissile01_Polytrails01 = {
            '/effects/emitters/weapons/uef/cruisemissile01/projectile/w_u_crm01_p_01_polytrail_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/projectile/w_u_crm01_p_06_polytrail_emit.bp',
        },
        UEF_Cruisemissile01_Trails01 = {
            '/effects/emitters/weapons/uef/cruisemissile01/projectile/w_u_crm01_p_04_ignitefire_emit.bp',
            '/effects/emitters/weapons/uef/cruisemissile01/projectile/w_u_crm01_p_05_flare_emit.bp',
        },
        UEF_Cruisemissile02_Trails01 = {
            '/effects/emitters/weapons/uef/cruisemissile02/projectile/w_u_crm02_p_01_glow_emit.bp',
        },
        UEF_CruiseMissile03_Launch01 = {
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_02_sparks_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_04_flash_emit.bp',
        },
        UEF_CruiseMissile04_Launch01 = {
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_01_smoke_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_02_sparks_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/launch/w_u_crm04_l_04_flash_emit.bp',
        },
		UEF_Cruisemissile04_Polytrails01 = {
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_01_polytrail_emit.bp',
        },
        UEF_Cruisemissile04_Polytrails02 = {
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_02_polytrail_emit.bp',
        },
        UEF_Cruisemissile04_Trails01 = {
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_03_glow_emit.bp',
        },
        UEF_Cruisemissile04_Trails02 = {
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_04_ignitefire_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_05_flare_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/projectile/w_u_crm04_p_06_smoketrail_emit.bp',
        },
        UEF_Cruisemissile04_Impact01 = {
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_01_flashflat_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_03_fire_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_04_firelines_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_05_darksmoke_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_06_sparks_emit.bp',
			'/effects/emitters/weapons/uef/cruisemissile04/impact/unit/w_u_crm04_i_u_07_shrapnel_emit.bp',
	    },
	    UEF_DisruptorArtillery01_Launch01 = {
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_02_flashline_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_04_plasma_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_05_sideplasma_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_06_flashdetail_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/launch/w_u_dra01_l_07_column_emit.bp',
        },
        UEF_DisruptorArtillery01_Impact01 = {
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_02_flash_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_04_plasma_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_05_shockwaves_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_06_lines_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_07_groundsmoke_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_08_debris_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_09_smoke_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_10_lingersmoke_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/impact/unit/w_u_dra01_i_u_11_stunrings_emit.bp',
        },
        UEF_DisruptorArtillery01_Polytrails01 = {
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_02_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_03_polytrail_emit.bp',
            },
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_06_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_07_polytrail_emit.bp',
            },
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_08_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_09_polytrail_emit.bp',
            },
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_02_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_09_polytrail_emit.bp',
            },
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_06_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_03_polytrail_emit.bp',
            },
            {
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_08_polytrail_emit.bp',
                '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_07_polytrail_emit.bp',
            },
        },

        UEF_DisruptorArtillery01_Trails01 = {
            '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_01_glow_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_04_wisps_emit.bp',
            '/effects/emitters/weapons/uef/disruptorartillery01/projectile/w_u_dra01_p_05_waves_emit.bp',
        },
        UEF_Flak01_Bulletspray01 = {
		    '/effects/emitters/weapons/uef/flak01/projectile/w_u_fla01_p_01_bulletspray_emit.bp',
        },
        UEF_Flak01_ImpactAirUnit01 = {
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_01_flashes_emit.bp',
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_03_smalldebris_emit.bp',
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_04_darksmoke_emit.bp',
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/flak01/impact/airunit/w_u_fla01_i_a_06_shrapnel_emit.bp',
        },
        UEF_Flak01_Launch01 = {
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_02_flashdetail_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_06_shellcasings_emit.bp',
            '/effects/emitters/weapons/uef/flak01/launch/w_u_fla01_l_07_largeflash_emit.bp',
        },
        UEF_Flak02_Bulletspray01 = {
		    '/effects/emitters/weapons/uef/flak02/projectile/w_u_fla02_p_01_bulletspray_emit.bp',
        },
        UEF_Gauss01_Impact01 = {
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_09_firelines_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/terrain/w_u_gau01_i_t_01_dirtlines_emit.bp',
        },
        UEF_Gauss01_ImpactUnit01 = {
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_09_firelines_emit.bp',
            '/effects/emitters/units/general/event/death/destruction_unit_hit_shrapnel_01_emit.bp',
        },
        UEF_Gauss01_ImpactWater01 = {
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_01_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_02_flatripple_emit.bp',
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_03_mist_emit.bp',
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_04_splash_emit.bp',
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_05_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/gauss01/impact/water/w_u_gau01_i_w_06_waterlines_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/impact/unit/w_u_gau01_i_u_09_firelines_emit.bp',
        },
        UEF_Gauss01_Launch01 = {
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_05_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_07_flatglow_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_08_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/launch/w_u_gau01_l_09_smallsmoke_emit.bp',
        },
        UEF_Gauss01_Polytrails01 = {
            '/effects/emitters/weapons/uef/gauss01/projectile/w_u_gau01_p_01_polytrails_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/projectile/w_u_gau01_p_02_polytrails_emit.bp',
        },
        UEF_Gauss01_Trails01 = {
            '/effects/emitters/weapons/uef/gauss01/projectile/w_u_gau01_p_03_brightglow_emit.bp',
            '/effects/emitters/weapons/uef/gauss01/projectile/w_u_gau01_p_04_smoke_emit.bp',
        },
        UEF_Gauss02_Impact01 = {
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_02_flatring_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_03_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_05_debris_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_06_debriscloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_07_firelines_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/impact/unit/w_u_gau02_i_u_08_flash_emit.bp',
        },
        UEF_Gauss02_Launch01 = {
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_02_fireline_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_03_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_05_flashdetail_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/launch/w_u_gau02_l_06_flashglow_emit.bp',
        },
        UEF_Gauss02_Polytrails01 = {
            '/effects/emitters/weapons/uef/gauss02/projectile/w_u_gau02_p_01_polytrail_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/projectile/w_u_gau02_p_02_polytrail_emit.bp',
        },
        UEF_Gauss02_Trails01 = {
            '/effects/emitters/weapons/uef/gauss02/projectile/w_u_gau02_p_03_glow_emit.bp',
            '/effects/emitters/weapons/uef/gauss02/projectile/w_u_gau02_p_04_wisps_emit.bp',
        },
        UEF_Gauss03_Impact01 = {
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_09_firelines_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/terrain/w_u_gau03_i_t_01_dirtlines_emit.bp',
        },
        UEF_Gauss03_ImpactUnit01 = {
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_09_firelines_emit.bp',
            '/effects/emitters/units/general/event/death/destruction_unit_hit_shrapnel_01_emit.bp',
        },
        UEF_Gauss03_Launch01 = {
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_05_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_07_flatglow_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_08_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_09_smallsmoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_10_flashdetail_emit.bp',
        },
        UEF_Gauss03_Polytrails01 = {
            '/effects/emitters/weapons/uef/gauss03/projectile/w_u_gau03_p_01_polytrails_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/projectile/w_u_gau03_p_02_polytrails_emit.bp',
        },
        UEF_Gauss03_Trails01 = {
            '/effects/emitters/weapons/uef/gauss03/projectile/w_u_gau03_p_03_brightglow_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/projectile/w_u_gau03_p_04_smoke_emit.bp',
        },
        UEF_Gauss04_Impact01 = {
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/unit/w_u_gau04_i_u_09_firelines_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/impact/terrain/w_u_gau04_i_t_01_dirtlines_emit.bp',
        },
        UEF_Gauss04_Launch01 = {
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_05_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss04/launch/w_u_gau04_l_07_smoke_emit.bp',
        },
        UEF_Gauss06_Impact01 = {
            '/effects/emitters/weapons/uef/gauss06/impact/unit/w_u_gau06_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_03_flatfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_05_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_06_dirtchunks_emit.bp',
            '/effects/emitters/weapons/uef/gauss06/impact/unit/w_u_gau06_i_u_07_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_08_leftoverfire_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/impact/unit/w_u_gau03_i_u_09_firelines_emit.bp',
            '/effects/emitters/units/general/event/death/destruction_unit_hit_shrapnel_01_emit.bp',
        },
        UEF_Gauss06_Launch01 = {
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_05_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_07_flatglow_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_08_smoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_09_smallsmoke_emit.bp',
            '/effects/emitters/weapons/uef/gauss03/launch/w_u_gau03_l_10_flashdetail_emit.bp',
        },
        UEF_Gauss06_Trails01 = {
            '/effects/emitters/weapons/uef/gauss06/projectile/w_u_gau06_p_01_tracer_emit.bp',
            '/effects/emitters/weapons/uef/gauss06/projectile/w_u_gau06_p_02_wisps_emit.bp',
        },
        UEF_Gauss07_Impact01 = {
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_03_flatfirecloud_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_06_dirtchunks_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_07_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_08_leftoverfire_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_09_firelines_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/impact/unit/w_u_gau07_i_u_10_dirtlines_emit.bp',
        },
        UEF_Gauss07_Polytrails01 = {
			'/effects/emitters/weapons/uef/gauss07/projectile/w_u_gau07_p_01_polytrails_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/projectile/w_u_gau07_p_02_polytrails_emit.bp',
        },
        UEF_Gauss07_Trails01 = {
			'/effects/emitters/weapons/uef/gauss07/projectile/w_u_gau07_p_03_brightglow_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/projectile/w_u_gau07_p_04_smoke_emit.bp',
        },
        UEF_Gauss07_Launch01 = {
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_02_fire_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_06_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_07_glow_emit.bp',
			'/effects/emitters/weapons/uef/gauss07/launch/w_u_gau07_l_08_smoke_emit.bp',
        },
        UEF_HandCannon01_PreLaunch01 = {
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_01_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_02_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_03_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_04_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_05_predots_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_06_preinward_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_10_prelines_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_11_presmoke_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_12_prelargeglow_emit.bp',
        },
        UEF_HandCannon01_PreLaunch02 = {
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_18_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_19_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_20_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_21_preglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_22_predots_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_23_preinward_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_24_prelines_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_25_presmoke_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_26_prelargeglow_emit.bp',
        },
        UEF_HandCannon01_Launch01 = {
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_07_flash_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_08_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_09_ring_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_13_backstreaks_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_14_backsmoke_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_15_backstreaks_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_16_backsmoke_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/launch/w_u_hcn01_l_17_flashline_emit.bp',
        },
        UEF_HandCannon01_Trails01 = {
			'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_01_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_02_brightglow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_06_glow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_08_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_09_smoketrail_emit.bp',
			--'/effects/emitters/weapons/uef/handcannon01/projectile/w_u_hcn01_p_10_distort_emit.bp',
        },
        UEF_HandCannon_Impact01 = {
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_01_flashflat_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_02_glow_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_03_glowhalf_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_05_halfring_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_06_ring_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_07_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_08_fwdsparks_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_09_leftoverglows_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_10_leftoverwisps_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_11_darkring_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_12_fwdsmoke_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_13_debris_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_14_lines_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_15_fastdirt_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_16_distortring_emit.bp',
        },
        UEF_HeavyGauss01_Impact01 = {
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_02_flash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_04_halfring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_05_ring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_07_fwdsparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_08_leftoverglows_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_09_leftoverwisps_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_10_fwdsmoke_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_11_debris_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_12_lines_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/terrain/w_u_hvg01_i_t_01_fastdirt_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/terrain/w_u_hvg01_i_t_02_darkring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_13_leftoversmoke_emit.bp',
        },
        UEF_HeavyGauss01_ImpactUnit01 = {
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_02_flash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_04_halfring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_05_ring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_06_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_07_fwdsparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_08_leftoverglows_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_09_leftoverwisps_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_10_fwdsmoke_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_11_debris_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_12_lines_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/impact/unit/w_u_hvg01_i_u_13_leftoversmoke_emit.bp',
        },
        UEF_Heavygauss01_Launch01 = {
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_02_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_03_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_04_shockwave_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_05_flashline_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_06_leftoverplasma_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_07_leftoversmoke_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_08_inwardfirecloud_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_09_sparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_10_flashdetail_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_11_dots_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_12_flareflash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/launch/w_u_hvg01_l_13_leftoverline_emit.bp',
        },
        UEF_HeavyGauss01_Trails01 = {
            '/effects/emitters/weapons/uef/heavygauss01/projectile/w_u_hvg01_p_01_smoke_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/projectile/w_u_hvg01_p_04_wisps_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss01/projectile/w_u_hvg01_p_05_glow_emit.bp',
        },
        UEF_HeavyGauss01_Polytrails01 = {
            '/effects/emitters/weapons/uef/heavygauss01/projectile/w_u_hvg01_p_03_polytrail_emit.bp',
        },
        UEF_Heavygauss02_Launch01 = {
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_01_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_02_flash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_03_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_04_spark_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_05_fireline_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_06_ring_emit.bp', -- fire cloud
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_07_flashdetail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_08_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_09_distort_emit.bp',
        },
        UEF_Heavygauss02_Launch02 = {
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_10_prefire_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_11_preglow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/launch/w_u_hvg02_l_12_prelines_emit.bp',
        },
        UEF_HeavyGauss02_Trails01 = {
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_01_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_02_stream_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_03_distort_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_06_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_07_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/projectile/w_u_hvg02_p_08_outercloud_emit.bp',
        },
        UEF_HeavyGauss02_Impact01 = {
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_01_flashflat_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_02_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_03_refraction_emit.bp', -- distort ring
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_06_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_05_firecore_emit.bp', -- glow half
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_07_lines_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_08_smokering_emit.bp', -- halfring
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_09_darkring_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_10_leftoverwisps_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_11_leftoverglows_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_12_fwdsmoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_13_debris_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_14_ring_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss02/impact/unit/w_u_hvg02_i_u_15_fastdirt_emit.bp',
        },
        UEF_HeavyGauss03_Impact01 = {
			'/effects/emitters/weapons/uef/heavygauss03/impact/terrain/w_u_hvg03_i_t_01_dirtlines_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_03_fire_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_05_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_06_debris_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_07_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_08_firelines_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_09_largesmoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_10_blueshock_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_11_inward_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/impact/unit/w_u_hvg03_i_u_12_glow_emit.bp',
        },
        UEF_Heavygauss03_Launch01 = {
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_02_flashdetail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_06_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/launch/w_u_hvg03_l_07_firecloud_emit.bp',
        },
        UEF_HeavyGauss03_Trails01 = {
			'/effects/emitters/weapons/uef/heavygauss03/projectile/w_u_hvg03_p_04_wisps_emit.bp',
        },
        UEF_HeavyGauss03_Polytrails01 = {
			'/effects/emitters/weapons/uef/heavygauss03/projectile/w_u_hvg03_p_02_polytrail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss03/projectile/w_u_hvg03_p_03_polytrail_emit.bp',
        },
        UEF_Heavygauss04_Launch01 = {
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_02_flashdetail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_03_fireline_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_04_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_05_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_06_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/launch/w_u_hvg04_l_07_firecloud_emit.bp',
        },
        UEF_HeavyGauss04_Trails01 = {
			'/effects/emitters/weapons/uef/heavygauss04/projectile/w_u_hvg04_p_01_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/projectile/w_u_hvg04_p_04_wisps_emit.bp',
        },
        UEF_HeavyGauss04_Polytrails01 = {
			'/effects/emitters/weapons/uef/heavygauss04/projectile/w_u_hvg04_p_02_polytrail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/projectile/w_u_hvg04_p_03_polytrail_emit.bp',
        },
        UEF_HeavyGauss04_Impact01 = {
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_02_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_03_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_04_firesmoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_05_firelines_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_06_smokegrit_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_09_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_10_debris_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_11_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_12_blueshock_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss04/impact/unit/w_u_hvg04_i_u_13_dirtlines_emit.bp',
        },
        UEF_Heavygauss05_Launch01 = {
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_02_firecloud_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_03_flashline_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_05_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_06_sparks_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_07_flashdetail_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_08_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/launch/w_u_hvg05_l_09_distort_emit.bp',
        },
        UEF_HeavyGauss05_Trails01 = {
			'/effects/emitters/weapons/uef/heavygauss05/projectile/w_u_hvg05_p_01_tracer_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/projectile/w_u_hvg05_p_02_glow_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/projectile/w_u_hvg05_p_03_wisps_emit.bp',
			'/effects/emitters/weapons/uef/heavygauss05/projectile/w_u_hvg05_p_04_distort_emit.bp',
        },
        UEF_HeavyGauss05_Impact01 = {
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_01_flatflash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_02_flash_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_04_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_05_halfring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_06_ring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_07_smoke_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_08_groundring_emit.bp',
            '/effects/emitters/weapons/uef/heavygauss05/impact/w_u_hvg05_i_09_lightsmoke_emit.bp',
            '/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_13_debris_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_15_fastdirt_emit.bp',
			'/effects/emitters/weapons/uef/handcannon01/impact/unit/w_u_hcn01_i_u_16_distortring_emit.bp',
        },
        UEF_Napalm01_Impact01 = {
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_02_flash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_03_flash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_04_thinsmoke_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_05_fireflash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_06_flash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_07_sparks_emit.bp',
        },
        UEF_Napalm01_ImpactAir01 = {
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_09_airfire_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_10_flash_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_11_airthinsmoke_emit.bp',
			'/effects/emitters/weapons/uef/naplambomb01/impact/unit/w_u_npb01_i_u_13_airsparks_emit.bp',
        },
        UEF_Napalm01_Polytrails01 =  {
            '/effects/emitters/units/general/projectile/default_polytrail_08_emit.bp',
        },
        UEF_Napalm01_Trails01 = {
			'/effects/emitters/weapons/uef/naplambomb01/projectile/w_u_npb01_p_01_wisps_emit.bp',
        },
        UEF_Noah01_Launch01 = {
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_02_firecloud_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_04_sparks_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_05_smokefront_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_06_smokeright_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_07_smokeleft_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_08_smokeflare_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_09_largefirecloud_emit.bp',
            '/effects/emitters/weapons/uef/noah01/launch/w_u_noah01_l_10_ring_emit.bp',
        },
        UEF_Noah01_Polytrails01 = {
			'/effects/emitters/weapons/uef/noah01/projectile/w_u_noah01_p_01_polytrails_emit.bp',
        },
        UEF_Noah01_Trails01 = {
			'/effects/emitters/weapons/uef/noah01/projectile/w_u_noah01_p_02_smoke_emit.bp',
			'/effects/emitters/weapons/uef/noah01/projectile/w_u_noah01_p_03_glow_emit.bp',
        },
        UEF_Noah01_ShellSplit01 = {
			'/effects/emitters/weapons/uef/noah01/event/split/w_u_noah01_e_s_01_ring_emit.bp',
			'/effects/emitters/weapons/uef/noah01/event/split/w_u_noah01_e_s_02_flash_emit.bp',
			'/effects/emitters/weapons/uef/noah01/event/split/w_u_noah01_e_s_03_sparks_emit.bp',
			'/effects/emitters/weapons/uef/noah01/event/split/w_u_noah01_e_s_04_flashlines_emit.bp',
        },
        UEF_Noah01_Impact01 = {
			'/effects/emitters/weapons/uef/noah01/impact/w_u_noah01_i_01_glow_emit.bp',
			'/effects/emitters/weapons/uef/noah01/impact/w_u_noah01_i_02_fire_emit.bp',
        },
        UEF_Riotgun01_Bulletspray01 = {
		    '/effects/emitters/weapons/uef/riotgun01/projectile/w_u_rio01_p_01_bulletspray_emit.bp',
        },
        UEF_Riotgun01_Impact01 = {
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_01_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_02_smallflashes_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_04_shrapnel_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_05_smoke_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_06_dirtlines_emit.bp',
        },
        UEF_Riotgun01_Launch01 = {
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_05_shells_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_06_sparks_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_07_muzzletracers_emit.bp',
        },
        UEF_Riotgun02_Impact01 = {
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_01_largeflash_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_02_smallflashes_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_03_sparks_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_04_shrapnel_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_05_smoke_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/impact/unit/w_u_rio01_i_u_06_dirtlines_emit.bp',
        },
        UEF_Riotgun02_Launch01 = {
            '/effects/emitters/weapons/uef/riotgun02/launch/w_u_rio02_l_01_shells_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_01_flash_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_02_fire_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_03_fireline_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_04_smoke_emit.bp',
            '/effects/emitters/weapons/uef/riotgun01/launch/w_u_rio01_l_06_sparks_emit.bp',
        },
        UEF_Riotgun02_Projectile01 = {
            '/effects/emitters/weapons/uef/riotgun02/projectile/w_u_rio02_p_01_tracer_emit.bp',
        },
        UEF_Shield_Impact_Small01 = {
			'/effects/emitters/weapons/uef/shield/impact/small/w_u_s_i_s_01_shrapnel_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/small/w_u_s_i_s_02_smoke_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/small/w_u_s_i_s_03_sparks_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/small/w_u_s_i_s_04_fire_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/small/w_u_s_i_s_05_firelines_emit.bp',
        },
        UEF_Shield_Impact_Medium01 = {
			'/effects/emitters/weapons/uef/shield/impact/medium/w_u_s_i_m_01_shrapnel_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/medium/w_u_s_i_m_02_fire_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/medium/w_u_s_i_m_03_sparks_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/medium/w_u_s_i_m_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/medium/w_u_s_i_m_05_firelines_emit.bp',
        },
        UEF_Shield_Impact_Large01 = {
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_01_shrapnel_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_02_fire_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_03_sparks_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_05_firelines_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_06_ring_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_07_wisps_emit.bp',
			'/effects/emitters/weapons/uef/shield/impact/large/w_u_s_i_l_08_flash_emit.bp',
        },
        UEF_Torpedo01_Launch01 = {
			'/effects/emitters/weapons/uef/torpedo01/launch/w_u_tor01_l_01_flash_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/launch/w_u_tor01_l_02_fireline_emit.bp',
        },
        UEF_Torpedo01_Polytrails01 = {
			'/effects/emitters/weapons/uef/torpedo01/projectile/w_u_tor01_p_01_polytrails_emit.bp',
        },
        UEF_Torpedo01_Trails01 = {
			'/effects/emitters/weapons/uef/torpedo01/projectile/w_u_tor01_p_02_smoke_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/projectile/w_u_tor01_p_03_smallsmoke_emit.bp',
        },
        UEF_Torpedo01_Impact01 = {
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_01_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_02_flatripple_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_03_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_04_smoke_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_05_firelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_06_smokelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_07_mist_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_09_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_10_waterlines_emit.bp',
        },
        UEF_Torpedo01_Impact02 = {
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_03_shockwave_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_05_firelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_06_smokelines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_07_mist_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_09_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_10_waterlines_emit.bp',
        },
        UEF_Torpedo01_Impact03 = {
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_11_flatflash_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_12_flatripple_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_13_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_14_waterlines_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_15_firecore_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_16_splash_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_09_waterspray_emit.bp',
			'/effects/emitters/weapons/uef/torpedo01/impact/unit/w_u_tor01_i_u_02_flatripple_emit.bp',
        },
        Water_Impact_Small01 = {
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_02_flatripple_emit.bp',
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_03_splash_emit.bp',
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_04_waterspray_emit.bp',
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_05_mist_emit.bp',
			'/effects/emitters/weapons/generic/water01/small01/impact/w_g_wat01_s_i_06_leftover_emit.bp',
        },
        Water_Impact_Medium01 = {
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_02_flatripple_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_03_shockwave_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_04_splash_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_05_firecore_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_06_waterspray_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_07_mist_emit.bp',
			'/effects/emitters/weapons/generic/water01/medium01/impact/w_g_wat01_m_i_08_leftover_emit.bp',
        },
        Water_Impact_Large01 = {
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_01_flatflash_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_02_flatripple_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_03_shockwave_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_04_splash_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_05_firecore_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_06_waterspray_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_07_mist_emit.bp',
			'/effects/emitters/weapons/generic/water01/large01/impact/w_g_wat01_l_i_08_leftover_emit.bp',
        },
		-----------------------------------------------------------------
        -- UNIT DESTROY PROJECTILE EFFECTS
        -----------------------------------------------------------------

        Illuminate_Destroy_Impact_Large01 = {
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_02_flashflat_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_03_core_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_04_plasma_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_05_plasmalines_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_06_groundring_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_07_ring_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_08_smokecloud_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_09_splat_emit.bp',
			'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_10_singleray_emit.bp',
        },
        Illuminate_Destroy_Trails_Large01 = {
			'/effects/emitters/units/illuminate/general/event/split/trail/u_i_gen_e_s_t_01_glow_emit.bp',
			'/effects/emitters/units/illuminate/general/event/split/trail/u_i_gen_e_s_t_02_plasma_emit.bp',
			'/effects/emitters/units/illuminate/general/event/split/trail/u_i_gen_e_s_t_03_smoke_emit.bp',
        },
        UEF_Destroy_Trails_Large01 = {
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_01_glow_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_02_fire_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_03_smoke_emit.bp',
        },
        UEF_Destroy_Trails_Med01 = {
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_04_glow_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_05_fire_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_06_smoke_emit.bp',
        },
        UEF_Destroy_Impact_Med01 = {
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_02_flashflat_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_03_fire_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_04_dirt_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_05_dirtlines_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_06_dustgroundring_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_07_smokecloud_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_08_smokelines_emit.bp',
			'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_09_sparks_emit.bp',
        },
        UEF_Destroy_ImpactWater_Med01 = {
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
			'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
        },
        UEF_Destroy_Trails_Large02 = {
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_01_glow_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_02_fire_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_03_smoke_emit.bp',
			'/effects/emitters/units/uef/land/general/event/split/trail/u_l_gen_e_s_t_07_electricity_emit.bp',
        },

        -----------------------------------------------------------------
        -- IMPACTS, PROJECTILE TRAILS
        -----------------------------------------------------------------

        CIFNeutronClusterBomb01_Polytrails01 =  {
            '/effects/emitters/units/general/projectile/default_polytrail_08_emit.bp',
        },
        CIFNeutronClusterBomb01_Polytrails02 =  {
            '/effects/emitters/units/general/projectile/default_polytrail_08_emit.bp',
        },
        CybranBuild01_Trails01 = {
			'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_16_nodering_emit.bp',
			'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_17_nodesparks_emit.bp',
			'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_18_nodeglow_emit.bp',
        },
        SBOOtheTacticalBomb01_Polytrails01 = {
            '/effects/emitters/seraphim_othe_bomb_projectile_polytrail_01_emit.bp',
        },
        TIFMissileNuke01_Beam01 = {
        },
        TIFNapalmCarpetBomb01_Polytrails01 =  {
            '/effects/emitters/units/general/projectile/default_polytrail_08_emit.bp',
        },
        BrackmanQAIHackCircuitryEffect01_Trails01 = {},
        DestructionDust01_Trails01 = {
            '/effects/emitters/ambient/units/terran_bomber_dust_blanket_01_emit.bp',
        },
        SCUDeathShockwave01_Trails01 = {
            '/effects/emitters/weapons/illuminate/nuke01/seraphim_inaino_plume_fxtrails_05_emit.bp',
        },
        UEFBuild01_Trails01 = {
            '/effects/emitters/units/uef/general/build_terran_glow_01_emit.bp',
            '/effects/emitters/units/uef/general/uef_build_glow_02_emit.bp',
            '/effects/emitters/units/uef/general/build_sparks_blue_01_emit.bp',
        },
        UEFNukeFlavorPlume01_Trails01 = {
            '/effects/emitters/weapons/uef/nuke01/impact/nuke_smoke_trail01_emit.bp',
        },
        UEFNukeShockwave01_Trails01 = {
            '/effects/emitters/weapons/uef/nuke01/impact/nuke_blanket_smoke_02_emit.bp',
        },
        UEFNukeShockwave02_Trails01 = {
            '/effects/emitters/weapons/uef/nuke01/impact/nuke_blanket_smoke_01_emit.bp',
        },
		TestFastPolyTrailSpeed15 = {
			'/effects/emitters/weapons/dev/dev_fast15_polytrail_01_emit.bp',
		},
		TestSlowPolyTrailSpeed15 = {
			'/effects/emitters/weapons/dev/dev_slow15_polytrail_01_emit.bp',
		},
		TestFastPolyTrailSpeed30 = {
			'/effects/emitters/weapons/dev/dev_fast30_polytrail_01_emit.bp',
		},
		TestSlowPolyTrailSpeed30 = {
			'/effects/emitters/weapons/dev/dev_slow30_polytrail_01_emit.bp',
		},
		TestFastPolyTrailSpeed45 = {
			'/effects/emitters/weapons/dev/dev_fast45_polytrail_01_emit.bp',
		},
		TestSlowPolyTrailSpeed45 = {
			'/effects/emitters/weapons/dev/dev_slow45_polytrail_01_emit.bp',
		},
    },

	-----------------------------------------------------------------
    -- Factional Explosion Effects
    -----------------------------------------------------------------

    Explosions = {
		Air = {
			-- CYBRAN AIR --
			CybranDefaultDestroyEffectsAir01 = {
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokelines_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_sparks_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_firelines_emit.bp',
			},
			CybranDefaultDestroyEffectsAir02 = {
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_12_energyc_emit.bp',
			},
			CybranDefaultDestroyEffectsAirLarge01 = {
				'/effects/emitters/units/cybran/air/general/event/death/u_c_a_gen_evt_d_01_flash_emit.bp',
				'/effects/emitters/units/cybran/air/general/event/death/u_c_a_gen_evt_d_02_sparks_emit.bp',
				'/effects/emitters/units/cybran/air/general/event/death/u_c_a_gen_evt_d_03_debris_emit.bp',
				'/effects/emitters/units/cybran/air/general/event/death/u_c_a_gen_evt_d_04_debris_emit.bp',
				'/effects/emitters/units/cybran/air/general/event/death/u_c_a_gen_evt_d_05_lines_emit.bp',
				'/effects/emitters/weapons/cybran/artillery02/impact/unit/w_u_art02_i_u_01_flatflash_emit.bp',
				'/effects/emitters/units/cybran/experimental/0101/event/death/ucx0101_evt_d_04_fastfire_emit.bp',
				'/effects/emitters/ambient/impact/explosion_fire_sparks_02_emit.bp',
			},
			-- ILLUMINATE AIR --
			IlluminateDefaultDestroyEffectsAir01 = {
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokelines_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_sparks_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_firelines_emit.bp',
			},
			IlluminateDefaultDestroyEffectsAir02 = {
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_flashlines02_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_firelines_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_plasma_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_plasmacore_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_smokelines_01_emit.bp',
				'/effects/emitters/units/illuminate/air/general/event/death02/general_evt_d_sparks_emit.bp',
			},
			-- UEF AIR --
			UEFDefaultDestroyEffectsAir01 = {
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_smokelines_01_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_sparks_emit.bp',
				'/effects/emitters/units/uef/air/general/event/death/general_evt_d_firelines_emit.bp',
			},
		},
		Land = {
			-- CYBRAN LAND --
            CybranStructureDestroyEffectsSmall01 = {
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/small/b_general_evt_d_s_08_leftover_electricity_emit.bp',
            },
            CybranStructureDestroyEffectsMedium01 = {
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/medium/b_general_evt_d_m_09_debris_emit.bp',
            },
            CybranStructureDestroyEffectsLarge01 = {
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_09_debris_emit.bp', -- core electricity
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_10_energy_emit.bp',  -- outward
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_11_energyb_emit.bp', -- outward
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_12_sparks_emit.bp',
            },
            CybranStructureDestroyEffectsExtraLarge01 = {
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_09_debris_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_10_energy_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_11_energyb_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_12_energyc_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xlarge/b_general_evt_d_xl_13_sparks_emit.bp',
            },
            CybranStructureDestroyEffectsExtraLarge02 = {
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_09_debris_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_10_energy_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_11_energyb_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_12_energyc_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/xxlarge/b_general_evt_d_xxl_13_sparks_emit.bp',
            },
			CybranDefaultDestroyEffectsSmall01 = {
				'/effects/emitters/units/general/event/death/unit_destroy_ring_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_ringflat_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_02_decal_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_dustgroundring_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_02_debris_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_02_dirt_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_02_dirt_02_emit.bp',
				'/effects/emitters/units/general/event/death/unit_destroy_02_dustburst_emit.bp',
			},
            CybranDefaultDestroyEffectsMed01 = {
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_electricity_emit.bp',
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_electricitycore_emit.bp',
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/cybran/general/event/death01/general_evt_d_sparks_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ringflat_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirt_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustgroundring_03_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_firegroundring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_sparks_emit.bp',
            },
            CybranDefaultDestroyEffectsLarge01 = {
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dirt_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dirtlines_01_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_03_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_sparks_emit.bp',
                '/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_upwardlines_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_distortring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dustring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_flash_emit.bp',
            },
            CybranSCB3601DestroyEffects01 = {
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_08_glow_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_09_flatshockwave_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_10_flatshockdistort_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_13_flatdistortring_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_15_origindust_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_16_flatorigindust_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_19_faintorigindust_emit.bp',
				'/effects/emitters/weapons/generic/nuke01/base/w_g_nuk01_b_20_originbacklighting_emit.bp',
            },
            CybranDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_09_debris_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_10_energy_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_11_energyb_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_12_sparks_emit.bp',
            },
            CybranDefaultDestroyEffectsWater02 = {
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_01_flash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_02_flatflash_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_03_core_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_04_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_05_flat_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_06_glow_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_07_smokecloud_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_08_leftover_electricity_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_09_debris_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_10_energy_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_11_energyb_emit.bp',
				'/effects/emitters/units/cybran/base/general/event/death/large/b_general_evt_d_l_12_sparks_emit.bp',
            },
            -- ILLUMINATE LAND --
            IlluminateDefaultDestroyEffectsMed01 = {
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_flashlines_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_plasmacore_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_sparks_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_ringsplat_emit.bp',
				'/effects/emitters/units/illuminate/general/event/death01/general_evt_d_droplets_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_glowflat_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirt_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokelines_01_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_sparks_emit.bp',
            },
            IlluminateStructureDestroyEffectsSmall01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_09_singleray_emit.bp',
            },
            IlluminateStructureDestroyEffectsMedium01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_09_splat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/medium/b_general_evt_d_m_10_singleray_emit.bp',
            },
            IlluminateStructureDestroyEffectsLarge01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_09_splat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_10_wave_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/large/b_general_evt_d_l_11_singleray_emit.bp',
            },
            IlluminateStructureDestroyEffectsExtraLarge01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_09_splat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_10_wave_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xlarge/b_general_evt_d_xl_11_singleray_emit.bp',
            },
            IlluminateStructureDestroyEffectsExtraLarge02 = {
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_09_splat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_10_wave_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/xxlarge/b_general_evt_d_xxl_11_singleray_emit.bp',
            },
            IlluminateStructureDestroyEffectsSecondary01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_02_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_03_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_04_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_05_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_06_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/secondary/b_general_evt_d_sd_07_splat_emit.bp',
            },
            IlluminateDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_01_flash_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_02_flashflat_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_03_core_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_04_plasma_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_05_plasmalines_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_06_groundring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_07_ring_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_08_smokecloud_emit.bp',
				'/effects/emitters/units/illuminate/base/general/event/death/small/b_general_evt_d_s_09_singleray_emit.bp',
            },
            -- UEF LAND --
            UEFStructureDestroyEffectsSmall01 = {
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_03_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_04_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_05_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_06_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_07_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/small/b_general_evt_d_s_08_smokelines_emit.bp',
            },
            UEFStructureDestroyEffectsMedium01 = {
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_03_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_04_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_05_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_06_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_07_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_08_smokelines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_09_sparks_emit.bp',
            },
            UEFStructureDestroyEffectsLarge01 = {
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_03_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_04_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_05_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_06_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_07_firegroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_08_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_09_smokelines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_10_sparks_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_11_ring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/large/b_general_evt_d_l_12_ringflat_emit.bp',
            },
            UEFStructureDestroyEffectsExtraLarge01 = {
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_03_flashlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_04_firecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_05_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_06_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_07_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_08_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_09_firegroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_10_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_11_smokelines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_12_sparks_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_13_ring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_14_ringflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xlarge/b_general_evt_d_xl_15_dirtmask_emit.bp',
            },
            UEFStructureDestroyEffectsExtraLarge02 = {
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_03_flashlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_04_firecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_05_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_06_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_07_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_08_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_09_firegroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_10_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_11_smokelines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_12_sparks_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_13_ring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_14_ringflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_15_dirtmask_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/xxlarge/b_general_evt_d_xxl_16_smokering_emit.bp',
            },
            UEFStructureDestroyEffectsFlash01 = {
				--'/effects/emitters/units/uef/base/general/event/death/b_general_evt_d_01_flashflat_emit.bp',
            },
			UEFDefaultDestroyEffectsMed01 = {
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_flash_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_flashflat_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_ringflat_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirt_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dirtlines_01_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustgroundring_03_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_firegroundring_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokecloud_02_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_smokelines_02_emit.bp',
				'/effects/emitters/units/uef/land/general/event/death/general_evt_d_sparks_emit.bp',
            },
            UEFPowerUnitDestroyEffects01 = {
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dirt_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dirtlines_01_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_03_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_sparks_emit.bp',
                '/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_upwardlines_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_distortring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_ring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dustring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_energyring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_energyringflat_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_flash_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_godrays_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_singleray_emit.bp',
            },
            UEFDefaultDestroyEffectsWater02 = {
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_01_flash_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_02_flashflat_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_03_fire_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_04_dirt_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_05_dirtlines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_06_dustgroundring_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_07_smokecloud_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_08_smokelines_emit.bp',
				'/effects/emitters/units/uef/base/general/event/death/medium/b_general_evt_d_m_09_sparks_emit.bp',
            },
		},
		Sub = {
			-- UEF SUB --
			UEFDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
            },
            -- Cybran SUB --
            CybranDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
            },
		},
		Water = {
			-- CYBRAN WATER --
			CybranDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_05_firecloud_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_09_fireglow_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
            },
            CybranDefaultDestroyEffectsWater02 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_05_firecloud_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_09_fireglow_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_14_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_15_ripples_emit.bp',
            },
            -- Illuminate WATER --
            IlluminateDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_05_firecloud_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_09_fireglow_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_14_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_15_ripples_emit.bp',
            },
            -- UEF WATER --
            UEFDefaultDestroyEffectsWater01 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_05_firecloud_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_09_fireglow_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
            },
            UEFDefaultDestroyEffectsWater02 = {
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_01_flatflash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_02_flash_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_05_firecloud_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_09_fireglow_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_14_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_15_ripples_emit.bp',
            },
            UEFSeaFactoryDestroyEffects01 = {
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_debris_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_dustburst_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_fire_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_01_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_02_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_smokecloud_03_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_sparks_emit.bp',
                '/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_upwardlines_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_distortring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_ring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_energyring_emit.bp',
				'/effects/emitters/units/uef/land/0702/event/death/uub0702_evt_d_energyringflat_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
				'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
            },
		},
    },

	-----------------------------------------------------------------
    -- General Explosion Effects
    -----------------------------------------------------------------
    ExplosionEffectsSml01 = {
        '/effects/emitters/units/general/event/death/destruction_explosion_fire_shadow_02_emit.bp',
        '/effects/emitters/ambient/impact/fire_cloud_05_emit.bp',
        '/effects/emitters/ambient/impact/fire_cloud_04_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_07_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_08_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_09_emit.bp',
    },
    ExplosionEffectsMed01 = {
        '/effects/emitters/units/general/event/death/destruction_explosion_fire_shadow_01_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_smoke_04_emit.bp',
        '/effects/emitters/ambient/impact/explosion_fire_sparks_01_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_10_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_11_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_12_emit.bp',
    },
    ExplosionEffectsLrg01 = {
        '/effects/emitters/units/general/event/death/destruction_explosion_fire_shadow_01_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_smoke_03_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_smoke_07_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_01_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_02_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_debris_03_emit.bp',
    },
    DefaultHitExplosion01 = {
        '/effects/emitters/ambient/impact/fire_cloud_06_emit.bp',
        '/effects/emitters/ambient/impact/explosion_fire_sparks_01_emit.bp',
        '/effects/emitters/units/general/event/death/destruction_explosion_smoke_02_emit.bp',
    },

    -----------------------------------------------------------------
    -- Default Unit Damage Effects
    -----------------------------------------------------------------
    DamageElectricity01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_electricity_01_emit.bp',
	},
    DamageSmoke01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_smoke_01_emit.bp',
	},
	DamageWaterSmoke01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_watersmoke_01_emit.bp',
	},
    DamageSparks01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_sparks_01_emit.bp',
	},
    DamageFire01 = {
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_01_emit.bp',
    },
    DamageFireSmoke01 = {
        '/effects/emitters/units/general/event/damage/destruction_damaged_smoke_01_emit.bp',
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_01_emit.bp',
    },
    DamageStructureSmoke01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_smoke_02_emit.bp',
	},
    DamageStructureFire01 = {
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_02_emit.bp',
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_03_emit.bp',
    },
    DamageStructureSparks01 = {
		'/effects/emitters/units/general/event/damage/destruction_damaged_sparks_01_emit.bp',
	},
    DamageStructureFireSmoke01 = {
        '/effects/emitters/units/general/event/damage/destruction_damaged_smoke_02_emit.bp',
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_02_emit.bp',
        '/effects/emitters/units/general/event/damage/destruction_damaged_fire_03_emit.bp',
    },

    -----------------------------------------------------------------
    -- Smoke Effects
    -----------------------------------------------------------------

    SmokePlumeLightDensityMed01 = { '/effects/emitters/units/general/event/death/destruction_explosion_smoke_08_emit.bp',},

	-----------------------------------------------------------------
    -- Transport Beacon Effects
    -----------------------------------------------------------------

    IlluminateBeaconEffects01 = {
		'/effects/emitters/units/illuminate/uib0902/ambient/illuminate_beacon_01_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uib0902/ambient/illuminate_beacon_02_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uib0902/ambient/illuminate_beacon_03_plasma_emit.bp',
    },

    -----------------------------------------------------------------
    -- Shield Impact effects
    -----------------------------------------------------------------

    CybranShieldHit01 = {
        '/effects/emitters/ambient/impact/_test_shield_impact_emit.bp',
    },
    UEFShieldHit01 = {
        '/effects/emitters/ambient/impact/_test_shield_impact_emit.bp',
    },
    ShieldHit01 = {
		'/effects/emitters/units/illuminate/general/event/shieldimpact01/general_evt_i_flash_emit.bp',
		'/effects/emitters/units/illuminate/general/event/shieldimpact01/general_evt_i_sparks_emit.bp',
    },

    -----------------------------------------------------------------
    -- Fire Cloud Effects
    -----------------------------------------------------------------

    FireCloudMed01 = {
        '/effects/emitters/ambient/impact/fire_cloud_06_emit.bp',
        '/effects/emitters/ambient/impact/explosion_fire_sparks_01_emit.bp',
    },
    
	-----------------------------------------------------------------
    -- Build Bonus Effects
    -----------------------------------------------------------------
    
	BuildBonusEffect = {
		'/effects/emitters/units/general/event/buildbonus/general_evt_bb_01_flatglow_emit.bp',
		'/effects/emitters/units/general/event/buildbonus/general_evt_bb_02_line_emit.bp',
		'/effects/emitters/units/general/event/buildbonus/general_evt_bb_03_ring_emit.bp',
		'/effects/emitters/units/general/event/buildbonus/general_evt_bb_04_sparkle_emit.bp',
		'/effects/emitters/units/general/event/buildbonus/general_evt_bb_06_debris_emit.bp',
    },
    
    -----------------------------------------------------------------
    -- Capture Effects
    -----------------------------------------------------------------

    CaptureBeams = {
		'/effects/emitters/units/general/event/capture/capture_beam_01_emit.bp',
		'/effects/emitters/units/general/event/capture/capture_beam_02_emit.bp',
    },
    CaptureMuzzleEffect = {
		'/effects/emitters/units/general/event/capture/capture_03_glow_emit.bp',
		'/effects/emitters/units/general/event/capture/capture_04_sparks_emit.bp',
    },
	CaptureEndEffect = {
		'/effects/emitters/units/general/event/capture/capture_05_glow_emit.bp',
		'/effects/emitters/units/general/event/capture/capture_07_debris_emit.bp',
		'/effects/emitters/units/general/event/capture/capture_09_dust_emit.bp',
    },

    -----------------------------------------------------------------
    -- Reclaim Effects
    -----------------------------------------------------------------
    ReclaimBeams = {
		Surface = {
			'/effects/emitters/units/general/event/reclaim/reclaim_beam_01_emit.bp',
			'/effects/emitters/units/general/event/reclaim/reclaim_beam_02_emit.bp',
		},
		UnderWater = {
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_beam_u_01_emit.bp',
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_beam_u_02_emit.bp',
		},
    },
	ReclaimMuzzle01 = {
		Surface = {
			'/effects/emitters/units/general/event/reclaim/reclaim_06_glow_muzzle_emit.bp',
			'/effects/emitters/units/general/event/reclaim/reclaim_07_sparks_muzzle_emit.bp',
		},
		UnderWater = {
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_06_u_glow_muzzle_emit.bp',
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_07_u_sparks_muzzle_emit.bp',
		},
	},
    ReclaimEffects01 = {
		Surface = {
			'/effects/emitters/units/general/event/reclaim/reclaim_03_dust_emit.bp',
			'/effects/emitters/units/general/event/reclaim/reclaim_04_debris_emit.bp',
		},
		UnderWater = {
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_03_u_dust_emit.bp',
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_04_u_debris_emit.bp',
		},
    },
	ReclaimEffects02 = {
		Surface = {
			'/effects/emitters/units/general/event/reclaim/reclaim_05_plasma_emit.bp',
		},
		UnderWater = {
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_05_u_plasma_emit.bp',
		},
    },
    ReclaimObjectAOE = {
		Surface = {
			'/effects/emitters/units/general/event/reclaim/reclaim_01_sparks_emit.bp',
			'/effects/emitters/units/general/event/reclaim/reclaim_02_glow_emit.bp',
		},
		UnderWater = {
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_01_u_sparks_emit.bp',
			'/effects/emitters/units/general/event/reclaim/underwater/reclaim_02_u_glow_emit.bp',
		},
	},
    ReclaimObjectEnd = {
		Surface = {
			--'/effects/emitters/units/general/event/reclaim/reclaim_02_glow_emit.bp',
		},
		UnderWater = {
			--'/effects/emitters/units/general/event/reclaim/underwater/reclaim_02_u_glow_emit.bp',
		},
	},
	ReclaimWaterSteam = {
		'/effects/emitters/units/general/event/reclaim/underwater/reclaim_08_u_steam_emit.bp',
	},

    -----------------------------------------------------------------
    -- Build Effects
    -----------------------------------------------------------------

    -----------------------
    -- Cybran Build Effects
    -----------------------
    CybranSeaFactoryBuildEffects01 = {
		'/effects/emitters/units/cybran/ucb0003/event/build/ucb0003_build_04_endsmoke_emit.bp',
		'/effects/emitters/units/cybran/ucb0003/event/build/ucb0003_build_05_wave_emit.bp',
    },
	CybranScaffoldingEffects01 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_01_steam_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_02_sparks_emit.bp',
	},
	CybranScaffoldingEffects02 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_03_glow_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_04_sparks_emit.bp',
	},
	CybranScaffoldingEffects03 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_05_nodeglow_emit.bp',
	},
	CybranScaffoldingEffects04 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_06_largesmoke_emit.bp',
	},
	CybranScaffoldingEffects05 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_07_ring_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_19_centerring_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_20_centercore_emit.bp',
	},
	CybranScaffoldingEffects06 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_08_glow_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_09_electricity_emit.bp',
	},
	CybranScaffoldingEffects07 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_11_endsmoke_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_12_endglow_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_13_endelectricity_emit.bp',
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_14_enddebris_emit.bp',
	},
	CybranScaffoldingEffects08 = {
		'/effects/emitters/units/cybran/ucb0021/event/build/uub0021_e_b_15_flash_emit.bp',
	},

    ---------------------------
    -- Illuminate Build Effects
    ---------------------------
    IlluminateBuildBeams01 = {
		'/effects/emitters/units/illuminate/general/illuminate_build_beam_01_emit.bp',
		'/effects/emitters/units/illuminate/general/illuminate_build_beam_02_emit.bp',
    },
	IlluminateBuildBeams02 = {
		'/effects/emitters/units/illuminate/general/u_i_g_build_01_glow_emit.bp',
		'/effects/emitters/units/illuminate/general/u_i_g_build_02_sparks_emit.bp',
		'/effects/emitters/units/illuminate/general/u_i_g_build_03_flatglow_emit.bp',
    },
	IlluminateScaffoldingEffects01 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_01_core_emit.bp',
	},
	IlluminateScaffoldingEffects02 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_03_glow_emit.bp',
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_04_plasma_emit.bp',
	},
	IlluminateScaffoldingEffects03 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_10_flatring_emit.bp',
	},
	IlluminateScaffoldingEffects04 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_06_ring_emit.bp',
	},
	IlluminateScaffoldingEffects05 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_07_godrays_emit.bp',
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_08_singleray_emit.bp',
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_09_upwardlines_emit.bp',
	},
	IlluminateScaffoldingEffects06 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_03_glow_emit.bp',
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_12_wisptrail_emit.bp',
	},
	IlluminateScaffoldingEffects07 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_02_wisps_emit.bp',
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_05_largewisps_emit.bp',
	},
	IlluminateScaffoldingEffects08 = {
		'/effects/emitters/units/illuminate/uib0021/event/build/illuminate_uib0021_14_endcore_emit.bp',
	},

	--------------------
    -- UEF Build Effects
    --------------------
	UEFLandFactoryBuildEffects01 = {
		'/effects/emitters/units/uef/uub0001/event/build/uef_landfactory_02_smoke_emit.bp',
		'/effects/emitters/units/uef/uub0001/event/build/uef_landfactory_03_sparks_emit.bp',
    },
    UEFAirFactoryBuildEffects01 = {
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_01_smokeplume_emit.bp',
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_02_smoke_emit.bp',
    },
    UEFAirFactoryBuildEffects02 = {
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_03_steam_emit.bp',
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_04_sparks_emit.bp',
    },
    UEFAirFactoryBuildEffects03 = {
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_05_steam_emit.bp',
		'/effects/emitters/units/uef/uub0002/event/build/uef_airfactory_06_sparks_emit.bp',
    },
	UEFSeaFactoryBuildEffects01 = {
		'/effects/emitters/units/uef/uub0003/build/uef_seafactory_01_splash_emit.bp',
		'/effects/emitters/units/uef/uub0003/build/uef_seafactory_02_ripple_emit.bp',
		'/effects/emitters/units/uef/uub0003/build/uef_seafactory_03_steam_emit.bp',
		'/effects/emitters/units/uef/uub0003/build/uef_seafactory_04_sparks_emit.bp',
    },
    UEFExperimentalFactoryBuildEffects01 = {
		'/effects/emitters/units/uef/uub0011/event/build/uef_expfactory_01_smoke_emit.bp',
    },
    UEFScaffoldingEffects01 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam1_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam2_emit.bp',
	},
	UEFScaffoldingEffects02 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam3_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam4_emit.bp',
	},
	UEFScaffoldingEffects03 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam5_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_01_steam6_emit.bp',
	},
	UEFScaffoldingEffects04 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_16_armglow_emit.bp',
	},
	UEFScaffoldingEffects05 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_17_flatglow_emit.bp',
	},
	UEFScaffoldingEffects06 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_08_water_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_10_waterstream_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_11_spray_emit.bp',
	},
	UEFScaffoldingEffects07 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_09_largesteam_emit.bp',
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_13_largesplash_emit.bp',
	},
	UEFScaffoldingEffects08 = {
		'/effects/emitters/units/uef/uub0021/event/build/uub0021_e_b_07_largesmoke_emit.bp',
	},
	--------------------
    -- Water Scaffolding Build Effects
    --------------------
	WaterScaffoldingBuildEffects01 = {
		'/effects/emitters/units/general/event/build/water/u_g_evt_b_w_01_mist_emit.bp',
		'/effects/emitters/units/general/event/build/water/u_g_evt_b_w_02_shockwave_emit.bp',
		'/effects/emitters/units/general/event/build/water/u_g_evt_b_w_03_surfacewater_emit.bp',
		'/effects/emitters/units/general/event/build/water/u_g_evt_b_w_04_surfacewater_emit.bp',
    },
    -----------------------------------------------------------------
    -- Upgrade Effects
    -----------------------------------------------------------------
    UpgradeUnitAmbient = {
        '/effects/emitters/ambient/units/unit_upgrade_ambient_01_emit.bp',
        '/effects/emitters/ambient/units/unit_upgrade_ambient_02_emit.bp',
    },
    UpgradeBoneAmbient = {
        '/effects/emitters/ambient/units/unit_upgrade_bone_ambient_01_emit.bp',
    },

    -----------------------------------------------------------------
    -- Half-baked shutdown ambient Effects
    -----------------------------------------------------------------
    HalfBakedShutdownAmbients = {
		'/effects/emitters/units/general/event/halfbaked/halfbaked_electricity_01_emit.bp',
		'/effects/emitters/units/general/event/halfbaked/halfbaked_electricity_02_emit.bp',
    },
    HalfBakedShutdownAmbients02 = {
		'/effects/emitters/units/general/event/halfbaked/halfbaked_electricity_03_emit.bp',
		'/effects/emitters/units/general/event/halfbaked/halfbaked_electricity_04_emit.bp',
    },
    HalfBakedStunEffect = {
		'/effects/emitters/units/general/event/halfbaked/halfbaked_smokering_05_emit.bp',
		'/effects/emitters/units/general/event/halfbaked/halfbaked_flatflash_06_emit.bp',
		'/effects/emitters/units/general/event/halfbaked/halfbaked_electricityring_07_emit.bp',
    },

	-----------------------------------------------------------------
    -- ACU Overcharge Activation Effects
    -----------------------------------------------------------------
    OverchargeActivateEffect01 = {
		'/effects/emitters/units/general/event/overcharge/u_g_e_oc_01_flash_emit.bp',
		'/effects/emitters/units/general/event/overcharge/u_g_e_oc_02_energy_emit.bp',
		'/effects/emitters/units/general/event/overcharge/u_g_e_oc_03_distort_emit.bp',
		'/effects/emitters/units/general/event/overcharge/u_g_e_oc_04_lightenergy_emit.bp',
		'/effects/emitters/units/general/event/overcharge/u_g_e_oc_05_ring_emit.bp',
    },

    -----------------------------------------------------------------
    -- Power Detonate Effects
    -----------------------------------------------------------------
    PowerDetonateEffectsSmall01 = {
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_01_flashflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_02_ring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_03_ringflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_04_dustgroundring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_05_groundlines_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_06_glow_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/small/general_evt_p_s_07_electricity_emit.bp',
    },
    PowerDetonateEffectsMedium01 = {
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_01_flashflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_02_ring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_03_ringflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_04_dustgroundring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_05_groundlines_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_06_glow_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/medium/general_evt_p_m_07_electricity_emit.bp',
    },
    PowerDetonateEffectsLarge01 = {
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_01_flashflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_02_ring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_03_ringflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_04_dustgroundring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_05_groundlines_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_06_glow_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/large/general_evt_p_l_07_electricity_emit.bp',
    },
    PowerDetonateEffectsExtraLarge01 = {
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_01_flashflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_02_ring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_03_ringflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_04_dustgroundring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_05_groundlines_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_06_glow_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xlarge/general_evt_p_xl_07_electricity_emit.bp',
    },
    PowerDetonateEffectsExtraLarge02 = {
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_01_flashflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_02_ring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_03_ringflat_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_04_dustgroundring_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_05_groundlines_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_06_glow_emit.bp',
		'/effects/emitters/units/cybran/general/event/powerdetonate01/xxlarge/general_evt_p_xxl_07_electricity_emit.bp',
    },

    -----------------------------------------------------------------
    -- Teleport effects
    -----------------------------------------------------------------
    UnitTeleportSteam01 = {
        '/effects/emitters/ambient/units/teleport_commander_mist_01_emit.bp',
    },
    CommanderTeleport01 = {
        '/effects/emitters/ambient/units/teleport_ring_01_emit.bp',
        '/effects/emitters/ambient/units/teleport_rising_mist_01_emit.bp',
        '/effects/emitters/ambient/units/commander_teleport_01_emit.bp',
        '/effects/emitters/ambient/units/commander_teleport_02_emit.bp',
    },
    SC2ProtoUnitUpgrade = {
        '/effects/emitters/ambient/units/_upgrade_01_emit.bp',
    },
    CloudFlareEffects01 = {
        '/effects/emitters/ambient/impact/quantum_warhead_02_emit.bp',
        '/effects/emitters/ambient/impact/quantum_warhead_04_emit.bp',
    },
    GenericTeleportOut01 = {
		'/effects/emitters/ambient/units/teleport/generic_teleportout_01_glow_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportout_02_flatglow_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportout_03_sparkle_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportout_04_line_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportout_05_ring_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportout_06_refraction_emit.bp',
    },
    GenericTeleportIn01 = {
		'/effects/emitters/ambient/units/teleport/generic_teleportin_01_glow_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportin_02_flatglow_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportin_03_sparkle_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportin_04_line_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportin_05_ring_emit.bp',
		'/effects/emitters/ambient/units/teleport/generic_teleportin_06_refraction_emit.bp',
    },
    Teleport01 = {
        Small = {
            '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_01_glow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_02_flatglow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_03_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_04_energy_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_05_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_06_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_07_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_08_bright_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_09_line_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_10_shockwave_emit.bp',
		    '/effects/emitters/ambient/units/teleport/small/ambient_u_t_sml_12_inward_emit.bp',
        },
        Medium = {
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_01_glow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_02_flatglow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_03_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_04_energy_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_05_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_06_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_07_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_08_bright_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_09_line_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_10_shockwave_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_11_distort_emit.bp',
		    '/effects/emitters/ambient/units/teleport/medium/ambient_u_t_med_12_inward_emit.bp',
		},
		Large = {
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_01_glow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_02_flatglow_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_03_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_04_energy_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_05_swirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_06_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_07_flatswirl_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_08_bright_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_09_line_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_10_shockwave_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_11_distort_emit.bp',
		    '/effects/emitters/ambient/units/teleport/large/ambient_u_t_lrg_12_inward_emit.bp',
        },
    },

    -----------------------------------------------------------------
    -- Unit Upgrade Effects
    -----------------------------------------------------------------
    UpgradeEffect01 = {
		'/effects/emitters/units/general/event/upgrade/general_evt_u_01_glow_emit.bp',
		'/effects/emitters/units/general/event/upgrade/general_evt_u_02_flatglow_emit.bp',
		'/effects/emitters/units/general/event/upgrade/general_evt_u_03_line_emit.bp',
		'/effects/emitters/units/general/event/upgrade/general_evt_u_04_ring_emit.bp',
		'/effects/emitters/units/general/event/upgrade/general_evt_u_05_sparkle_emit.bp',
		'/effects/emitters/units/general/event/upgrade/general_evt_u_06_ring_emit.bp',
    },

    -----------------------------------------------------------------
    -- Rogue Nanite Effects -- the lines commented out cause the 360 to shut down, so leave commented out.SoLjA 5/1/2019
    -----------------------------------------------------------------
    RogueNaniteAmbientEffect = {
		'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_01_glow_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_02_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_03_debris_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_04_sparks_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_05_wisps_emit.bp',
		--'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_06_darkspots_emit.bp',
		--'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_07_ring_emit.bp',
		--'/effects/emitters/units/illuminate/uim0002/ambient/uim0002_a_08_outerwisps_emit.bp',
    },
    RogueNaniteEniemyDeathEffect = {
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_01_flash_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_02_core_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_03_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_04_plasmalines_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_05_groundring_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_06_ring_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_07_splat_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/damage/uim0002_evt_d_d_08_singleray_emit.bp',
    },
    RogueNaniteFriendlyDeathEffect = {
		'/effects/emitters/units/illuminate/uim0002/event/death/heal/uim0002_evt_d_h_01_flash_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/heal/uim0002_evt_d_h_02_core_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/heal/uim0002_evt_d_h_04_plasmalines_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/heal/uim0002_evt_d_h_05_splat_emit.bp',
		'/effects/emitters/units/illuminate/uim0002/event/death/heal/uim0002_evt_d_h_06_singleray_emit.bp',
    },

    -----------------------------------------------------------------
    -- Default Projectile Impact Effects
    -----------------------------------------------------------------

    DefaultProjectileWaterImpact = {},

    WaterSplash01 = {
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_03_waterlines_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_04_vertwaterlines_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_06_sidemist_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_07_shockwave_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_08_watercolumn_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_10_surfacewater_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_12_fastspecks_emit.bp',
		'/effects/emitters/units/uef/water/general/event/death/u_u_w_g_evt_d_13_lingercolumn_emit.bp',
    },

    -----------------------------------------------------------------
    --  Death Claw Effects
    -----------------------------------------------------------------
    ACollossusTractorBeam01 = {
		'/effects/emitters/ambient/units/collossus_tractor_beam_01_emit.bp',             -- This is just for the colossus beam and how it will tractor beam stuff.
    },
    ACollossusTractorBeamGlow01 = {
		--'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_01_plasma_emit.bp',
		--'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_02_ring_emit.bp',
		--'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_03_glow_emit.bp',
		--'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_04_debris_emit.bp',
		--'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_05_dust_emit.bp',
	},
    ACollossusTractorBeamGlow02 = {
		'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_06_grit_emit.bp',
		'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_07_dust_emit.bp',
		'/effects/emitters/weapons/illuminate/deathclaw01/attract/w_i_dc01_a_08_debris_emit.bp',
    },
    ACollossusTractorBeamVacuum01 = {
		'/effects/emitters/ambient/units/collossus_vacuum_grab_01_emit.bp',
    },
    ACollossusTractorBeamCrush01 = {
        '/effects/emitters/ambient/units/collossus_crush_explosion_01_emit.bp',
        '/effects/emitters/ambient/units/collossus_crush_explosion_02_emit.bp',
    },

    -----------------------------------------------------------------
    -- Default ACU Escape Pod Effects
    -----------------------------------------------------------------

    UEFEscapePodEjectEffect01 = {
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_01_flash_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_02_fire_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_03_firelines_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_04_sparks_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_05_dustring_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_06_smokecloud_emit.bp',
		'/effects/emitters/units/uef/uul0001/event/escapepod/eject/uul0001_evt_e_e_07_smokelines_emit.bp',
    },
    UEFEscapePodMovementEffect01 = {
        '/effects/emitters/ambient/terrain/water_splash_ripples_ring_01_emit.bp',
        '/effects/emitters/ambient/terrain/water_splash_plume_01_emit.bp',
    },

    -----------------------------------------------------------------
    -- Lights for SCB2201
    -----------------------------------------------------------------

    SCB2201Lights01 = {
		'/effects/emitters/ambient/units/light_red_blinking_04_emit.bp',
		'/effects/emitters/ambient/units/light_red_spread_01_emit.bp',
    },

	-----------------------------------------------------------------
    -- Effects for UIX0114
    -----------------------------------------------------------------

    LoyaltyBeamMuzzle01 = {
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_01_glow_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_02_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_03_largewisps_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_04_smallglow_emit.bp',
    },
    LoyaltyBeamImpact01 = {
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_05_groundflash_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_06_sparks_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_07_plasma_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_08_plasmaflat_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_09_plasmasmoke_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_10_ring_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_11_lines_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_12_halfring_emit.bp',
		'/effects/emitters/units/illuminate/uix0114/event/capture/illuminate_uix0114_13_upwardring_emit.bp',
    },

    --------------------------------------------------------------------------
    --  UEF (TERRAN) NUKE EMITTERS
    --------------------------------------------------------------------------
    TNukeRings01 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_concussion_ring_01_emit.bp',
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_concussion_ring_02_emit.bp',
    },
    TNukeFlavorPlume01 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_smoke_trail01_emit.bp',
    },
    TNukeGroundConvectionEffects01 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_mist_01_emit.bp',
    },
    TNukeBaseEffects01 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_base03_emit.bp',
        },
    TNukeBaseEffects02 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_base05_emit.bp',
        },
    TNukeBaseEffects03 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_base06_emit.bp',
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_base07_emit.bp',
    },
    TNukeHeadEffects01 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_plume_01_emit.bp',
    },
    TNukeHeadEffects02 = {
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_head_smoke_03_emit.bp',
        '/effects/emitters/weapons/uef/nuke01/impact/nuke_head_smoke_04_emit.bp',
    },
    TNukeHeadEffects03 = {
		'/effects/emitters/weapons/uef/nuke01/impact/nuke_head_fire_01_emit.bp',
	},
    -----------------------------------------------------------------
    -- Marker Effects
    -----------------------------------------------------------------
	Marker = {
		BlinkingLight01 = {
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_01_streak_emit.bp',
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_02_glow_emit.bp',
		},
		BlinkingLight02 = {
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_05_streak_emit.bp',
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_06_glow_emit.bp',
		},
		-- C02 Map Ambient Effects
		C02Fog01 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_08_large_emit.bp',
		},
		-- C03 Map Ambient Effects
		C03Energy01 = {
			'/effects/emitters/ambient/terrain/energy/ambient_t_e_01_electricity_emit.bp',
			'/effects/emitters/ambient/terrain/energy/ambient_t_e_02_glow_emit.bp',
		},
		C03Steam01 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_01_c03_emit.bp',
		},
		C03Steam02 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_02_c03_emit.bp',
		},
	    -- I04 Map Ambient Effects
		I04Steam01 = { -- large steam at base of terraformer, near fan blade
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_01_i04_emit.bp',
		},
		I04Steam02 = { -- smaller steam outlets near the top from vents
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_02_i04_emit.bp',
		},
		-- Multi Player 201 Map Ambient Effects
		MP201Water01 = {
			'/effects/emitters/ambient/terrain/mp201/mp201_water_wash_01_emit.bp',
			'/effects/emitters/ambient/terrain/mp201/mp201_water_ripples_03_emit.bp',
		},
		MP201Water02 = {
			'/effects/emitters/ambient/terrain/mp201/mp201_water_bubbles_02_emit.bp',
			'/effects/emitters/ambient/terrain/mp201/mp201_water_ripples_03_emit.bp',
		},
		ShivaGate01 = {
			'/effects/emitters/ambient/terrain/teleport/ambient_t_t_01_ring_emit.bp',
			'/effects/emitters/ambient/terrain/teleport/ambient_t_t_02_glow_emit.bp',
		},
		SmokeCloud01 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_03_large_emit.bp',
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_04_large_emit.bp',
		},
		SmokeCloud02 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_07_medium_emit.bp',
		},
		SmokePlume01 = {
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_08_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_06_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_05_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_11_emit.bp',
		},
		SmokePlume02 = {
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_08_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_06_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_05_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_11_emit.bp',
		},
		SmokePlume03 = {
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_08_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_06_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_05_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_11_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_06_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_05_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_05_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_11_emit.bp',
		},
		SmokePlume04 = {
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_14_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_15_emit.bp',
		},
		SmokePlume05 = {
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_14_emit.bp',
			'/effects/emitters/units/general/event/death/destruction_explosion_smoke_15_emit.bp',
		},
		SmokePlume06 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_05_medium_emit.bp',
			--'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_06_medium_emit.bp',
		},
		SmokeSmall01 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_01_small_emit.bp',
		},
		SmokeMedium01 = {
			'/effects/emitters/ambient/terrain/smoke/ambient_t_smoke_02_med_emit.bp',
		},
		SparksSmall01 = {
			'/effects/emitters/ambient/terrain/sparks/ambient_t_sparks_01_small_emit.bp',
		},
		SparksMedium01 = {
			'/effects/emitters/ambient/terrain/sparks/ambient_t_sparks_02_med_emit.bp',
		},
		SteamSmall01 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_01_small_emit.bp',
		},
		SteamMedium01 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_02_med_emit.bp',
		},
		WaterfallSmall01 = {
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_01_small_emit.bp',
		},
		WaterfallMedium01 = {
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_02_med_emit.bp',
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_03_med_emit.bp',
		},
		-- U01 Map Ambient Effects
		U01Steam01 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_01_u01_emit.bp',
		},
		U01WaterfallTop01 = {
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_01_u01_emit.bp',
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_02_u01_emit.bp',
		},
		U01WaterfallBottom01 = {
			'/effects/emitters/ambient/terrain/waterfall/ambient_t_waterfall_02_u01_emit.bp',
		},
		-- U02 Map Ambient Effects
		U02FlatDust01 = { -- 70x35
			'/effects/emitters/ambient/terrain/dust/ambient_t_01_reddust_flat_emit.bp',
			'/effects/emitters/ambient/terrain/dust/ambient_t_02_reddust_bursts_emit.bp',
		},
		U02FlatDust02 = { -- 100x100
			'/effects/emitters/ambient/terrain/dust/ambient_t_05_reddust_flat_emit.bp',
		},
		U02DustBurstLine01 = { -- 70x5
			'/effects/emitters/ambient/terrain/dust/ambient_t_03_reddust_bursts_emit.bp',
		},
		U02DustBurstLine02 = { -- 70x5, no angle, straight on z axis
			'/effects/emitters/ambient/terrain/dust/ambient_t_04_reddust_bursts_emit.bp',
		},
		U02DustStream01 = { -- 70x5, no angle, straight on z axis
			'/effects/emitters/ambient/terrain/dust/ambient_t_06_reddust_stream_emit.bp',
		},
		-- U03 Map Ambient Effects
		U03SnowWisps01 = { -- 8x8x8
			'/effects/emitters/ambient/terrain/snow/ambient_t_s_01_wisps_emit.bp',
		},
		U03SnowWisps02 = { -- 40x5
			'/effects/emitters/ambient/terrain/snow/ambient_t_s_02_linewisps_emit.bp',
		},
		U03SnowWisps03 = { -- 8x8x8 faint wisps
			'/effects/emitters/ambient/terrain/snow/ambient_t_s_03_faintwisps_emit.bp',
		},
		U03SnowWisps04 = { -- 16x5x5
			'/effects/emitters/ambient/terrain/snow/ambient_t_s_04_wisps_emit.bp',
		},
		-- U04 Map Ambient Effects
		U04Steam01 = {
			'/effects/emitters/ambient/terrain/steam/ambient_t_steam_01_u04_emit.bp',
		},
		U04Light01 = {
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_03_streak_emit.bp',
			'/effects/emitters/ambient/terrain/lights/ambient_t_l_04_glow_emit.bp',
		},
	},
}