From: Domen Puncer <domen@coderock.org>
Date: Sun, 15 Feb 2004 19:06:14 +0000
Subject: [Kernel-janitors] [patch 2.6.2] some stv680 fixes
Message-Id: <200402152006.15059.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

- swapRGB is already initialized to 0
- change "swapRGB_on = 1" to match in-source documentation
- submit urb with GFP_ATOMIC (interrupt context) - this made driver
   unusable because of "might_sleep" messages.
- group some "case"s
- release vdev on fail
- remove "kfree(0)" checking

Compiles, works.


	Domen


--- c/drivers/usb/media/stv680.c	2004-02-04 04:44:04.000000000 +0100
+++ a/drivers/usb/media/stv680.c	2004-02-15 16:55:26.000000000 +0100
@@ -490,10 +490,9 @@ exit:
 	stv680->hue = 32767;
 	stv680->palette = STV_VIDEO_PALETTE;
 	stv680->depth = 24;	/* rgb24 bits */
-	swapRGB = 0;
 	if ((swapRGB_on = 0) && (swapRGB = 0))
 		PDEBUG (1, "STV(i): swapRGB is (auto) OFF");
-	else if ((swapRGB_on = 1) && (swapRGB = 1))
+	else if ((swapRGB_on = 0) && (swapRGB = 1))
 		PDEBUG (1, "STV(i): swapRGB is (auto) ON");
 	else if (swapRGB_on = 1)
 		PDEBUG (1, "STV(i): swapRGB is (forced) ON");
@@ -657,7 +656,7 @@ static void stv680_video_irq (struct urb
 	/* Resubmit urb for new data */
 	urb->status = 0;
 	urb->dev = stv680->udev;
-	if (usb_submit_urb (urb, GFP_KERNEL))
+	if (usb_submit_urb (urb, GFP_ATOMIC))
 		PDEBUG (0, "STV(e): urb burned down in video irq");
 	return;
 }				/*  _video_irq  */
@@ -1252,13 +1251,10 @@ static int stv680_do_ioctl (struct inode
 			return -EINVAL;
 		}
 	case VIDIOCSFBUF:
-		return -EINVAL;
 	case VIDIOCGTUNER:
 	case VIDIOCSTUNER:
-		return -EINVAL;
 	case VIDIOCGFREQ:
 	case VIDIOCSFREQ:
-		return -EINVAL;
 	case VIDIOCGAUDIO:
 	case VIDIOCSAUDIO:
 		return -EINVAL;
@@ -1434,7 +1430,7 @@ static int stv680_probe (struct usb_inte
 	if (video_register_device (stv680->vdev, VFL_TYPE_GRABBER, video_nr) = -1) {
 		PDEBUG (0, "STV(e): video_register_device failed");
 		retval = -EIO;
-		goto error;
+		goto error_vdev;
 	}
 	PDEBUG (0, "STV(i): registered new video device: video%d", stv680->vdev->minor);
 
@@ -1442,6 +1438,8 @@ static int stv680_probe (struct usb_inte
 	stv680_create_sysfs_files(stv680->vdev);
 	return 0;
 
+error_vdev:
+	video_device_release(stv680->vdev);
 error:
 	kfree(stv680);
 	return retval;
@@ -1466,9 +1464,7 @@ static inline void usb_stv680_remove_dis
 			kfree (stv680->sbuf[i].data);
 		}
 	for (i = 0; i < STV680_NUMSCRATCH; i++)
-		if (stv680->scratch[i].data) {
-			kfree (stv680->scratch[i].data);
-		}
+		kfree (stv680->scratch[i].data);
 	PDEBUG (0, "STV(i): %s disconnected", stv680->camera_name);
 
 	/* Free the memory */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
