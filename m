From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Jul 2020 10:12:03 +0000
Subject: [PATCH][next] spi: atmel: remove redundant label out_free
Message-Id: <20200709101203.1374117-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Peng Fan <fanpeng@loongson.cn>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error exit label out_free is no longer being used, it is redundant
and can be removed.

Cleans up warning:
drivers/spi/spi-atmel.c:1680:1: warning: label ‘out_free’ defined but not used [-Wunused-label]

Fixes: 2d9a744685bc ("spi: atmel: No need to call spi_master_put() if spi_alloc_master() failed")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/spi/spi-atmel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 6ed7abdcf74a..2cfe6253a784 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1677,7 +1677,6 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	clk_disable_unprepare(clk);
 out_free_irq:
 out_unmap_regs:
-out_free:
 	spi_master_put(master);
 	return ret;
 }
-- 
2.27.0
