From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 09:50:20 +0000
Subject: [PATCH] [media] au0828: Delete an error message for a failed memory allocation in au0828_usb_probe()
Message-Id: <0c29dc8f-d21a-911f-28db-780206061d6f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Shuah Khan <shuah@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 11:40:31 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/au0828/au0828-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index cd363a2100d4..9c5c05c90e15 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -583,7 +583,5 @@ static int au0828_usb_probe(struct usb_interface *interface,
-	if (dev = NULL) {
-		pr_err("%s() Unable to allocate memory\n", __func__);
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	mutex_init(&dev->lock);
 	mutex_lock(&dev->lock);
-- 
2.14.1

