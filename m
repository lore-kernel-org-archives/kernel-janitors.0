From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:22:00 +0000
Subject: [KJ] [PATCH 10/20] lockd/svc: remove
Message-Id: <20050202192200.GM2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51023985827550344=="
List-Id: <kernel-janitors.vger.kernel.org>
To: okir@monad.swb.de, matthew@wil.cx
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============51023985827550344==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/fs/lockd/svc.c	2005-01-24 09:34:17.000000000 -0800
+++ 2.6.11-rc2-kj/fs/lockd/svc.c	2005-01-27 11:11:50.000000000 -0800
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #include <linux/sunrpc/types.h>
 #include <linux/sunrpc/stats.h>
@@ -281,6 +282,7 @@ EXPORT_SYMBOL(lockd_up);
 void
 lockd_down(void)
 {
+	DEFINE_WAIT(wait);
 	static int warned;
 
 	down(&nlmsvc_sema);
@@ -303,7 +305,9 @@ lockd_down(void)
 	 * the lockd semaphore, we can't wait around forever ...
 	 */
 	clear_thread_flag(TIF_SIGPENDING);
-	interruptible_sleep_on_timeout(&lockd_exit, HZ);
+	prepare_to_wait(&lockd_exit, &wait, TASK_INTERRUPTIBLE);
+	schedule_timeout(HZ);
+	finish_wait(&lockd_exit, &wait);
 	if (nlmsvc_pid) {
 		printk(KERN_WARNING 
 			"lockd_down: lockd failed to exit, clearing pid\n");

--===============51023985827550344==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51023985827550344==--
