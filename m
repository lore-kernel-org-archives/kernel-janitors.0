From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:53:09 +0000
Subject: [Kernel-janitors] [PATCH] video/cx88: replace schedule_timeout()
Message-Id: <20040726225309.GP1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19402346334993537=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19402346334993537==
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


--- linux-vanilla/drivers/media/video/cx88/cx88-video.c	2004-06-16 05:19:35.000000000 +0000
+++ linux-dev/drivers/media/video/cx88/cx88-video.c	2004-07-21 17:23:49.000000000 +0000
@@ -28,6 +28,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include <asm/div64.h>
 
 #include "cx88.h"
@@ -471,8 +472,7 @@ static int set_pll(struct cx8800_dev *de
 			return 0;
 		}
 		dprintk(1,"pll not locked yet, waiting ...\n");
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 	dprintk(1,"pll NOT locked [pre=%d,ofreq=%d]\n",prescale,ofreq);
 	return -1;
@@ -2201,8 +2201,7 @@ static int cx8800_reset(struct cx8800_de
 	cx_write(MO_INT1_STAT,   0xFFFFFFFF); // Clear RISC int
 
 	/* wait a bit */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 	
 	/* init sram */
 	cx88_sram_channel_setup(dev, &cx88_sram_channels[SRAM_CH21], 720*4, 0);

--===============19402346334993537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19402346334993537==--
