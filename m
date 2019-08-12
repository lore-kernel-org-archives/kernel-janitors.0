From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 12 Aug 2019 07:42:05 +0000
Subject: [PATCH linux-next] drivers: dma: Fix sparse warning for mux_configure32
Message-Id: <20190812074205.96759-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

There is one sparse warning in drivers/dma/fsl-edma-common.c,
fix it by setting mux_configure32() as static.

make allmodconfig ARCH=mips CROSS_COMPILE=mips-linux-gnu-
make C=2 drivers/dma/fsl-edma-common.o ARCH=mips CROSS_COMPILE=mips-linux-gnu-
drivers/dma/fsl-edma-common.c:93:6: warning: symbol 'mux_configure32' was not declared. Should it be static?

Fixes: 232a7f18cf8ec ("dmaengine: fsl-edma: add i.mx7ulp edma2 version support")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/dma/fsl-edma-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 6d6d8a4..7dbf7df 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -90,8 +90,8 @@ static void mux_configure8(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 	iowrite8(val8, addr + off);
 }
 
-void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
-		     u32 off, u32 slot, bool enable)
+static void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
+			    u32 off, u32 slot, bool enable)
 {
 	u32 val;
 
-- 
2.7.4
