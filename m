From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 05 Mar 2013 19:01:37 +0000
Subject: build regressions 2013-03-05
Message-Id: <51364111.L5qDOqesAdPXmKS1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
include/asm-generic/bitops/le.h:54:2: warning: array subscript is above array bounds [-Warray-bounds]
include/asm-generic/bitops/le.h:54:2: warning: array subscript is above array bounds [-Warray-bounds]
sound/soc/soc-dmaengine-pcm.c:333:2: warning: passing argument 2 of 'dma_request_slave_channel' discards 'const' qualifier from pointer target type [enabled by default]
WARNING: kernel/trace/built-in.o(.data+0x2728): Section mismatch in reference from the variable _event_class_ftrace_branch to the function .init.text:_ftrace_define_fields_branch()
WARNING: kernel/trace/built-in.o(.data+0x2794): Section mismatch in reference from the variable _event_class_ftrace_mmiotrace_map to the function .init.text:_ftrace_define_fields_mmiotrace_map()
WARNING: kernel/trace/built-in.o(.data+0x2b60): Section mismatch in reference from the variable _event_class_ftrace_funcgraph_entry to the function .init.text:_ftrace_define_fields_funcgraph_entry()
WARNING: kernel/trace/built-in.o(.data+0x2bcc): Section mismatch in reference from the variable _event_class_ftrace_function to the function .init.text:_ftrace_define_fields_function()
WARNING: kernel/trace/built-in.o(.data+0x2c38): Section mismatch in reference from the variable _event_class_ftrace_test_filter to the function .init.text:_ftrace_define_fields_ftrace_test_filter()
WARNING: kernel/trace/built-in.o(.data+0x324c): Section mismatch in reference from the variable _event_class_power_domain to the function .init.text:_ftrace_define_fields_power_domain()
WARNING: kernel/trace/built-in.o(.data+0x3348): Section mismatch in reference from the variable _event_class_clock to the function .init.text:_ftrace_define_fields_clock()
WARNING: kernel/trace/built-in.o(.data+0x33b4): Section mismatch in reference from the variable _event_class_power_end to the function .init.text:_ftrace_define_fields_power_end()
WARNING: kernel/trace/built-in.o(.data+0x3468): Section mismatch in reference from the variable _event_class_power to the function .init.text:_ftrace_define_fields_power()
WARNING: kernel/trace/built-in.o(.data+0x351c): Section mismatch in reference from the variable _event_class_wakeup_source to the function .init.text:_ftrace_define_fields_wakeup_source()
WARNING: kernel/trace/built-in.o(.data+0x3588): Section mismatch in reference from the variable _event_class_machine_suspend to the function .init.text:_ftrace_define_fields_machine_suspend()
WARNING: kernel/trace/built-in.o(.data+0x363c): Section mismatch in reference from the variable _event_class_cpu to the function .init.text:_ftrace_define_fields_cpu()
WARNING: kernel/trace/built-in.o(.data+0x2800): Section mismatch in reference from the variable _event_class_ftrace_mmiotrace_rw to the function .init.text:_ftrace_define_fields_mmiotrace_rw()
WARNING: kernel/trace/built-in.o(.data+0x3718): Section mismatch in reference from the variable _event_class_rpm_return_int to the function .init.text:_ftrace_define_fields_rpm_return_int()
WARNING: kernel/trace/built-in.o(.data+0x3814): Section mismatch in reference from the variable _event_class_rpm_internal to the function .init.text:_ftrace_define_fields_rpm_internal()
WARNING: kernel/trace/built-in.o(.data+0x286c): Section mismatch in reference from the variable _event_class_ftrace_print to the function .init.text:_ftrace_define_fields_print()
WARNING: kernel/trace/built-in.o(.data+0x28d8): Section mismatch in reference from the variable _event_class_ftrace_bprint to the function .init.text:_ftrace_define_fields_bprint()
WARNING: kernel/trace/built-in.o(.data+0x2944): Section mismatch in reference from the variable _event_class_ftrace_user_stack to the function .init.text:_ftrace_define_fields_user_stack()
WARNING: kernel/trace/built-in.o(.data+0x29b0): Section mismatch in reference from the variable _event_class_ftrace_kernel_stack to the function .init.text:_ftrace_define_fields_kernel_stack()
WARNING: kernel/trace/built-in.o(.data+0x2a1c): Section mismatch in reference from the variable _event_class_ftrace_wakeup to the function .init.text:_ftrace_define_fields_wakeup()
WARNING: kernel/trace/built-in.o(.data+0x2a88): Section mismatch in reference from the variable _event_class_ftrace_context_switch to the function .init.text:_ftrace_define_fields_context_switch()
WARNING: kernel/trace/built-in.o(.data+0x2af4): Section mismatch in reference from the variable _event_class_ftrace_funcgraph_exit to the function .init.text:_ftrace_define_fields_funcgraph_exit()
WARNING: net/mac80211/mac80211.o(.data+0x9e24): Section mismatch in reference from the variable event_class_api_radar_detected to the function .init.text:ftrace_define_fields_api_radar_detected()
WARNING: net/mac80211/mac80211.o(.data+0x9e90): Section mismatch in reference from the variable event_class_drv_set_default_unicast_key to the function .init.text:ftrace_define_fields_drv_set_default_unicast_key()
WARNING: vmlinux.o(.data+0xf82dc): Section mismatch in reference from the variable event_class_block_bio_queue to the function .init.text:ftrace_define_fields_block_bio_queue()
WARNING: vmlinux.o(.data+0xf8390): Section mismatch in reference from the variable event_class_block_bio_merge to the function .init.text:ftrace_define_fields_block_bio_merge()
WARNING: vmlinux.o(.data+0xf86cc): Section mismatch in reference from the variable event_class_block_buffer to the function .init.text:ftrace_define_fields_block_buffer()
WARNING: fs/ext4/ext4.o(.data+0x40e0): Section mismatch in reference from the variable event_class_ext4_es_shrink_exit to the function .init.text:ftrace_define_fields_ext4_es_shrink_exit()
WARNING: fs/ext4/ext4.o(.data+0x414c): Section mismatch in reference from the variable event_class_ext4_es_shrink_enter to the function .init.text:ftrace_define_fields_ext4_es_shrink_enter()
WARNING: fs/ext4/ext4.o(.data+0x41b8): Section mismatch in reference from the variable event_class_ext4_es_lookup_extent_exit to the function .init.text:ftrace_define_fields_ext4_es_lookup_extent_exit()
WARNING: fs/ext4/ext4.o(.data+0x4224): Section mismatch in reference from the variable event_class_ext4_es_lookup_extent_enter to the function .init.text:ftrace_define_fields_ext4_es_lookup_extent_enter()
WARNING: fs/ext4/ext4.o(.data+0x4f14): Section mismatch in reference from the variable event_class_ext4_punch_hole to the function .init.text:ftrace_define_fields_ext4_punch_hole()
WARNING: fs/ext4/ext4.o(.data+0x4290): Section mismatch in reference from the variable event_class_ext4_es_find_delayed_extent_exit to the function .init.text:ftrace_define_fields_ext4_es_find_delayed_extent_exit()
WARNING: fs/ext4/ext4.o(.data+0x42fc): Section mismatch in reference from the variable event_class_ext4_es_find_delayed_extent_enter to the function .init.text:ftrace_define_fields_ext4_es_find_delayed_extent_enter()
WARNING: net/wireless/cfg80211.o(.data+0x7c5c): Section mismatch in reference from the variable event_class_cfg80211_report_wowlan_wakeup to the function .init.text:ftrace_define_fields_cfg80211_report_wowlan_wakeup()
WARNING: net/wireless/cfg80211.o(.data+0x8340): Section mismatch in reference from the variable event_class_cfg80211_cac_event to the function .init.text:ftrace_define_fields_cfg80211_cac_event()
WARNING: net/wireless/cfg80211.o(.data+0x83ac): Section mismatch in reference from the variable event_class_cfg80211_radar_event to the function .init.text:ftrace_define_fields_cfg80211_radar_event()
WARNING: net/wireless/cfg80211.o(.data+0x8484): Section mismatch in reference from the variable event_class_cfg80211_chandef_dfs_required to the function .init.text:ftrace_define_fields_cfg80211_chandef_dfs_required()
WARNING: net/wireless/cfg80211.o(.data+0x8c1c): Section mismatch in reference from the variable event_class_rdev_set_mac_acl to the function .init.text:ftrace_define_fields_rdev_set_mac_acl()
WARNING: fs/jbd2/jbd2.o(.data+0x1fac): Section mismatch in reference from the variable event_class_jbd2_handle_stats to the function .init.text:ftrace_define_fields_jbd2_handle_stats()
WARNING: fs/jbd2/jbd2.o(.data+0x2018): Section mismatch in reference from the variable event_class_jbd2_handle_extend to the function .init.text:ftrace_define_fields_jbd2_handle_extend()
WARNING: fs/jbd2/jbd2.o(.data+0x2084): Section mismatch in reference from the variable event_class_jbd2_handle_start to the function .init.text:ftrace_define_fields_jbd2_handle_start()
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
WARNING: kernel/trace/built-in.o(.data+0x27fc): Section mismatch in reference from the variable event_class_ftrace_branch to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2868): Section mismatch in reference from the variable event_class_ftrace_mmiotrace_map to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2c34): Section mismatch in reference from the variable event_class_ftrace_funcgraph_entry to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2ca0): Section mismatch in reference from the variable event_class_ftrace_function to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2e68): Section mismatch in reference from the variable event_class_ftrace_test_filter to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x3570): Section mismatch in reference from the variable event_class_power_domain to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x366c): Section mismatch in reference from the variable event_class_clock to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x36d8): Section mismatch in reference from the variable event_class_power_end to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x378c): Section mismatch in reference from the variable event_class_power to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x3840): Section mismatch in reference from the variable event_class_wakeup_source to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x38ac): Section mismatch in reference from the variable event_class_machine_suspend to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x3960): Section mismatch in reference from the variable event_class_cpu to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x28d4): Section mismatch in reference from the variable event_class_ftrace_mmiotrace_rw to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x3a70): Section mismatch in reference from the variable event_class_rpm_return_int to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x3b6c): Section mismatch in reference from the variable event_class_rpm_internal to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2940): Section mismatch in reference from the variable event_class_ftrace_print to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x29ac): Section mismatch in reference from the variable event_class_ftrace_bprint to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2a18): Section mismatch in reference from the variable event_class_ftrace_user_stack to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2a84): Section mismatch in reference from the variable event_class_ftrace_kernel_stack to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2af0): Section mismatch in reference from the variable event_class_ftrace_wakeup to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2b5c): Section mismatch in reference from the variable event_class_ftrace_context_switch to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2bc8): Section mismatch in reference from the variable event_class_ftrace_funcgraph_exit to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2cf8): Section mismatch in reference from the variable event_class_syscall_exit to the function .init.text:set_ftrace_notrace()
WARNING: kernel/trace/built-in.o(.data+0x2d1c): Section mismatch in reference from the variable event_class_syscall_enter to the function .init.text:set_ftrace_notrace()
Warning(include/net/mac80211.h): no structured comments found
WARNING: block/built-in.o(.data+0x17f0): Section mismatch in reference from the variable event_class_block_bio to the function .init.text:ftrace_define_fields_block_bio()
WARNING: fs/ext4/ext4.o(.data+0x8360): Section mismatch in reference from the variable event_class_ext4_es_find_extent_exit to the function .init.text:ftrace_define_fields_ext4_es_find_extent_exit()
WARNING: fs/ext4/ext4.o(.data+0x8440): Section mismatch in reference from the variable event_class_ext4_es_find_extent_enter to the function .init.text:ftrace_define_fields_ext4_es_find_extent_enter()
fs/gfs2/lock_dlm.c:667:20: warning: array subscript is above array bounds [-Warray-bounds]
fs/gfs2/lock_dlm.c:728:18: warning: array subscript is above array bounds [-Warray-bounds]
WARNING: kernel/trace/built-in.o(.data+0x18ce0): Section mismatch in reference from the variable event_class_power_end to the function .init.text:ftrace_define_fields_power_end()
WARNING: kernel/trace/built-in.o(.data+0x18e50): Section mismatch in reference from the variable event_class_power to the function .init.text:ftrace_define_fields_power()

