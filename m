From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:03:43 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 12/17] media/saa7134-core:
Message-Id: <20040920220343.GR2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31073020211656743=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31073020211656743==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/saa7134/saa7134-core.c	2004-09-13 17:15:39.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/saa7134/saa7134-core.c	2004-09-17 14:53:50.000000000 -0700
@@ -27,6 +27,7 @@
 #include <linux/kmod.h>
 #include <linux/sound.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 
 #include "saa7134-reg.h"
 #include "saa7134.h"
@@ -910,8 +911,7 @@ static int __devinit saa7134_initdev(str
 	}
 
 	/* wait a bit, register i2c bus */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep_interruptible(100);
 	saa7134_i2c_register(dev);
 
 	/* initialize hardware #2 */

--===============31073020211656743==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31073020211656743==--
