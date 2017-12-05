From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 21:52:03 +0000
Subject: [PATCH 2/2] usbip: Use common error handling code in stub_recv_cmd_submit()
Message-Id: <32b1d0d7-8a48-a960-c666-b0ea187ecdcc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6a84f1e4-a5c1-84da-bd14-de28e306991b@users.sourceforge.net>
In-Reply-To: <6a84f1e4-a5c1-84da-bd14-de28e306991b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 22:40:30 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/usbip/stub_rx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index a70eb81823a3..f46d71abd2f9 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -445,29 +445,23 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	else
 		priv->urb = usb_alloc_urb(0, GFP_KERNEL);
 
-	if (!priv->urb) {
-		usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
-		return;
-	}
+	if (!priv->urb)
+		goto add_event_malloc_failure;
 
 	/* allocate urb transfer buffer, if needed */
 	if (pdu->u.cmd_submit.transfer_buffer_length > 0) {
 		priv->urb->transfer_buffer  			kzalloc(pdu->u.cmd_submit.transfer_buffer_length,
 				GFP_KERNEL);
-		if (!priv->urb->transfer_buffer) {
-			usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
-			return;
-		}
+		if (!priv->urb->transfer_buffer)
+			goto add_event_malloc_failure;
 	}
 
 	/* copy urb setup packet */
 	priv->urb->setup_packet = kmemdup(&pdu->u.cmd_submit.setup, 8,
 					  GFP_KERNEL);
-	if (!priv->urb->setup_packet) {
-		usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
-		return;
-	}
+	if (!priv->urb->setup_packet)
+		goto add_event_malloc_failure;
 
 	/* set other members from the base header of pdu */
 	priv->urb->context                = (void *) priv;
@@ -507,6 +501,10 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	}
 
 	usbip_dbg_stub_rx("Leave\n");
+	return;
+
+add_event_malloc_failure:
+	usbip_event_add(ud, SDEV_EVENT_ERROR_MALLOC);
 }
 
 /* recv a pdu */
-- 
2.15.1

