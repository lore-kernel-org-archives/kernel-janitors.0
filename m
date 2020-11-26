From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Nov 2020 22:37:04 +0000
Subject: [PATCH] usb: phy: Fix spelling mistake in Kconfig help text
Message-Id: <20201126223704.13273-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index ef4787cd3d37..52eebcb88c1f 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -144,7 +144,7 @@ config USB_MV_OTG
 	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
 	select USB_PHY
 	help
-	  Say Y here if you want to build Marvell USB OTG transciever
+	  Say Y here if you want to build Marvell USB OTG transceiver
 	  driver in kernel (including PXA and MMP series). This driver
 	  implements role switch between EHCI host driver and gadget driver.
 
-- 
2.29.2
