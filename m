From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jul 2017 07:47:40 +0000
Subject: [PATCH] cxgb4: Fix error codes in c4iw_create_cq()
Message-Id: <20170713074740.4i2weowvndudqwh6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If one of these kmalloc() calls fails then we return ERR_PTR(0) which is
NULL.  It results in a NULL dereference in the callers.

Fixes: cfdda9d76436 ("RDMA/cxgb4: Add driver for Chelsio T4 RNIC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb4/cq.c b/drivers/infiniband/hw/cxgb4/cq.c
index e16fcaf6b5a3..be07da1997e6 100644
--- a/drivers/infiniband/hw/cxgb4/cq.c
+++ b/drivers/infiniband/hw/cxgb4/cq.c
@@ -963,6 +963,7 @@ struct ib_cq *c4iw_create_cq(struct ib_device *ibdev,
 		goto err3;
 
 	if (ucontext) {
+		ret = -ENOMEM;
 		mm = kmalloc(sizeof *mm, GFP_KERNEL);
 		if (!mm)
 			goto err4;
