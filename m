From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:05:29 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 15/17] media/tda9887: replace
Message-Id: <20040920220529.GU2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32216415830812162=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32216415830812162==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/media/video/tda9887.c	2004-09-09 23:05:26.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/media/video/tda9887.c	2004-09-13 14:27:26.000000000 -0700
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include <media/audiochip.h>
 #include <media/tuner.h>
@@ -543,8 +544,7 @@ static int tda9887_configure(struct tda9
                 printk(PREFIX "i2c i/o error: rc == %d (should be 4)\n",rc);
 
 	if (debug > 2) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
+		msleep_interruptible(1000);
 		tda9887_status(t);
 	}
 	return 0;

--===============32216415830812162==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32216415830812162==--
