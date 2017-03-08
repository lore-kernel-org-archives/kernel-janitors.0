From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Mar 2017 13:30:18 +0000
Subject: [PATCH 24/26] IB/ocrdma: One jump label less in ocrdma_alloc_ucontext_pd()
Message-Id: <3954cbe9-a265-bcb8-2dac-daade1a5e967@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
In-Reply-To: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Devesh Sharma <devesh.sharma@avagotech.com>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Selvin Xavier <selvin.xavier@avagotech.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Mar 2017 11:11:35 +0100

This issue was detected by using the Coccinelle software.

1. Return directly if a call of the function "_ocrdma_alloc_pd" failed.

2. Reduce the scope for the local variable "status" to one case
   of an if statement.

3. Delete the jump label "err" then.

4. Return zero as a constant at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index ae0d343d1731..d3cb8e2f099f 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -484,19 +484,17 @@ static int ocrdma_alloc_ucontext_pd(struct ocrdma_dev *dev,
 				    struct ocrdma_ucontext *uctx,
 				    struct ib_udata *udata)
 {
-	int status = 0;
-
 	uctx->cntxt_pd = _ocrdma_alloc_pd(dev, uctx, udata);
 	if (IS_ERR(uctx->cntxt_pd)) {
-		status = PTR_ERR(uctx->cntxt_pd);
+		int status = PTR_ERR(uctx->cntxt_pd);
+
 		uctx->cntxt_pd = NULL;
-		goto err;
+		return status;
 	}
 
 	uctx->cntxt_pd->uctx = uctx;
 	uctx->cntxt_pd->ibpd.device = &dev->ibdev;
-err:
-	return status;
+	return 0;
 }
 
 static int ocrdma_dealloc_ucontext_pd(struct ocrdma_ucontext *uctx)
-- 
2.12.0

