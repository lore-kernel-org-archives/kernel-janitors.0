From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Aug 2013 07:46:50 +0000
Subject: [patch] dmaengine: make dma_submit_error() return an error code
Message-Id: <20130810074650.GA14390@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <djbw@fb.com>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem here is that the dma_xfer() functions in
drivers/ata/pata_arasan_cf.c and drivers/mtd/nand/fsmc_nand.c expect
dma_submit_error() to return an error code so they return 1 when they
intended to return a negative.

So far as I can tell, none of the ->tx_submit() functions ever do
return error codes so this patch should have no effect in the current
code.

I also changed it from a define to an inline.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 5692bc3..16321fb 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -38,7 +38,10 @@ typedef s32 dma_cookie_t;
 #define DMA_MIN_COOKIE	1
 #define DMA_MAX_COOKIE	INT_MAX
 
-#define dma_submit_error(cookie) ((cookie) < 0 ? 1 : 0)
+static inline int dma_submit_error(dma_cookie_t cookie)
+{
+	return cookie < 0 ? cookie : 0;
+}
 
 /**
  * enum dma_status - DMA transaction status
