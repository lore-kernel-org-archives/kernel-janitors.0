From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 21:16:36 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/33] char/amiserial: replace
Message-Id: <20040915211636.GF5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79835149570378916=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79835149570378916==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla//drivers/char/amiserial.c	2004-09-13 17:15:50.000000000 -0700
+++ 2.6.9-rc2/drivers/char/amiserial.c	2004-09-15 13:57:05.000000000 -0700
@@ -32,6 +32,7 @@
  */
 
 #include <linux/config.h>
+#include <linux/delay.h>
 
 #undef SERIAL_PARANOIA_CHECK
 #define SERIAL_DO_RESTART
@@ -1567,8 +1568,7 @@ static void rs_close(struct tty_struct *
 	info->tty = 0;
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -1626,8 +1626,7 @@ static void rs_wait_until_sent(struct tt
 #ifdef SERIAL_DEBUG_RS_WAIT_UNTIL_SENT
 		printk("serdatr = %d (jiff=%lu)...", lsr, jiffies);
 #endif
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (timeout && time_after(jiffies, orig_jiffies + timeout))

--===============79835149570378916==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79835149570378916==--
