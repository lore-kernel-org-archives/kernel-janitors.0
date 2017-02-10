From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Feb 2017 21:03:23 +0000
Subject: [PATCH 3/5] IB/hfi1: Adjust another size determination in hfi1_user_sdma_alloc_queues()
Message-Id: <0fdf4d81-58d7-c6fc-b37f-41d47675dd83@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
In-Reply-To: <8a997282-09c7-0f9f-645e-d7c6e8c79e67-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Feb 2017 08:50:45 +0100

* Pass a product for a call of the function "vmalloc_user" without storing
  it in an intermediate variable.

* Delete the local variable "memsize" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/hfi1/user_sdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/user_sdma.c b/drivers/infiniband/hw/hfi1/user_sdma.c
index 15194554a92b..991e7f3d8e18 100644
--- a/drivers/infiniband/hw/hfi1/user_sdma.c
+++ b/drivers/infiniband/hw/hfi1/user_sdma.c
@@ -375,7 +375,6 @@ int hfi1_user_sdma_alloc_queues(struct hfi1_ctxtdata *uctxt, struct file *fp)
 {
 	struct hfi1_filedata *fd;
 	int ret = 0;
-	unsigned memsize;
 	char buf[64];
 	struct hfi1_devdata *dd;
 	struct hfi1_user_sdma_comp_q *cq;
@@ -443,8 +442,8 @@ int hfi1_user_sdma_alloc_queues(struct hfi1_ctxtdata *uctxt, struct file *fp)
 	if (!cq)
 		goto cq_nomem;
 
-	memsize = PAGE_ALIGN(sizeof(*cq->comps) * hfi1_sdma_comp_ring_size);
-	cq->comps = vmalloc_user(memsize);
+	cq->comps = vmalloc_user(PAGE_ALIGN(sizeof(*cq->comps)
+				 * hfi1_sdma_comp_ring_size));
 	if (!cq->comps)
 		goto cq_comps_nomem;
 
-- 
2.11.1

