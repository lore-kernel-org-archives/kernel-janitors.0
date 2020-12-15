From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 10:53:29 +0000
Subject: [PATCH] gpio: fix spelling mistake in Kconfig "supprot" -> "support"
Message-Id: <20201215105329.138193-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..f58e46ec1c96 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -666,7 +666,7 @@ config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
 	depends on MFD_WCD934X && OF_GPIO
 	help
-         This driver is to supprot GPIO block found on the Qualcomm Technologies
+         This driver is to support GPIO block found on the Qualcomm Technologies
 	 Inc WCD9340/WCD9341 Audio Codec.
 
 config GPIO_XGENE
-- 
2.29.2
