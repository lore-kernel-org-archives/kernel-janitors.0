From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 18 Oct 2013 22:20:17 +0000
Subject: build regressions 2013-10-18
Message-Id: <5261b421.1A3aYZl8BpPUFivs%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: Input tree has errors, aborting (use -f to force output)
(.text+0x24bea): undefined reference to `i2c_get_adapter'
(.text+0x24bfa): undefined reference to `i2c_new_device'
sfi.c:(.init.text+0xeca4): undefined reference to `__x86_intel_mid_dev_start'
sfi.c:(.init.text+0xeccb): undefined reference to `__x86_intel_mid_dev_end'
ERROR: "ieee80211_mesh_csa_beacon" [net/mac80211/mac80211.ko] undefined!
ERROR: "ieee80211_mesh_finish_csa" [net/mac80211/mac80211.ko] undefined!
cfg.c:(.text+0xeaf8a): undefined reference to `ieee80211_mesh_csa_beacon'
(.text+0xebc6c): undefined reference to `ieee80211_mesh_finish_csa'
kernel/capability.c:280:2: error: too few arguments to function 'audit_log_capset'
include/linux/compiler.h:137:17: error: too few arguments to function 'audit_log_capset'

[warnings]
kernel/capability.c:280:2: warning: passing argument 1 of 'audit_log_capset' makes integer from pointer without a cast [enabled by default]
drivers/video/backlight/pwm_bl.c:48:6: warning: unused variable 'duty_cycle' [-Wunused-variable]
net/netfilter/nfnetlink.c:358:1: warning: 'nfnetlink_rcv_batch' uses dynamic stack allocation [enabled by default]
fs/afs/dir.c:675:1: warning: label 'out_skip' defined but not used [-Wunused-label]
include/linux/compiler.h:137:17: warning: passing argument 1 of 'audit_log_capset' makes integer from pointer without a cast [enabled by default]

[sparse]
net/ipv4/netfilter/nft_reject_ipv4.c:75:53: sparse: incorrect type in argument 3 (different base types) @@    expected restricted __be32 [usertype] value @@    got int enum nft_rrestricted __be32 [usertype] value @@
net/netfilter/nf_tables_core.c:76:17: sparse: cast between address spaces (<asn:3>-><asn:4>)
net/netfilter/nf_tables_core.c:76:17: sparse: incompatible types in comparison expression (different address spaces)
net/netfilter/nf_tables_api.c:712:25: sparse: cast between address spaces (<asn:3>-><asn:4>)
net/netfilter/nf_tables_api.c:712:25: sparse: incompatible types in comparison expression (different address spaces)
net/netfilter/nft_compat.c:215:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got noderef] <asn:1>*dst @@
net/netfilter/nft_compat.c:399:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1>*dst @@    got noderef] <asn:1>*dst @@
net/netfilter/nf_tables_api.c:350:23: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] flags @@    got  [usertype] flags @@
net/netfilter/nf_tables_api.c:351:21: sparse: restricted __be32 degrades to integer
net/netfilter/nf_tables_api.c:354:22: sparse: restricted __be32 degrades to integer
net/netfilter/nf_tables_api.c:359:30: sparse: restricted __be32 degrades to integer
net/netfilter/nf_tables_api.c:415:23: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] flags @@    got  [usertype] flags @@
net/netfilter/nf_tables_api.c:416:21: sparse: restricted __be32 degrades to integer
net/netfilter/nf_tables_api.c:421:30: sparse: invalid assignment: |net/netfilter/nft_nat.c:50:43: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [addressable] [usertype] ip @@    got addressable] [usertype] ip @@
net/netfilter/nft_nat.c:51:43: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [addressable] [usertype] ip @@    got addressable] [usertype] ip @@
net/netfilter/nft_nat.c:65:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [addressable] [assigned] [usertype] all @@    got ] [assigned] [usertype] all @@
net/netfilter/nft_nat.c:66:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [addressable] [assigned] [usertype] all @@    got ] [assigned] [usertype] all @@
net/netfilter/nfnetlink.c:386:55: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short [unsigned] [usertype] subsys_id @@    got  short [unsigned] [usertype] subsys_id @@
net/unix/af_unix.c:1216:9: sparse: context imbalance in 'do_unix_stream_connect' - different lock contexts for basic block
arch/x86/platform/intel-mid/sfi.c:63:5: sparse: symbol 'sfi_mtimer_num' was not declared. Should it be static?
arch/x86/platform/intel-mid/sfi.c:114:30: sparse: symbol 'sfi_get_mtmr' was not declared. Should it be static?
arch/x86/platform/intel-mid/sfi.c:136:6: sparse: symbol 'sfi_free_mtmr' was not declared. Should it be static?
net/netfilter/nft_lookup.c:133:12: sparse: symbol 'nft_lookup_module_init' was not declared. Should it be static?
net/netfilter/nft_lookup.c:138:6: sparse: symbol 'nft_lookup_module_exit' was not declared. Should it be static?

[coccinelle]
arch/x86/pci/intel_mid_pci.c:153:9-10: WARNING: return of 0/1 in function 'type1_access_ok' with return type bool
arch/x86/platform/intel-mid/sfi.c:272:1-7: Replace memcpy with struct assignment
arch/x86/platform/intel-mid/sfi.c:251:1-7: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
