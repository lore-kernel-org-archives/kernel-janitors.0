From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Nov 2020 22:46:02 +0000
Subject: [PATCH] staging: most: Fix spelling mistake "tranceiver" -> "transceiver"
Message-Id: <20201126224602.13878-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/i2c/Kconfig b/drivers/staging/most/i2c/Kconfig
index 19a094b5bee0..ff64283cbad1 100644
--- a/drivers/staging/most/i2c/Kconfig
+++ b/drivers/staging/most/i2c/Kconfig
@@ -7,7 +7,7 @@ config MOST_I2C
 	tristate "I2C"
 	depends on I2C
 	help
-	  Say Y here if you want to connect via I2C to network tranceiver.
+	  Say Y here if you want to connect via I2C to network transceiver.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called most_i2c.
-- 
2.29.2
