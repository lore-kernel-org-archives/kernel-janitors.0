From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Feb 2020 06:42:09 +0000
Subject: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable 'pg_size'
Message-Id: <20200227064209.87893-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
drivers/infiniband/hw/bnxt_re/qplib_res.c:109:13: warning:
 variable 'pg_size' set but not used [-Wunused-but-set-variable]

commit 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
involved this, but not used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/bnxt_re/qplib_res.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_res.c b/drivers/infiniband/hw/bnxt_re/qplib_res.c
index fc5909c7f2e0..cab1adf1fed9 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_res.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_res.c
@@ -106,13 +106,12 @@ static int __alloc_pbl(struct bnxt_qplib_res *res,
 	struct pci_dev *pdev = res->pdev;
 	struct scatterlist *sghead;
 	bool is_umem = false;
-	u32 pages, pg_size;
+	u32 pages;
 	int i;
 
 	if (sginfo->nopte)
 		return 0;
 	pages = sginfo->npages;
-	pg_size = sginfo->pgsize;
 	sghead = sginfo->sghead;
 	/* page ptr arrays */
 	pbl->pg_arr = vmalloc(pages * sizeof(void *));
