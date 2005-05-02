From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 02 May 2005 06:18:24 +0000
Subject: [KJ] [PATCH] i386/apm: use wait_event_interruptible_timeout()
Message-Id: <20050502061824.GC10173@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============081532362627680044=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============081532362627680044==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use wait_event_interruptible_timeout() instead of custom wait-queue.


Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc3/arch/i386/kernel/apm.c	2005-04-29 11:03:03.000000000 -0700
+++ 2.6.12-rc3-dev/arch/i386/kernel/apm.c	2005-05-01 19:02:48.000000000 -0700
@@ -224,6 +224,7 @@
 #include <linux/smp_lock.h>
 #include <linux/dmi.h>
 #include <linux/suspend.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/uaccess.h>
@@ -1418,22 +1419,15 @@ static void apm_event_handler(void)
 
 static void apm_mainloop(void)
 {
-	DECLARE_WAITQUEUE(wait, current);
-
-	add_wait_queue(&apm_waitqueue, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
-	for (;;) {
-		schedule_timeout(APM_CHECK_TIMEOUT);
-		if (exit_kapmd)
-			break;
+	do {
+		wait_event_interruptible_timeout(apm_waitqueue,
+				exit_kapmd, APM_CHECK_TIMEOUT);
 		/*
 		 * Ok, check all events, check for idle (and mark us sleeping
 		 * so as not to count towards the load average)..
 		 */
-		set_current_state(TASK_INTERRUPTIBLE);
 		apm_event_handler();
-	}
-	remove_wait_queue(&apm_waitqueue, &wait);
+	} while (!exit_kapmd);
 }
 
 static int check_apm_user(struct apm_user *as, const char *func)

--===============081532362627680044==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============081532362627680044==--
