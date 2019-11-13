From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2019 18:25:48 +0000
Subject: [PATCH net-next] cxgb4: Fix an error code in cxgb4_mqprio_alloc_hw_resources()
Message-Id: <20191113182548.vtmyryulik4gxnrv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vishal Kulkarni <vishal@chelsio.com>, Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" is zero or possibly uninitialized on this error path.  It
should be a negative error code instead.

Fixes: 2d0cb84dd973 ("cxgb4: add ETHOFLD hardware queue support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
index 143cb1f31bc0..eee45edc59e7 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
@@ -158,8 +158,10 @@ static int cxgb4_mqprio_alloc_hw_resources(struct net_device *dev)
 		/* Allocate Rxqs for receiving ETHOFLD Tx completions */
 		if (msix >= 0) {
 			msix = cxgb4_get_msix_idx_from_bmap(adap);
-			if (msix < 0)
+			if (msix < 0) {
+				ret = msix;
 				goto out_free_queues;
+			}
 
 			eorxq->msix = &adap->msix_info[msix];
 			snprintf(eorxq->msix->desc,
-- 
2.11.0
