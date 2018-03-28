From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:19 +0000
Subject: [PATCH net-next] net: bcmgenet: return NULL instead of plain integer
Message-Id: <1522241479-77691-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/broadcom/genet/bcmgenet.c:1351:16: warning:
 Using plain integer as NULL pointer

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 7db8edc..2f4cb5c 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1348,7 +1348,7 @@ static struct sk_buff *bcmgenet_free_tx_cb(struct device *dev,
 		dma_unmap_addr_set(cb, dma_addr, 0);
 	}
 
-	return 0;
+	return NULL;
 }
 
 /* Simple helper to free a receive control block's resources */

