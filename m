From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 28 Nov 2015 15:52:04 +0000
Subject: [PATCH] IB/iser: constify iser_reg_ops structure
Message-Id: <1448725924-26376-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sagi Grimberg <sagig-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Roi Dayan <roid-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The iser_reg_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/infiniband/ulp/iser/iscsi_iser.h  |    2 +-
 drivers/infiniband/ulp/iser/iser_memory.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h b/drivers/infiniband/ulp/iser/iscsi_iser.h
index 8a5998e..08d0926 100644
--- a/drivers/infiniband/ulp/iser/iscsi_iser.h
+++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
@@ -400,7 +400,7 @@ struct iser_device {
 	int                          refcount;
 	int			     comps_used;
 	struct iser_comp	     *comps;
-	struct iser_reg_ops          *reg_ops;
+	const struct iser_reg_ops    *reg_ops;
 };
 
 #define ISER_CHECK_GUARD	0xc0
diff --git a/drivers/infiniband/ulp/iser/iser_memory.c b/drivers/infiniband/ulp/iser/iser_memory.c
index ea765fb..b137d6d 100644
--- a/drivers/infiniband/ulp/iser/iser_memory.c
+++ b/drivers/infiniband/ulp/iser/iser_memory.c
@@ -49,7 +49,7 @@ int iser_fast_reg_mr(struct iscsi_iser_task *iser_task,
 		     struct iser_reg_resources *rsc,
 		     struct iser_mem_reg *mem_reg);
 
-static struct iser_reg_ops fastreg_ops = {
+static const struct iser_reg_ops fastreg_ops = {
 	.alloc_reg_res	= iser_alloc_fastreg_pool,
 	.free_reg_res	= iser_free_fastreg_pool,
 	.reg_mem	= iser_fast_reg_mr,
@@ -58,7 +58,7 @@ static struct iser_reg_ops fastreg_ops = {
 	.reg_desc_put	= iser_reg_desc_put_fr,
 };
 
-static struct iser_reg_ops fmr_ops = {
+static const struct iser_reg_ops fmr_ops = {
 	.alloc_reg_res	= iser_alloc_fmr_pool,
 	.free_reg_res	= iser_free_fmr_pool,
 	.reg_mem	= iser_fast_reg_fmr,

