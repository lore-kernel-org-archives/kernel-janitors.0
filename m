From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 27 Jan 2017 13:15:35 +0000
Subject: [PATCH] IB/cma: Fix reversed test
Message-Id: <20170127131535.19918-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dledford@redhat.com, sean.hefty@intel.com, hal.rosenstock@gmail.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This test looks reverted.
We should log an error message only if 'ib_attach_mcast()' fails.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/core/cma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index cfefb941d729..175f62e5841e 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -3838,7 +3838,7 @@ static int cma_ib_mc_handler(int status, struct ib_sa_multicast *multicast)
 	if (!status && id_priv->id.qp) {
 		status = ib_attach_mcast(id_priv->id.qp, &multicast->rec.mgid,
 					 be16_to_cpu(multicast->rec.mlid));
-		if (!status)
+		if (status)
 			pr_debug_ratelimited("RDMA CM: MULTICAST_ERROR: failed to attach QP. status %d\n",
 					     status);
 	}
-- 
2.9.3

