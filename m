From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 22 Jun 2018 01:49:12 +0000
Subject: [PATCH -next] spi: spi-fsl-dspi: Fix a typo in dspi_probe()
Message-Id: <1529632152-99368-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a typo, use 'dspi->regmap_pushr' instead of 'dspi->regmap'.

Fixes: 58ba07ec79e6 ("spi: spi-fsl-dspi: Add support for XSPI mode registers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-fsl-dspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 1f85dcd..ff7456b 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1066,7 +1066,7 @@ static int dspi_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"failed to init pushr regmap: %ld\n",
 				PTR_ERR(dspi->regmap_pushr));
-			ret = PTR_ERR(dspi->regmap);
+			ret = PTR_ERR(dspi->regmap_pushr);
 			goto out_master_put;
 		}
 	}

