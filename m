From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 19 Dec 2015 20:48:59 +0000
Subject: [PATCH] IB/usnic: delete unneeded IS_ERR test
Message-Id: <1450558139-466-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Benvenuti <benve-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Goodell <dgoodell-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

kzalloc doesn't return ERR_PTR, so there is no need to test for it.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
@@

* x = kzalloc(...)
... when != x = e
* IS_ERR_OR_NULL(x)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
index f8e3211..20f53e5 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
@@ -625,8 +625,8 @@ struct ib_mr *usnic_ib_reg_mr(struct ib_pd *pd, u64 start, u64 length,
 			virt_addr, length);
 
 	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
-	if (IS_ERR_OR_NULL(mr))
-		return ERR_PTR(mr ? PTR_ERR(mr) : -ENOMEM);
+	if (!mr)
+		return ERR_PTR(-ENOMEM);
 
 	mr->umem = usnic_uiom_reg_get(to_upd(pd)->umem_pd, start, length,
 					access_flags, 0);

