From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 27 Sep 2012 09:43:46 +0000
Subject: [PATCH] sound: Remove unecessary semicolon
Message-Id: <1348739026-31912-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unecessary semicolon

And:
sound/drivers/vx/vx_pcm.c: Convert spaces in tab

Found by http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---

diff -u -p a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -163,7 +163,7 @@ static int opl3_get_voice(struct snd_opl
 	struct best *bp;
 
 	for (i = 0; i < END; i++) {
-		best[i].time = (unsigned int)(-1); /* XXX MAX_?INT really */;
+		best[i].time = (unsigned int)(-1); /* XXX MAX_?INT really */
 		best[i].voice = -1;
 	}
 
diff -u -p a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -184,7 +184,7 @@ static int vx_set_format(struct vx_core
 	default : 
 		snd_BUG();
 		return -EINVAL;
-        };
+	}
 
 	return vx_set_stream_format(chip, pipe, header);
 }
diff -u -p a/sound/sparc/dbri.c b/sound/sparc/dbri.c
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -592,7 +592,7 @@ static __u32 reverse_bytes(__u32 b, int
 		break;
 	default:
 		printk(KERN_ERR "DBRI reverse_bytes: unsupported length\n");
-	};
+	}
 
 	return b;
 }
diff -u -p a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -813,7 +813,7 @@ static int snd_amd7930_get_volume(struct
 	default:
 		swval = &amd->pgain;
 		break;
-	};
+	}
 
 	ucontrol->value.integer.value[0] = *swval;
 
@@ -838,7 +838,7 @@ static int snd_amd7930_put_volume(struct
 	default:
 		swval = &amd->pgain;
 		break;
-	};
+	}
 
 	spin_lock_irqsave(&amd->lock, flags);
 
diff -u -p a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -2658,7 +2658,7 @@ static int __devinit snd_card_asihpi_mix
 					hpi_ctl.dst_node_type,
 					hpi_ctl.dst_node_index);
 			continue;
-		};
+		}
 		if (err < 0)
 			return err;
 	}
diff -u -p a/sound/pci/au88x0/au88x0_game.c b/sound/pci/au88x0/au88x0_game.c
--- a/sound/pci/au88x0/au88x0_game.c
+++ b/sound/pci/au88x0/au88x0_game.c
@@ -100,7 +100,7 @@ static int __devinit vortex_gameport_reg
 	if (!gp) {
 		printk(KERN_ERR "vortex: cannot allocate memory for gameport\n");
 		return -ENOMEM;
-	};
+	}
 
 	gameport_set_name(gp, "AU88x0 Gameport");
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(vortex->pci_dev));
diff -u -p a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -585,7 +585,7 @@ static int snd_vortex_pcm_vol_put(struct
 				case 4:
 					mixin = p->mixin[i];
 					break;
-				};
+				}
 				vol = p->vol[i];
 				vortex_mix_setinputvolumebyte(vortex,
 					vortex->mixplayb[i], mixin, vol);
diff -u -p a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1310,7 +1310,7 @@ static int snd_emu10k1_capture_efx_open(
 			runtime->hw.channels_min  				runtime->hw.channels_max = 16;
 			break;
-		};
+		}
 #endif
 #if 0
 		/* For 96kHz */
diff -u -p a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -228,7 +228,7 @@ lookup_voices(struct snd_emux *emu, stru
 	int  i;
 
 	for (i = 0; i < V_END; i++) {
-		best[i].time = (unsigned int)-1; /* XXX MAX_?INT really */;
+		best[i].time = (unsigned int)-1; /* XXX MAX_?INT really */
 		best[i].voice = -1;
 	}
 
diff -u -p a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2226,7 +2226,7 @@ static int __devinit snd_intel8x0_mixer(
 		case DEVICE_INTEL_ICH4:
 			chip->spdif_idx = ICHD_SPBAR;
 			break;
-		};
+		}
 	}
 
 	chip->in_ac97_init = 1;
