From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 17:24:12 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] sbus/aurora: replace
Message-Id: <20040927172412.GK1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54407434556954559=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221217.GZ2270@us.ibm.com>
In-Reply-To: <20040920221217.GZ2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============54407434556954559==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/sbus/char/aurora.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/sbus/char/aurora.c	2004-09-10 15:37:43.000000000 -0700
@@ -1519,8 +1519,7 @@ static void aurora_close(struct tty_stru
 		 */
 		timeout = jiffies+HZ;
 		while(port->SRER & SRER_TXEMPTY)  {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->timeout);
+			msleep_interruptible(jiffies_to_msecs(port->timeout));
 			if (time_after(jiffies, timeout))
 				break;
 		}
@@ -1538,8 +1537,7 @@ static void aurora_close(struct tty_stru
 	port->tty = 0;
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(port->close_delay);
 		}
 		wake_up_interruptible(&port->open_wait);
 	}

--===============54407434556954559==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54407434556954559==--
