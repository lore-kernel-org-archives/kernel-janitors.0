From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 22:37:50 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2] media/radio-zoltrix: replace
Message-Id: <20040921223750.GA14892@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28331132451926422=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28331132451926422==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of sleep_delay() so that the driver
sleeps as the comment indicated. I assumed that two sleep_delay()s in a
row indicated sleeping for 20ms. Please let me know if this is
incorrect.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/radio/radio-zoltrix.c	2004-09-13 17:15:39.000000000 -0700
+++ 2.6.9-rc2/drivers/media/radio/radio-zoltrix.c	2004-09-21 15:36:20.000000000 -0700
@@ -29,7 +29,7 @@
 #include <linux/module.h>	/* Modules                        */
 #include <linux/init.h>		/* Initdata                       */
 #include <linux/ioport.h>	/* check_region, request_region   */
-#include <linux/delay.h>	/* udelay                 */
+#include <linux/delay.h>	/* udelay, msleep                 */
 #include <asm/io.h>		/* outb, outb_p                   */
 #include <asm/uaccess.h>	/* copy to/from user              */
 #include <linux/videodev.h>	/* kernel radio structs           */
@@ -51,15 +51,6 @@ struct zol_device {
 	struct semaphore lock;
 };
 
-
-/* local things */
-
-static void sleep_delay(void)
-{
-	/* Sleep nicely for +/- 10 mS */
-	schedule();
-}
-
 static int zol_setvol(struct zol_device *dev, int vol)
 {
 	dev->curvol = vol;
@@ -76,7 +67,7 @@ static int zol_setvol(struct zol_device 
 	}
 
 	outb(dev->curvol-1, io);
-	sleep_delay();
+	msleep(10);
 	inb(io + 2);
 	up(&dev->lock);
 	return 0;
@@ -176,11 +167,10 @@ int zol_getsigstr(struct zol_device *dev
 	down(&dev->lock);
 	outb(0x00, io);         /* This stuff I found to do nothing */
 	outb(dev->curvol, io);
-	sleep_delay();
-	sleep_delay();
+	msleep(20);
 
 	a = inb(io);
-	sleep_delay();
+	msleep(10);
 	b = inb(io);
 
 	up(&dev->lock);
@@ -202,11 +192,10 @@ int zol_is_stereo (struct zol_device *de
 	
 	outb(0x00, io);
 	outb(dev->curvol, io);
-	sleep_delay();
-	sleep_delay();
+	msleep(20);
 
 	x1 = inb(io);
-	sleep_delay();
+	msleep(10);
 	x2 = inb(io);
 
 	up(&dev->lock);
@@ -368,8 +357,7 @@ static int __init zoltrix_init(void)
 
 	outb(0, io);
 	outb(0, io);
-	sleep_delay();
-	sleep_delay();
+	msleep(20);
 	inb(io + 3);
 
 	zoltrix_unit.curvol = 0;

--===============28331132451926422==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28331132451926422==--
