From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][19/26] drivers/video/kyro/* - compile warning cleanup
Message-Id: <420BEF84.32422.5872E2@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0078471518223679482=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0078471518223679482==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/video/kyro/fbdev.c linux-2.6.11-rc3-mm/drivers/video/kyro/fbdev.c
--- linux-2.6.11-rc3-mm-original/drivers/video/kyro/fbdev.c	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/video/kyro/fbdev.c	2005-02-08 18:40:40.000000000 +0200
@@ -596,7 +596,10 @@ static int kyrofb_ioctl(struct inode *in
 
 	switch (cmd) {
 	case KYRO_IOCTL_OVERLAY_CREATE:
-		copy_from_user(&ol_create, argp, sizeof(overlay_create));
+		if (copy_from_user(&ol_create, argp, sizeof(overlay_create))) {
+			printk(KERN_ERR "copy_from_user failed!\n");
+			return -EFAULT;
+		}
 
 		if (kyro_dev_overlay_create(ol_create.ulWidth,
 					    ol_create.ulHeight, 0) < 0) {
@@ -606,8 +609,11 @@ static int kyrofb_ioctl(struct inode *in
 		}
 		break;
 	case KYRO_IOCTL_OVERLAY_VIEWPORT_SET:
-		copy_from_user(&ol_viewport_set, argp,
-			       sizeof(overlay_viewport_set));
+		if (copy_from_user(&ol_viewport_set, argp,
+			       sizeof(overlay_viewport_set))) {
+			printk(KERN_ERR "copy_from_user failed!\n");
+			return -EFAULT;
+		}
 
 		if (kyro_dev_overlay_viewport_set(ol_viewport_set.xOrgin,
 						  ol_viewport_set.yOrgin,
@@ -627,13 +633,22 @@ static int kyrofb_ioctl(struct inode *in
 		}
 		break;
 	case KYRO_IOCTL_UVSTRIDE:
-		copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	case KYRO_IOCTL_STRIDE:
-		copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	case KYRO_IOCTL_OVERLAY_OFFSET:
-		copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	}
 




--===============0078471518223679482==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0078471518223679482==--
