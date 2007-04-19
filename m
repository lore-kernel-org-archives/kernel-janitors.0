From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 19 Apr 2007 12:25:03 +0000
Subject: [KJ][PATCH]SPIN_LOCK_UNLOCKED cleanup in init_task.h
Message-Id: <20070419121303.GB12373@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070419041440.GB14283@arun.site>
In-Reply-To: <20070419041440.GB14283@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: Andrw Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

SPIN_LOCK_UNLOCKED cleanup,use __SPIN_LOCK_UNLOCKED instead 

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
---
 init_task.h |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index a2d95ff..7951023 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -138,7 +138,7 @@ extern struct group_info init_groups;
 	.journal_info	= NULL,						\
 	.cpu_timers	= INIT_CPU_TIMERS(tsk.cpu_timers),		\
 	.fs_excl	= ATOMIC_INIT(0),				\
-	.pi_lock	= SPIN_LOCK_UNLOCKED,				\
+	.pi_lock	= __SPIN_LOCK_UNLOCKED(tsk.pi_lock),		\
 	INIT_TRACE_IRQFLAGS						\
 	INIT_LOCKDEP							\
 }
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
