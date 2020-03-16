From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Mar 2020 09:16:53 +0000
Subject: [PATCH] dmaengine: fix spelling mistake "exceds" -> "exceeds"
Message-Id: <20200316091653.110984-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123092359.10714-1-colin.king@canonical.com>
In-Reply-To: <20200123092359.10714-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in dev_err error messages.
Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/sh/rcar-dmac.c  | 2 +-
 drivers/dma/sh/shdma-base.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index f06016d38a05..59b36ab5d684 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1219,7 +1219,7 @@ rcar_dmac_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
 	sg_len = buf_len / period_len;
 	if (sg_len > RCAR_DMAC_MAX_SG_LEN) {
 		dev_err(chan->device->dev,
-			"chan%u: sg length %d exceds limit %d",
+			"chan%u: sg length %d exceeds limit %d",
 			rchan->index, sg_len, RCAR_DMAC_MAX_SG_LEN);
 		return NULL;
 	}
diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index c51de498b5b4..2deeaab078a4 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -709,7 +709,7 @@ static struct dma_async_tx_descriptor *shdma_prep_dma_cyclic(
 	BUG_ON(!schan->desc_num);
 
 	if (sg_len > SHDMA_MAX_SG_LEN) {
-		dev_err(schan->dev, "sg length %d exceds limit %d",
+		dev_err(schan->dev, "sg length %d exceeds limit %d",
 				sg_len, SHDMA_MAX_SG_LEN);
 		return NULL;
 	}
-- 
2.25.1
