From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Mon, 16 Apr 2007 17:53:55 +0000
Subject: [KJ] [PATCH]Rocket port:use mutex instead of binary  semaphore
Message-Id: <20070416174155.GA9314@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adabqho8b65.fsf@cisco.com>
In-Reply-To: <adabqho8b65.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrw Morton <akpm@linux-foundation.org>

Use mutex instead of binary semaphore for mutual exclusion.

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 rocket.c     |   22 ++++++++++++----------
 rocket_int.h |    2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)


diff --git a/drivers/char/rocket.c b/drivers/char/rocket.c
index 76357c8..07255c3 100644
--- a/drivers/char/rocket.c
+++ b/drivers/char/rocket.c
@@ -35,7 +35,7 @@
  *    is data to be transmitted.  Protected by atomic bit operations.
  * -  rp_num_ports, int indicating number of open ports, protected by atomic operations.
  * 
- * rp_write() and rp_write_char() functions use a per port semaphore to protect against
+ * rp_write() and rp_write_char() functions use a per port mutex to protect against
  * simultaneous access to the same port by more than one process.
  */
 
@@ -67,7 +67,7 @@
 
 #ifdef MODVERSIONS
 #include <config/modversions.h>
-#endif				
+#endif
 
 #include <linux/module.h>
 #include <linux/errno.h>
@@ -93,7 +93,7 @@
 #include <asm/atomic.h>
 #include <linux/bitops.h>
 #include <linux/spinlock.h>
-#include <asm/semaphore.h>
+#include <linux/mutex.h>
 #include <linux/init.h>
 
 /****** RocketPort includes ******/
@@ -702,7 +702,7 @@ static void init_r_port(int board, int aiop, int chan, struct pci_dev *pci_dev)
 		}
 	}
 	spin_lock_init(&info->slock);
-	sema_init(&info->write_sem, 1);
+	mutex_init(&info->write_lock);
 	rp_table[line] = info;
 	if (pci_dev)
 		tty_register_device(rocket_driver, line, &pci_dev->dev);
@@ -1661,8 +1661,8 @@ static void rp_put_char(struct tty_struct *tty, unsigned char ch)
 	if (rocket_paranoia_check(info, "rp_put_char"))
 		return;
 
-	/*  Grab the port write semaphore, locking out other processes that try to write to this port */
-	down(&info->write_sem);
+	/*  Grab the port write mutex, locking out other processes that try to write to this port */
+	mutex_lock(&info->write_lock);
 
 #ifdef ROCKET_DEBUG_WRITE
 	printk(KERN_INFO "rp_put_char %c...", ch);
@@ -1684,12 +1684,12 @@ static void rp_put_char(struct tty_struct *tty, unsigned char ch)
 		info->xmit_fifo_room--;
 	}
 	spin_unlock_irqrestore(&info->slock, flags);
-	up(&info->write_sem);
+	mutex_unlock(&info->write_lock);
 }
 
 /*
  *  Exception handler - write routine, called when user app writes to the device.
- *  A per port write semaphore is used to protect from another process writing to
+ *  A per port write mutex is used to protect from another process writing to
  *  this port at the same time.  This other process could be running on the other CPU
  *  or get control of the CPU if the copy_from_user() blocks due to a page fault (swapped out). 
  *  Spinlocks protect the info xmit members.
@@ -1706,7 +1706,9 @@ static int rp_write(struct tty_struct *tty,
 	if (count <= 0 || rocket_paranoia_check(info, "rp_write"))
 		return 0;
 
-	down_interruptible(&info->write_sem);
+	if(mutex_lock_interruptible(&info->write_lock)){
+		return -ERESTARTSYS;
+	}
 
 #ifdef ROCKET_DEBUG_WRITE
 	printk(KERN_INFO "rp_write %d chars...", count);
@@ -1777,7 +1779,7 @@ end:
 		wake_up_interruptible(&tty->poll_wait);
 #endif
 	}
-	up(&info->write_sem);
+	mutex_unlock(&info->write_lock);
 	return retval;
 }
 
diff --git a/drivers/char/rocket_int.h b/drivers/char/rocket_int.h
index 3a8bcc8..e91a1cb 100644
--- a/drivers/char/rocket_int.h
+++ b/drivers/char/rocket_int.h
@@ -1171,7 +1171,7 @@ struct r_port {
 	struct wait_queue *close_wait;
 #endif
 	spinlock_t slock;
-	struct semaphore write_sem;
+	struct mutex write_lock;
 };
 
 #define RPORT_MAGIC 0x525001

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
