From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Sat, 21 Jul 2012 18:27:35 +0000
Subject: Re: [rcu:rcu:smp:hotplug 3/6] softirq.c:(.init.text+0x540): undefined reference to `smpboot_register
Message-Id: <20120721182735.GG2435@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <500aeafe.TGJ6m5FSx2bYXZFx%fengguang.wu@intel.com>
In-Reply-To: <500aeafe.TGJ6m5FSx2bYXZFx%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 22, 2012 at 01:46:38AM +0800, Fengguang Wu wrote:
> Hi Thomas,
> 
> Kernel build failed on
> 
> tree:   rcu/rcu/smp/hotplug rcu/smp/hotplug
> head:   d03fca4cf521da26494755d7ea507144911132a8
> commit: e4bf0a283afe045c05947dc46fb7c995f6cc5fba [3/6] softirq: Use hotplug thread infrastructure
> config: x86_64-randconfig-s002 (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/built-in.o: In function `spawn_ksoftirqd':
> softirq.c:(.init.text+0x540): undefined reference to `smpboot_register_percpu_thread'

Hello, Fengguang,

Does the following patch help?

							Thanx, Paul

------------------------------------------------------------------------


hotplug: Fix UP bug in smpboot hotplug code

Because kernel subsystems need their per-CPU kthreads on UP systems
as well as on SMP systems, the smpboot hotplug kthread functions
must be provided in UP builds as well as in SMP builds.  This commit
therefore adds smpboot.c to UP builds and excludes irrelevant code
via #ifdef.

Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/Makefile b/kernel/Makefile
index c0cc67a..e5602d3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -10,7 +10,7 @@ obj-y     = fork.o exec_domain.o panic.o printk.o \
 	    kthread.o wait.o kfifo.o sys_ni.o posix-cpu-timers.o mutex.o \
 	    hrtimer.o rwsem.o nsproxy.o srcu.o semaphore.o \
 	    notifier.o ksysfs.o cred.o \
-	    async.o range.o groups.o lglock.o
+	    async.o range.o groups.o lglock.o smpboot.o
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace debug files and internal ftrace files
@@ -46,7 +46,6 @@ obj-$(CONFIG_DEBUG_RT_MUTEXES) += rtmutex-debug.o
 obj-$(CONFIG_RT_MUTEX_TESTER) += rtmutex-tester.o
 obj-$(CONFIG_GENERIC_ISA_DMA) += dma.o
 obj-$(CONFIG_SMP) += smp.o
-obj-$(CONFIG_SMP) += smpboot.o
 ifneq ($(CONFIG_SMP),y)
 obj-y += up.o
 endif
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index e17653d..6b0d6fe 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -15,6 +15,8 @@
 
 #include "smpboot.h"
 
+#ifdef CONFIG_SMP
+
 #ifdef CONFIG_GENERIC_SMP_IDLE_THREAD
 /*
  * For the hotplug case we keep the task structs around and reuse
@@ -67,6 +69,8 @@ void __init idle_threads_init(void)
 }
 #endif
 
+#endif /* #ifdef CONFIG_SMP */
+
 static LIST_HEAD(hotplug_threads);
 static DEFINE_MUTEX(smpboot_threads_lock);
 

