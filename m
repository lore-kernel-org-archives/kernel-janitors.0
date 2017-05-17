From: Colin King <colin.king@canonical.com>
Date: Wed, 17 May 2017 08:42:17 +0000
Subject: [PATCH] dmaengine: make several functions static
Message-Id: <20170517084217.23511-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anup Patel <anup.patel@broadcom.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions sba_prep_dma_pq_req, sba_prep_dma_pq_single_req and
sba_prep_dma_xor_req can be made static as they do not need to
be in global scope.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/bcm-sba-raid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index d6b927b960ab..7daa883eeded 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -782,7 +782,7 @@ static void sba_fillup_xor_msg(struct sba_request *req,
 	msg->error = 0;
 }
 
-struct sba_request *
+static struct sba_request *
 sba_prep_dma_xor_req(struct sba_device *sba,
 		     dma_addr_t off, dma_addr_t dst, dma_addr_t *src,
 		     u32 src_cnt, size_t len, unsigned long flags)
@@ -991,7 +991,7 @@ static void sba_fillup_pq_msg(struct sba_request *req,
 	msg->error = 0;
 }
 
-struct sba_request *
+static struct sba_request *
 sba_prep_dma_pq_req(struct sba_device *sba, dma_addr_t off,
 		    dma_addr_t *dst_p, dma_addr_t *dst_q, dma_addr_t *src,
 		    u32 src_cnt, const u8 *scf, size_t len, unsigned long flags)
@@ -1243,7 +1243,7 @@ static void sba_fillup_pq_single_msg(struct sba_request *req,
 	msg->error = 0;
 }
 
-struct sba_request *
+static struct sba_request *
 sba_prep_dma_pq_single_req(struct sba_device *sba, dma_addr_t off,
 			   dma_addr_t *dst_p, dma_addr_t *dst_q,
 			   dma_addr_t src, u8 scf, size_t len,
-- 
2.11.0

