From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 21:06:09 +0000
Subject: [KJ] [PATCH 6/22] block/xd: replace schedule_timeout() with msleep()
Message-Id: <20050117210609.GH24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30212108629749945=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30212108629749945==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code wishes to sleep for 1 jiffy, but I am not
sure if this is actually intended, as with the change to HZ=1000, the time
equivalent of 1 jiffy changed from 10ms to 1ms. I have assumed the former in
this case; however the patch can be easily changed to assume the latter.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/xd.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/xd.c	2005-01-16 21:14:56.000000000 -0800
@@ -47,6 +47,7 @@
 #include <linux/wait.h>
 #include <linux/blkdev.h>
 #include <linux/blkpg.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -529,10 +530,8 @@ static inline u_char xd_waitport (u_shor
 	int success;
 
 	xdc_busy = 1;
-	while ((success = ((inb(port) & mask) != flags)) && time_before(jiffies, expiry)) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1);
-	}
+	while ((success = ((inb(port) & mask) != flags)) && time_before(jiffies, expiry))
+		msleep(10);
 	xdc_busy = 0;
 	return (success);
 }

--===============30212108629749945==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30212108629749945==--
