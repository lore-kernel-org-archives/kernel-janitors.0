From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:57:11 +0000
Subject: [PATCH] RDMA/bnxt_re: Fix a couple off by one bugs
Message-Id: <20180704095711.v3mjb3qkbgo6iw2r@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The sgid_tbl->tbl[] array is allocated in bnxt_qplib_alloc_sgid_tbl().
It has sgid_tbl->max elements.  So the > should be >= to prevent
accessing one element beyond the end of the array.

Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_sp.c b/drivers/infiniband/hw/bnxt_re/qplib_sp.c
index 2f3f32eaa1d5..4097f3fa25c5 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_sp.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_sp.c
@@ -197,7 +197,7 @@ int bnxt_qplib_get_sgid(struct bnxt_qplib_res *res,
 			struct bnxt_qplib_sgid_tbl *sgid_tbl, int index,
 			struct bnxt_qplib_gid *gid)
 {
-	if (index > sgid_tbl->max) {
+	if (index >= sgid_tbl->max) {
 		dev_err(&res->pdev->dev,
 			"QPLIB: Index %d exceeded SGID table max (%d)",
 			index, sgid_tbl->max);
@@ -402,7 +402,7 @@ int bnxt_qplib_get_pkey(struct bnxt_qplib_res *res,
 		*pkey = 0xFFFF;
 		return 0;
 	}
-	if (index > pkey_tbl->max) {
+	if (index >= pkey_tbl->max) {
 		dev_err(&res->pdev->dev,
 			"QPLIB: Index %d exceeded PKEY table max (%d)",
 			index, pkey_tbl->max);
