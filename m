From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 02 Dec 2012 16:12:06 +0000
Subject: build regressions 2012-12-02
Message-Id: <50bb7dd6.Egx7uYm1O3/RI2ht%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/sched/sched.h:235:2: error: unknown type name 'atomic64_t'
kernel/sched/fair.c:1076:2: error: implicit declaration of function 'atomic64_read' [-Werror=implicit-function-declaration]
kernel/sched/fair.c:1267:3: error: implicit declaration of function 'atomic64_xchg' [-Werror=implicit-function-declaration]
kernel/sched/fair.c:1274:3: error: implicit declaration of function 'atomic64_add' [-Werror=implicit-function-declaration]
kernel/sched/fair.c:4211:5: error: 'struct sd_lb_stats' has no member named 'min_util'
kernel/sched/fair.c:4212:5: error: 'struct sd_lb_stats' has no member named 'leader_util'
kernel/sched/fair.c:4247:7: error: 'struct sg_lb_stats' has no member named 'group_utils'
kernel/sched/fair.c:4274:51: error: 'struct sd_lb_stats' has no member named 'group_min'
kernel/sched/fair.c:4277:6: error: 'struct sd_lb_stats' has no member named 'min_load_per_task'
dm1105.c:(.devinit.text+0x2357a): undefined reference to `i2c_bit_add_bus'
kernel/sched/fair.c:2902:27: error: 'struct cfs_rq' has no member named 'tg_runnable_contrib'
kernel/sched/fair.c:3817:20: error: 'struct sched_entity' has no member named 'avg'

[warnings]
WARNING: vmlinux.o(.text+0x257de): Section mismatch in reference from the function smp_add_present_cpu() to the function .cpuinit.text:register_cpu()
net/netfilter/ipvs/ip_vs_pe_sip.c:87:11: warning: 'iph.thoff_reasm' may be used uninitialized in this function [-Wuninitialized]
WARNING: drivers/built-in.o(.text+0x56d18): Section mismatch in reference from the function twlreg_probe() to the variable .devinit.rodata:ci13xxx_pci_id_table
kernel/sched/fair.c:3822:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
net/ipv4/inet_hashtables.c:242:21: sparse: restricted __portpair degrades to integer
net/ipv6/inet6_hashtables.c:92:21: sparse: restricted __portpair degrades to integer
kernel/sched/fair.c:4322:52: sparse: no member 'group_min' in struct sd_lb_stats
kernel/sched/fair.c:4339:45: sparse: no member 'min_load_per_task' in struct sd_lb_stats
kernel/sched/fair.c:4211:12: sparse: no member 'min_util' in struct sd_lb_stats
kernel/sched/fair.c:4212:12: sparse: no member 'leader_util' in struct sd_lb_stats
kernel/sched/fair.c:4588:20: sparse: no member 'group_utils' in struct sg_lb_stats

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
