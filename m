From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 07 May 2020 11:55:50 +0000
Subject: [PATCH -next] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
Message-Id: <20200507115550.139457-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sanjay R Mehta <sanju.mehta@amd.com>, Mark Brown <broonie@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

The call to spi_master_put() in amd_spi_remove() is redundant and
may causes user after free since the master have been freed by
spi_unregister_master(), so remove it.

Fixes: bbb336f39efc ("spi: spi-amd: Add AMD SPI controller driver support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-amd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index c7cfc3dc20b1..e5e767ba5823 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -304,7 +304,6 @@ static int amd_spi_remove(struct platform_device *pdev)
 	struct amd_spi *amd_spi = platform_get_drvdata(pdev);
 
 	spi_unregister_master(amd_spi->master);
-	spi_master_put(amd_spi->master);
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
