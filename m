From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Mon, 29 Mar 2010 13:20:42 +0000
Subject: [PATCH] pwc Kconfig dependency fix
Message-Id: <1269868842.8583.9.camel@lovely>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

makes USB_PWC_INPUT_EVDEV to depend also on USB_PWC

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/media/video/pwc/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/pwc/Kconfig b/drivers/media/video/pwc/Kconfig
index 340f954..11980db 100644
--- a/drivers/media/video/pwc/Kconfig
+++ b/drivers/media/video/pwc/Kconfig
@@ -39,7 +39,7 @@ config USB_PWC_DEBUG
 config USB_PWC_INPUT_EVDEV
 	bool "USB Philips Cameras input events device support"
 	default y
-	depends on USB_PWC=INPUT || INPUT=y
+	depends on USB_PWC && (USB_PWC=INPUT || INPUT=y)
 	---help---
 	  This option makes USB Philips cameras register the snapshot button as
 	  an input device to report button events.
-- 
1.5.6.5




