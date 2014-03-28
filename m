From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:24:28 +0000
Subject: [patch] RDMA/cxgb4: info leak in c4iw_alloc_ucontext()
Message-Id: <20140328082428.GH25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The c4iw_alloc_ucontext_resp struct has a 4 byte hole after the last
member and we should clear it before passing it to the user.

Fixes: 05eb23893c2c ('cxgb4/iw_cxgb4: Doorbell Drop Avoidance Bug Fixes')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb4/provider.c b/drivers/infiniband/hw/cxgb4/provider.c
index e36d2a2..a72aaa7 100644
--- a/drivers/infiniband/hw/cxgb4/provider.c
+++ b/drivers/infiniband/hw/cxgb4/provider.c
@@ -107,7 +107,7 @@ static struct ib_ucontext *c4iw_alloc_ucontext(struct ib_device *ibdev,
 	struct c4iw_ucontext *context;
 	struct c4iw_dev *rhp = to_c4iw_dev(ibdev);
 	static int warned;
-	struct c4iw_alloc_ucontext_resp uresp;
+	struct c4iw_alloc_ucontext_resp uresp = {};
 	int ret = 0;
 	struct c4iw_mm_entry *mm = NULL;
 
