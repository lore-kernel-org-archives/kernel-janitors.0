From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 23 Oct 2004 00:00:56 +0000
Subject: [KJ] [PATCH] w1/w1_family: replace schedule_timeout() with
Message-Id: <20041023000056.GP18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74468956417388732=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74468956417388732==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-bk7-vanilla/drivers/w1/w1_family.c	2004-10-22 10:41:43.000000000 -0700
+++ 2.6.9-bk7/drivers/w1/w1_family.c	2004-10-22 16:07:20.000000000 -0700
@@ -87,10 +87,8 @@ void w1_unregister_family(struct w1_fami
 	while (atomic_read(&fent->refcnt)) {
 		printk(KERN_INFO "Waiting for family %u to become free: refcnt=%d.\n",
 				fent->fid, atomic_read(&fent->refcnt));
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
 
-		if (signal_pending(current))
+		if (msleep_interruptible(1000))
 			flush_signals(current);
 	}
 }

--===============74468956417388732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74468956417388732==--
