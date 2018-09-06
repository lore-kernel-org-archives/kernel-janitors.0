From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 06 Sep 2018 01:38:45 +0000
Subject: [PATCH -next] spi: spi-gpio: Remove set but not used variable 'pdata'
Message-Id: <1536197925-158441-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-gpio.c: In function 'spi_gpio_remove':
drivers/spi/spi-gpio.c:450:33: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 421bfc7..9d7ac41 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -447,10 +447,8 @@ static int spi_gpio_probe(struct platform_device *pdev)
 static int spi_gpio_remove(struct platform_device *pdev)
 {
 	struct spi_gpio			*spi_gpio;
-	struct spi_gpio_platform_data	*pdata;
 
 	spi_gpio = platform_get_drvdata(pdev);
-	pdata = dev_get_platdata(&pdev->dev);
 
 	/* stop() unregisters child devices too */
 	spi_bitbang_stop(&spi_gpio->bitbang);
