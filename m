From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:44:24 +0000
Subject: [PATCH 12/19] [media] uvc_driver: Move six assignments in uvc_parse_streaming()
Message-Id: <e48b8f26-cf02-7dec-40b4-898831ae5596@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 16:25:57 +0100

Move the assignments for six local variables so that these statements
will only be executed if memory allocations succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 5bb18a5f7d9f..d67fd5dfb335 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -634,11 +634,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	struct uvc_streaming *streaming;
 	struct uvc_format *format;
 	struct uvc_frame *frame;
-	struct usb_host_interface *alts = &intf->altsetting[0];
-	unsigned char *_buffer, *buffer = alts->extra;
-	int _buflen, buflen = alts->extralen;
-	unsigned int nformats = 0, nframes = 0, nintervals = 0;
-	unsigned int size, i, n, p;
+	struct usb_host_interface *alts;
+	unsigned char *_buffer, *buffer;
+	int _buflen, buflen;
+	unsigned int nformats, nframes, nintervals, size, i, n, p;
 	__u32 *interval;
 	__u16 psize;
 	int ret = -EINVAL;
@@ -670,6 +669,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	streaming->dev = dev;
 	streaming->intf = usb_get_intf(intf);
 	streaming->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
+	alts = &intf->altsetting[0];
+	buffer = alts->extra;
+	buflen = alts->extralen;
 
 	/* The Pico iMage webcam has its class-specific interface descriptors
 	 * after the endpoint descriptors.
@@ -759,6 +761,9 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 
 	_buffer = buffer;
 	_buflen = buflen;
+	nformats = 0;
+	nframes = 0;
+	nintervals = 0;
 
 	/* Count the format and frame descriptors. */
 	while (_buflen > 2 && _buffer[1] = USB_DT_CS_INTERFACE) {
-- 
2.11.0

