From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:11:59 +0000
Subject: [Kernel-janitors] [PATCH] usb/ov511: replace schedule_timeout()
Message-Id: <20040727231159.GL4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8929945010730016=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8929945010730016==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/media/ov511.c	2004-06-16 05:19:10.000000000 +0000
+++ linux-dev/drivers/usb/media/ov511.c	2004-07-13 20:29:29.000000000 +0000
@@ -1169,7 +1169,7 @@ init_ov_sensor(struct usb_ov511 *ov)
 		return -EIO;
 
 	/* Wait for it to initialize */
-	schedule_timeout(1 + 150 * HZ / 1000);
+	msleep(150);
 
 	for (i = 0, success = 0; i < i2c_detect_tries && !success; i++) {
 		if ((i2c_r(ov, OV7610_REG_ID_HIGH) == 0x7F) &&
@@ -1182,7 +1182,7 @@ init_ov_sensor(struct usb_ov511 *ov)
 		if (i2c_w(ov, 0x12, 0x80) < 0)
 			return -EIO;
 		/* Wait for it to initialize */
-		schedule_timeout(1 + 150 * HZ / 1000);
+		msleep(150);
 		/* Dummy read to sync I2C */
 		if (i2c_r(ov, 0x00) < 0)
 			return -EIO;
@@ -4947,7 +4947,7 @@ ov7xx0_configure(struct usb_ov511 *ov)
 			return -1;
 
 		/* Wait for it to initialize */
-		schedule_timeout(1 + 150 * HZ / 1000);
+		msleep(150);
 
 		i = 0;
 		success = 0;

--===============8929945010730016==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8929945010730016==--
