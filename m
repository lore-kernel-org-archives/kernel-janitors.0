From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:08:23 +0000
Subject: [PATCH 2/2] at76c50x-usb: Improve size determinations in at76_usbdfu_download()
Message-Id: <08f4f979-481c-2861-cf59-408c49f3f627@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d76fe59-af15-ba4d-e05d-09dcd9ee38cd@users.sourceforge.net>
In-Reply-To: <1d76fe59-af15-ba4d-e05d-09dcd9ee38cd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Andrew Zaborowski <andrew.zaborowski@intel.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:56:56 +0100

Replace the specification of two data types by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/atmel/at76c50x-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless/atmel/at76c50x-usb.c
index 2893d339b440..6144d4a258ca 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -383,7 +383,7 @@ static int at76_usbdfu_download(struct usb_device *udev, u8 *buf, u32 size,
 		return -EINVAL;
 	}
 
-	dfu_stat_buf = kmalloc(sizeof(struct dfu_status), GFP_KERNEL);
+	dfu_stat_buf = kmalloc(sizeof(*dfu_stat_buf), GFP_KERNEL);
 	if (!dfu_stat_buf) {
 		ret = -ENOMEM;
 		goto exit;
@@ -395,7 +395,7 @@ static int at76_usbdfu_download(struct usb_device *udev, u8 *buf, u32 size,
 		goto exit;
 	}
 
-	dfu_state = kmalloc(sizeof(u8), GFP_KERNEL);
+	dfu_state = kmalloc(sizeof(*dfu_state), GFP_KERNEL);
 	if (!dfu_state) {
 		ret = -ENOMEM;
 		goto exit;
-- 
2.15.1

