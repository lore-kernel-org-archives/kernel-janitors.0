From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:59:11 +0000
Subject: [Kernel-janitors] [PATCH] video/saa7134-core: replace
Message-Id: <20040726225911.GU1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82171563721853413=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82171563721853413==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/saa7134/saa7134-core.c	2004-06-16 05:19:10.000000000 +0000
+++ linux-dev/drivers/media/video/saa7134/saa7134-core.c	2004-07-21 17:24:51.000000000 +0000
@@ -27,6 +27,7 @@
 #include <linux/kmod.h>
 #include <linux/sound.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 
 #include "saa7134-reg.h"
 #include "saa7134.h"
@@ -901,8 +902,7 @@ static int __devinit saa7134_initdev(str
 	}
 
 	/* wait a bit, register i2c bus */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 	saa7134_i2c_register(dev);
 
 	/* initialize hardware #2 */

--===============82171563721853413==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82171563721853413==--
