From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 20:24:16 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_net=3a_usb=3a_Delete_unnecessary_checks_befor?= =?UTF-8?B?ZSB0aGUgbWFjcm8gY2Fs
Message-Id: <425214be-355b-92c0-bc74-1d0ea899290f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Petko Manolov <petkan@nucleusys.com>, Steve Winslow <swinslow@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 22:16:02 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/lg-vl600.c | 4 +---
 drivers/net/usb/rtl8150.c  | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/lg-vl600.c b/drivers/net/usb/lg-vl600.c
index 6c2b3e368efe..217a2d8fa47b 100644
--- a/drivers/net/usb/lg-vl600.c
+++ b/drivers/net/usb/lg-vl600.c
@@ -87,9 +87,7 @@ static void vl600_unbind(struct usbnet *dev, struct usb_interface *intf)
 {
 	struct vl600_state *s = dev->driver_priv;

-	if (s->current_rx_buf)
-		dev_kfree_skb(s->current_rx_buf);
-
+	dev_kfree_skb(s->current_rx_buf);
 	kfree(s);

 	return usbnet_cdc_unbind(dev, intf);
diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 98f33e270af1..13e51ccf0214 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -586,8 +586,7 @@ static void free_skb_pool(rtl8150_t *dev)
 	int i;

 	for (i = 0; i < RX_SKB_POOL_SIZE; i++)
-		if (dev->rx_skb_pool[i])
-			dev_kfree_skb(dev->rx_skb_pool[i]);
+		dev_kfree_skb(dev->rx_skb_pool[i]);
 }

 static void rx_fixup(unsigned long data)
@@ -946,8 +945,7 @@ static void rtl8150_disconnect(struct usb_interface *intf)
 		unlink_all_urbs(dev);
 		free_all_urbs(dev);
 		free_skb_pool(dev);
-		if (dev->rx_skb)
-			dev_kfree_skb(dev->rx_skb);
+		dev_kfree_skb(dev->rx_skb);
 		kfree(dev->intr_buff);
 		free_netdev(dev->netdev);
 	}
--
2.23.0
