From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2020 14:40:50 +0000
Subject: [PATCH] dmaengine: coh901318: Fix a double lock bug in dma_tc_handle()
Message-Id: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>, kernel-janitors@vger.kernel.org

The caller is already holding the lock so this will deadlock.

Fixes: 0b58828c923e ("DMAENGINE: COH 901 318 remove irq counting")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is the second double lock bug found using static analysis.  The
previous one was commit 627469e4445b ("dmaengine: coh901318: Fix a
double-lock bug").

The fact that this has been broken for ten years suggests that no one
has the hardware.

 drivers/dma/coh901318.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index e51d836afcc7..1092d4ce723e 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -1947,8 +1947,6 @@ static void dma_tc_handle(struct coh901318_chan *cohc)
 		return;
 	}
 
-	spin_lock(&cohc->lock);
-
 	/*
 	 * When we reach this point, at least one queue item
 	 * should have been moved over from cohc->queue to
@@ -1969,8 +1967,6 @@ static void dma_tc_handle(struct coh901318_chan *cohc)
 	if (coh901318_queue_start(cohc) = NULL)
 		cohc->busy = 0;
 
-	spin_unlock(&cohc->lock);
-
 	/*
 	 * This tasklet will remove items from cohc->active
 	 * and thus terminates them.
-- 
2.11.0
