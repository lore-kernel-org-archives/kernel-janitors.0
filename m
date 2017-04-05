From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 05 Apr 2017 13:54:45 +0000
Subject: [PATCH 4/5] IB/qib: Use kcalloc() in qib_init_pportdata()
Message-Id: <e715e921-acef-b406-943c-b61b76d0ff42@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
In-Reply-To: <c16b18ac-287f-5faf-b79a-c86e2adfa22c-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Apr 2017 14:20:10 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/qib/qib_init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_init.c b/drivers/infiniband/hw/qib/qib_init.c
index 9e680ca971e3..101580f0460a 100644
--- a/drivers/infiniband/hw/qib/qib_init.c
+++ b/drivers/infiniband/hw/qib/qib_init.c
@@ -258,15 +258,15 @@ int qib_init_pportdata(struct qib_pportdata *ppd, struct qib_devdata *dd,
 
 	ppd->cc_max_table_entries  		ppd->cc_supported_table_entries/IB_CCT_ENTRIES;
-
-	size = IB_CC_TABLE_CAP_DEFAULT * sizeof(struct ib_cc_table_entry)
-		* IB_CCT_ENTRIES;
-	ppd->ccti_entries = kzalloc(size, GFP_KERNEL);
+	ppd->ccti_entries = kcalloc(IB_CC_TABLE_CAP_DEFAULT * IB_CCT_ENTRIES,
+				    sizeof(*ppd->ccti_entries),
+				    GFP_KERNEL);
 	if (!ppd->ccti_entries)
 		goto bail;
 
-	size = IB_CC_CCS_ENTRIES * sizeof(struct ib_cc_congestion_entry);
-	ppd->congestion_entries = kzalloc(size, GFP_KERNEL);
+	ppd->congestion_entries = kcalloc(IB_CC_CCS_ENTRIES,
+					  sizeof(*ppd->congestion_entries),
+					  GFP_KERNEL);
 	if (!ppd->congestion_entries)
 		goto bail_1;
 
-- 
2.12.2

