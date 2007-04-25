From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 25 Apr 2007 06:50:58 +0000
Subject: [KJ] [PATCH]:Replacing current->state with set_current_state in
Message-Id: <1177483138.27118.25.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,

Replacing current->state with set_current_state in kernel/signal.c
	

thanks.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----


diff --git a/kernel/signal.c b/kernel/signal.c
index 3670225..44e2cf3 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -2596,7 +2596,7 @@ sys_signal(int sig, __sighandler_t handler)
 asmlinkage long
 sys_pause(void)
 {
-       current->state = TASK_INTERRUPTIBLE;
+       set_current_state(TASK_INTERRUPTIBLE);
        schedule();
        return -ERESTARTNOHAND;
 }
@@ -2622,7 +2622,7 @@ asmlinkage long sys_rt_sigsuspend(sigset_t __user *unewset, size_t sigsetsize)
        recalc_sigpending();
        spin_unlock_irq(&current->sighand->siglock);

-       current->state = TASK_INTERRUPTIBLE;
+       set_current_state(TASK_INTERRUPTIBLE);
        schedule();
        set_thread_flag(TIF_RESTORE_SIGMASK);
        return -ERESTARTNOHAND;

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