[sparse]
drivers/staging/android/sw_sync.c:73:26: sparse: symbol 'sw_sync_timeline_ops' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:106:5: sparse: symbol 'sw_sync_open' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:122:5: sparse: symbol 'sw_sync_release' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:129:6: sparse: symbol 'sw_sync_ioctl_create_fence' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:170:6: sparse: symbol 'sw_sync_ioctl_inc' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:182:6: sparse: symbol 'sw_sync_ioctl' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:211:12: sparse: symbol 'sw_sync_device_init' was not declared. Should it be static?
drivers/staging/android/sw_sync.c:216:13: sparse: symbol 'sw_sync_device_remove' was not declared. Should it be static?
drivers/staging/android/sync.c:924:6: sparse: symbol 'sync_dump' was not declared. Should it be static?
drivers/staging/dgrp/dgrp_dpa_ops.c:119:23: sparse: incorrect type in assignment (different address spaces)
drivers/staging/dgrp/dgrp_net_ops.c:94:23: sparse: incorrect type in assignment (different address spaces)
fs/proc/root.c:245:28: sparse: incorrect type in initializer (different address spaces)
sound/core/info.c:968:30: sparse: incorrect type in assignment (different address spaces)

[smatch]
drivers/iio/industrialio-core.c:712 iio_device_add_channel_sysfs() error: buffer overflow 'iio_chan_info_postfix' 16 <= 31
drivers/iio/industrialio-core.c:725 iio_device_add_channel_sysfs() error: buffer overflow 'iio_chan_info_postfix' 16 <= 31

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
