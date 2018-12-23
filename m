From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:13 +0000
Subject: [PATCH 18/20] dmaengine: sa11x0: drop useless LIST_HEAD
Message-Id: <1545555435-24576-19-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares has never been
used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 4a533218fccf ("dmaengine: sa11x0: Split device_control")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/dma/sa11x0-dma.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index 784d5f1a473b..3fae23768b47 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -705,7 +705,6 @@ static int sa11x0_dma_device_pause(struct dma_chan *chan)
 	struct sa11x0_dma_chan *c = to_sa11x0_dma_chan(chan);
 	struct sa11x0_dma_dev *d = to_sa11x0_dma(chan->device);
 	struct sa11x0_dma_phy *p;
-	LIST_HEAD(head);
 	unsigned long flags;
 
 	dev_dbg(d->slave.dev, "vchan %p: pause\n", &c->vc);
@@ -732,7 +731,6 @@ static int sa11x0_dma_device_resume(struct dma_chan *chan)
 	struct sa11x0_dma_chan *c = to_sa11x0_dma_chan(chan);
 	struct sa11x0_dma_dev *d = to_sa11x0_dma(chan->device);
 	struct sa11x0_dma_phy *p;
-	LIST_HEAD(head);
 	unsigned long flags;
 
 	dev_dbg(d->slave.dev, "vchan %p: resume\n", &c->vc);
