From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Apr 2020 22:49:21 +0000
Subject: [PATCH][next] i40iw: fix null pointer dereference on a null wqe pointer
Message-Id: <20200401224921.405279-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faisal Latif <faisal.latif@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, sindhu.devale@intel.com, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the null check for wqe is incorrect and lets a null wqe
be passed to set_64bit_val and this indexes into the null pointer
causing a null pointer dereference.  Fix this by fixing the null
pointer check to return an error if wqe is null.

Addresses-Coverity: ("dereference after a null check")
Fixes: 4b34e23f4eaa ("i40iw: Report correct firmware version")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/i40iw/i40iw_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
index e8b4b3743661..688f19667221 100644
--- a/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
+++ b/drivers/infiniband/hw/i40iw/i40iw_ctrl.c
@@ -1046,7 +1046,7 @@ i40iw_sc_query_rdma_features(struct i40iw_sc_cqp *cqp,
 	u64 header;
 
 	wqe = i40iw_sc_cqp_get_next_send_wqe(cqp, scratch);
-	if (wqe)
+	if (!wqe)
 		return I40IW_ERR_RING_FULL;
 
 	set_64bit_val(wqe, 32, feat_mem->pa);
-- 
2.25.1