diff -u -p a/sound/pci/mixart/mixart_hwdep.c b/sound/pci/mixart/mixart_hwdep.c
--- a/sound/pci/mixart/mixart_hwdep.c
+++ b/sound/pci/mixart/mixart_hwdep.c
@@ -538,7 +538,7 @@ static int mixart_dsp_load(struct mixart
 
 		if ((err = snd_card_register(chip->card)) < 0)
 			return err;
-	};
+	}
 
 	snd_printdd("miXart firmware downloaded and successfully set up\n");
 
diff -u -p a/sound/oss/pss.c b/sound/oss/pss.c
--- a/sound/oss/pss.c
+++ b/sound/oss/pss.c
@@ -359,7 +359,7 @@ static int pss_download_boot(pss_confdat
 		{
 			/*_____ Send the next byte */
 			outw (*block++, REG (PSS_DATA));
-		};
+		}
 		count++;
 	}
 
diff -u -p a/sound/oss/sys_timer.c b/sound/oss/sys_timer.c
--- a/sound/oss/sys_timer.c
+++ b/sound/oss/sys_timer.c
@@ -57,7 +57,7 @@ poll_def_tmr(unsigned long dummy)
 		  {
 			  def_tmr.expires = (1) + jiffies;
 			  add_timer(&def_tmr);
-		  };
+		  }
 
 		  if (tmr_running)
 		    {
@@ -103,7 +103,7 @@ def_tmr_open(int dev, int mode)
 	{
 		def_tmr.expires = (1) + jiffies;
 		add_timer(&def_tmr);
-	};
+	}
 
 	return 0;
 }
diff -u -p a/sound/oss/sb_ess.c b/sound/oss/sb_ess.c
--- a/sound/oss/sb_ess.c
+++ b/sound/oss/sb_ess.c
@@ -1104,15 +1104,15 @@ int ess_init(sb_devc * devc, struct addr
 		default:
 			printk (KERN_ERR "Invalid esstype=%d specified\n", devc->sbmo.esstype);
 			return 0;
-		};
+		}
 		if (submodel != -1) {
 			devc->submodel = submodel;
 			sprintf (modelname, "ES%d", devc->sbmo.esstype);
 			chip = modelname;
-		};
+		}
 		if (chip = NULL && (ess_minor & 0x0f) < 8) {
 			chip = "ES688";
-		};
+		}
 #ifdef FKS_TEST
 FKS_test (devc);
 #endif
@@ -1122,7 +1122,7 @@ FKS_test (devc);
 		 */
 		if (chip = NULL && devc->sbmo.esstype = ESSTYPE_LIKE20) {
 			chip = "ES1688";
-		};
+		}
 
 		if (chip = NULL) {
 			int type;
@@ -1150,8 +1150,8 @@ FKS_test (devc);
 				if ((type & 0x00ff) != ((type >> 8) & 0x00ff)) {
 					printk ("ess_init: Unrecognized %04x\n", type);
 				}
-			};
-		};
+			}
+		}
 #if 0
 		/*
 		 * this one failed:
@@ -1182,10 +1182,10 @@ FKS_test (devc);
 				chip = "ES1788";
 				devc->submodel = SUBMDL_ES1788;
 			}
-		};
+		}
 		if (chip = NULL) {
 			chip = "ES1688";
-		};
+		}
 
 	    printk ( KERN_INFO "ESS chip %s %s%s\n"
                , chip
@@ -1293,7 +1293,7 @@ printk(KERN_INFO "ess_set_dma_hw: dma8=%
 			default:
 				printk(KERN_ERR "ESS1887: Invalid DMA16 %d\n", dma);
 				return 0;
-			};
+			}
 			ess_chgmixer (devc, 0x78, 0x20, dma16_bits);
 			ess_chgmixer (devc, 0x7d, 0x07, dma_bits);
 		}
@@ -1584,7 +1584,7 @@ printk(KERN_INFO "FKS: write mixer %x: %
 		udelay(20);
 		outb(((unsigned char) (value & 0xff)), MIXER_DATA);
 		udelay(20);
-	};
+	}
 	spin_unlock_irqrestore(&devc->lock, flags);
 }
 
@@ -1761,7 +1761,7 @@ int ess_mixer_reset (sb_devc * devc)
 			ess_chgmixer(devc, 0x7a, 0x18, 0x08);
 			ess_chgmixer(devc, 0x1c, 0x07, 0x07);
 			break;
-		};
+		}
 		/*
 		 * Call set_recmask for proper initialization
 		 */
