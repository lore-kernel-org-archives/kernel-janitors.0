From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 21:54:46 +0000
Subject: [PATCH] net: ethernet: ti: remove redundant NULL check.
Message-Id: <1360706086-31506-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, mugunthanvnm@ti.com, zonque@gmail.com, hotforest@gmail.com, Julia.Lawall@lip6.fr, netdev@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

cpdma_chan_destroy() on a NULL pointer is a no-op, so the NULL check in
cpdma_ctlr_destroy() can safely be removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/net/ethernet/ti/davinci_cpdma.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index f862918..aba787b 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -450,8 +450,7 @@ int cpdma_ctlr_destroy(struct cpdma_ctlr *ctlr)
 		cpdma_ctlr_stop(ctlr);
 
 	for (i = 0; i < ARRAY_SIZE(ctlr->channels); i++) {
-		if (ctlr->channels[i])
-			cpdma_chan_destroy(ctlr->channels[i]);
+		cpdma_chan_destroy(ctlr->channels[i]);
 	}
 
 	cpdma_desc_pool_destroy(ctlr->pool);
-- 
1.7.10.4

