From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 16 Jul 2014 16:08:02 +0000
Subject: [PATCH V6 6/6] staging: vt6556: Replace printk by dev_warn
Message-Id: <1405526882-7904-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: forest@alittletooquiet.net, gregkh@linuxfoundation.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Peter Senna Tschudin <peter.senna@gmail.com>

This patch fixes a checkpatch warning by replacing printk
by dev_warn. Tested by compilation only.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from V5
 - Refresh for staging-next of 16/07/2014

 drivers/staging/vt6656/main_usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index a3057da..c595a15 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -534,7 +534,8 @@ static void usb_device_reset(struct vnt_private *pDevice)
 
 	status = usb_reset_device(pDevice->usb);
 	if (status)
-            printk("usb_device_reset fail status=%d\n",status);
+		dev_warn(&pDevice->usb->dev,
+			 "usb_device_reset fail status=%d\n", status);
 	return ;
 }
 
-- 
1.9.3

