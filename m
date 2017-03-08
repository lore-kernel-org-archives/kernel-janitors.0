From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Mar 2017 13:09:02 +0000
Subject: [PATCH 13/26] IB/ocrdma: Use kcalloc() in ocrdma_alloc_resources()
Message-Id: <5c457559-d7a2-12ec-505c-5b030a425e47@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
In-Reply-To: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Devesh Sharma <devesh.sharma@avagotech.com>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Selvin Xavier <selvin.xavier@avagotech.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 7 Mar 2017 21:55:42 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus reuse the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determinations a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_main.c b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
index 3e43bdc81e7a..9caa4c564e34 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_main.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
@@ -225,19 +225,19 @@ static int ocrdma_register_device(struct ocrdma_dev *dev)
 static int ocrdma_alloc_resources(struct ocrdma_dev *dev)
 {
 	mutex_init(&dev->dev_lock);
-	dev->cq_tbl = kzalloc(sizeof(struct ocrdma_cq *) *
-			      OCRDMA_MAX_CQ, GFP_KERNEL);
+	dev->cq_tbl = kcalloc(OCRDMA_MAX_CQ, sizeof(*dev->cq_tbl), GFP_KERNEL);
 	if (!dev->cq_tbl)
 		goto alloc_err;
 
 	if (dev->attr.max_qp) {
-		dev->qp_tbl = kzalloc(sizeof(struct ocrdma_qp *) *
-				      OCRDMA_MAX_QP, GFP_KERNEL);
+		dev->qp_tbl = kcalloc(OCRDMA_MAX_QP, sizeof(*dev->qp_tbl),
+				      GFP_KERNEL);
 		if (!dev->qp_tbl)
 			goto alloc_err;
 	}
 
-	dev->stag_arr = kzalloc(sizeof(u64) * OCRDMA_MAX_STAG, GFP_KERNEL);
+	dev->stag_arr = kcalloc(OCRDMA_MAX_STAG, sizeof(*dev->stag_arr),
+				GFP_KERNEL);
 	if (dev->stag_arr = NULL)
 		goto alloc_err;
 
-- 
2.12.0

