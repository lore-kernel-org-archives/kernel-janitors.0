From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:54:31 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/17] media/ovcamchip_core:
Message-Id: <20040920215431.GN2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============086741006751388738=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============086741006751388738==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/ovcamchip/ovcamchip_core.c	2004-09-13 17:15:39.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/ovcamchip/ovcamchip_core.c	2004-09-20 14:53:01.000000000 -0700
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include "ovcamchip_priv.h"
 
 #define DRIVER_VERSION "v2.27 for Linux 2.6"
@@ -128,8 +129,7 @@ static int init_camchip(struct i2c_clien
 	ov_write(c, 0x12, 0x80);
 
 	/* Wait for it to initialize */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(1 + 150 * HZ / 1000);
+	msleep(150);
 
 	for (i = 0, success = 0; i < I2C_DETECT_RETRIES && !success; i++) {
 		if (ov_read(c, GENERIC_REG_ID_HIGH, &high) >= 0) {
@@ -145,8 +145,7 @@ static int init_camchip(struct i2c_clien
 		ov_write(c, 0x12, 0x80);
 
 		/* Wait for it to initialize */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1 + 150 * HZ / 1000);
+		msleep(150);
 
 		/* Dummy read to sync I2C */
 		ov_read(c, 0x00, &low);

--===============086741006751388738==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============086741006751388738==--
