From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 02:54:26 +0000
Subject: [PATCH -next] spi: spi-amd: Fix a NULL vs IS_ERR() check in amd_spi_probe()
Message-Id: <20200429025426.167664-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sanjay R Mehta <sanju.mehta@amd.com>, Mark Brown <broonie@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: bbb336f39efc ("spi: spi-amd: Add AMD SPI controller driver support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-amd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index 0d9debe1386e..d8e66689d132 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -266,10 +266,9 @@ static int amd_spi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	amd_spi->io_remap_addr = devm_ioremap_resource(&pdev->dev, res);
-
-	if (!amd_spi->io_remap_addr) {
+	if (IS_ERR(amd_spi->io_remap_addr)) {
+		err = PTR_ERR(amd_spi->io_remap_addr);
 		dev_err(dev, "error %d ioremap of SPI registers failed\n", err);
-		err = -ENOMEM;
 		goto err_free_master;
 	}
 	dev_dbg(dev, "io_remap_address: %p\n", amd_spi->io_remap_addr);
