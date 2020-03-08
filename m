From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 08 Mar 2020 06:54:42 +0000
Subject: [PATCH] RDMA/bnxt_re: Remove a redundant 'memset'
Message-Id: <20200308065442.5415-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, somnath.kotur@broadcom.com, sriharsha.basavapatna@broadcom.com, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'wqe' is already zeroed at the top of the 'while' loop, just a few lines
below, and is not used outside of the loop.
So there is no need to zero it here as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/bnxt_re/ib_verbs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index ad3e524187e3..15494ca33092 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -2475,7 +2475,6 @@ static int bnxt_re_post_send_shadow_qp(struct bnxt_re_dev *rdev,
 	unsigned long flags;
 
 	spin_lock_irqsave(&qp->sq_lock, flags);
-	memset(&wqe, 0, sizeof(wqe));
 	while (wr) {
 		/* House keeping */
 		memset(&wqe, 0, sizeof(wqe));
-- 
2.20.1
