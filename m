From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:59:50 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 10/17] media/saa5249: replace
Message-Id: <20040920215950.GP2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26614576278745394=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26614576278745394==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/media/video/saa5249.c	2004-09-09 23:05:26.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/media/video/saa5249.c	2004-09-10 11:55:47.000000000 -0700
@@ -273,8 +273,7 @@ static void jdelay(unsigned long delay) 
 	sigfillset(&current->blocked);
 	recalc_sigpending();
 	spin_unlock_irq(&current->sighand->siglock);
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(delay);
+	msleep_interruptible(jiffies_to_msecs(delay));
 
 	spin_lock_irq(&current->sighand->siglock);
 	current->blocked = oldblocked;

--===============26614576278745394==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26614576278745394==--
