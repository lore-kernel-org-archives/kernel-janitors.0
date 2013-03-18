From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 18 Mar 2013 16:03:38 +0000
Subject: build regressions 2013-03-18
Message-Id: <51473ada.z+ACN25uOxb9a5WS%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
make[2]: *** No rule to make target `modules.builtin', needed by `kernel/modnamelist.c'.
init/main.c:252:11: error: 'builtin_modnames' undeclared (first use in this function)
sound/pci/hda/patch_sigmatel.c:892:48: error: dereferencing pointer to incomplete type
sound/pci/hda/patch_sigmatel.c:900:2: error: implicit declaration of function 'snd_hda_enable_beep_device' [-Werror=implicit-function-declaration]
sound/pci/hda/patch_sigmatel.c:3570:15: error: dereferencing pointer to incomplete type
drivers/hid/usbhid/hid-quirks.c:76:4: error: 'USB_VENDIR_ID_MSI' undeclared here (not in a function)
sh: scripts/modnamelist.sh: No such file or directory
drivers/block/drbd/drbd_receiver.c:4057:10: error: 'mdev' undeclared (first use in this function)

[warnings]
drivers/mmc/host/mmci.c:1165:20: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/media/i2c/m5mols/m5mols_core.c:595:18: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/zcache/zbud.c:288:22: warning: 'zbud_pers_evicted_pageframes' defined but not used [-Wunused-variable]

[sparse]
net/core/netpoll.c:50:1: sparse: symbol 'netpoll_srcu_srcu_array' was not declared. Should it be static?
drivers/hwmon/adt7310.c:51:16: sparse: cast to restricted __be16
drivers/hwmon/adt7310.c:51:16: sparse: cast to restricted __be16
drivers/hwmon/adt7310.c:51:16: sparse: cast to restricted __be16
drivers/hwmon/adt7310.c:51:16: sparse: cast to restricted __be16
drivers/staging/dwc2/hcd_intr.c:59:2: sparse: Compiling code to track missed SOFs
security/tomoyo/tomoyo.c:539:1: sparse: symbol 'tomoyo_ss_srcu_array' was not declared. Should it be static?
fs/btrfs/free-space-cache.c:3464:34: sparse: non-ANSI function declaration of function 'btrfs_test_free_space_cache'
sound/pci/hda/patch_sigmatel.c:892:55: sparse: using member 'enabled' in incomplete struct hda_beep
sound/pci/hda/patch_sigmatel.c:900:16: sparse: undefined identifier 'snd_hda_enable_beep_device'
sound/pci/hda/patch_sigmatel.c:3570:36: sparse: using member 'linear_tone' in incomplete struct hda_beep
kernel/trace/trace.c:87:8: sparse: symbol 'trace_cmdline_save' was not declared. Should it be static?
kernel/trace/trace.c:192:8: sparse: symbol 'global_trace_cpu' was not declared. Should it be static?
kernel/trace/trace.c:228:8: sparse: symbol 'max_tr_data' was not declared. Should it be static?
kernel/trace/trace.c:284:8: sparse: symbol 'cpu_access_lock' was not declared. Should it be static?
kernel/trace/trace.c:1327:8: sparse: symbol 'ftrace_stack' was not declared. Should it be static?
kernel/trace/trace.c:1328:8: sparse: symbol 'ftrace_stack_reserve' was not declared. Should it be static?
kernel/trace/trace.c:1451:8: sparse: symbol 'user_stack_count' was not declared. Should it be static?

[smatch]
drivers/net/vxlan.c:350 vxlan_fdb_append() error: potential NULL dereference 'rd_prev'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
