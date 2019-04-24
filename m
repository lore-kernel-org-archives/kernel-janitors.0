From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Apr 2019 09:54:14 +0000
Subject: [PATCH] usbip: stub_rx: tidy the indenting in is_clear_halt_cmd()
Message-Id: <20190424095414.GB16664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an extra space character before the return statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 97b09a42a10c..f3230bed18af 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -17,9 +17,9 @@ static int is_clear_halt_cmd(struct urb *urb)
 
 	req = (struct usb_ctrlrequest *) urb->setup_packet;
 
-	 return (req->bRequest = USB_REQ_CLEAR_FEATURE) &&
-		 (req->bRequestType = USB_RECIP_ENDPOINT) &&
-		 (req->wValue = USB_ENDPOINT_HALT);
+	return (req->bRequest = USB_REQ_CLEAR_FEATURE) &&
+	       (req->bRequestType = USB_RECIP_ENDPOINT) &&
+	       (req->wValue = USB_ENDPOINT_HALT);
 }
 
 static int is_set_interface_cmd(struct urb *urb)
