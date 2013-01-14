From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 14 Jan 2013 02:43:00 +0000
Subject: build regressions 2013-01-13
Message-Id: <50f370b4.L2QNZajCjFfAXCCX%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
arch/x86/kernel/cpu/intel_cacheinfo.c:519:27: warning: 'cache_disable_0' defined but not used [-Wunused-variable]
arch/x86/kernel/cpu/intel_cacheinfo.c:521:27: warning: 'cache_disable_1' defined but not used [-Wunused-variable]
arch/x86/kernel/cpu/intel_cacheinfo.c:618:29: warning: 'this_leaf.size' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/kernel/cpu/intel_cacheinfo.c:619:30: warning: 'this_leaf.eax.split.num_threads_sharing' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/char/rtc.c:192:22: warning: 'rtc_freq' defined but not used [-Wunused-variable]
arch/x86/kernel/cpu/intel_cacheinfo.c:560:27: warning: 'subcaches' defined but not used [-Wunused-variable]
warning: (BRIDGE_NF_EBTABLES) selects NETFILTER_XTABLES which has unmet direct dependencies (NET && INET && NETFILTER)
drivers/regulator/tps62360-regulator.c:376:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/base/regmap/regmap-debugfs.c:147:9: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/route.c:120:12: warning: 'ip_rt_gc_timeout' defined but not used [-Wunused-variable]
net/ipv4/route.c:121:12: warning: 'ip_rt_gc_interval' defined but not used [-Wunused-variable]
net/ipv4/route.c:122:12: warning: 'ip_rt_gc_min_interval' defined but not used [-Wunused-variable]
net/ipv4/route.c:128:12: warning: 'ip_rt_gc_elasticity' defined but not used [-Wunused-variable]
drivers/mfd/twl6030-irq.c:398:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/regulator/tps62360-regulator.c:364:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
fs/fuse/cuse.c:286:24: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/fuse/cuse.c:282:10: warning: 'key' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/wm8994-core.c:568:7: warning: 'patch_regs' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (DLM) selects IP_SCTP which has unmet direct dependencies (NET && INET && EXPERIMENTAL && (IPV6 || IPV6=n))

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
