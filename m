From: Colin King <colin.king@canonical.com>
Date: Tue, 01 May 2018 08:25:49 +0000
Subject: [PATCH] RDMA/qedr: fix spelling mistake: "failes" -> "fails"
Message-Id: <20180501082549.22215-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Kalderon <Michal.Kalderon@cavium.com>, Ariel Elior <Ariel.Elior@cavium.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_ERR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/qedr/verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index 7d3763b2e01c..35f3b6f8fd45 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -2579,7 +2579,7 @@ static int qedr_set_page(struct ib_mr *ibmr, u64 addr)
 	u32 pbes_in_page;
 
 	if (unlikely(mr->npages = mr->info.pbl_info.num_pbes)) {
-		DP_ERR(mr->dev, "qedr_set_page failes when %d\n", mr->npages);
+		DP_ERR(mr->dev, "qedr_set_page fails when %d\n", mr->npages);
 		return -ENOMEM;
 	}
 
-- 
2.17.0

