From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 16:47:11 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 12/33] char/ip2main: replace
Message-Id: <20040916164711.GE1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95934570531064733=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95934570531064733==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/ip2main.c	2004-09-09 23:05:42.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/ip2main.c	2004-09-10 10:58:48.000000000 -0700
@@ -1632,8 +1632,7 @@ ip2_close( PTTY tty, struct file *pFile 
 
 	if (pCh->wopen) {
 		if (pCh->ClosingDelay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(pCh->ClosingDelay);
+			msleep_interruptible(jiffies_to_msecs(pCh->ClosingDelay));
 		}
 		wake_up_interruptible(&pCh->open_wait);
 	}

--===============95934570531064733==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95934570531064733==--
