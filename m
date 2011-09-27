From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Sep 2011 06:25:19 +0000
Subject: [patch] USB: message: cleanup min_t() cast in usb_sg_init()
Message-Id: <20110927062519.GB4227@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"length" is type size_t so the cast to unsigned int truncates the
upper bytes.  This isn't an issue in real life (I've checked the
callers) but it's a bit messy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 0b5ec23..b3bdfed 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -435,7 +435,7 @@ int usb_sg_init(struct usb_sg_request *io, struct usb_device *dev,
 
 			len = sg->length;
 			if (length) {
-				len = min_t(unsigned, len, length);
+				len = min_t(size_t, len, length);
 				length -= len;
 				if (length = 0)
 					io->entries = i + 1;
