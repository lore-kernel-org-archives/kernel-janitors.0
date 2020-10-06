From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 11:47:00 +0000
Subject: [PATCH][next] RDMA/bnxt_re: fix sizeof mismatch for allocation of pbl_tbl.
Message-Id: <20201006114700.537916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Eddie Wai <eddie.wai@broadcom.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof is being used, u64 * is not correct, it should be
just u64 for a table of umem_pgs number of u64 items in the pbl_tbl.
Use the idiom sizeof(*pbl_tbl) to get the object type without the need
to explicitly use u64.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index a0e8d93595d8..dc7de0863c77 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -3856,7 +3856,7 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 	}
 
 	umem_pgs = ib_umem_num_dma_blocks(umem, page_size);
-	pbl_tbl = kcalloc(umem_pgs, sizeof(u64 *), GFP_KERNEL);
+	pbl_tbl = kcalloc(umem_pgs, sizeof(*pbl_tbl), GFP_KERNEL);
 	if (!pbl_tbl) {
 		rc = -ENOMEM;
 		goto free_umem;
-- 
2.27.0
