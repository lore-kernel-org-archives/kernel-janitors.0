From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Feb 2019 11:33:51 +0000
Subject: [PATCH] chelsio: clean up indentation issue
Message-Id: <20190202113351.17803-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to size is indented too far, fix this and join
two lines into one.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb/sge.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/chelsio/cxgb/sge.c
index 30de26ef3da4..2443c2a3ead2 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -585,8 +585,7 @@ static int alloc_rx_resources(struct sge *sge, struct sge_params *p)
 		sizeof(struct cpl_rx_data) +
 		sge->freelQ[!sge->jumbo_fl].dma_offset;
 
-		size = (16 * 1024) -
-		    SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	size = (16 * 1024) - SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
 
 	sge->freelQ[sge->jumbo_fl].rx_buffer_size = size;
 
-- 
2.20.1
