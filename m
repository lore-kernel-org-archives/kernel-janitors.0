From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 16:57:28 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 14/33] char/isicom: replace
Message-Id: <20040916165728.GG1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80522727308007314=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80522727308007314==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/isicom.c	2004-09-09 23:05:39.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/isicom.c	2004-09-10 11:00:15.000000000 -0700
@@ -1126,11 +1126,10 @@ static void isicom_close(struct tty_stru
 	port->tty = NULL;
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
 #ifdef ISICOM_DEBUG			
 			printk(KERN_DEBUG "ISICOM: scheduling until time out.\n");
 #endif			
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(jiffies_to_msecs(port->close_delay));
 		}
 		wake_up_interruptible(&port->open_wait);
 	}	

--===============80522727308007314==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80522727308007314==--
