From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:46:05 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-zoltrix: replace
Message-Id: <20040726224605.GL1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56005372601542858=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56005372601542858==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replaced sleep_delay() with schedule() in all locations. Removed definition of sleep_delay().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-zoltrix.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-zoltrix.c	2004-07-02 20:49:33.000000000 +0000
@@ -54,12 +54,6 @@ struct zol_device {
 
 /* local things */
 
-static void sleep_delay(void)
-{
-	/* Sleep nicely for +/- 10 mS */
-	schedule();
-}
-
 static int zol_setvol(struct zol_device *dev, int vol)
 {
 	dev->curvol = vol;
@@ -76,7 +70,7 @@ static int zol_setvol(struct zol_device 
 	}
 
 	outb(dev->curvol-1, io);
-	sleep_delay();
+	schedule();
 	inb(io + 2);
 	up(&dev->lock);
 	return 0;
@@ -176,11 +170,11 @@ int zol_getsigstr(struct zol_device *dev
 	down(&dev->lock);
 	outb(0x00, io);         /* This stuff I found to do nothing */
 	outb(dev->curvol, io);
-	sleep_delay();
-	sleep_delay();
+	schedule();
+	schedule();
 
 	a = inb(io);
-	sleep_delay();
+	schedule();
 	b = inb(io);
 
 	up(&dev->lock);
@@ -202,11 +196,11 @@ int zol_is_stereo (struct zol_device *de
 	
 	outb(0x00, io);
 	outb(dev->curvol, io);
-	sleep_delay();
-	sleep_delay();
+	schedule();
+	schedule();
 
 	x1 = inb(io);
-	sleep_delay();
+	schedule();
 	x2 = inb(io);
 
 	up(&dev->lock);
@@ -368,8 +362,8 @@ static int __init zoltrix_init(void)
 
 	outb(0, io);
 	outb(0, io);
-	sleep_delay();
-	sleep_delay();
+	schedule();
+	schedule();
 	inb(io + 3);
 
 	zoltrix_unit.curvol = 0;

--===============56005372601542858==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56005372601542858==--
