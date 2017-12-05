From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 20:30:19 +0000
Subject: [PATCH 4/4] uwb/i1480/dfu/usb: Delete two error messages for a failed memory allocation in i1480_usb
Message-Id: <e7ebfa5b-3379-3562-1894-fdde9139d532@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
In-Reply-To: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 21:07:47 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uwb/i1480/dfu/usb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/uwb/i1480/dfu/usb.c b/drivers/uwb/i1480/dfu/usb.c
index a50cf45e530f..56bbdc5504d4 100644
--- a/drivers/uwb/i1480/dfu/usb.c
+++ b/drivers/uwb/i1480/dfu/usb.c
@@ -366,10 +366,9 @@ int i1480_usb_probe(struct usb_interface *iface, const struct usb_device_id *id)
 	if (iface->cur_altsetting->desc.bNumEndpoints < 1)
 		return -ENODEV;
 
-	result = -ENOMEM;
 	i1480_usb = kzalloc(sizeof(*i1480_usb), GFP_KERNEL);
 	if (i1480_usb = NULL) {
-		dev_err(dev, "Unable to allocate instance\n");
+		result = -ENOMEM;
 		goto error;
 	}
 	i1480_usb_init(i1480_usb);
@@ -378,7 +377,6 @@ int i1480_usb_probe(struct usb_interface *iface, const struct usb_device_id *id)
 	i1480->buf_size = 512;
 	i1480->cmd_buf = kmalloc(2 * i1480->buf_size, GFP_KERNEL);
 	if (i1480->cmd_buf = NULL) {
-		dev_err(dev, "Cannot allocate transfer buffers\n");
 		result = -ENOMEM;
 		goto error_buf_alloc;
 	}
-- 
2.15.1

