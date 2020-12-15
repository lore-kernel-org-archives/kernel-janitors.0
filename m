From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 12:52:54 +0000
Subject: [PATCH] HID: fix spelling mistake in Kconfig "Uninterruptable" -> "Uninterruptible"
Message-Id: <20201215125254.200436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/usbhid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig
index dcf3a235870f..7c2032f7f44d 100644
--- a/drivers/hid/usbhid/Kconfig
+++ b/drivers/hid/usbhid/Kconfig
@@ -38,7 +38,7 @@ config USB_HIDDEV
 	help
 	  Say Y here if you want to support HID devices (from the USB
 	  specification standpoint) that aren't strictly user interface
-	  devices, like monitor controls and Uninterruptable Power Supplies.
+	  devices, like monitor controls and Uninterruptible Power Supplies.
 
 	  This module supports these devices separately using a separate
 	  event interface on /dev/usb/hiddevX (char 180:96 to 180:111).
-- 
2.29.2
