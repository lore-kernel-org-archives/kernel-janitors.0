From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2013 12:53:34 +0000
Subject: [patch] USB: wusbcore/wa-xfer: error handling fixes in setup_segs()
Message-Id: <20130201125333.GA10024@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1) It didn't free xfer->seg[0] so there was a leak.
2) xfer->seg[cnt] can be NULL.
3) Use usb_free_urb() for ->dto_urb instead of kfree().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/wusbcore/wa-xfer.c b/drivers/usb/wusbcore/wa-xfer.c
index 57c01ab..6ef94bc 100644
--- a/drivers/usb/wusbcore/wa-xfer.c
+++ b/drivers/usb/wusbcore/wa-xfer.c
@@ -695,9 +695,9 @@ error_dto_alloc:
 	cnt--;
 error_seg_kzalloc:
 	/* use the fact that cnt is left at were it failed */
-	for (; cnt > 0; cnt--) {
-		if (xfer->is_inbound = 0)
-			kfree(xfer->seg[cnt]->dto_urb);
+	for (; cnt >= 0; cnt--) {
+		if (xfer->seg[cnt] && xfer->is_inbound = 0)
+			usb_free_urb(xfer->seg[cnt]->dto_urb);
 		kfree(xfer->seg[cnt]);
 	}
 error_segs_kzalloc:
