From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 18:25:33 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 23/33] char/serial167: replace
Message-Id: <20040916182533.GQ1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83324834320696106=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83324834320696106==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/serial167.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/serial167.c	2004-09-10 11:16:21.000000000 -0700
@@ -1856,8 +1856,7 @@ cy_close(struct tty_struct * tty, struct
     }
     if (info->blocked_open) {
 	if (info->close_delay) {
-	    current->state = TASK_INTERRUPTIBLE;
-	    schedule_timeout(info->close_delay);
+	    msleep_interruptible(jiffies_to_msecs(info->close_delay));
 	}
 	wake_up_interruptible(&info->open_wait);
     }

--===============83324834320696106==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83324834320696106==--
