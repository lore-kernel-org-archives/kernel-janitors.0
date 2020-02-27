From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Feb 2020 06:45:42 +0000
Subject: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable 'dev_attr'
Message-Id: <20200227064542.91205-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227064209.87893-1-yuehaibing@huawei.com>
In-Reply-To: <20200227064209.87893-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_gsi_qp':
drivers/infiniband/hw/bnxt_re/ib_verbs.c:1283:30: warning:
 variable 'dev_attr' set but not used [-Wunused-but-set-variable]

commit 8dae419f9ec7 ("RDMA/bnxt_re: Refactor queue pair creation code")
involved this, but not used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index ad3e524187e3..7e74efd15d6d 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -1280,14 +1280,12 @@ static int bnxt_re_create_shadow_gsi(struct bnxt_re_qp *qp,
 static int bnxt_re_create_gsi_qp(struct bnxt_re_qp *qp, struct bnxt_re_pd *pd,
 				 struct ib_qp_init_attr *init_attr)
 {
-	struct bnxt_qplib_dev_attr *dev_attr;
 	struct bnxt_re_dev *rdev;
 	struct bnxt_qplib_qp *qplqp;
 	int rc = 0;
 
 	rdev = qp->rdev;
 	qplqp = &qp->qplib_qp;
-	dev_attr = &rdev->dev_attr;
 
 	qplqp->rq_hdr_buf_size = BNXT_QPLIB_MAX_QP1_RQ_HDR_SIZE_V2;
 	qplqp->sq_hdr_buf_size = BNXT_QPLIB_MAX_QP1_SQ_HDR_SIZE_V2;
