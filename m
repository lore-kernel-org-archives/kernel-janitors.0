From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:30:34 +0000
Subject: [KJ] [PATCH] message/mptbase: replace schedule_timeout() with
Message-Id: <20041022233034.GE18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72400740447941847=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72400740447941847==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Uses msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/message/fusion/mptbase.c	2004-10-22 10:41:45.000000000 -0700
+++ 2.6.9-bk7/drivers/message/fusion/mptbase.c	2004-10-22 14:54:57.000000000 -0700
@@ -3171,8 +3171,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1000 * HZ / 1000);
+					msleep_interruptible(1000);
 				} else {
 					mdelay (1000);
 				}

--===============72400740447941847==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72400740447941847==--
