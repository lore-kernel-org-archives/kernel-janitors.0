From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:58:02 +0000
Subject: [PATCH] RDMA/bnxt_re: Fix a bunch of off by one bugs in qplib_fp.c
Message-Id: <20180704095802.wg4wjgdweyy6ofug@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The srq->swq[] is allocated in bnxt_qplib_create_srq().  It has
srq->hwq.max_elements elements so these tests should be > instead of >or we might go beyond the end of the array.

Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_fp.c b/drivers/infiniband/hw/bnxt_re/qplib_fp.c
index 50d8f1fc98d5..e426b990c1dd 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_fp.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_fp.c
@@ -2354,7 +2354,7 @@ static int bnxt_qplib_cq_process_res_rc(struct bnxt_qplib_cq *cq,
 		srq = qp->srq;
 		if (!srq)
 			return -EINVAL;
-		if (wr_id_idx > srq->hwq.max_elements) {
+		if (wr_id_idx >= srq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process RC ");
 			dev_err(&cq->hwq.pdev->dev,
@@ -2369,7 +2369,7 @@ static int bnxt_qplib_cq_process_res_rc(struct bnxt_qplib_cq *cq,
 		*pcqe = cqe;
 	} else {
 		rq = &qp->rq;
-		if (wr_id_idx > rq->hwq.max_elements) {
+		if (wr_id_idx >= rq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process RC ");
 			dev_err(&cq->hwq.pdev->dev,
@@ -2437,7 +2437,7 @@ static int bnxt_qplib_cq_process_res_ud(struct bnxt_qplib_cq *cq,
 		if (!srq)
 			return -EINVAL;
 
-		if (wr_id_idx > srq->hwq.max_elements) {
+		if (wr_id_idx >= srq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process UD ");
 			dev_err(&cq->hwq.pdev->dev,
@@ -2452,7 +2452,7 @@ static int bnxt_qplib_cq_process_res_ud(struct bnxt_qplib_cq *cq,
 		*pcqe = cqe;
 	} else {
 		rq = &qp->rq;
-		if (wr_id_idx > rq->hwq.max_elements) {
+		if (wr_id_idx >= rq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process UD ");
 			dev_err(&cq->hwq.pdev->dev,
@@ -2546,7 +2546,7 @@ static int bnxt_qplib_cq_process_res_raweth_qp1(struct bnxt_qplib_cq *cq,
 				"QPLIB: FP: SRQ used but not defined??");
 			return -EINVAL;
 		}
-		if (wr_id_idx > srq->hwq.max_elements) {
+		if (wr_id_idx >= srq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process Raw/QP1 ");
 			dev_err(&cq->hwq.pdev->dev,
@@ -2561,7 +2561,7 @@ static int bnxt_qplib_cq_process_res_raweth_qp1(struct bnxt_qplib_cq *cq,
 		*pcqe = cqe;
 	} else {
 		rq = &qp->rq;
-		if (wr_id_idx > rq->hwq.max_elements) {
+		if (wr_id_idx >= rq->hwq.max_elements) {
 			dev_err(&cq->hwq.pdev->dev,
 				"QPLIB: FP: CQ Process Raw/QP1 RQ wr_id ");
 			dev_err(&cq->hwq.pdev->dev,
