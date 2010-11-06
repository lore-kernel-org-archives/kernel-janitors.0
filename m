From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 06 Nov 2010 14:41:20 +0000
Subject: [PATCH] infiniband: core: fix information leak to userland
Message-Id: <1289054481-18145-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Chiang <achiang-VXdhtT5mjnY@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Structure ib_uverbs_qp_attr is copied to userland with allmost all
fields uninitialized (140 bytes on x86).  It leads to leaking of
contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/infiniband/core/ucm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/infiniband/core/ucm.c b/drivers/infiniband/core/ucm.c
index 08f948d..ccfa4f9 100644
--- a/drivers/infiniband/core/ucm.c
+++ b/drivers/infiniband/core/ucm.c
@@ -622,7 +622,7 @@ static ssize_t ib_ucm_init_qp_attr(struct ib_ucm_file *file,
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
-	resp.qp_attr_mask = 0;
+	memset(&resp, 0, sizeof(resp));
 	memset(&qp_attr, 0, sizeof qp_attr);
 	qp_attr.qp_state = cmd.qp_state;
 	result = ib_cm_init_qp_attr(ctx->cm_id, &qp_attr, &resp.qp_attr_mask);
-- 
1.7.0.4

