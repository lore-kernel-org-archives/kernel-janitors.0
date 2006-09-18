From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 00:54:25 +0000
Subject: [KJ] bluetooth drivers : kmalloc to kzalloc conversion
Message-Id: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, bluez-devel@lists.sf.net

Tested by compiling with $make allmodconfig; make

Signed off by Om Narasimhan <om.turyx@gmail.com>

 drivers/bluetooth/bfusb.c   |    2 +-
 drivers/bluetooth/hci_usb.c |   11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/bfusb.c b/drivers/bluetooth/bfusb.c
index 23f9621..9772d8c 100644
--- a/drivers/bluetooth/bfusb.c
+++ b/drivers/bluetooth/bfusb.c
@@ -588,7 +588,7 @@ static int bfusb_load_firmware(struct bf

 	bfusb->udev->toggle[0] = bfusb->udev->toggle[1] = 0;

-	buf = kmalloc(BFUSB_MAX_BLOCK_SIZE + 3, GFP_ATOMIC);
+	buf = kzalloc(BFUSB_MAX_BLOCK_SIZE + 3, GFP_ATOMIC);
 	if (!buf) {
 		BT_ERR("Can't allocate memory chunk for firmware");
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_usb.c b/drivers/bluetooth/hci_usb.c
index e2d4bea..2274248 100644
--- a/drivers/bluetooth/hci_usb.c
+++ b/drivers/bluetooth/hci_usb.c
@@ -147,10 +147,9 @@ static struct usb_device_id blacklist_id

 static struct _urb *_urb_alloc(int isoc, gfp_t gfp)
 {
-	struct _urb *_urb = kmalloc(sizeof(struct _urb) +
+	struct _urb *_urb = kzalloc(sizeof(struct _urb) +
 				sizeof(struct usb_iso_packet_descriptor) * isoc, gfp);
 	if (_urb) {
-		memset(_urb, 0, sizeof(*_urb));
 		usb_init_urb(&_urb->urb);
 	}
 	return _urb;
@@ -220,7 +219,7 @@ static int hci_usb_intr_rx_submit(struct

 	size = le16_to_cpu(husb->intr_in_ep->desc.wMaxPacketSize);

-	buf = kmalloc(size, GFP_ATOMIC);
+	buf = kzalloc(size, GFP_ATOMIC);
 	if (!buf)
 		return -ENOMEM;

@@ -255,7 +254,7 @@ static int hci_usb_bulk_rx_submit(struct
 	int err, pipe, size = HCI_MAX_FRAME_SIZE;
 	void *buf;

-	buf = kmalloc(size, GFP_ATOMIC);
+	buf = kzalloc(size, GFP_ATOMIC);
 	if (!buf)
 		return -ENOMEM;

@@ -296,7 +295,7 @@ static int hci_usb_isoc_rx_submit(struct
 	mtu  = le16_to_cpu(husb->isoc_in_ep->desc.wMaxPacketSize);
 	size = mtu * HCI_MAX_ISOC_FRAMES;

-	buf = kmalloc(size, GFP_ATOMIC);
+	buf = kzalloc(size, GFP_ATOMIC);
 	if (!buf)
 		return -ENOMEM;

@@ -471,7 +470,7 @@ static inline int hci_usb_send_ctrl(stru
 			return -ENOMEM;
 		_urb->type = bt_cb(skb)->pkt_type;

-		dr = kmalloc(sizeof(*dr), GFP_ATOMIC);
+		dr = kzalloc(sizeof(*dr), GFP_ATOMIC);
 		if (!dr) {
 			_urb_free(_urb);
 			return -ENOMEM;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
