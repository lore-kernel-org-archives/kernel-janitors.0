From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 08:48:42 +0000
Subject: [KJ] printk : arch/alpha/kernel/semaphore.c
Message-Id: <20050923084842.GF10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0074769724375993718=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0074769724375993718==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



Index: linux-2.6.14-rc2/arch/alpha/kernel/semaphore.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/semaphore.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/semaphore.c
@@ -68,7 +68,7 @@ __down_failed(struct semaphore *sem)
 	DECLARE_WAITQUEUE(wait, tsk);
 
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down failed(%p)\n",
+	printk(KERN_DEBUG "%s(%d): down failed(%p)\n",
 	       tsk->comm, tsk->pid, sem);
 #endif
 
@@ -97,7 +97,7 @@ __down_failed(struct semaphore *sem)
 	wake_up(&sem->wait);
 
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down acquired(%p)\n",
+	printk(KERN_DEBUG "%s(%d): down acquired(%p)\n",
 	       tsk->comm, tsk->pid, sem);
 #endif
 }
@@ -110,7 +110,7 @@ __down_failed_interruptible(struct semap
 	long ret = 0;
 
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down failed(%p)\n",
+	printk(KERN_DEBUG "%s(%d): down failed(%p)\n",
 	       tsk->comm, tsk->pid, sem);
 #endif
 
@@ -138,7 +138,7 @@ __down_failed_interruptible(struct semap
 	wake_up(&sem->wait);
 
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down %s(%p)\n",
+	printk(KERN_DEBUG "%s(%d): down %s(%p)\n",
 	       current->comm, current->pid,
 	       (ret < 0 ? "interrupted" : "acquired"), sem);
 #endif
@@ -167,7 +167,7 @@ down(struct semaphore *sem)
 	CHECK_MAGIC(sem->__magic);
 #endif
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down(%p) <count=%d> from %p\n",
+	printk(KERN_DEBUG "%s(%d): down(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
 #endif
@@ -181,7 +181,7 @@ down_interruptible(struct semaphore *sem
 	CHECK_MAGIC(sem->__magic);
 #endif
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down(%p) <count=%d> from %p\n",
+	printk(KERN_DEBUG "%s(%d): down(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
 #endif
@@ -200,7 +200,7 @@ down_trylock(struct semaphore *sem)
 	ret = __down_trylock(sem);
 
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): down_trylock %s from %p\n",
+	printk(KERN_DEBUG "%s(%d): down_trylock %s from %p\n",
 	       current->comm, current->pid,
 	       ret ? "failed" : "acquired",
 	       __builtin_return_address(0));
@@ -216,7 +216,7 @@ up(struct semaphore *sem)
 	CHECK_MAGIC(sem->__magic);
 #endif
 #ifdef CONFIG_DEBUG_SEMAPHORE
-	printk("%s(%d): up(%p) <count=%d> from %p\n",
+	printk(KERN_DEBUG "%s(%d): up(%p) <count=%d> from %p\n",
 	       current->comm, current->pid, sem,
 	       atomic_read(&sem->count), __builtin_return_address(0));
 #endif


--===============0074769724375993718==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0074769724375993718==--
