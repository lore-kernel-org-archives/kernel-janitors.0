From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 18:54:54 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 24/33] char/sis-agp: replace
Message-Id: <20040916185454.GR1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38042522858961503=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38042522858961503==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/agp/sis-agp.c	2004-09-13 17:15:48.000000000 -0700
+++ 2.6.9-rc2/drivers/char/agp/sis-agp.c	2004-09-15 13:53:13.000000000 -0700
@@ -6,6 +6,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/agp_backend.h>
+#include <linux/delay.h>
 #include "agp.h"
 
 #define SIS_ATTBASE	0x90
@@ -102,8 +103,7 @@ static void sis_delayed_enable(u32 mode)
 		 */
 		if (device->device == agp_bridge->dev->device) {
 			printk(KERN_INFO PFX "SiS delay workaround: giving bridge time to recover.\n");
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout (1+(HZ*10)/1000);
+			msleep(10);
 		}
 	}
 }

--===============38042522858961503==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38042522858961503==--
