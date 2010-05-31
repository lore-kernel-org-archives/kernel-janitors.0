From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 14:00:53 +0000
Subject: [patch 1/2] infiniband/cxgb4: remove unneeded assignment
Message-Id: <20100531140053.GT5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We don't need to assign rpl here, we do that later on.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index 30ce0a8..60b5beb 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -2242,7 +2242,7 @@ static void process_work(struct work_struct *work)
 {
 	struct sk_buff *skb = NULL;
 	struct c4iw_dev *dev;
-	struct cpl_act_establish *rpl = cplhdr(skb);
+	struct cpl_act_establish *rpl;
 	unsigned int opcode;
 	int ret;
 
