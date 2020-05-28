From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 12:49:57 +0000
Subject: [PATCH net-next] cxgb4: cleanup error code in setup_sge_queues_uld()
Message-Id: <20200528124957.GD1219412@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vishal Kulkarni <vishal@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The caller doesn't care about the error codes, they only check for zero
vs non-zero.  Still, it's better to preserve the negative error codes
from alloc_uld_rxqs() instead of changing it to 1.  We can also return
directly if there is a failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This isn't a bugfix so it should probably go to net-next, but the code
is pretty old.

The other error handling only checks the last iteration in the
for_each_port() loop.  I didn't change that because it's slightly
riskier and I can't test the code.

 drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
index 6b1d3df4b9bae..9e3c6b36cde89 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
@@ -174,13 +174,14 @@ static int
 setup_sge_queues_uld(struct adapter *adap, unsigned int uld_type, bool lro)
 {
 	struct sge_uld_rxq_info *rxq_info = adap->sge.uld_rxq_info[uld_type];
-	int i, ret = 0;
+	int i, ret;
 
-	ret = !(!alloc_uld_rxqs(adap, rxq_info, lro));
+	ret = alloc_uld_rxqs(adap, rxq_info, lro);
+	if (ret)
+		return ret;
 
 	/* Tell uP to route control queue completions to rdma rspq */
-	if (adap->flags & CXGB4_FULL_INIT_DONE &&
-	    !ret && uld_type = CXGB4_ULD_RDMA) {
+	if (adap->flags & CXGB4_FULL_INIT_DONE && uld_type = CXGB4_ULD_RDMA) {
 		struct sge *s = &adap->sge;
 		unsigned int cmplqid;
 		u32 param, cmdop;
-- 
2.26.2
