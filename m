From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 May 2015 12:29:51 +0000
Subject: [patch] USB: devio: fix a condition in async_completed()
Message-Id: <20150518122951.GA32633@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.de>, Chase Metzger <chasemetzger15@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that the current condition is never true.  It
seems pretty likely that it's a typo and "URB" was intended instead of
"USB".

Fixes: 3d97ff63f899 ('usbdevfs: Use scatter-gather lists for large bulk transfers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 4b0448c..986abde 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -513,7 +513,7 @@ static void async_completed(struct urb *urb)
 	snoop(&urb->dev->dev, "urb complete\n");
 	snoop_urb(urb->dev, as->userurb, urb->pipe, urb->actual_length,
 			as->status, COMPLETE, NULL, 0);
-	if ((urb->transfer_flags & URB_DIR_MASK) = USB_DIR_IN)
+	if ((urb->transfer_flags & URB_DIR_MASK) = URB_DIR_IN)
 		snoop_urb_data(urb, urb->actual_length);
 
 	if (as->status < 0 && as->bulk_addr && as->status != -ECONNRESET &&
