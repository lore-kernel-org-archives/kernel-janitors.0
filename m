From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 10:33:59 +0000
Subject: [PATCH] staging: kpc2000: fix resource size calculation
Message-Id: <20190430103359.GA7064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code is calculating the resource size wrong because it should be
inclusive of the "res->end" address.  In other words, "end - start + 1".
We can just use the resource_size() function to do it correctly.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/kpc2000/kpc_i2c/i2c_driver.c | 2 +-
 drivers/staging/kpc2000/kpc_spi/spi_driver.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c b/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
index 6bb6ad4abe87..1fc30dc687f9 100644
--- a/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
+++ b/drivers/staging/kpc2000/kpc_i2c/i2c_driver.c
@@ -632,7 +632,7 @@ int pi2c_probe(struct platform_device *pldev)
     priv->adapter.algo = &smbus_algorithm;
     
     res = platform_get_resource(pldev, IORESOURCE_MEM, 0);
-    priv->smba = (unsigned long)ioremap_nocache(res->start, res->end - res->start);
+    priv->smba = (unsigned long)ioremap_nocache(res->start, resource_size(res));
     
     priv->pldev = pldev;
     pldev->dev.platform_data = priv;
diff --git a/drivers/staging/kpc2000/kpc_spi/spi_driver.c b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
index b38149b752fb..e568dec04800 100644
--- a/drivers/staging/kpc2000/kpc_spi/spi_driver.c
+++ b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
@@ -452,7 +452,7 @@ kp_spi_probe(struct platform_device *pldev)
         goto free_master;
     }
     
-    kpspi->phys = (unsigned long)ioremap_nocache(r->start, r->end - r->start);
+    kpspi->phys = (unsigned long)ioremap_nocache(r->start, resource_size(r));
     kpspi->base = (u64 __iomem *)kpspi->phys;
     
     status = spi_register_master(master);
-- 
2.18.0
