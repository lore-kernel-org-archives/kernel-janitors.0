From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 13:37:56 +0000
Subject: [PATCH 1/3] [media] si470x: Delete an error message for a failed memory allocation in si470x_usb_dri
Message-Id: <2cc6c33d-4d3f-c097-e0ef-faf828d18c28@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b58222fa-99f8-f2d6-2755-5ccd4a91e783@users.sourceforge.net>
In-Reply-To: <b58222fa-99f8-f2d6-2755-5ccd4a91e783@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 14:53:49 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index c311f9951d80..af295530b20f 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -618,5 +618,4 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	if (!radio->int_in_buffer) {
-		dev_info(&intf->dev, "could not allocate int_in_buffer");
 		retval = -ENOMEM;
 		goto err_usbbuf;
 	}
-- 
2.14.1

