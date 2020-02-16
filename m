From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 16 Feb 2020 11:32:42 +0000
Subject: [PATCH] mfd: Kconfig: Fix some typo
Message-Id: <20200216113242.20268-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Fix several variations of typo around functionality.ies

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 2b203290e7b9..cde9cef2e4a3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1201,7 +1201,7 @@ config AB8500_CORE
 	  chip. This connects to U8500 either on the SSP/SPI bus (deprecated
 	  since hardware version v1.0) or the I2C bus via PRCMU. It also adds
 	  the irq_chip parts for handling the Mixed Signal chip events.
-	  This chip embeds various other multimedia funtionalities as well.
+	  This chip embeds various other multimedia functionalities as well.
 
 config AB8500_DEBUG
 	bool "Enable debug info via debugfs"
@@ -1851,7 +1851,7 @@ config MFD_WM8994
 	  has on board GPIO and regulator functionality which is
 	  supported via the relevant subsystems.  This driver provides
 	  core support for the WM8994, in order to use the actual
-	  functionaltiy of the device other drivers must be enabled.
+	  functionality of the device other drivers must be enabled.
 
 config MFD_WM97xx
 	tristate "Wolfson Microelectronics WM97xx"
@@ -1864,7 +1864,7 @@ config MFD_WM97xx
 	  designed for smartphone applications.  As well as audio functionality
 	  it has on board GPIO and a touchscreen functionality which is
 	  supported via the relevant subsystems.  This driver provides core
-	  support for the WM97xx, in order to use the actual functionaltiy of
+	  support for the WM97xx, in order to use the actual functionality of
 	  the device other drivers must be enabled.
 
 config MFD_STW481X
@@ -1957,7 +1957,7 @@ config MFD_STPMIC1
 	  Support for ST Microelectronics STPMIC1 PMIC. STPMIC1 has power on
 	  key, watchdog and regulator functionalities which are supported via
 	  the relevant subsystems. This driver provides core support for the
-	  STPMIC1. In order to use the actual functionaltiy of the device other
+	  STPMIC1. In order to use the actual functionality of the device other
 	  drivers must be enabled.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.20.1
