From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 05 Dec 2005 15:27:17 +0000
Subject: [KJ] 2.6.15-rc5-kj1
Message-Id: <20051205152717.GA6641@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79311328318927687=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============79311328318927687==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.15-rc5-kj1 is out. You can get it from
http://coderock.org/kj/2.6.15-rc5-kj1/

I'm sure I forgot something.

Merged
------
dont_concatenate___FUNCTION___with_strings.patch
alim15x3_replace_pci_find_device_with_pci_dev_present.patch
reiserfs_vfree_checking_cleanup.patch
cs5520_fix_return_value_of_cs5520_init_one.patch
mips_bcm1250_tbprof_c_remove_interruptible_sleep_on_usage.patch
drivers_ide_convert_to_pci_register_driver.patch
drivers_video_add_KERN__constants.patch
	savagefb chunks
drivers_net_use_DMA_64_32BIT_MASK.patch
	merged chunks
drivers_scsi_use_DMA_32BIT_MASK.patch
	aacraid chunks
ixgb_ethtool_c_replace_schedule_timeout_with_msleep_interruptible.patch
fs_reiserfs_fix_node_c_fix_sparse_warnings___nocast_type.patch
ll_rw_blk_c_fix_sparse_warnings.patch
deadline_iosched_fix_sparse_warnings___nocast_type.patch
cfq_iosched_fix_sparse_warnings___nocast_type.patch
as_iosched_fix_sparse_warnings___nocast_type.patch
dm_crypt_fix_nocast_type_warnings.patch
parisc_pci_dma_c_audit_return_code_of_create_proc_read_entry.patch
vgastate_c_remove_unnecessary_calls_to_init_module_and_cleanup_module.patch
ntfs_fmt_warning_fix_for_64_bit_platforms.patch
dvb_fmt_warning_fixes_for_64_bit_platforms.patch
	1/2
pktcdvd_remove_unused_variable.patch
Documentation_early_userspace_README_s_Youre_Your_.patch
kernel_timer_c_use_KERN_WARNING.patch

Dropped
-------
remove_include_asm_mips_mach_au1x00_au1100_mmc_h.patch
remove_include_asm_mips_mipsprom_h.patch
agp_backend_vfree_checking_cleanup.patch
mtd_remove_compatmac_h.patch
specialix_check_region_request_region_related_cleanups.patch

New
---
arch_i386_kernel_cpu_cpufreq_cpufreq_nforce2_c_make_pll_signed.patch
	added
drivers_atm_firestream_c_convert_interruptible_sleep_on.patch
drivers_atm_nicstar_c_replace_interruptible_sleep_on_timeout.patch
drivers_block_swim_iop_c_replace_interruptible_sleep_on.patch
drivers_char_amiserial_c_replace_interruptible_sleep_on.patch
drivers_char_cyclades_c_replace_interruptible_sleep_on.patch
drivers_char_epca_c_replace_interruptible_sleep_on.patch
drivers_char_esp_c_replace_interruptible_sleep_on.patch
drivers_char_generic_serial_c_replace_interruptible_sleep_on.patch
drivers_char_isicom_c_replace_interruptible_sleep_on.patch
drivers_char_istallion_c_replace_interruptible_sleep_on.patch
drivers_char_moxa_c_replace_interruptible_sleep_on.patch
drivers_char_pcmcia_synclink_cs_c_replace_interruptible_sleep_on.patch
drivers_char_riscom8_c_replace_interruptible_sleep_on.patch
drivers_char_rocket_c_replace_interruptible_sleep_on.patch
drivers_char_serial167_c_replace_interruptible_sleep_on.patch
drivers_char_specialix_c_replace_interruptible_sleep_on.patch
drivers_char_stallion_c_replace_interruptible_sleep_on.patch
drivers_char_synclink_c_replace_interruptible_sleep_on.patch
drivers_char_synclinkmp_c_replace_interruptible_sleep_on.patch
drivers_isdn_i4l_isdn_tty_c_replace_interruptible_sleep_on.patch
drivers_media_radio_radio_cadet_c_replace_interruptible_sleep_on.patch
	added
drivers_ide_ide-tape_c_use_time_after_time_after_eq.patch
	added
drivers_macintosh_apm_emu_c_audit_misc_register_return_value.patch
	added
kernel_kprobes_c_use_kzalloc.patch
	added
security_selinux_use_array_size.patch
	added
sound_pci_au88x0_c_remove_unneeded_call_to_pci_dma_supported.patch
	added


--===============79311328318927687==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79311328318927687==--
