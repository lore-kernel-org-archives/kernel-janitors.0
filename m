From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:15:49 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 25/33] char/specialix: replace
Message-Id: <20040916211549.GS1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31384108127605326=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31384108127605326==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/specialix.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/specialix.c	2004-09-10 11:17:09.000000000 -0700
@@ -1452,8 +1452,7 @@ static void sx_close(struct tty_struct *
 		 */
 		timeout = jiffies+HZ;
 		while(port->IER & IER_TXEMPTY) {
-			current->state = TASK_INTERRUPTIBLE;
- 			schedule_timeout(port->timeout);
+			msleep_interruptible(jiffies_to_msecs(port->timeout));
 			if (time_after(jiffies, timeout)) {
 				printk (KERN_INFO "Timeout waiting for close\n");
 				break;
@@ -1471,8 +1470,7 @@ static void sx_close(struct tty_struct *
 	port->tty = NULL;
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(jiffies_to_msecs(port->close_delay));
 		}
 		wake_up_interruptible(&port->open_wait);
 	}

--===============31384108127605326==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31384108127605326==--
