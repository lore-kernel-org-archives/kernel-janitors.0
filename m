From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Sep 2012 07:12:53 +0000
Subject: [patch] [media] cx25821: testing the wrong variable
Message-Id: <20120929071253.GD10993@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: "Leonid V. Fedorenchik" <leonidsbox@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

->input_filename could be NULL here.  The intent was to test
->_filename.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not totally convinced that using /root/vid411.yuv is the right idea.

diff --git a/drivers/media/pci/cx25821/cx25821-video-upstream.c b/drivers/media/pci/cx25821/cx25821-video-upstream.c
index 52c13e0..6759fff 100644
--- a/drivers/media/pci/cx25821/cx25821-video-upstream.c
+++ b/drivers/media/pci/cx25821/cx25821-video-upstream.c
@@ -808,7 +808,7 @@ int cx25821_vidupstream_init_ch1(struct cx25821_dev *dev, int channel_select,
 	}
 
 	/* Default if filename is empty string */
-	if (strcmp(dev->input_filename, "") = 0) {
+	if (strcmp(dev->_filename, "") = 0) {
 		if (dev->_isNTSC) {
 			dev->_filename  				(dev->_pixel_format = PIXEL_FRMT_411) ?
diff --git a/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c b/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
index c8c94fb..d33fc1a 100644
--- a/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
+++ b/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
@@ -761,7 +761,7 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *dev, int channel_select,
 	}
 
 	/* Default if filename is empty string */
-	if (strcmp(dev->input_filename_ch2, "") = 0) {
+	if (strcmp(dev->_filename_ch2, "") = 0) {
 		if (dev->_isNTSC_ch2) {
 			dev->_filename_ch2 = (dev->_pixel_format_ch2 =
 				PIXEL_FRMT_411) ? "/root/vid411.yuv" :
