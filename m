From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Feb 2017 21:24:15 +0000
Subject: [PATCH 14/14] RDMA/cxgb4: Rename jump labels in rdma_init()
Message-Id: <b439de0f-197b-a2cb-39e8-711451cbf48f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
In-Reply-To: <0aff92fa-2891-333a-2e1e-ca309db2ec72-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Feb 2017 21:21:47 +0100

Adjust a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/cxgb4/qp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
index c278b1d968b0..29b63eb110a6 100644
--- a/drivers/infiniband/hw/cxgb4/qp.c
+++ b/drivers/infiniband/hw/cxgb4/qp.c
@@ -1467,13 +1467,13 @@ static int rdma_init(struct c4iw_dev *rhp, struct c4iw_qp *qhp)
 
 	ret = c4iw_ofld_send(&rhp->rdev, skb);
 	if (ret)
-		goto err1;
+		goto free_ird;
 
 	ret = c4iw_wait_for_reply(&rhp->rdev, &qhp->ep->com.wr_wait,
 				  qhp->ep->hwtid, qhp->wq.sq.qid, __func__);
 	if (!ret)
 		goto out;
-err1:
+free_ird:
 	free_ird(rhp, qhp->attr.max_ird);
 out:
 	PDBG("%s ret %d\n", __func__, ret);
-- 
2.11.1

