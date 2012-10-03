From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 13:39:34 +0000
Subject: [uapi:uapi-split 16/74] arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
Message-Id: <20121003133934.GA7653@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, there are new compile warnings show up in

tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-split
head:   fe8d5078f66f6cdf1f327912ed7240b0379fde0e
commit: d128c2f473adfc11793b0c5740c81b714234db84 [16/74] UAPI: (Scripted) Disintegrate arch/avr32/include/asm
config: avr32-atngw100_defconfig

All warnings:

In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/mm.h:8,
                 from arch/avr32/kernel/asm-offsets.c:7:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/mm.h:8,
                 from arch/avr32/kernel/asm-offsets.c:7:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
--
In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from fs/namei.c:20:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from fs/namei.c:20:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
fs/namei.c: In function 'link_path_walk':
fs/namei.c:1546: warning: 'cookie' may be used uninitialized in this function
fs/namei.c:1546: note: 'cookie' was declared here
fs/namei.c: In function 'path_lookupat':
fs/namei.c:1936: warning: 'cookie' may be used uninitialized in this function
fs/namei.c: In function 'path_openat':
fs/namei.c:2905: warning: 'cookie' may be used uninitialized in this function
--
In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/mmc/card/block.c:21:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/mmc/card/block.c:21:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
drivers/mmc/card/block.c: In function 'mmc_blk_issue_rq':
drivers/mmc/card/block.c:819: warning: 'arg' may be used uninitialized in this function
drivers/mmc/card/block.c:819: note: 'arg' was declared here
drivers/mmc/card/block.c:819: warning: 'nr' may be used uninitialized in this function
drivers/mmc/card/block.c:819: note: 'nr' was declared here
drivers/mmc/card/block.c:819: warning: 'from' may be used uninitialized in this function
drivers/mmc/card/block.c:819: note: 'from' was declared here
--
In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from net/unix/af_unix.c:83:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from net/unix/af_unix.c:83:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
net/unix/af_unix.c: In function 'unix_bind':
net/unix/af_unix.c:898: warning: 'path.mnt' may be used uninitialized in this function
net/unix/af_unix.c:898: warning: 'path.dentry' may be used uninitialized in this function
--
In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/textsearch.h:8,
                 from include/linux/skbuff.h:28,
                 from net/ipv4/netfilter/ip_tables.c:14:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/textsearch.h:8,
                 from include/linux/skbuff.h:28,
                 from net/ipv4/netfilter/ip_tables.c:14:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
net/ipv4/netfilter/ip_tables.c: In function 'ipt_get_target_c':
net/ipv4/netfilter/ip_tables.c:182: warning: passing argument 1 of 'ipt_get_target' discards qualifiers from pointer target type
--
In file included from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/textsearch.h:8,
                 from include/linux/skbuff.h:28,
                 from net/ipv6/netfilter/ip6_tables.c:14:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/param.h:4,
                 from include/linux/timex.h:172,
                 from include/linux/jiffies.h:8,
                 from include/linux/ktime.h:25,
                 from include/linux/timer.h:5,
                 from include/linux/workqueue.h:8,
                 from include/linux/srcu.h:32,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/textsearch.h:8,
                 from include/linux/skbuff.h:28,
                 from net/ipv6/netfilter/ip6_tables.c:14:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
net/ipv6/netfilter/ip6_tables.c: In function 'ip6t_get_target_c':
net/ipv6/netfilter/ip6_tables.c:207: warning: passing argument 1 of 'ip6t_get_target' discards qualifiers from pointer target type

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
