From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:43:07 +0000
Subject: [KJ] [PATCH 39/39] w1/w1_therm: replace schedule_timeout() with
Message-Id: <20050121214307.GT3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68446734293711686=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68446734293711686==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. Changed tm to an int, as it now is in
terms of msecs, not jiffies.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/w1/w1_therm.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/w1/w1_therm.c	2005-01-21 13:41:08.000000000 -0800
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 #include <linux/device.h>
 #include <linux/types.h>
+#include <linux/delay.h>
 
 #include "w1.h"
 #include "w1_io.h"
@@ -128,7 +129,7 @@ static ssize_t w1_therm_read_bin(struct 
 		if (!w1_reset_bus (dev)) {
 			int count = 0;
 			u8 match[9] = {W1_MATCH_ROM, };
-			unsigned long tm;
+			unsigned int tm = 750;
 
 			memcpy(&match[1], (u64 *) & sl->reg_num, 8);
 			
@@ -136,11 +137,8 @@ static ssize_t w1_therm_read_bin(struct 
 
 			w1_write_8(dev, W1_CONVERT_TEMP);
 
-			tm = jiffies + msecs_to_jiffies(750);
-			while(time_before(jiffies, tm)) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(tm-jiffies);
-
+			while (tm) {
+				tm = msleep_interruptible(tm);
 				if (signal_pending(current))
 					flush_signals(current);
 			}

--===============68446734293711686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68446734293711686==--
