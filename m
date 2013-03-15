From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Mar 2013 06:03:31 +0000
Subject: [patch] Staging: dwc2: remove a kfree(NULL)
Message-Id: <20130315060330.GA3793@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

dwc2_hcd_release() calls dwc2_hcd_free() which frees ->core_params
and sets it to NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/dwc2/hcd.c b/drivers/staging/dwc2/hcd.c
index cdb142d..e123f1e 100644
--- a/drivers/staging/dwc2/hcd.c
+++ b/drivers/staging/dwc2/hcd.c
@@ -2939,7 +2939,6 @@ void dwc2_hcd_remove(struct device *dev, struct dwc2_hsotg *hsotg)
 	usb_remove_hcd(hcd);
 	hsotg->priv = NULL;
 	dwc2_hcd_release(hsotg);
-	kfree(hsotg->core_params);
 
 #ifdef CONFIG_USB_DWC2_TRACK_MISSED_SOFS
 	kfree(hsotg->last_frame_num_array);
