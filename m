From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 30 Aug 2018 13:50:53 +0000
Subject: [PATCH] spi: davinci: remove set but not used variable 'pdata'
Message-Id: <1535637672-14306-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-davinci.c: In function 'davinci_spi_chipselect':
drivers/spi/spi-davinci.c:211:36: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-davinci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index a02099c..3dabc20 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -208,13 +208,11 @@ static inline void clear_io_bits(void __iomem *addr, u32 bits)
 static void davinci_spi_chipselect(struct spi_device *spi, int value)
 {
 	struct davinci_spi *dspi;
-	struct davinci_spi_platform_data *pdata;
 	struct davinci_spi_config *spicfg = spi->controller_data;
 	u8 chip_sel = spi->chip_select;
 	u16 spidat1 = CS_DEFAULT;
 
 	dspi = spi_master_get_devdata(spi->master);
-	pdata = &dspi->pdata;
 
 	/* program delay transfers if tx_delay is non zero */
 	if (spicfg && spicfg->wdelay)
