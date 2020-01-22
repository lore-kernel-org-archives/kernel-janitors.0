From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 09:38:18 +0000
Subject: [PATCH][next] dmaengine: ti: k3-udma: fix spelling mistake "limted" -> "limited"
Message-Id: <20200122093818.2800743-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/ti/k3-udma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9974e72cdc50..ea79c2df28e0 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2300,7 +2300,7 @@ udma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	/* static TR for remote PDMA */
 	if (udma_configure_statictr(uc, d, dev_width, burst)) {
 		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limted to maximum 4095 (%u)\n",
+			"%s: StaticTR Z is limited to maximum 4095 (%u)\n",
 			__func__, d->static_tr.bstcnt);
 
 		udma_free_hwdesc(uc, d);
@@ -2483,7 +2483,7 @@ udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
 	/* static TR for remote PDMA */
 	if (udma_configure_statictr(uc, d, dev_width, burst)) {
 		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limted to maximum 4095 (%u)\n",
+			"%s: StaticTR Z is limited to maximum 4095 (%u)\n",
 			__func__, d->static_tr.bstcnt);
 
 		udma_free_hwdesc(uc, d);
-- 
2.24.0
