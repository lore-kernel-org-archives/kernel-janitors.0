From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:59:58 +0000
Subject: [patch] usb/uvc_v4l2: cleanup test for end of loop
Message-Id: <20100812075958.GP645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're trying to test for the the end of the loop here.  "format" is
never NULL.  We don't know what "format->fcc" is because we're past the
end of the loop and I think "fmt->fmt.pix.pixelformat" comes from the
user so we don't know what that is either.  It works, but it's cleaner
to just test to see if (i = ARRAY_SIZE(uvc_formats).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/gadget/uvc_v4l2.c b/drivers/usb/gadget/uvc_v4l2.c
index 2dcffda..5e807f0 100644
--- a/drivers/usb/gadget/uvc_v4l2.c
+++ b/drivers/usb/gadget/uvc_v4l2.c
@@ -94,7 +94,7 @@ uvc_v4l2_set_format(struct uvc_video *video, struct v4l2_format *fmt)
 			break;
 	}
 
-	if (format = NULL || format->fcc != fmt->fmt.pix.pixelformat) {
+	if (i = ARRAY_SIZE(uvc_formats)) {
 		printk(KERN_INFO "Unsupported format 0x%08x.\n",
 			fmt->fmt.pix.pixelformat);
 		return -EINVAL;
