From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 17 Jan 2019 03:21:47 +0000
Subject: [PATCH -next] RDMA/qedr: remove set but not used variable 'ib_ctx'
Message-Id: <1547695307-134798-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_create_srq':
drivers/infiniband/hw/qedr/verbs.c:1436:22: warning:
 variable 'ib_ctx' set but not used [-Wunused-but-set-variable]

drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_create_user_qp':
drivers/infiniband/hw/qedr/verbs.c:1701:22: warning:
 variable 'ib_ctx' set but not used [-Wunused-but-set-variable]

It not used since commit b0ea0fa5435f ("IB/{core,hw}: Have ib_umem_get extract
the ib_ucontext from ib_udata")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/qedr/verbs.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index bdd887e..0e14a74 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -1433,7 +1433,6 @@ struct ib_srq *qedr_create_srq(struct ib_pd *ibpd,
 	struct qedr_pd *pd = get_qedr_pd(ibpd);
 	struct qedr_create_srq_ureq ureq = {};
 	u64 pbl_base_addr, phy_prod_pair_addr;
-	struct ib_ucontext *ib_ctx = NULL;
 	struct qedr_srq_hwq_info *hw_srq;
 	u32 page_cnt, page_size;
 	struct qedr_srq *srq;
@@ -1459,8 +1458,6 @@ struct ib_srq *qedr_create_srq(struct ib_pd *ibpd,
 	hw_srq->max_sges = init_attr->attr.max_sge;
 
 	if (udata && ibpd->uobject && ibpd->uobject->context) {
-		ib_ctx = ibpd->uobject->context;
-
 		if (ib_copy_from_udata(&ureq, udata, sizeof(ureq))) {
 			DP_ERR(dev,
 			       "create srq: problem copying data from user space\n");
@@ -1698,13 +1695,10 @@ static int qedr_create_user_qp(struct qedr_dev *dev,
 	struct qed_rdma_create_qp_in_params in_params;
 	struct qed_rdma_create_qp_out_params out_params;
 	struct qedr_pd *pd = get_qedr_pd(ibpd);
-	struct ib_ucontext *ib_ctx = NULL;
 	struct qedr_create_qp_ureq ureq;
 	int alloc_and_init = rdma_protocol_roce(&dev->ibdev, 1);
 	int rc = -EINVAL;
 
-	ib_ctx = ibpd->uobject->context;
-
 	memset(&ureq, 0, sizeof(ureq));
 	rc = ib_copy_from_udata(&ureq, udata, sizeof(ureq));
 	if (rc) {
