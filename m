From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Feb 2020 06:49:00 +0000
Subject: [PATCH -next] RDMA/bnxt_re: Remove set but not used variables 'pg' and 'idx'
Message-Id: <20200227064900.92255-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227064209.87893-1-yuehaibing@huawei.com>
In-Reply-To: <20200227064209.87893-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/bnxt_re/qplib_rcfw.c: In function '__send_message':
drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:101:10: warning:
 variable 'idx' set but not used [-Wunused-but-set-variable]
drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:101:6: warning:
 variable 'pg' set but not used [-Wunused-but-set-variable]

commit cee0c7bba486 ("RDMA/bnxt_re: Refactor command queue management code")
involved this, but not used.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c b/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
index b0b050e5cd12..f01e864bb611 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
@@ -98,7 +98,6 @@ static int __send_message(struct bnxt_qplib_rcfw *rcfw, struct cmdq_base *req,
 	unsigned long flags;
 	u32 size, opcode;
 	u16 cookie, cbit;
-	int pg, idx;
 	u8 *preq;
 
 	pdev = rcfw->pdev;
@@ -167,9 +166,6 @@ static int __send_message(struct bnxt_qplib_rcfw *rcfw, struct cmdq_base *req,
 	hwq_ptr = (struct bnxt_qplib_cmdqe **)hwq->pbl_ptr;
 	preq = (u8 *)req;
 	do {
-		pg = 0;
-		idx = 0;
-
 		/* Locate the next cmdq slot */
 		sw_prod = HWQ_CMP(hwq->prod, hwq);
 		cmdqe = &hwq_ptr[get_cmdq_pg(sw_prod, cmdq_depth)]
