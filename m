From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 23 Oct 2004 00:01:27 +0000
Subject: [KJ] [PATCH] w1/w1: replace schedule_timeout() with
Message-Id: <20041023000127.GR18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34615194531259252=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34615194531259252==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/w1/w1.c	2004-10-22 10:41:42.000000000 -0700
+++ 2.6.9-bk7/drivers/w1/w1.c	2004-10-22 16:06:51.000000000 -0700
@@ -452,10 +452,8 @@ static void w1_slave_detach(struct w1_sl
 	while (atomic_read(&sl->refcnt)) {
 		printk(KERN_INFO "Waiting for %s to become free: refcnt=%d.\n",
 				sl->name, atomic_read(&sl->refcnt));
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
 
-		if (signal_pending(current))
+		if (msleep_interruptible(1000))
 			flush_signals(current);
 	}
 

--===============34615194531259252==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34615194531259252==--
