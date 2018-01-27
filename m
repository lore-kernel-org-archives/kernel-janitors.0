From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 20:16:34 +0000
Subject: [PATCH 1/2] RDMA/bnxt_re: Delete two error messages for a failed memory allocation in bnxt_qplib_all
Message-Id: <1d57e7ae-b04a-3875-d89a-c4e3c57b96bc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19c755a6-8c52-bbd5-a425-48fc08cecd4f@users.sourceforge.net>
In-Reply-To: <19c755a6-8c52-bbd5-a425-48fc08cecd4f-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Somnath Kotur <somnath.kotur-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sriharsha Basavapatna <sriharsha.basavapatna-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 20:40:11 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/bnxt_re/qplib_res.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_res.c b/drivers/infiniband/hw/bnxt_re/qplib_res.c
index ad37d54affcc..9dacfd24869b 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_res.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_res.c
@@ -707,8 +707,6 @@ static int bnxt_qplib_alloc_dpi_tbl(struct bnxt_qplib_res     *res,
 	dpit->app_tbl = kcalloc(dpit->max, sizeof(void *), GFP_KERNEL);
 	if (!dpit->app_tbl) {
 		pci_iounmap(res->pdev, dpit->dbr_bar_reg_iomem);
-		dev_err(&res->pdev->dev,
-			"QPLIB: DPI app tbl allocation failed");
 		return -ENOMEM;
 	}
 
@@ -721,9 +719,6 @@ static int bnxt_qplib_alloc_dpi_tbl(struct bnxt_qplib_res     *res,
 		pci_iounmap(res->pdev, dpit->dbr_bar_reg_iomem);
 		kfree(dpit->app_tbl);
 		dpit->app_tbl = NULL;
-		dev_err(&res->pdev->dev,
-			"QPLIB: DPI tbl allocation failed for size = %d",
-			bytes);
 		return -ENOMEM;
 	}
 
-- 
2.16.1