diff -u -p a/sound/oss/opl3.c b/sound/oss/opl3.c
--- a/sound/oss/opl3.c
+++ b/sound/oss/opl3.c
@@ -1190,7 +1190,7 @@ static int opl3_init(int ioaddr, struct
 
 		for (i = 0; i < 18; i++)
 			pv_map[i].ioaddr = devc->left_io;
-	};
+	}
 	conf_printf2(devc->fm_info.name, ioaddr, 0, -1, -1);
 
 	for (i = 0; i < SBFM_MAXINSTR; i++)
diff -u -p a/sound/oss/uart6850.c b/sound/oss/uart6850.c
--- a/sound/oss/uart6850.c
+++ b/sound/oss/uart6850.c
@@ -146,7 +146,7 @@ static int uart6850_open(int dev, int mo
 	{
 /*		  printk("Midi6850: Midi busy\n");*/
 		  return -EBUSY;
-	};
+	}
 
 	uart6850_cmd(UART_RESET);
 	uart6850_input_loop();
diff -u -p a/sound/oss/sb_mixer.c b/sound/oss/sb_mixer.c
--- a/sound/oss/sb_mixer.c
+++ b/sound/oss/sb_mixer.c
@@ -410,7 +410,7 @@ static int set_recmask(sb_devc * devc, i
 		case MDL_SMW:
 			if (devc->model = MDL_ESS && ess_set_recmask (devc, &devmask)) {
 				break;
-			};
+			}
 			if (devmask != SOUND_MASK_MIC &&
 				devmask != SOUND_MASK_LINE &&
 				devmask != SOUND_MASK_CD)
@@ -666,7 +666,7 @@ static void sb_mixer_reset(sb_devc * dev
 
 	if (devc->model != MDL_ESS || !ess_mixer_reset (devc)) {
 		set_recmask(devc, SOUND_MASK_MIC);
-	};
+	}
 }
 
 int sb_mixer_init(sb_devc * devc, struct module *owner)
diff -u -p a/sound/oss/audio.c b/sound/oss/audio.c
--- a/sound/oss/audio.c
+++ b/sound/oss/audio.c
@@ -354,7 +354,7 @@ int audio_read(int dev, struct file *fil
 
 			if(copy_to_user(&(buf)[p], fixit, l))
 				return -EFAULT;
-		};
+		}
 
 		DMAbuf_rmchars(dev, buf_no, l);
 
diff -u -p a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -538,7 +538,7 @@ munge_int32 (unsigned int src,
 	                            /* Note: we leave the upper bits in place */ 
 
 		dst++;
- 	};
+	}
 	return dst;
 };
 
diff -u -p a/sound/isa/sb/emu8000_callback.c b/sound/isa/sb/emu8000_callback.c
--- a/sound/isa/sb/emu8000_callback.c
+++ b/sound/isa/sb/emu8000_callback.c
@@ -175,7 +175,7 @@ get_voice(struct snd_emux *emu, struct s
 	hw = emu->hw;
 
 	for (i = 0; i < END; i++) {
-		best[i].time = (unsigned int)(-1); /* XXX MAX_?INT really */;
+		best[i].time = (unsigned int)(-1); /* XXX MAX_?INT really */
 		best[i].voice = -1;
 	}
 

