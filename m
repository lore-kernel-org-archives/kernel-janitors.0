From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Feb 2017 21:01:21 +0000
Subject: [PATCH 1/5] IB/hfi1: Use kcalloc() in hfi1_user_exp_rcv_init()
Message-Id: <89f8b926-e272-71f2-f15e-3c322251da7b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
In-Reply-To: <8a997282-09c7-0f9f-645e-d7c6e8c79e67-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 9 Feb 2017 15:30:53 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus reuse the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/hfi1/user_exp_rcv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.c b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
index 64d26525435a..8ae0d26a34c6 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.c
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
@@ -199,8 +199,9 @@ int hfi1_user_exp_rcv_init(struct file *fp)
 
 	if (!HFI1_CAP_UGET_MASK(uctxt->flags, TID_UNMAP)) {
 		fd->invalid_tid_idx = 0;
-		fd->invalid_tids = kzalloc(uctxt->expected_count *
-					   sizeof(u32), GFP_KERNEL);
+		fd->invalid_tids = kcalloc(uctxt->expected_count,
+					   sizeof(*fd->invalid_tids),
+					   GFP_KERNEL);
 		if (!fd->invalid_tids) {
 			ret = -ENOMEM;
 			goto done;
-- 
2.11.1

