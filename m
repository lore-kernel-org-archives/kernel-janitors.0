From: Colin King <colin.king@canonical.com>
Date: Wed, 17 May 2017 21:58:50 +0000
Subject: [PATCH][V2] dmaengine: bcm-scm-raid: remove redundant null check on req
Message-Id: <20170517215850.5077-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anup Patel <anup.patel@broadcom.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Req is never null on at the point of the null check, so
remove this redundant check and just return &req->tx.

Detected by CoverityScan, CID#1436147 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/bcm-sba-raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 7daa883eeded..8246c26eabe5 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -582,7 +582,7 @@ sba_prep_dma_interrupt(struct dma_chan *dchan, unsigned long flags)
 	req->tx.flags = flags;
 	req->tx.cookie = -EBUSY;
 
-	return (req) ? &req->tx : NULL;
+	return &req->tx;
 }
 
 static void sba_fillup_memcpy_msg(struct sba_request *req,
-- 
2.11.0

