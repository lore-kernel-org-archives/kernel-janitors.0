From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:49 +0000
Subject: [KJ] [PATCH] 21/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214749.15055.82382.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/semaphore.c b/arch/alpha/kernel/semaphore.c
index 8c8aaa2..8b16a17 100644
--- a/arch/alpha/kernel/semaphore.c
+++ b/arch/alpha/kernel/semaphore.c
@@ -9,6 +9,12 @@ #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/init.h>
 
+#ifdef CONFIG_DEBUG_SEMAPHORE
+#define DBG_SEM (fmt, args...) printk(KERN_DEBUG fmt, ## args)
+#else
+#define DBG_SEM (fmt, args...)
+#endif
+
 /*
  * This is basically the PPC semaphore scheme ported to use
  * the Alpha ll/sc sequences, so see the PPC code for
@@ -67,10 +73,8 @@ __down_failed(struct semaphore *sem)
 	struct task_struct *tsk = current;
 	DECLARE_WAITQUEUE(wait, tsk);
 
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down failed(%p)\n",
+	DBG_SEM("%s(%d): down failed(%p)\n",
 	       tsk->comm, tsk->pid, sem);
-#endif
 
 	tsk->state = TASK_UNINTERRUPTIBLE;
 	wmb();
@@ -96,10 +100,8 @@ #endif
 	 */
 	wake_up(&sem->wait);
 
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down acquired(%p)\n",
+	DBG_SEM("%s(%d): down acquired(%p)\n",
 	       tsk->comm, tsk->pid, sem);
-#endif
 }
 
 int __sched
@@ -109,10 +111,8 @@ __down_failed_interruptible(struct semap
 	DECLARE_WAITQUEUE(wait, tsk);
 	long ret = 0;
 
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down failed(%p)\n",
+	DBG_SEM("%s(%d): down failed(%p)\n",
 	       tsk->comm, tsk->pid, sem);
-#endif
 
 	tsk->state = TASK_INTERRUPTIBLE;
 	wmb();
@@ -137,11 +137,9 @@ #endif
 	tsk->state = TASK_RUNNING;
 	wake_up(&sem->wait);
 
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down %s(%p)\n",
+	DBG_SEM("%s(%d): down %s(%p)\n",
 	       current->comm, current->pid,
 	       (ret < 0 ? "interrupted" : "acquired"), sem);
-#endif
 	return ret;
 }
 
@@ -166,11 +164,9 @@ down(struct semaphore *sem)
 #ifdef WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down(%p) <count=%d> from %p\n",
+	DBG_SEM("%s(%d): down(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
-#endif
 	__down(sem);
 }
 
@@ -180,11 +176,9 @@ down_interruptible(struct semaphore *sem
 #ifdef WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down(%p) <count=%d> from %p\n",
+	DBG_SEM("%s(%d): down(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
-#endif
 	return __down_interruptible(sem);
 }
 
@@ -199,12 +193,10 @@ #endif
 
 	ret = __down_trylock(sem);
 
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down_trylock %s from %p\n",
+	DBG_SEM("%s(%d): down_trylock %s from %p\n",
 	       current->comm, current->pid,
 	       ret ? "failed" : "acquired",
 	       __builtin_return_address(0));
-#endif
 
 	return ret;
 }
@@ -215,10 +207,8 @@ up(struct semaphore *sem)
 #ifdef WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
-#ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): up(%p) <count=%d> from %p\n",
+	DBG_SEM("%s(%d): up(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
-#endif
 	__up(sem);
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
