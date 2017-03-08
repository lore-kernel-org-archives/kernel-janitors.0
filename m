From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Mar 2017 13:28:10 +0000
Subject: [PATCH 23/26] IB/ocrdma: Delete an unnecessary variable in ocrdma_dealloc_pd()
Message-Id: <0e667a69-3afa-6122-ed3b-d313bc5909ad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
In-Reply-To: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Devesh Sharma <devesh.sharma@avagotech.com>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Selvin Xavier <selvin.xavier@avagotech.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Mar 2017 10:58:34 +0100

1. Return zero in one case directly.

2. Return the value from a call of the function "_ocrdma_dealloc_pd"
   without using an extra assignment for the local variable.

3. Remove the variable "status" in this function then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
index 1d25512416f5..ae0d343d1731 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
@@ -755,7 +755,6 @@ int ocrdma_dealloc_pd(struct ib_pd *ibpd)
 	struct ocrdma_pd *pd = get_ocrdma_pd(ibpd);
 	struct ocrdma_dev *dev = get_ocrdma_dev(ibpd->device);
 	struct ocrdma_ucontext *uctx = NULL;
-	int status = 0;
 	u64 usr_db;
 
 	uctx = pd->uctx;
@@ -769,11 +768,10 @@ int ocrdma_dealloc_pd(struct ib_pd *ibpd)
 
 		if (is_ucontext_pd(uctx, pd)) {
 			ocrdma_release_ucontext_pd(uctx);
-			return status;
+			return 0;
 		}
 	}
-	status = _ocrdma_dealloc_pd(dev, pd);
-	return status;
+	return _ocrdma_dealloc_pd(dev, pd);
 }
 
 static int ocrdma_alloc_lkey(struct ocrdma_dev *dev, struct ocrdma_mr *mr,
-- 
2.12.0

