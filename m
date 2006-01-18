From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 18 Jan 2006 14:35:16 +0000
Subject: [KJ] 2.6.16-rc1-kj1
Message-Id: <20060118143516.GA25002@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87780677478265545=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============87780677478265545==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.16-rc1-kj1 is out.

http://coderock.org/kj/2.6.16-rc1-kj1/

Download it, unpack it, review it. Quite a few non-trivial patches
acuumulated there.

Changes since 2.6.15-rc5-kj1:

-8139too_remove_interruptible_sleep_on_timeout_usage.patch
	8139too was reworked with workqueue interfaces.
-affs_fix_sparse_warning.patch
	Was wrong. See -bird for correct one.
-befs_fix_sparse_warnings.patch
	Was wrong. See -bird for correct patchset.
-bond_main_c_uninitialize_static_variables_initialized_to_0.patch
	We've removed this item from TODO.
-net_sunrpc_clnt_c_remove_sleep_on_timeout_usage.patch
	Get converted to wait_event_timeout()

-arch_i386_kernel_cpu_cpufreq_cpufreq_nforce2_c_make_pll_signed.patch
-arch_i386_pci_acpi_c_use_for_each_pci_dev.patch
-double_this.patch
-drivers_net_wireless_atmel_c_audit_return_code_of_create_proc_read_entry.patch
-drivers_net_wireless_atmel_c_codingstyle_cleanup.patch
-drivers_parport_convert_to_pci_register_driver.patch
-drivers_usb_input_ati_remote_c_use_time_before_time_after.patch
-dvb_fmt_warning_fixes_for_64_bit_platforms.patch
-floppy_remove_unused_LOCAL_END_REQUEST.patch
-kernel_kprobes_c_use_kzalloc.patch
-remove_drivers_net_wan_lmc_lmc_prot_h.patch
-remove_include_asm-mips_riscos-syscall_h.patch
-security_selinux_use_array_size.patch
-sound_pci_au88x0_c_remove_unneeded_call_to_pci_dma_supported.patch
	merged
-ext3_fix_sparse_warnings.patch
-hpfs_fix_sparse_warnings.patch
	In -bird.
-proc_ipmi_root_depends_on_CONFIG_PROC_FS.patch
	merged
-space_before_n_removal.patch
	Temporarily dropped. I'm thinking to automate this.

+arch_arm_common_scoop_c_add_kern_info.patch
+arch_arm_kernel_bios32_c_add_pritnk__.patch
+arch_arm_kernel_ecard_c_use_kern__.patch
+arch_frv_kernel_setup_c_use_bug_on.patch
+bonding_fix__get_settings_error_checking.patch
+cris_fasttimer_remove_kernel_version_#ifs.patch
+cs4218_tdm_c_remove_module_parm.patch
+drivers_block_sx8_c_fix_polling_loop.patch
+drivers_block_use_array_size.patch
+drivers_cdrom_aztcd_c_remove_sleep_on.patch
+drivers_cdrom_optcd_c_remove_sleep_on.patch
+drivers_cdrom_sjcd_c_remove_sleep_on.patch
+drivers_char_dsp56k_c_fix_polling_loop.patch
+drivers_char_pcmcia_synclink_cs_c_fix_polling_loop.patch
+drivers_char_riscom8_c_switch_to_module_param.patch
+drivers_char_sonypi_c_fix_polling_loops.patch
+drivers_char_sx_c_fix_polling_loops.patch
+drivers_char_synclink_c_fix_polling_loop.patch
+drivers_char_synclinkmp_c_fix_polling_loop.patch
+drivers_char_tpm_tpm_infineon_c_fix_polling_loop.patch
+drivers_i2c___fix_polling_loops.patch
+drivers_infiniband_hw_mthca_mthca_reset_c_fix_polling_loop.patch
+drivers_input_joystick_analog_c_fix_polling_loop.patch
+drivers_isdn_hardware_eicon_debug_c_remove_min_max.patch
+drivers_isdn_hardware_eicon_io_c_remove_min_max.patch
+drivers_isdn_hysdn_boardergo_c_fix_polling_loop.patch
+drivers_media_dvb__fix_polling_loops.patch
+drivers_media_video__fix_polling_loops.patch
+drivers_message_fusion___fix_polling_loops.patch
+drivers_mtd_nand_au1550nd_c_remove_linux_version_code.patch
+drivers_net___fix_polling_loops.patch
+drivers_net_acenic_fix_eeprom_byte_error_value.patch
+drivers_net_atari_bionet_c_switch_to_module_param.patch
+drivers_net_atarilance_c_switch_to_module_param.patch
+drivers_net_cassini_c_switch_to_module_param.patch
+drivers_net_fs_enet_fs_enet_main_c_switch_to_module_param.patch
+drivers_net_irda_sir_kthread_c_remove_linux_version_code.patch
+drivers_net_irda_vlsi_ir_h_irq_retval_is_always_defined.patch
+drivers_net_irda_vlsi_ir_h_remove_linux_version_code.patch
+drivers_net_lasi_82596_c_switch_to_module_param.patch
+drivers_net_mac89x0_c_switch_to_module_param.patch
+drivers_net_mace_c_switch_to_module_param.patch
+drivers_net_meth_c_switch_to_module_param.patch
+drivers_net_ne_h8300_c_switch_to_module_param.patch
+drivers_net_ni5010_c_switch_to_module_param.patch
+drivers_net_sun3lance_c_switch_to_module_param.patch
+drivers_net_tulip_uli526x_c_switch_to_module_param.patch
+drivers_pci_hotplug___fix_polling_loops.patch
+drivers_pcmcia_cs_c_fix_polling_loops.patch
+drivers_s390_net_lcs_c_fix_polling_loop.patch
+drivers_sbus_char_bbc_i2c_c_fix_polling_loop.patch
+drivers_scsi___fix_polling_loops.patch
+drivers_serial_icom_c_fix_polling_loops.patch
+drivers_usb_media__remove_linux_version_code_checks.patch
+em28xx_i2c_remove_mod_{inc,dec}_use_count.patch
+kernel_exit_c_use_bug_on.patch
+mm_pdflush_c_use_bug_on.patch
+printk_fmt_fixes.patch
+remove_include_linux_version_h.patch
+switch_to_module_param_in_kernel_rcutorture_c.patch
+usb_fix_polling_loops.patch
+use_dma__bit_mask.patch

	KERN_* additions, LINUX_VERSION_CODE removals, MODULE_PARM
	conversions, correct polling loops, DMA_*BIT_MASK conversions, BUG_ON
	conversions, other little things.

P.S.: "ls -l" will probably mismatch with "cat series" in both directions.
quilt makes real easy to get out of sync and royal PITA to sync back. :-\


--===============87780677478265545==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87780677478265545==--
