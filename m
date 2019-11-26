From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 13:50:26 +0000
Subject: [PATCH] spi: pic32: Add a comment in pic32_spi_dma_prep()
Message-Id: <20191126135025.mligekonmv2u6dcl@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code triggers a static checker warning about missed error codes.
It's slightly tricky that we fall back to PIO so let's silence the
checker and add a comment for anyone who is confused.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I won't feel offended at all if people don't think it's worth applying
this patch.

 drivers/spi/spi-pic32.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 156961b4ca86..835380ab8bf2 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -633,8 +633,10 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic32s, struct device *dev)
 		goto out_err;
 	}
 
-	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
+	if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE)) {
+		ret = 0;  /* Fall back to PIO if DMA fails. */
 		goto out_err;
+	}
 
 	/* DMA chnls allocated and prepared */
 	set_bit(PIC32F_DMA_PREP, &pic32s->flags);
-- 
2.11.0
