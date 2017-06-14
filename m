From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:39:24 +0000
Subject: [PATCH] RDS: IB: NULL dereference on error in rds_ib_alloc_frmr()
Message-Id: <20170614103924.GK29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Avinash Repaka <avinash.repaka-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We accidentally return ERR_PTR(0) if ib_alloc_mr() fails.  The caller
is expecting error pointers so it results in a NULL dereference.

Fixes: 1659185fb4d0 ("RDS: IB: Support Fastreg MR (FRMR) memory registration mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/rds/ib_frmr.c b/net/rds/ib_frmr.c
index 48332a6ed738..74a66cc162ed 100644
--- a/net/rds/ib_frmr.c
+++ b/net/rds/ib_frmr.c
@@ -38,7 +38,7 @@ static struct rds_ib_mr *rds_ib_alloc_frmr(struct rds_ib_device *rds_ibdev,
 	struct rds_ib_mr_pool *pool;
 	struct rds_ib_mr *ibmr = NULL;
 	struct rds_ib_frmr *frmr;
-	int err = 0;
+	int err;
 
 	if (npages <= RDS_MR_8K_MSG_SIZE)
 		pool = rds_ibdev->mr_8k_pool;
@@ -61,6 +61,7 @@ static struct rds_ib_mr *rds_ib_alloc_frmr(struct rds_ib_device *rds_ibdev,
 			 pool->fmr_attr.max_pages);
 	if (IS_ERR(frmr->mr)) {
 		pr_warn("RDS/IB: %s failed to allocate MR", __func__);
+		err = -ENOMEM;
 		goto out_no_cigar;
 	}
 
