From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:09 +0000
Subject: [PATCH 14/20] dmaengine: st_fdma: drop useless LIST_HEAD
Message-Id: <1545555435-24576-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrice Chotard <patrice.chotard@st.com>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The declarations were introduced with the file, but the declared
variables were not used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 6b4cd727eaf1 ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/dma/st_fdma.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index 07c20aa2e955..954f7cf62bb1 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -294,8 +294,6 @@ static void st_fdma_free_chan_res(struct dma_chan *chan)
 	struct rproc *rproc = fchan->fdev->slim_rproc->rproc;
 	unsigned long flags;
 
-	LIST_HEAD(head);
-
 	dev_dbg(fchan->fdev->dev, "%s: freeing chan:%d\n",
 		__func__, fchan->vchan.chan.chan_id);
 
@@ -626,7 +624,6 @@ static void st_fdma_issue_pending(struct dma_chan *chan)
 static int st_fdma_pause(struct dma_chan *chan)
 {
 	unsigned long flags;
-	LIST_HEAD(head);
 	struct st_fdma_chan *fchan = to_st_fdma_chan(chan);
 	int ch_id = fchan->vchan.chan.chan_id;
 	unsigned long cmd = FDMA_CMD_PAUSE(ch_id);
