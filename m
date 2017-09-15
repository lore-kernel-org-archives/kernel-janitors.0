From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 20:41:48 +0000
Subject: [PATCH 1/2] [media] ma901: Delete two error messages for a failed memory allocation in usb_ma901radi
Message-Id: <0a794519-30e4-666d-d16b-7d3081f26a37@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6d4d9e92-9ac5-1e46-99ed-2b7d93bd7121@users.sourceforge.net>
In-Reply-To: <6d4d9e92-9ac5-1e46-99ed-2b7d93bd7121@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 22:20:04 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-ma901.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/radio/radio-ma901.c b/drivers/media/radio/radio-ma901.c
index fdc481257efd..c386fbd63703 100644
--- a/drivers/media/radio/radio-ma901.c
+++ b/drivers/media/radio/radio-ma901.c
@@ -361,10 +361,8 @@ static int usb_ma901radio_probe(struct usb_interface *intf,
 	if (!radio) {
-		dev_err(&intf->dev, "kzalloc for ma901radio_device failed\n");
 		retval = -ENOMEM;
 		goto err;
 	}
 
 	radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
 	if (!radio->buffer) {
-		dev_err(&intf->dev, "kmalloc for radio->buffer failed\n");
 		retval = -ENOMEM;
-- 
2.14.1

