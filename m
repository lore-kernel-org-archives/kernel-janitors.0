From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Dec 2015 18:43:43 +0000
Subject: [PATCH 1/6] InfiniBand-ocrdma: One variable and jump label less in ocrdma_alloc_ucontext_pd()
Message-Id: <567EDFDF.5000801@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567EDED5.4040201@users.sourceforge.net>
In-Reply-To: <567EDED5.4040201@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Devesh Sharma <devesh.sharma@avagotech.com>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Mitesh Ahuja <mitesh.ahuja@avagotech.com>, Sean Hefty <sean.hefty@intel.com>, Selvin Xavier <selvin.xavier@avagotech.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Dec 2015 17:16:00 +0100

This issue was detected by using the Coccinelle software.

* Let us return directly if a call of the _ocrdma_alloc_pd()
  function failed.

* Delete the jump label "err" and the local variable "status" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index 583001b..374c839 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -483,19 +483,15 @@ static int ocrdma_alloc_ucontext_pd(struct ocrdma_dev *dev,
 				    struct ocrdma_ucontext *uctx,
 				    struct ib_udata *udata)
 {
-	int status = 0;
-
 	uctx->cntxt_pd = _ocrdma_alloc_pd(dev, uctx, udata);
 	if (IS_ERR(uctx->cntxt_pd)) {
-		status = PTR_ERR(uctx->cntxt_pd);
 		uctx->cntxt_pd = NULL;
-		goto err;
+		return PTR_ERR(uctx->cntxt_pd);
 	}
 
 	uctx->cntxt_pd->uctx = uctx;
 	uctx->cntxt_pd->ibpd.device = &dev->ibdev;
-err:
-	return status;
+	return 0;
 }
 
 static int ocrdma_dealloc_ucontext_pd(struct ocrdma_ucontext *uctx)
-- 
2.6.3

