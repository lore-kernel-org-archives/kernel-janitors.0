From: Dan Carpenter <error27@gmail.com>
Date: Tue, 27 Apr 2010 09:20:12 +0000
Subject: [patch] ipheth: potential null dereferences on error path
Message-Id: <20100427092012.GA29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Giagio <diego@giagio.com>
Cc: "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?L=2E_Alberto_Gim=E9nez?= <agimenez@sysvalve.es>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The calls to usb_free_buffer() dereference rx_urb and tx_urb in the
parameter list but those could be NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index fd10331..418825d 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -122,25 +122,25 @@ static int ipheth_alloc_urbs(struct ipheth_device *iphone)
 
 	tx_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (tx_urb = NULL)
-		goto error;
+		goto error_nomem;
 
 	rx_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (rx_urb = NULL)
-		goto error;
+		goto free_tx_urb;
 
 	tx_buf = usb_buffer_alloc(iphone->udev,
 				  IPHETH_BUF_SIZE,
 				  GFP_KERNEL,
 				  &tx_urb->transfer_dma);
 	if (tx_buf = NULL)
-		goto error;
+		goto free_rx_urb;
 
 	rx_buf = usb_buffer_alloc(iphone->udev,
 				  IPHETH_BUF_SIZE,
 				  GFP_KERNEL,
 				  &rx_urb->transfer_dma);
 	if (rx_buf = NULL)
-		goto error;
+		goto free_tx_buf;
 
 
 	iphone->tx_urb = tx_urb;
@@ -149,13 +149,14 @@ static int ipheth_alloc_urbs(struct ipheth_device *iphone)
 	iphone->rx_buf = rx_buf;
 	return 0;
 
-error:
-	usb_buffer_free(iphone->udev, IPHETH_BUF_SIZE, rx_buf,
-			rx_urb->transfer_dma);
+free_tx_buf:
 	usb_buffer_free(iphone->udev, IPHETH_BUF_SIZE, tx_buf,
 			tx_urb->transfer_dma);
+free_rx_urb:
 	usb_free_urb(rx_urb);
+free_tx_urb:
 	usb_free_urb(tx_urb);
+error_nomem:
 	return -ENOMEM;
 }
 
