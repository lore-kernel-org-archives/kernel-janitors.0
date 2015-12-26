From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Dec 2015 18:47:17 +0000
Subject: [PATCH 3/6] InfiniBand-ocrdma: Returning only value constants in ocrdma_qp_state_change()
Message-Id: <567EE0B5.5020707@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567EDED5.4040201@users.sourceforge.net>
In-Reply-To: <567EDED5.4040201-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mitesh Ahuja <mitesh.ahuja-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Dec 2015 18:28:35 +0100

Return zero at the end without using the local variable "status".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_hw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
index 6647aa6..9a2b153 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
@@ -2110,7 +2110,6 @@ int ocrdma_qp_state_change(struct ocrdma_qp *qp, enum ib_qp_state new_ib_state,
 			   enum ib_qp_state *old_ib_state)
 {
 	unsigned long flags;
-	int status = 0;
 	enum ocrdma_qp_state new_state;
 	new_state = get_ocrdma_qp_state(new_ib_state);
 
@@ -2135,7 +2134,7 @@ int ocrdma_qp_state_change(struct ocrdma_qp *qp, enum ib_qp_state new_ib_state,
 	qp->state = new_state;
 
 	spin_unlock_irqrestore(&qp->q_lock, flags);
-	return status;
+	return 0;
 }
 
 static u32 ocrdma_set_create_qp_mbx_access_flags(struct ocrdma_qp *qp)
-- 
2.6.3

