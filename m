From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:32:00 +0000
Subject: [Kernel-janitors] [PATCH] base/dmapool: replace schedule_timeout()
Message-Id: <20040915183200.GH4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40759456267936289=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40759456267936289==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: msleep_interruptible() is used instead of schedule_timeout()
to guarantee the task delays as expected. To achieve this, the timeout
variable is converted from jiffies to msecs. Also, set_current_state()
is used instead of direct assignment.

--- 2.6.9-rc2-vanilla/drivers/base/dmapool.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/base/dmapool.c	2004-09-14 11:37:07.000000000 -0700
@@ -34,7 +34,7 @@ struct dma_page {	/* cacheable header fo
 	unsigned long		bitmap [0];
 };
 
-#define	POOL_TIMEOUT_JIFFIES	((100 /* msec */ * HZ) / 1000)
+#define	POOL_TIMEOUT_MSECS	(100)   /* msec */
 #define	POOL_POISON_FREED	0xa7	/* !inuse */
 #define	POOL_POISON_ALLOCATED	0xa9	/* !initted */
 
@@ -293,11 +293,11 @@ restart:
 		if (mem_flags & __GFP_WAIT) {
 			DECLARE_WAITQUEUE (wait, current);
 
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state (TASK_INTERRUPTIBLE);
 			add_wait_queue (&pool->waitq, &wait);
 			spin_unlock_irqrestore (&pool->lock, flags);
 
-			schedule_timeout (POOL_TIMEOUT_JIFFIES);
+			msleep_interruptible(POOL_TIMEOUT_MSECS);
 
 			remove_wait_queue (&pool->waitq, &wait);
 			goto restart;

--===============40759456267936289==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40759456267936289==--
