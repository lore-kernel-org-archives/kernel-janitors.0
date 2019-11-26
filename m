From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:23:24 +0000
Subject: [PATCH] spi: pic32: Fix an error code in pic32_spi_dma_prep()
Message-Id: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally return success on this error path.

Fixes: eb7e6dc6d9ff ("spi: pic32: Retire dma_request_slave_channel_compat()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/spi/spi-pic32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 156961b4ca86..93fb95073522 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -633,7 +633,8 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic32s, struct device *dev)
 		goto out_err;
 	}
 
-	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
+	ret = pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE);
+	if (ret)
 		goto out_err;
 
 	/* DMA chnls allocated and prepared */
-- 
2.11.0
