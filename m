From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Feb 2017 21:22:28 +0000
Subject: [PATCH 12/14] RDMA/cxgb4: Delete an unnecessary variable initialisation in create_qp()
Message-Id: <b319a50e-9e2a-61c0-5707-b4549b077d6a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0aff92fa-2891-333a-2e1e-ca309db2ec72@users.sourceforge.net>
In-Reply-To: <0aff92fa-2891-333a-2e1e-ca309db2ec72-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Feb 2017 21:07:07 +0100

The local variable "ret" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/cxgb4/qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/cxgb4/qp.c b/drivers/infiniband/hw/cxgb4/qp.c
index 373d66a511a8..ac63b1f70731 100644
--- a/drivers/infiniband/hw/cxgb4/qp.c
+++ b/drivers/infiniband/hw/cxgb4/qp.c
@@ -202,7 +202,7 @@ static int create_qp(struct c4iw_rdev *rdev, struct t4_wq *wq,
 	int wr_len;
 	struct c4iw_wr_wait wr_wait;
 	struct sk_buff *skb;
-	int ret = 0;
+	int ret;
 	int eqsize;
 
 	wq->sq.qid = c4iw_get_qpid(rdev, uctx);
-- 
2.11.1

