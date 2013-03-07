From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 07 Mar 2013 16:10:34 +0000
Subject: build regressions 2013-03-07
Message-Id: <5138bbfa.xEjqUvlZam/8uD0s%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/mfd/efm32board.c:85:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
drivers/mfd/efm32board.c:85:22: error: 'IRQF_VALID' undeclared (first use in this function)
ERROR: "copy_from_user_overflow" [drivers/isdn/hardware/avm/b1.ko] undefined!
drivers/mfd/efm32board.c:24:9: error: implicit declaration of function 'irq_get_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/efm32board.c:70:3: error: implicit declaration of function 'generic_handle_irq' [-Werror=implicit-function-declaration]
drivers/mfd/efm32board.c:82:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/efm32board.c:83:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/efm32board.c:83:47: error: 'handle_edge_irq' undeclared (first use in this function)
drivers/target/iscsi/iscsi_target.c:1629:12: error: conflicting types for 'iscsit_handle_task_mgt_cmd'
drivers/target/iscsi/iscsi_target.c:2333:12: error: conflicting types for 'iscsit_handle_immediate_data'
drivers/target/iscsi/iscsi_target.c:3937:4: error: too few arguments to function 'iscsit_handle_scsi_cmd'
drivers/target/iscsi/iscsi_target.c:3945:4: error: too few arguments to function 'iscsit_handle_nop_out'
drivers/target/iscsi/iscsi_target.c:3949:4: error: too few arguments to function 'iscsit_handle_task_mgt_cmd'
drivers/target/iscsi/iscsi_target.c:3957:4: error: too few arguments to function 'iscsit_handle_logout_cmd'

[warnings]
include/linux/hid.h:906:27: warning: 'report' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/efm32board.c:24:35: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/efm32board.c:35:35: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/efm32board.c:48:35: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/target/iscsi/iscsi_target.c:1096:6: warning: passing argument 2 of 'iscsit_handle_immediate_data' from incompatible pointer type [enabled by default]
drivers/target/iscsi/iscsi_target.c:3937:4: warning: passing argument 2 of 'iscsit_handle_scsi_cmd' from incompatible pointer type [enabled by default]
drivers/target/iscsi/iscsi_target.c:3945:4: warning: passing argument 2 of 'iscsit_handle_nop_out' from incompatible pointer type [enabled by default]
drivers/target/iscsi/iscsi_target.c:3949:4: warning: passing argument 2 of 'iscsit_handle_task_mgt_cmd' from incompatible pointer type [enabled by default]
drivers/target/iscsi/iscsi_target.c:3957:4: warning: passing argument 2 of 'iscsit_handle_logout_cmd' from incompatible pointer type [enabled by default]
drivers/target/iscsi/iscsi_target.c:72:12: warning: 'iscsit_handle_immediate_data' used but never defined [enabled by default]
drivers/mfd/efm32board.c:163:2: warning: passing argument 2 of 'request_irq' from incompatible pointer type [enabled by default]

[sparse]
drivers/staging/comedi/drivers/s626.c:2835:48: sparse: cast truncates bits from constant value (ffff1fff becomes 1fff)
drivers/staging/comedi/drivers/s626.c:2841:48: sparse: cast truncates bits from constant value (ffff1fff becomes 1fff)
drivers/staging/comedi/drivers/s626.c:2986:33: sparse: cast truncates bits from constant value (ffff0fff becomes fff)
drivers/staging/comedi/drivers/s626.c:3047:33: sparse: cast truncates bits from constant value (ffff0fff becomes fff)
drivers/staging/comedi/drivers/s626.c:3058:33: sparse: cast truncates bits from constant value (ffff0fff becomes fff)
drivers/staging/comedi/drivers/s626.c:3066:33: sparse: cast truncates bits from constant value (ffff1ffb becomes 1ffb)
drivers/staging/comedi/drivers/s626.c:3090:33: sparse: cast truncates bits from constant value (ffff1cff becomes 1cff)
drivers/staging/comedi/drivers/s626.c:3120:33: sparse: cast truncates bits from constant value (ffff1f3f becomes 1f3f)
drivers/staging/comedi/drivers/s626.c:3143:48: sparse: cast truncates bits from constant value (ffff1fff becomes 1fff)
drivers/staging/zcache/zcache-main.c:143:9: sparse: symbol 'zcache_last_active_file_pageframes' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:144:9: sparse: symbol 'zcache_last_inactive_file_pageframes' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:145:9: sparse: symbol 'zcache_last_active_anon_pageframes' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:146:9: sparse: symbol 'zcache_last_inactive_anon_pageframes' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_core.c:364:2: sparse: FIXME: Unexpected unsolicited_data out
drivers/infiniband/ulp/isert/isert_core.c:379:2: sparse: FIXME: Non page-aligned unsolicited_data out
drivers/infiniband/ulp/isert/isert_core.c:85:5: sparse: symbol 'isert_alloc_rx_descriptors' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_core.c:568:6: sparse: symbol 'isert_cmd_kref_free' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_core.c:576:6: sparse: symbol 'isert_put_cmd' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_verbs.c:109:2: sparse: FIXME: max_sge hardcoded to 16
drivers/infiniband/ulp/isert/isert_verbs.c:305:6: sparse: symbol 'isert_connect_release' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_core.c:774:1: sparse: symbol 'isert_dump_ib_wc' was not declared. Should it be static?
drivers/target/iscsi/iscsi_target.c:1138:5: sparse: symbol 'iscsit_handle_scsi_cmd' was not declared. Should it be static?
drivers/mfd/efm32board.c:87:9: sparse: undefined identifier 'set_irq_flags'
drivers/staging/zcache/zcache-main.c:138:5: sparse: symbol 'zcache_pers_zbytes' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_verbs.c:355:6: sparse: symbol 'isert_put_conn' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_verbs.c:386:5: sparse: symbol 'isert_cma_handler' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_verbs.c:427:5: sparse: symbol 'isert_post_recv' was not declared. Should it be static?
drivers/infiniband/ulp/isert/isert_verbs.c:461:5: sparse: symbol 'isert_post_send' was not declared. Should it be static?

[smatch]
drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c:381 brcmf_fws_hdrpull() warn: inconsistent returns irqsave:(flags): locked (282) unlocked (381)
drivers/net/wireless/brcm80211/brcmfmac/fwsignal.c:381 brcmf_fws_hdrpull() warn: inconsistent returns irqsave:flags: locked (381) unlocked (282)
drivers/net/wireless/mwifiex/cfg80211.c:2357 mwifiex_cfg80211_suspend() error: potential null dereference 'mef_entry'.  (kzalloc returns null)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00111-g19cd77e"' too small (25 vs 32)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
