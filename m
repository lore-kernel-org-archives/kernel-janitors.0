From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 21:49:55 +0000
Subject: [PATCH 1/2] usbip: Delete an error message for a failed memory allocation in two functions
Message-Id: <ffdb1a7c-2dd6-416e-e13f-e54289e2c194@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6a84f1e4-a5c1-84da-bd14-de28e306991b@users.sourceforge.net>
In-Reply-To: <6a84f1e4-a5c1-84da-bd14-de28e306991b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 22:25:38 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/usbip/stub_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 536e037f541f..a70eb81823a3 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -302,7 +302,6 @@ static struct stub_priv *stub_priv_alloc(struct stub_device *sdev,
 
 	priv = kmem_cache_zalloc(stub_priv_cache, GFP_ATOMIC);
 	if (!priv) {
-		dev_err(&sdev->udev->dev, "alloc stub_priv\n");
 		spin_unlock_irqrestore(&sdev->priv_lock, flags);
 		usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
 		return NULL;
@@ -466,7 +465,6 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	priv->urb->setup_packet = kmemdup(&pdu->u.cmd_submit.setup, 8,
 					  GFP_KERNEL);
 	if (!priv->urb->setup_packet) {
-		dev_err(&udev->dev, "allocate setup_packet\n");
 		usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
 		return;
 	}
-- 
2.15.1

