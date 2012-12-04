From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 04 Dec 2012 17:11:25 +0000
Subject: build regressions 2012-12-04
Message-Id: <50be2ebd.PqrjUHKcb+kFXk7c%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/leds/leds-tca6507.c:725:1: error: unknown type name 'tca6507_platform_data'
drivers/leds/leds-tca6507.c:728:2: error: implicit declaration of function 'ERR_PRT' [-Werror=implicit-function-declaration]
adis16260_core.c:(.text+0x5a85d3): undefined reference to `adis_single_conversion'
adis16260_core.c:(.devinit.text+0x5c6b8): undefined reference to `adis_init'
adis16260_core.c:(.devinit.text+0x5c799): undefined reference to `adis_initial_startup'
adis16260_core.c:(.text+0x5a7a27): undefined reference to `adis_write_reg'
adis16260_core.c:(.text+0x5a7ae8): undefined reference to `adis_read_reg'
ERROR: "pch_set_station_address" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_tx_snap_read" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_src_uuid_lo_read" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_ch_event_read" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_ch_event_write" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_src_uuid_hi_read" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_ch_control_write" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!
ERROR: "pch_rx_snap_read" [drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe.ko] undefined!

[warnings]
drivers/leds/leds-tca6507.c:728:2: warning: return makes pointer from integer without a cast [enabled by default]
drivers/leds/leds-tca6507.c:750:9: warning: assignment from incompatible pointer type [enabled by default]
net/wireless/reg.c:352:9: warning: unused variable 'r' [-Wunused-variable]

[sparse]
mm/memory.c:3451:5: sparse: symbol 'do_numa_page' was not declared. Should it be static?
mm/memory.c:3486:5: sparse: symbol 'do_pmd_numa_page' was not declared. Should it be static?
drivers/ata/ahci_platform.c:52:28: sparse: symbol 'ahci_platform_ops' was not declared. Should it be static?
drivers/ata/ahci_platform.c:57:28: sparse: symbol 'ahci_platform_retry_srst_ops' was not declared. Should it be static?
drivers/leds/leds-tca6507.c:746:9: sparse: Trying to use reserved word 'if' as identifier
drivers/leds/leds-tca6507.c:754:25: sparse: Trying to use reserved word 'return' as identifier
drivers/leds/leds-tca6507.c:762:9: sparse: Trying to use reserved word 'do' as identifier
drivers/leds/leds-tca6507.c:766:9: sparse: Trying to use reserved word 'for' as identifier
drivers/leds/leds-tca6507.c:806:23: sparse: too many errors
drivers/leds/leds-tca6507.c:725:30: sparse: Expected ; at end of declaration
drivers/leds/leds-tca6507.c:725:30: sparse: got *
drivers/leds/leds-tca6507.c:729:1: sparse: Expected ; at the end of type declaration
drivers/leds/leds-tca6507.c:746:13: sparse: Expected ) in function declarator
drivers/leds/leds-tca6507.c:751:27: sparse: got (
drivers/leds/leds-tca6507.c:754:32: sparse: got PTR_ERR
drivers/leds/leds-tca6507.c:762:9: sparse: Expected ) in nested declarator
drivers/leds/leds-tca6507.c:786:17: sparse: got goto
drivers/leds/leds-tca6507.c:792:5: sparse: got :

[smatch]
sound/usb/midi.c:1088 substream_open() warn: inconsistent returns mutex:&umidi->mutex: locked (1058) unlocked (1048,1088)
fs/ext4/inode.c:1953 __ext4_journalled_writepage() error: potential NULL dereference 'page_bufs'.
fs/nfsd/nfs4state.c:4617 nfsd_print_client() error: rpc_ntop() 'buf' too small (48 vs 129)
fs/nfsd/nfs4state.c:4626 nfsd_print_count() error: rpc_ntop() 'buf' too small (48 vs 129)
fs/nfsd/fault_inject.c:82 nfsd_inject_set_client() error: rpc_ntop() 'buf' too small (48 vs 129)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
