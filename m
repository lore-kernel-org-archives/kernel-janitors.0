From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jan 2018 16:14:25 +0000
Subject: [PATCH] be2net: remove redundant initialization of 'head' and pointer txq
Message-Id: <20180131161425.15011-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Perla <sathya.perla@broadcom.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable head is initialized to a value that is never read and is
being updated to a new value a few lines later, hence this
initialization is redundant and can be safely removed as well
as the now unused pointer txq.

Cleans up clang warning:
drivers/net/ethernet/emulex/benet/be_main.c:996:6: warning: Value
stored to 'head' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/emulex/benet/be_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
index c36c81959198..d81e2d37bc3d 100644
--- a/drivers/net/ethernet/emulex/benet/be_main.c
+++ b/drivers/net/ethernet/emulex/benet/be_main.c
@@ -991,9 +991,8 @@ static u32 be_xmit_enqueue(struct be_adapter *adapter, struct be_tx_obj *txo,
 {
 	u32 i, copied = 0, wrb_cnt = skb_wrb_cnt(skb);
 	struct device *dev = &adapter->pdev->dev;
-	struct be_queue_info *txq = &txo->q;
 	bool map_single = false;
-	u32 head = txq->head;
+	u32 head;
 	dma_addr_t busaddr;
 	int len;
 
-- 
2.15.1

