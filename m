From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Sep 2013 07:54:51 +0000
Subject: [patch] spi: spi-topcliff-pch: fix a pci_iomap() check
Message-Id: <20130924075451.GA29141@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If pci_iomap() returns NULL, adding "PCH_ADDRESS_SIZE * plat_dev->id"
can make it non-NULL which breaks the error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index eaeeed5..777c404 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1410,13 +1410,13 @@ static int pch_spi_pd_probe(struct platform_device *plat_dev)
 	/* baseaddress + address offset) */
 	data->io_base_addr = pci_resource_start(board_dat->pdev, 1) +
 					 PCH_ADDRESS_SIZE * plat_dev->id;
-	data->io_remap_addr = pci_iomap(board_dat->pdev, 1, 0) +
-					 PCH_ADDRESS_SIZE * plat_dev->id;
+	data->io_remap_addr = pci_iomap(board_dat->pdev, 1, 0);
 	if (!data->io_remap_addr) {
 		dev_err(&plat_dev->dev, "%s pci_iomap failed\n", __func__);
 		ret = -ENOMEM;
 		goto err_pci_iomap;
 	}
+	data->io_remap_addr += PCH_ADDRESS_SIZE * plat_dev->id;
 
 	dev_dbg(&plat_dev->dev, "[ch%d] remap_addr=%p\n",
 		plat_dev->id, data->io_remap_addr);
