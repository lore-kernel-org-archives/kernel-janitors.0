From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:50:59 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/17] media/cx88-video: replace
Message-Id: <20040920215059.GL2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8544584959234387=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8544584959234387==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/cx88/cx88-video.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/cx88/cx88-video.c	2004-09-17 14:56:13.000000000 -0700
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include <asm/div64.h>
 
 #include "cx88.h"
@@ -476,8 +477,7 @@ static int set_pll(struct cx8800_dev *de
 			return 0;
 		}
 		dprintk(1,"pll not locked yet, waiting ...\n");
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 	dprintk(1,"pll NOT locked [pre=%d,ofreq=%d]\n",prescale,ofreq);
 	return -1;
@@ -2237,8 +2237,7 @@ static int cx8800_reset(struct cx8800_de
 	cx_write(MO_INT1_STAT,   0xFFFFFFFF); // Clear RISC int
 
 	/* wait a bit */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep_interruptible(100);
 	
 	/* init sram */
 	cx88_sram_channel_setup(dev, &cx88_sram_channels[SRAM_CH21], 720*4, 0);

--===============8544584959234387==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8544584959234387==--
