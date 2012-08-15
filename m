From: Alex Shi <alex.shi@intel.com>
Date: Wed, 15 Aug 2012 00:57:10 +0000
Subject: Re: [tip:auto-latest 18/37] kernel/sched/core.c:6460:1: error: 'SD_PREFER_LOCAL' undeclared (first u
Message-Id: <502AF3E6.3050709@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120814203654.GA20732@localhost>
In-Reply-To: <20120814203654.GA20732@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 08/15/2012 04:36 AM, Fengguang Wu wrote:

> Hi Alex,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git auto-latest
> head:   e42942691c8262b7fe2a7b88577623082b988217
> commit: f03542a7019c600163ac4441d8a826c92c1bd510 [18/37] sched: recover SD_WAKE_AFFINE in select_task_rq_fair and code clean up
> config: tile-tilegx_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/sched/core.c: In function 'sd_init_CPU':
> kernel/sched/core.c:6460:1: error: 'SD_PREFER_LOCAL' undeclared (first use in this function)
> kernel/sched/core.c:6460:1: note: each undeclared identifier is reported only once for each function it appears in
> 


Sorry for this mistaken!
The following is fixing patch

======
From 033c87bfde319e7b0bdd090a76e5731930332c41 Mon Sep 17 00:00:00 2001
From: Alex Shi <alex.shi@intel.com>
Date: Wed, 15 Aug 2012 08:14:36 +0800
Subject: [PATCH] sched: remove SD_PREFER_LOCAL in tile arch

commit (sched: recover SD_WAKE_AFFINE in select_task_rq_fair and code
clean up) remove SD_PREFER_LOCAL definition, but left a SD_PREFER_LOCAL
usage in tile arch code. That cause tile arch out of work.

This patch removes the died code from tile arch.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Alex Shi <alex.shi@intel.com>
---
 arch/tile/include/asm/topology.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/tile/include/asm/topology.h b/arch/tile/include/asm/topology.h
index 7a7ce39..d5e86c9 100644
--- a/arch/tile/include/asm/topology.h
+++ b/arch/tile/include/asm/topology.h
@@ -69,7 +69,6 @@ static inline const struct cpumask *cpumask_of_node(int node)
 				| 1*SD_BALANCE_FORK			\
 				| 0*SD_BALANCE_WAKE			\
 				| 0*SD_WAKE_AFFINE			\
-				| 0*SD_PREFER_LOCAL			\
 				| 0*SD_SHARE_CPUPOWER			\
 				| 0*SD_SHARE_PKG_RESOURCES		\
 				| 0*SD_SERIALIZE			\
-- 
1.7.5.4

