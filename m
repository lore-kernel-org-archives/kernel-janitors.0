From: Richard Genoud <richard.genoud@gmail.com>
Date: Sun, 17 May 2009 11:06:32 +0000
Subject: [PATCH 3/3] rspiusb.c: duplicate code in pixis_io
Message-Id: <5ec2d25bcf5e4f86e118c2df753a18bcd850077f.1242557192.git.richard.genoud@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <128c57bf092e08fe6372f6e8c3d02fc88b62e094.1242557192.git.richard.genoud@gmail.com>
 <92fedd0af6bfccd6bb8d69f430148e4630eeeb28.1242557192.git.richard.genoud@gmail.com>
In-Reply-To: <92fedd0af6bfccd6bb8d69f430148e4630eeeb28.1242557192.git.richard.genoud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Judd Montgomery <judd@jpilot.org>, Jeff Frontz <jeff.frontz@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>

It seems that pixis_io and pixis_io2 should do the same thing.


Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/staging/rspiusb/rspiusb.c |   59 +++++--------------------------------
 1 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/rspiusb/rspiusb.c b/drivers/staging/rspiusb/rspiusb.c
index 685ab3f..090bf41 100644
--- a/drivers/staging/rspiusb/rspiusb.c
+++ b/drivers/staging/rspiusb/rspiusb.c
@@ -252,38 +252,6 @@ static int pixis_io(struct ioctl_struct *ctrl, struct device_extension *pdx,
 	return ctrl->numbytes;
 }
 
-static int pixis_io2(struct ioctl_struct *ctrl, struct device_extension *pdx,
-		struct ioctl_struct *arg)
-{
-	unsigned char *uBuf;
-	int numbytes;
-	int i;
-
-	uBuf = kmalloc(ctrl->numbytes, GFP_KERNEL);
-	if (!uBuf) {
-		dbg("Alloc for uBuf failed");
-		return 0;
-	}
-	numbytes = (int) ctrl->numbytes;
-	/* dbg( "numbytes to read = %d", numbytes ); */
-	if (copy_from_user(uBuf, ctrl->pData, numbytes))
-		dbg("copying ctrl->pData to dummyBuf failed");
-
-	i = usb_bulk_msg(pdx->udev, pdx->hEP[ctrl->endpoint],
-			uBuf, numbytes, &numbytes, HZ * 10);
-	if (i) {
-		dbg("Blocking ReadI/O Failed with status %d", i);
-		kfree(uBuf);
-		return -1;
-	}
-	ctrl->numbytes = numbytes;
-	memcpy(ctrl->pData, uBuf, numbytes);
-	if (copy_to_user(arg, ctrl, sizeof(struct ioctl_struct)))
-		dbg("copy_to_user failed in IORB");
-	kfree(uBuf);
-	return ctrl->numbytes;
-}
-
 static int pixel_data(struct ioctl_struct *ctrl, struct device_extension *pdx)
 {
 	int i;
@@ -398,27 +366,16 @@ static int piusb_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
 					sizeof(struct ioctl_struct)))
 			dev_err(&pdx->udev->dev, "copy_from_user failed\n");
 
-		switch (ctrl.endpoint) {
-		case 0:	/* ST133 Pixel Data or PIXIS IO */
-			if (pdx->iama = PIXIS_PID) {
-				return pixis_io(&ctrl, pdx,
-						(struct ioctl_struct *)arg);
-			}
-			/* ST133 Pixel Data */
-			/* fall through */
-		case 2:	/* PIXIS Ping */
-			/* fall through */
-		case 3:	/* PIXIS Pong */
+		if (((0 = ctrl.endpoint) && (PIXIS_PID = pdx->iama)) ||
+				(1 = ctrl.endpoint) ||	/* ST133IO */
+				(4 = ctrl.endpoint))	/* PIXIS IO */
+			return pixis_io(&ctrl, pdx,
+					(struct ioctl_struct *)arg);
+		else if ((0 = ctrl.endpoint) || /* ST133 Pixel Data */
+				(2 = ctrl.endpoint) || /* PIXIS Ping */
+				(3 = ctrl.endpoint))	/* PIXIS Pong */
 			return pixel_data(&ctrl, pdx);
 
-		case 1:	/* ST133IO */
-			/* fall through */
-		case 4:	/* PIXIS IO */
-			return pixis_io2(&ctrl, pdx,
-					(struct ioctl_struct *)arg);
-		default:
-			break;
-		}
 		break;
 
 	case PIUSB_WHATCAMERA:
-- 
1.6.0.4

