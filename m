From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 15 Aug 2004 13:55:44 +0000
Subject: Re: [Kernel-janitors] [announce] 2.6.8.1-kjt1
Message-Id: <20040815135544.GI1799@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51334500615047829=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815121713.GE1799@stro.at>
In-Reply-To: <20040815121713.GE1799@stro.at>
To: kernel-janitors@vger.kernel.org

--===============51334500615047829==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

forgot to send a list of all patches,
some are already in other trees on the way to linus
namely 6 list_for_each touching pci and usb, remove-old-ifdefs-eepro100

next kjt can be expected soon in order not to get such a big backlog,
due to a nice surf trip :)
latest to go in was from domen list_for_each_entry regarding fs/dcache
newer patches will be considered automaticly, again please bug me
if i've overseen a patch in that incredible patch storm!

all patches:
add-msleep_interruptible.patch
extraver.patch
fix-check_region-esp.patch
kernel-doc_sgml.patch
kernel_thread-i2o_core.patch
list-for-each-entry-drivers_atm_he.patch
list-for-each-entry-drivers_chan_kern.patch
list-for-each-entry-drivers_macintosh_via-pmu.patch
list-for-each-entry-drivers_net_ppp_generic.patch
list-for-each-entry-drivers_usb_class_audio.patch
list-for-each-entry-drivers_usb_class_usb-midi.patch
list-for-each-entry-drivers_usb_core_devices.patch
list-for-each-entry-drivers_usb_host_uhci-hcd.patch
list-for-each-entry-drivers_usb_media_dabusb.patch
list-for-each-entry-fs_jffs_intrep.patch
list-for-each-entry-fs_namespace.patch
list-for-each-entry-safe-arch_i386_mm_pageattr.patch
list-for-each-entry-safe-drivers_usb_host_hc_sl811.patch
list-for-each-entry-safe-drivers_usb_serial_ipaq.patch
list-for-each-entry-safe-fs_coda_psdev.patch
list-for-each-entry-safe-fs_dquot.patch
list-for-each-entry-sound_core_memory.patch
list-for-each-fs_dcache.patch
list_for_each-i386pci-common.patch
list_for_each-i386pci-pcbios.patch
list_for_each-pci-setup-bus.patch
list_for_each-pcmcia-rsrc_mgr.patch
list_for_each-usb-audio.patch
list_for_each-usb-core-devices.patch
list_for_each-usb-midi.patch
macros-correct-comments-net-appletalk.patch
min-max-char_amiserial.patch
min-max-char_epca.patch
min-max-char_esp.patch
min-max-char_isicom.patch
min-max-char_mxser.patch
min-max-char_pcmcia_synclink_cs.patch
min-max-char_pcxx.patch
min-max-char_riscom8.patch
min-max-char_rocket.patch
min-max-char_rocket_int.h.patch
min-max-char_selection.patch
min-max-char_serial167.patch
min-max-char_specialix.patch
min-max-char_synclink.patch
min-max-char_synclinkmp.patch
min-max-ide_ide-timing.h.patch
min-max-linux_isicom.h.patch
min-max-tc_zs.patch
msleep-drivers_atm_firestream.patch
msleep-drivers_atm_he.patch
msleep-drivers_block_cciss.patch
msleep-drivers_block_nbd.patch
msleep-drivers_block_paride_pcd.patch
msleep-drivers_block_paride_pf.patch
msleep-drivers_block_paride_pg.patch
msleep-drivers_block_paride_pt.patch
msleep-drivers_block_xd.patch
msleep-drivers_cdrom_cdu31a.patch
msleep-drivers_cdrom_mcd.patch
msleep-drivers_char_agp_sis-agp.patch
msleep-drivers_char_ds1620.patch
msleep-drivers_char_dsp56k.patch
msleep-drivers_char_ec3104_keyb.patch
msleep-drivers_char_hvc_console.patch
msleep-drivers_char_isicom.patch
msleep-drivers_char_nwflash.patch
msleep-drivers_char_watchdog_pcwd.patch
msleep-drivers_ide_ide-cd.patch
msleep-drivers_ide_ide-tape.patch
msleep-drivers_ide_legacy_ide-cs.patch
msleep-drivers_ieee1394_sbp2.patch
msleep-drivers_isdn_hisax_config.patch
msleep-drivers_isdn_hisax_elsa.patch
msleep-drivers_isdn_hisax_hfc_pci.patch
msleep-drivers_isdn_hisax_hfc_sx.patch
msleep-drivers_isdn_hisax_hfcscard.patch
msleep-drivers_isdn_hysdn_boardergo.patch
msleep-drivers_isdn_hysdn_sched.patch
msleep-drivers_isdn_i4l_isdn_tty.patch
msleep-drivers_isdn_icn.patch
msleep-drivers_isdn_sc_init.patch
msleep-drivers_media_common_saa7146_i2c.patch
msleep-drivers_media_dvb_b2c2_skystar2.patch
msleep-drivers_media_dvb_dvb-core_dvb_ca_en50221.patch
msleep-drivers_media_dvb_dvb-core_dvb_frontend.patch
msleep-drivers_media_dvb_dvb-core_dvb_functions.patch
msleep-drivers_media_dvb_frontends_alps_tdmb7.patch
msleep-drivers_media_dvb_frontends_at76c651.patch
msleep-drivers_media_dvb_frontends_cs24110.patch
msleep-drivers_media_dvb_frontends_dst.patch
msleep-drivers_media_dvb_frontends_grundig_29504-401.patch
msleep-drivers_media_dvb_frontends_grundig_29504-491.patch
msleep-drivers_media_dvb_frontends_stv0299.patch
msleep-drivers_media_dvb_frontends_tda1004x.patch
msleep-drivers_media_dvb_frontends_ves1820.patch
msleep-drivers_media_dvb_frontends_ves1x93.patch
msleep-drivers_media_dvb_ttpci_av7110.patch
msleep-drivers_media_dvb_ttpci_av7110_hw.patch
msleep-drivers_media_dvb_ttpci_av7110_v4l.patch
msleep-drivers_media_dvb_ttpci_budget-av.patch
msleep-drivers_media_dvb_ttpci_budget-ci.patch
msleep-drivers_media_dvb_ttpci_budget.patch
msleep-drivers_media_radio-aimslab.patch
msleep-drivers_media_radio-cadet.patch
msleep-drivers_media_radio-maestro.patch
msleep-drivers_media_radio-maxiradio.patch
msleep-drivers_media_radio-miropcm20-rds.patch
msleep-drivers_media_radio-sf16fmi.patch
msleep-drivers_media_radio-sf16fmr2.patch
msleep-drivers_media_radio-zoltrix.patch
msleep-drivers_media_video_bttv-driver.patch
msleep-drivers_media_video_bw-qcam.patch
msleep-drivers_media_video_c-qcam.patch
msleep-drivers_media_video_cx88-video.patch
msleep-drivers_media_video_msp3400.patch
msleep-drivers_media_video_planb.patch
msleep-drivers_media_video_sa7134-core.patch
msleep-drivers_media_video_sa7134-ts.patch
msleep-drivers_media_video_sa7134_saa6752hs.patch
msleep-drivers_media_video_zoran_device.patch
msleep-drivers_media_video_zoran_driver.patch
msleep-drivers_media_video_zr26120.patch
msleep-drivers_message_fusion_mptscsih.patch
msleep-drivers_message_i2o_i2o_block.patch
msleep-drivers_message_i2o_i2o_core.patch
msleep-drivers_mtd_chips_cfi_cmdset_0001.patch
msleep-drivers_net_3c505.patch
msleep-drivers_net_appletalk_ltpc.patch
msleep-drivers_net_cs89x0.patch
msleep-drivers_net_e100.patch
msleep-drivers_net_e1000_osdep.patch
msleep-drivers_net_ewrk3.patch
msleep-drivers_net_gt96100eth.patch
msleep-drivers_net_irda_act200l-sir.patch
msleep-drivers_net_irda_irtty-sir.patch
msleep-drivers_net_irda_ma600-sir.patch
msleep-drivers_net_irda_sir_dev.patch
msleep-drivers_net_irda_tekram-sir.patch
msleep-drivers_net_ixgb_osdep.patch
msleep-drivers_net_max89x0.patch
msleep-drivers_net_ni65.patch
msleep-drivers_net_ns83820.patch
msleep-drivers_net_s2io.patch
msleep-drivers_net_slip.patch
msleep-drivers_net_tokenring_ibmtr.patch
msleep-drivers_net_tulip_de2104x.patch
msleep-drivers_net_wan_cosa.patch
msleep-drivers_net_wan_cycx_drv.patch
msleep-drivers_net_wireless_airo.patch
msleep-drivers_net_wireless_airport.patch
msleep-drivers_net_wireless_prism54_islpci_dev.patch
msleep-drivers_parport_ieee1284_ops.patch
msleep-drivers_pcmcia_cs.patch
msleep-drivers_pcmcia_ds.patch
msleep-drivers_pcmcia_i82365.patch
msleep-drivers_pcmcia_sa1100_h3600.patch
msleep-drivers_scsi_eta_pio.patch
msleep-drivers_scsi_ipr.patch
msleep-drivers_scsi_mesh.patch
msleep-drivers_scsi_osst.patch
msleep-drivers_scsi_qla2xxx_qla_init.patch
msleep-drivers_scsi_qla2xxx_qla_os.patch
msleep-drivers_scsi_sata_promise.patch
msleep-drivers_scsi_sata_sx4.patch
msleep-drivers_scsi_sd.patch
msleep-drivers_scsi_wd7000.patch
msleep-drivers_serial_pmac_zilog.patch
msleep-drivers_serial_serial_core.patch
pr_debug-drivers_block_umem.patch
pr_debug-drivers_isdn_tpam.patch
pr_debug-i386_kernel_microcode.patch
printk-net_wireless_prism54_islpci_mgt.h.patch
remove-old-ifdefs-aic79xx.patch
remove-old-ifdefs-aic79xx_core.patch
remove-old-ifdefs-aic79xx_inline.patch
remove-old-ifdefs-aic79xx_osm.c.patch
remove-old-ifdefs-aic79xx_osm.h.patch
remove-old-ifdefs-aic79xx_osm_pci.patch
remove-old-ifdefs-aic7xxx-cam.patch
remove-old-ifdefs-aic7xxx.patch
remove-old-ifdefs-aic7xxx_core.patch
remove-old-ifdefs-aic7xxx_osm.c.patch
remove-old-ifdefs-aic7xxx_osm.h.patch
remove-old-ifdefs-aic7xxx_osm_pci.patch
remove-old-ifdefs-cpqarray.patch
remove-old-ifdefs-dmascc.patch
remove-old-ifdefs-eepro100.patch
remove-old-ifdefs-fasttimer.patch
remove-unused-include-drivers_media_videocodec.patch
set-current-state-drivers_usb_media_dabusb.patch
set-current-state-drivers_usb_misc_tiglusb.patch
set-current-state-net_wan_farsync.patch
static-bsd_comp.patch
static-ppp_deflate.patch
use-msecs-to-jiffies-drivers_char_synclink.patch
use-msecs-to-jiffies-drivers_macintosh_mediabay.patch
use-msecs-to-jiffies-drivers_video_aty_radeon_base.patch
use-msecs-to-jiffies-drivers_video_aty_radeonfb.patch
use-msecs-to-jiffies-isdn_sc_card.patch
use-msecs-to-jiffies-pcmcia_synclink_cs.patch
use-msecs-to-jiffies-pcmcia_synclinkmp.patch


--===============51334500615047829==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51334500615047829==--
