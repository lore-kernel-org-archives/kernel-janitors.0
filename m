From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 21:01:22 +0000
Subject: [Kernel-janitors] [PATCH] sis-agp: replace schedule_timeout() with
Message-Id: <20040720210122.GF2959@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56965950633644757=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56965950633644757==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/agp/sis-agp.c	2004-06-16 05:18:56.000000000 +0000
+++ linux-dev/drivers/char/agp/sis-agp.c	2004-07-15 23:11:23.000000000 +0000
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/agp_backend.h>
 #include "agp.h"
 
@@ -102,8 +103,7 @@ static void sis_delayed_enable(u32 mode)
 		 */
 		if (device->device == agp_bridge->dev->device) {
 			printk(KERN_INFO PFX "SiS delay workaround: giving bridge time to recover.\n");
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout (1+(HZ*10)/1000);
+			msleep(HZ);		/* sleep 1s */
 		}
 	}
 }

--===============56965950633644757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56965950633644757==--
