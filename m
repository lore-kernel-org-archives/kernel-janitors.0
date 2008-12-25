From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 14:34:44 +0000
Subject: [PATCH 5/7] drivers/staging/comedi: Use DEFINE_SPINLOCK
Message-Id: <Pine.LNX.4.64.0812251534260.22039@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ds@schleef.org, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
in Documentation/spinlocks.txt

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/staging/comedi/rt_pend_tq.c b/drivers/staging/comedi/rt_pend_tq.c
--- a/drivers/staging/comedi/rt_pend_tq.c
+++ b/drivers/staging/comedi/rt_pend_tq.c
@@ -25,7 +25,7 @@ volatile static struct rt_pend_tq rt_pen
 volatile static struct rt_pend_tq *volatile rt_pend_head = rt_pend_tq,
 	*volatile rt_pend_tail = rt_pend_tq;
 int rt_pend_tq_irq = 0;
-spinlock_t rt_pend_tq_lock = SPIN_LOCK_UNLOCKED;
+DEFINE_SPINLOCK(rt_pend_tq_lock);
 
 // WARNING: following code not checked against race conditions yet.
 #define INC_CIRCULAR_PTR(ptr,begin,size) do {if(++(ptr)>=(begin)+(size)) (ptr)=(begin); } while(0)
