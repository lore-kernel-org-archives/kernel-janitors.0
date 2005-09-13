From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 13 Sep 2005 14:50:10 +0000
Subject: [KJ] 2.6.14-rc1-kj1
Message-Id: <20050913145010.GA12861@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6124155223975678=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============6124155223975678==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.14-rc1-kj1 patchset is out. You can grab it from
http://coderock.org/kj/2.6.14-rc1-kj1/

Full shortlog is at
http://coderock.org/kj/2.6.14-rc1-kj1/shortlog

Changes since 2.6.13-git4-kj1:

New
---

Christophe Lucas:
  arch/alpha/kernel/*: use KERN_*

Jim Cromie:
  Documentation/early-userspace/README: s/Youre/Your/

Tobias Klauser:
  i386: reboot.c: replace custom macro with isdigit()

Dropped
-------

drivers_parport___use_msleep_interruptible.patch
cciss_use_msleep.patch
smbfs_replace_schedule_timeout_with_msleep.patch
lockd_replace_schedule_timeout_with_msleep_interruptible.patch
drivers_char_ip2_i2lib_c_use_set_current_state.patch
sunrpc_replace_schedule_timeout_with_msleep.patch

	These wanted to convert code to msleep(), but
	schedule_timeout_interruptible() went in. Don't know if
	something should be done again.

pf_replace_pf_sleep_with_msleep.patch
pcd_use_msleep_ssleep.patch
pt_replace_pt_sleep_with_msleep_ssleep.patch
pg_replace_pg_sleep_with_msleep.patch

	Same story, except that wrappers around
	schedule_timeout_interruptible() are left.

fs_eventpoll_c_fix_gcc4_warning.patch
fs_cifs_asn1_c_fix_gcc4_warning.patch
ext3_fix_misleading_gcc4_warning_size_may_be_used_uninitialized.patch

	IIRC, these warnings were with pre 4.0.0 snapshots. 4.0.0,
	4.0.1, 4.1-20050522, 4.1-20050604, 4.1-20050702, 4.1-20050730,
	4.1-20050819, 4.1-20050909 don't warn.

Merged
------
meye_use_DMA_32BIT_MASK.patch
cypress_m8_c_CodingStyle_cleanup.patch
drivers_serial_usb_serial_c_remove_unneeded_casts.patch
xfs_fix_nocast_type_warnings.patch
qla_xxx_use_msleep___interruptible__instead_of_schedule_timeout.patch
sysfs_txt_use_snprintf_and_strnlen.patch
sysfs_txt_fix_whitespace_after_comma_between_parameters.patch
sysfs_txt_use_S_IRUSR_|_____instead_of_0644.patch
ldusb_fmt_warnings_fixes_for_64_bit_platforms.patch
dvb_ttusb_budget_use_time_after_eq_macro.patch
ide-timing.h_use_min_max_macros.patch
ppp_generic_make_code_more_readable_with_list_for_each.patch
jffs_make_code_more_readable_with_list_for_each_entry.patch
fs___make_code_more_readable_with_list_for_each_{entry,safe}.patch
drivers_ide___replace_schedule_timeout_with_msleep.patch
umem_use_pr_debug.patch
de4x5_make_code_more_readable_with_list_for_each.patch
arch_sh___remove_MAX.patch
drivers_block_xd_c_use_msleep_msleep_interruptible.patch
ieee1284_use_human_time_units_in_sleeping_logic.patch
sb16_csp_remove_home-grown_le_to_cpu_macros.patch
sb16_csp_untypedef.patch
apllicom_audit_return_codes_of_misc_register.patch
hdpu_cpustate_c_audit_return_codes.patch
lcd_audit_return_code_of_misc_register.patch
n_tty_c_fix_sparse_warnings___nocast_type.patch
Documentation____spelling_fixes.patch
mm_swap_state_c_fix_nocast_type_warnings.patch
lib_radix_tree_c_fix_nocast_type_warnings.patch
drivers_base_dmapool_c_fix_nocast_type_warnings.patch
ixj_use_msleep_instead_of_schedule_timeout.patch
i386_smpboot_c_use_msleep_instead_of_schedule_timeout.patch
lp_use_time_after_macro.patch
REPORTING_BUGS_spelling_and_whitespace_fixes.patch
firmware_sample_driver_c_use_KERN__.patch


--===============6124155223975678==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6124155223975678==--
