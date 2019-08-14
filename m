From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 14 Aug 2019 07:21:05 +0000
Subject: [PATCH v2 linux-next 2/2] drivers: dma: change alignment of mux_configure32 and fsl_edma_chan_mux
Message-Id: <20190814072105.144107-3-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814072105.144107-1-maowenan@huawei.com>
In-Reply-To: <20190814072105.144107-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

The alignment of mux_configure32() and fsl_edma_chan_mux() need 
to be adjusted, it must start precisely at the first column after 
the openning parenthesis of the first line.

Fixes: 9d831528a656 ("dmaengine: fsl-edma: extract common fsl-edma code (no changes in behavior intended)")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/dma/fsl-edma-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 264c448de409..b1a7ca91701a 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -91,7 +91,7 @@ static void mux_configure8(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 }
 
 static void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
-		     u32 off, u32 slot, bool enable)
+			    u32 off, u32 slot, bool enable)
 {
 	u32 val;
 
@@ -104,7 +104,7 @@ static void mux_configure32(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 }
 
 void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
-			unsigned int slot, bool enable)
+		       unsigned int slot, bool enable)
 {
 	u32 ch = fsl_chan->vchan.chan.chan_id;
 	void __iomem *muxaddr;
-- 
2.20.1
