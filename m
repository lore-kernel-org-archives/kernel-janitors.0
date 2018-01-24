From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 24 Jan 2018 02:14:33 +0000
Subject: [PATCH net-next] cxgb4: make symbol pedits static
Message-Id: <1516760073-129333-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ganesh Goudar <ganeshgr@chelsio.com>, Kumar Sanghvi <kumaras@chelsio.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:46:27: warning:
 symbol 'pedits' was not declared. Should it be static?

Fixes: 27ece1f357b7 ("cxgb4: add tc flower support for ETH-DMAC rewrite")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
index 4fee355..3656336 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
@@ -43,7 +43,7 @@
 
 #define STATS_CHECK_PERIOD (HZ / 2)
 
-struct ch_tc_pedit_fields pedits[] = {
+static struct ch_tc_pedit_fields pedits[] = {
 	PEDIT_FIELDS(ETH_, DMAC_31_0, 4, dmac, 0),
 	PEDIT_FIELDS(ETH_, DMAC_47_32, 2, dmac, 4),
 	PEDIT_FIELDS(ETH_, SMAC_15_0, 2, smac, 0),

