From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 26 Aug 2019 11:30:08 +0000
Subject: [PATCH] media: em28xx: Fix exception handling in em28xx_alloc_urbs()
Message-Id: <ce8f4240-1d81-87fc-c900-713ddb0bc4f2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Aug 2019 13:14:02 +0200

A null pointer would be passed to a call of the function "kfree" directly
after a call of the function "kcalloc" failed at one place.
Pass the data structure member "urb" instead for which memory
was allocated before (so that this resource will be properly cleaned up).

This issue was detected by using the Coccinelle software.

Fixes: d571b592c6206d33731f41aa710fa0f69ac8611b ("media: em28xx: don't use coherent buffer for DMA transfers")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/em28xx/em28xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 2b8c84a5c9a8..e6088b5d1b80 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -931,7 +931,7 @@ int em28xx_alloc_urbs(struct em28xx *dev, enum em28xx_mode mode, int xfer_bulk,

 	usb_bufs->buf = kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
 	if (!usb_bufs->buf) {
-		kfree(usb_bufs->buf);
+		kfree(usb_bufs->urb);
 		return -ENOMEM;
 	}

--
2.23.0
