From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Feb 2017 09:04:35 +0000
Subject: [PATCH 2/2] IB/hns: Use kcalloc() in hns_roce_buddy_init()
Message-Id: <e36d3f04-1bca-3067-97c1-568d6673ebfb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4863af1d-ca80-1818-213e-7eadda35e8a1@users.sourceforge.net>
In-Reply-To: <4863af1d-ca80-1818-213e-7eadda35e8a1-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Wei Hu <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Feb 2017 09:30:55 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determinations a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/hns/hns_roce_mr.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_mr.c b/drivers/infiniband/hw/hns/hns_roce_mr.c
index 4139abee3b54..b48693510727 100644
--- a/drivers/infiniband/hw/hns/hns_roce_mr.c
+++ b/drivers/infiniband/hw/hns/hns_roce_mr.c
@@ -127,11 +127,12 @@ static int hns_roce_buddy_init(struct hns_roce_buddy *buddy, int max_order)
 
 	buddy->max_order = max_order;
 	spin_lock_init(&buddy->lock);
-
-	buddy->bits = kzalloc((buddy->max_order + 1) * sizeof(long *),
-			       GFP_KERNEL);
-	buddy->num_free = kzalloc((buddy->max_order + 1) * sizeof(int *),
-				   GFP_KERNEL);
+	buddy->bits = kcalloc(buddy->max_order + 1,
+			      sizeof(*buddy->bits),
+			      GFP_KERNEL);
+	buddy->num_free = kcalloc(buddy->max_order + 1,
+				  sizeof(*buddy->num_free),
+				  GFP_KERNEL);
 	if (!buddy->bits || !buddy->num_free)
 		goto err_out;
 
-- 
2.11.1

