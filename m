From: Colin King <colin.king@canonical.com>
Date: Sat, 28 Apr 2018 22:11:34 +0000
Subject: [PATCH] [media] media/usbvision: fix spelling mistake: "compresion" -> "compression"
Message-Id: <20180428221134.19856-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in proc text string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/usbvision/usbvision-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/usbvision/usbvision-core.c b/drivers/media/usb/usbvision/usbvision-core.c
index 3f87fbc80be2..7138c2b606cc 100644
--- a/drivers/media/usb/usbvision/usbvision-core.c
+++ b/drivers/media/usb/usbvision/usbvision-core.c
@@ -1857,7 +1857,7 @@ int usbvision_stream_interrupt(struct usb_usbvision *usbvision)
 
 static int usbvision_set_compress_params(struct usb_usbvision *usbvision)
 {
-	static const char proc[] = "usbvision_set_compresion_params: ";
+	static const char proc[] = "usbvision_set_compression_params: ";
 	int rc;
 	unsigned char *value = usbvision->ctrl_urb_buffer;
 
-- 
2.17.0

