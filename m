From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 13:10:54 +0000
Subject: [PATCH][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
Message-Id: <20210128131054.637715-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to gpiod_to_irq fails the error return
path does not kfree the recently allocated object 'unit'. Fix this
by kfree'ing it before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1abc122a0977..56f867790ef1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1543,6 +1543,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 		if (irq != EPROBE_DEFER)
 			dev_err(&dev->udev->dev,
 				"No IRQ for privacy GPIO (%d)\n", irq);
+		kfree(unit);
 		return irq;
 	}
 
-- 
2.29.2
