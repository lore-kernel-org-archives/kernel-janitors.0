From: Dan Carpenter <error27@gmail.com>
Date: Sun, 07 Mar 2010 12:35:42 +0000
Subject: [patch] irda-usb: add error handling and fix leak
Message-Id: <20100307123542.GA6469@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Patrick McHardy <kaber@trash.net>, Tadashi Abe <tabe@mvista.com>, Julia Lawall <julia@diku.dk>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If the call to kcalloc() fails then we should return -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/irda/irda-usb.c b/drivers/net/irda/irda-usb.c
index e8e33bb..2c9b3af 100644
--- a/drivers/net/irda/irda-usb.c
+++ b/drivers/net/irda/irda-usb.c
@@ -1651,6 +1651,8 @@ static int irda_usb_probe(struct usb_interface *intf,
 
 	self->rx_urb = kcalloc(self->max_rx_urb, sizeof(struct urb *),
 				GFP_KERNEL);
+	if (!self->rx_urb)
+		goto err_free_net;
 
 	for (i = 0; i < self->max_rx_urb; i++) {
 		self->rx_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
@@ -1783,6 +1785,8 @@ err_out_2:
 err_out_1:
 	for (i = 0; i < self->max_rx_urb; i++)
 		usb_free_urb(self->rx_urb[i]);
+	kfree(self->rx_urb);
+err_free_net:
 	free_netdev(net);
 err_out:
 	return ret;
