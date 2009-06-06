From: firstlink@comcast.net
Date: Sat, 06 Jun 2009 02:12:17 +0000
Subject: rspiusb driver cleanup - fix compiler warning related to casting of
Message-Id: <2114917931.1182241244254337380.JavaMail.root@sz0061a.emeryville.ca.mail.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, judd@jpilot.org, jeff frontz <jeff.frontz@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Greg, 
Here below is an additional patch for silencing compiler warnings for casting page pointers. 
checkpatch.pl constrained me to split operations in two lines to stay below 80 char. Tell me if this 
is ok to proceed this way. 

Regards 

Jean-Pierre Sainfeld 


From d2eb0098f12fa5e8fee9807fb1bb1713b52f0dd7 Mon Sep 17 00:00:00 2001
From: Jean-Pierre Sainfeld <firstlink@comcast.net>
Date: Fri, 5 Jun 2009 19:01:02 -0700
Subject: [PATCH] fix compiler warnings related to casting page pointers


Signed-off-by: Jean-Pierre Sainfeld <firstlink@comcast.net>
---
 drivers/staging/rspiusb/rspiusb.c |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rspiusb/rspiusb.c b/drivers/staging/rspiusb/rspiusb.c
index 25d0737..f209b82 100644
--- a/drivers/staging/rspiusb/rspiusb.c
+++ b/drivers/staging/rspiusb/rspiusb.c
@@ -257,6 +257,7 @@ static int pixis_io(struct ioctl_struct *ctrl, struct device_extension *pdx,
 static int pixel_data(struct ioctl_struct *ctrl, struct device_extension *pdx)
 {
 	int i;
+	struct page *page;
 
 	if (!pdx->gotPixelData)
 		return 0;
@@ -265,8 +266,10 @@ static int pixel_data(struct ioctl_struct *ctrl, struct device_extension *pdx)
 	ctrl->numbytes = pdx->bulk_in_size_returned;
 	pdx->bulk_in_size_returned -= pdx->frameSize;
 
-	for (i = 0; i < pdx->maplist_numPagesMapped[pdx->active_frame]; i++)
-		SetPageDirty(pdx->sgl[pdx->active_frame][i].page_link);
+	for (i = 0; i < pdx->maplist_numPagesMapped[pdx->active_frame]; i++) {
+		page = (struct page *)pdx->sgl[pdx->active_frame][i].page_link;
+		SetPageDirty(page);
+	}
 
 	pdx->active_frame = ((pdx->active_frame + 1) % pdx->num_frames);
 
@@ -487,6 +490,7 @@ static int UnMapUserBuffer(struct device_extension *pdx)
 	int i = 0;
 	int k = 0;
 	unsigned int epAddr;
+	struct page *page;
 
 	for (k = 0; k < pdx->num_frames; k++) {
 		dev_dbg(&pdx->udev->dev,
@@ -518,8 +522,10 @@ static int UnMapUserBuffer(struct device_extension *pdx)
 
 		usb_buffer_unmap_sg(pdx->udev, epAddr, pdx->sgl[k],
 				    pdx->maplist_numPagesMapped[k]);
-		for (i = 0; i < pdx->maplist_numPagesMapped[k]; i++)
-			page_cache_release(pdx->sgl[k][i].page_link);
+		for (i = 0; i < pdx->maplist_numPagesMapped[k]; i++) {
+			page = (struct page *)pdx->sgl[k][i].page_link;
+			page_cache_release(page);
+		}
 		kfree(pdx->sgl[k]);
 		kfree(pdx->PixelUrb[k]);
 		kfree(pdx->pendedPixelUrbs[k]);
@@ -690,7 +696,7 @@ static int MapUserBuffer(struct ioctl_struct *io, struct device_extension *pdx)
 		dev_dbg(&pdx->udev->dev, "can't allocate mem for sgl");
 		return -ENOMEM;
 	}
-	pdx->sgl[frameInfo][0].page_link = maplist_p[0];
+	pdx->sgl[frameInfo][0].page_link = (unsigned long)maplist_p[0];
 	pdx->sgl[frameInfo][0].offset = uaddr & ~PAGE_MASK;
 	if (pdx->maplist_numPagesMapped[frameInfo] > 1) {
 		pdx->sgl[frameInfo][0].length @@ -698,7 +704,8 @@ static int MapUserBuffer(struct ioctl_struct *io, struct device_extension *pdx)
 		count -= pdx->sgl[frameInfo][0].length;
 		for (k = 1; k < pdx->maplist_numPagesMapped[frameInfo]; k++) {
 			pdx->sgl[frameInfo][k].offset = 0;
-			pdx->sgl[frameInfo][k].page_link = maplist_p[k];
+			pdx->sgl[frameInfo][k].page_link +			  (unsigned long)maplist_p[k];
 			pdx->sgl[frameInfo][k].length  			    (count < PAGE_SIZE) ? count : PAGE_SIZE;
 			count -= PAGE_SIZE; /* example had PAGE_SIZE here */
-- 
1.6.0.4

