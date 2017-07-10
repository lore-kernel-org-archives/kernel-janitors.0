From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Jul 2017 07:22:47 +0000
Subject: [PATCH] RDMA/bnxt_re: checking for NULL instead of IS_ERR()
Message-Id: <20170710072247.6eczlwcxu5mt5jry@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Eddie Wai <eddie.wai-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Somnath Kotur <somnath.kotur-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sriharsha Basavapatna <sriharsha.basavapatna-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

bnxt_re_alloc_mw() doesn't return NULL, it returns error pointers.

Fixes: 9152e0b722b2 ("RDMA/bnxt_re: HW workarounds for handling specific conditions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index c7bd68311d0c..e794b0fa4ae6 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -588,10 +588,10 @@ static int bnxt_re_create_fence_mr(struct bnxt_re_pd *pd)
 
 	/* Create a fence MW only for kernel consumers */
 	mw = bnxt_re_alloc_mw(&pd->ib_pd, IB_MW_TYPE_1, NULL);
-	if (!mw) {
+	if (IS_ERR(mw)) {
 		dev_err(rdev_to_dev(rdev),
 			"Failed to create fence-MW for PD: %p\n", pd);
-		rc = -EINVAL;
+		rc = PTR_ERR(mw);
 		goto fail;
 	}
 	fence->mw = mw;
