From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Nov 2019 19:11:43 +0000
Subject: [PATCH] dmaengine: iop-adma: clean up an indentation issue
Message-Id: <20191112191143.282814-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented too deeply, remove
the extraneous indentation.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/iop-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index 4dc5478fc156..db0e274126fb 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -173,7 +173,7 @@ static void __iop_adma_slot_cleanup(struct iop_adma_chan *iop_chan)
 					&iop_chan->chain, chain_node) {
 					zero_sum_result | 					    iop_desc_get_zero_result(grp_iter);
-					    pr_debug("\titer%d result: %d\n",
+					pr_debug("\titer%d result: %d\n",
 					    grp_iter->idx, zero_sum_result);
 					slot_cnt -= slots_per_op;
 					if (slot_cnt = 0)
-- 
2.20.1
