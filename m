From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 14 Aug 2019 07:21:04 +0000
Subject: [PATCH v2 linux-next 1/2] drivers: dma: make mux_configure32 static
Message-Id: <20190814072105.144107-2-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814072105.144107-1-maowenan@huawei.com>
In-Reply-To: <20190814072105.144107-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

There is one sparse warning in drivers/dma/fsl-edma-common.c:
drivers/dma/fsl-edma-common.c:93:6: warning: symbol 'mux_configure32'
was not declared. Should it be static?

Fix it by setting mux_configure32() as static.

Fixes: 232a7f18cf8ec ("dmaengine: fsl-edma: add i.mx7ulp edma2 version support")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/dma/fsl-edma-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 6d6d8a4e8e38..264c448de409 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -90,7 +90,7 @@ static void mux_configure8(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 	iowrite8(val8, addr + off);
 }
 
-void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
+static void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 		     u32 off, u32 slot, bool enable)
 {
 	u32 val;
-- 
2.20.1
