From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:32:21 +0000
Subject: [patch 3/6] Staging: gdm72xx: make "len" unsigned
Message-Id: <20160222193221.GC23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Shraddha Barke <shraddha.6596@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We had an underflow bug here and I think I fixed it but we may as
well be proactive and make "len" unsigned to be double sure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/gdm_wimax.h b/drivers/staging/gdm72xx/gdm_wimax.h
index 3330cd79..ed12813 100644
--- a/drivers/staging/gdm72xx/gdm_wimax.h
+++ b/drivers/staging/gdm72xx/gdm_wimax.h
@@ -26,10 +26,10 @@
 struct phy_dev {
 	void			*priv_dev;
 	struct net_device	*netdev;
-	int (*send_func)(void *priv_dev, void *data, int len,
+	int (*send_func)(void *priv_dev, void *data, size_t len,
 			 void (*cb)(void *cb_data), void *cb_data);
 	int (*rcv_func)(void *priv_dev,
-			void (*cb)(void *cb_data, void *data, int len),
+			void (*cb)(void *cb_data, void *data, size_t len),
 			void *cb_data);
 };
 
diff --git a/drivers/staging/gdm72xx/gdm_usb.h b/drivers/staging/gdm72xx/gdm_usb.h
index d864928..1456da0 100644
--- a/drivers/staging/gdm72xx/gdm_usb.h
+++ b/drivers/staging/gdm72xx/gdm_usb.h
@@ -49,7 +49,7 @@ struct usb_rx {
 	struct rx_cxt		*rx_cxt;
 	struct urb		*urb;
 	u8			*buf;
-	void (*callback)(void *cb_data, void *data, int len);
+	void (*callback)(void *cb_data, void *data, size_t len);
 	void *cb_data;
 };
 
diff --git a/drivers/staging/gdm72xx/gdm_usb.c b/drivers/staging/gdm72xx/gdm_usb.c
index 7f035b1..bbf3e70 100644
--- a/drivers/staging/gdm72xx/gdm_usb.c
+++ b/drivers/staging/gdm72xx/gdm_usb.c
@@ -284,7 +284,7 @@ static void gdm_usb_send_complete(struct urb *urb)
 	spin_unlock_irqrestore(&tx->lock, flags);
 }
 
-static int gdm_usb_send(void *priv_dev, void *data, int len,
+static int gdm_usb_send(void *priv_dev, void *data, size_t len,
 			void (*cb)(void *data), void *cb_data)
 {
 	struct usbwm_dev *udev = priv_dev;
@@ -341,7 +341,7 @@ static int gdm_usb_send(void *priv_dev, void *data, int len,
 	usb_fill_bulk_urb(t->urb, usbdev, usb_sndbulkpipe(usbdev, 1), t->buf,
 			  len + padding, gdm_usb_send_complete, t);
 
-	dev_dbg(&usbdev->dev, "usb_send: %*ph\n", len + padding, t->buf);
+	dev_dbg(&usbdev->dev, "usb_send: %*ph\n", (int)len + padding, t->buf);
 
 #ifdef CONFIG_WIMAX_GDM72XX_USB_PM
 	if (usbdev->state & USB_STATE_SUSPENDED) {
@@ -460,7 +460,7 @@ static void gdm_usb_rcv_complete(struct urb *urb)
 }
 
 static int gdm_usb_receive(void *priv_dev,
-			   void (*cb)(void *cb_data, void *data, int len),
+			   void (*cb)(void *cb_data, void *data, size_t len),
 			   void *cb_data)
 {
 	struct usbwm_dev *udev = priv_dev;
diff --git a/drivers/staging/gdm72xx/gdm_wimax.c b/drivers/staging/gdm72xx/gdm_wimax.c
index 1b3da2b..6d647d6 100644
--- a/drivers/staging/gdm72xx/gdm_wimax.c
+++ b/drivers/staging/gdm72xx/gdm_wimax.c
@@ -701,7 +701,7 @@ static void gdm_wimax_transmit_pkt(struct net_device *dev, char *buf, int len)
 	}
 }
 
-static void rx_complete(void *arg, void *data, int len)
+static void rx_complete(void *arg, void *data, size_t len)
 {
 	struct nic *nic = arg;
 
@@ -709,7 +709,7 @@ static void rx_complete(void *arg, void *data, int len)
 	gdm_wimax_rcv_with_cb(nic, rx_complete, nic);
 }
 
-static void prepare_rx_complete(void *arg, void *data, int len)
+static void prepare_rx_complete(void *arg, void *data, size_t len)
 {
 	struct nic *nic = arg;
 	int ret;
