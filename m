From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 06 Sep 2013 19:02:44 +0000
Subject: build regressions 2013-09-06
Message-Id: <522a26d4.qvE2PsL2hQ1b94yn%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/trace/trace_functions.c:574:2: error: implicit declaration of function 'ftrace_rcu_unsafe' [-Werror=implicit-function-declaration]
debug.c:(.text+0x1e0): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
debug.c:(.text+0x1ec): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
core.c:(.text+0xc87): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
core.c:(.text+0xc93): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
htc.c:(.text+0x88d): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
htc.c:(.text+0x899): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
htt.c:(.text+0x0): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
htt.c:(.text+0xc): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
htt_rx.c:(.text+0x68e): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
htt_rx.c:(.text+0x69a): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
htt_tx.c:(.text+0x59): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
htt_tx.c:(.text+0x65): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
txrx.c:(.text+0x0): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
txrx.c:(.text+0xc): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
wmi.c:(.text+0x376): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
wmi.c:(.text+0x382): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
bmi.c:(.text+0x0): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x3552): first defined here
bmi.c:(.text+0xc): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/mac.o:mac.c:(.text+0x355e): first defined here
ce.c:(.text+0xa24): multiple definition of `ath10k_debug_start'
drivers/net/wireless/ath/ath10k/pci.o:pci.c:(.text+0x1579): first defined here
ce.c:(.text+0xa30): multiple definition of `ath10k_debug_stop'
drivers/net/wireless/ath/ath10k/pci.o:pci.c:(.text+0x1585): first defined here
drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2015:3: error: implicit declaration of function 'bnx2x_vfpf_config_rss' [-Werror=implicit-function-declaration]
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:109:12: error: invalid storage class for function 'stmmac_pltfr_probe'
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:194:12: error: invalid storage class for function 'stmmac_pltfr_remove'
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:207:12: error: invalid storage class for function 'stmmac_pltfr_suspend'
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:214:12: error: invalid storage class for function 'stmmac_pltfr_resume'
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:248:2: error: initializer element is not constant
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:249:2: error: initializer element is not constant
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:250:2: error: initializer element is not constant
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:251:2: error: initializer element is not constant
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:252:2: error: initializer element is not constant
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:281:1: error: expected declaration or statement at end of input
ERROR: "vb2_ops_wait_finish" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ops_wait_prepare" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_streamoff" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_streamon" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_prepare_buf" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_create_bufs" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_dqbuf" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_qbuf" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_querybuf" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_ioctl_reqbufs" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_fop_release" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_fop_mmap" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_fop_poll" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_fop_read" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_plane_vaddr" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_buffer_done" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_queue_init" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!
ERROR: "vb2_vmalloc_memops" [drivers/staging/media/msi3101/sdr-msi3101.ko] undefined!

[warnings]
Warning(fs/dcache.c:1167): No description found for parameter 'data'
Warning(fs/dcache.c:1167): No description found for parameter 'dentry'
Warning(fs/dcache.c:1167): Excess function parameter 'parent' description in 'check_mount'
arch/openrisc/include/asm/prom.h:65:56: warning: 'struct of_irq' declared inside parameter list
arch/openrisc/include/asm/prom.h:65:56: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:109:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:266:21: warning: 'alias' attribute ignored [-Wattributes]
include/linux/ceph/ceph_debug.h:4:0: warning: "pr_fmt" redefined [enabled by default]
fs/dcache.c:1330:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
fs/cachefiles/interface.c:399:2: warning: passing argument 2 of 'cachefiles_end_secure' from incompatible pointer type [enabled by default]

[sparse]
fs/cachefiles/interface.c:399:39: sparse: incorrect type in argument 2 (different base types) @@    expected struct cred const *saved_cred @@    got sstruct cred const *saved_cred @@
drivers/net/vxlan.c:567:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:567:20: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/net/vxlan.c:567:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:567:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:567:20: sparse: incorrect type in initializer (different base types) @@    expected unsigned short [unsigned] [usertype] port @@    got  short [unsigned] [usertype] port @@
drivers/net/vxlan.c:584:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:584:20: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/net/vxlan.c:584:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:584:20: sparse: cast from restricted __be16
drivers/net/vxlan.c:584:20: sparse: incorrect type in initializer (different base types) @@    expected unsigned short [unsigned] [usertype] port @@    got  short [unsigned] [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2040:17: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be16 [usertype] port @@    got icted __be16 [usertype] port @@
drivers/net/vxlan.c:2041:32: sparse: cast from restricted __be16
drivers/net/vxlan.c:2041:32: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/net/vxlan.c:2041:32: sparse: cast from restricted __be16
drivers/net/vxlan.c:2041:32: sparse: cast from restricted __be16
drivers/net/vxlan.c:2041:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] port @@    got  short [unsigned] [usertype] port @@
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:3237:5: sparse: symbol 'bnx2x_vf_ndo_prep' was not declared. Should it be static?
fs/ceph/cache.c:59:27: sparse: non-ANSI function declaration of function 'ceph_fscache_register'
fs/ceph/cache.c:64:30: sparse: non-ANSI function declaration of function 'ceph_fscache_unregister'
fs/ceph/cache.c:34:22: sparse: symbol 'ceph_cache_netfs' was not declared. Should it be static?
include/linux/ceph/ceph_debug.h:4:9: sparse: preprocessor token pr_fmt redefined

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
