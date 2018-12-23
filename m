From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:12 +0000
Subject: [PATCH 17/20] dmaengine: pl330: drop useless LIST_HEAD
Message-Id: <1545555435-24576-18-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The variable has not been used since the function was introduced
in 740aa95703c5 ("dmaengine: pl330: Split device_control").

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 740aa95703c5 ("dmaengine: pl330: Split device_control")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/dma/pl330.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index cff1b143fff5..eec79fdf27a5 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2267,7 +2267,6 @@ static int pl330_terminate_all(struct dma_chan *chan)
 	struct dma_pl330_desc *desc;
 	unsigned long flags;
 	struct pl330_dmac *pl330 = pch->dmac;
-	LIST_HEAD(list);
 	bool power_down = false;
 
 	pm_runtime_get_sync(pl330->ddma.dev);
