From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 13 Sep 2018 01:22:01 +0000
Subject: [PATCH -next] spi: davinci: remove set but not used variable 'pdata'
Message-Id: <1536801721-178499-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-davinci.c: In function 'davinci_spi_setup':
drivers/spi/spi-davinci.c:422:36: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-davinci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index d502cf5..ce0e67d 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -419,13 +419,11 @@ static int davinci_spi_setup(struct spi_device *spi)
 {
 	int retval = 0;
 	struct davinci_spi *dspi;
-	struct davinci_spi_platform_data *pdata;
 	struct spi_master *master = spi->master;
 	struct device_node *np = spi->dev.of_node;
 	bool internal_cs = true;
 
 	dspi = spi_master_get_devdata(spi->master);
-	pdata = &dspi->pdata;
 
 	if (!(spi->mode & SPI_NO_CS)) {
 		if (np && (master->cs_gpios != NULL) && (spi->cs_gpio >= 0)) {
