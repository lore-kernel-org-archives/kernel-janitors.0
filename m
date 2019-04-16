From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 14:38:04 +0000
Subject: [PATCH] RDMA/cxgb4: fix spelling mistake "immedate" -> "immediate"
Message-Id: <20190416143804.1518-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Potnuri Bharat Teja <bharat@chelsio.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a module parameter description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/cxgb4/qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
index 9c8962d7bf97..e92b9544357a 100644
--- a/drivers/infiniband/hw/cxgb4/qp.c
+++ b/drivers/infiniband/hw/cxgb4/qp.c
@@ -57,7 +57,7 @@ MODULE_PARM_DESC(db_coalescing_threshold,
 
 static int max_fr_immd = T4_MAX_FR_IMMD;
 module_param(max_fr_immd, int, 0644);
-MODULE_PARM_DESC(max_fr_immd, "fastreg threshold for using DSGL instead of immedate");
+MODULE_PARM_DESC(max_fr_immd, "fastreg threshold for using DSGL instead of immediate");
 
 static int alloc_ird(struct c4iw_dev *dev, u32 ird)
 {
-- 
2.20.1
