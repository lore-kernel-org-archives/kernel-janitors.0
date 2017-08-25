From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 08:18:39 +0000
Subject: [PATCH] RDMA/qedr: Missing error code in qedr_init_user_queue()
Message-Id: <20170825081839.5ahvp6pehrhyyf2z@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ram Amrani <Ram.Amrani-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Kalderon@mwanda, Michal <Michal.Kalderon-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: Ariel Elior <Ariel.Elior-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We should return -ENOMEM if the kzalloc() fails.  We currently return
success.

Fixes: 69ad0e7fe845 ("RDMA/qedr: Add support for iWARP in user space")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index 4e14a558734b..bce4f79370e6 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -821,8 +821,10 @@ static inline int qedr_init_user_queue(struct ib_ucontext *ib_ctx,
 				   FW_PAGE_SHIFT);
 	} else {
 		q->pbl_tbl = kzalloc(sizeof(*q->pbl_tbl), GFP_KERNEL);
-		if (!q->pbl_tbl)
+		if (!q->pbl_tbl) {
+			rc = -ENOMEM;
 			goto err0;
+		}
 	}
 
 	return 0;
