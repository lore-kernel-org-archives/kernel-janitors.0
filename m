From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 06 Apr 2005 17:07:25 +0000
Subject: [KJ] [PATCH] kernel/softlockup: fix usage of msleep_interruptible()
Message-Id: <20050406170725.GB2681@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11293175485870766=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11293175485870766==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description: Jiffies are incorrectly being passed into
msleep_interruptible(), which expects milliseconds. Also, the state does
not need to be set before calling msleep_interruptible(), as it will
take care of it.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-current-mm/kernel/softlockup.c	2005-04-05 09:26:10.000000000 -0700
+++ 2.6.12-rc2-mm1/kernel/softlockup.c	2005-04-06 10:05:39.000000000 -0700
@@ -69,8 +69,7 @@ static int watchdog(void * __bind_cpu)
 	 * in softlockup_tick():
 	 */
 	while (!kthread_should_stop()) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		msleep_interruptible(HZ);
+		msleep_interruptible(1000);
 		touch_softlockup_watchdog();
 	}
 	__set_current_state(TASK_RUNNING);

--===============11293175485870766==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11293175485870766==--
