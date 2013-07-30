From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 30 Jul 2013 17:35:36 +0000
Subject: [PATCH 2/3] spi: spi-ep93xx: Fix format specifier warning
Message-Id: <1375205737-3468-2-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following sparse warning by changing the
the format specifier for size_t to %zu.

drivers/spi/spi-ep93xx.c:512:3: warning:
	format ‘%d’ expects argument of	type ‘int’,
	but argument 3 has type ‘size_t’ [-Wformat]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/spi/spi-ep93xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index 4c9a50c..31611f7 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -509,7 +509,7 @@ ep93xx_spi_dma_prepare(struct ep93xx_spi *espi, enum dma_transfer_direction dir)
 	}
 
 	if (WARN_ON(len)) {
-		dev_warn(&espi->pdev->dev, "len = %d expected 0!", len);
+		dev_warn(&espi->pdev->dev, "len = %zu expected 0!", len);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
1.7.10.4

