From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 12:39:34 +0000
Subject: [patch] RDMA/cxgb3: remove a couple unneeded conditions
Message-Id: <20140206123934.GA12503@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We know that "reset_tpt_entry" is false on this side of the if else
statement so there is no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/cxgb3/cxio_hal.c b/drivers/infiniband/hw/cxgb3/cxio_hal.c
index c3f5aca4ef00..de1c61b417d6 100644
--- a/drivers/infiniband/hw/cxgb3/cxio_hal.c
+++ b/drivers/infiniband/hw/cxgb3/cxio_hal.c
@@ -735,14 +735,12 @@ static int __cxio_tpt_op(struct cxio_rdev *rdev_p, u32 reset_tpt_entry,
 			((perm & TPT_MW_BIND) ? F_TPT_MW_BIND_ENABLE : 0) |
 			V_TPT_ADDR_TYPE((zbva ? TPT_ZBTO : TPT_VATO)) |
 			V_TPT_PAGE_SIZE(page_size));
-		tpt.rsvd_pbl_addr = reset_tpt_entry ? 0 :
-				    cpu_to_be32(V_TPT_PBL_ADDR(PBL_OFF(rdev_p, pbl_addr)>>3));
+		tpt.rsvd_pbl_addr = cpu_to_be32(V_TPT_PBL_ADDR(PBL_OFF(rdev_p, pbl_addr)>>3));
 		tpt.len = cpu_to_be32(len);
 		tpt.va_hi = cpu_to_be32((u32) (to >> 32));
 		tpt.va_low_or_fbo = cpu_to_be32((u32) (to & 0xFFFFFFFFULL));
 		tpt.rsvd_bind_cnt_or_pstag = 0;
-		tpt.rsvd_pbl_size = reset_tpt_entry ? 0 :
-				  cpu_to_be32(V_TPT_PBL_SIZE(pbl_size >> 2));
+		tpt.rsvd_pbl_size = cpu_to_be32(V_TPT_PBL_SIZE(pbl_size >> 2));
 	}
 	err = cxio_hal_ctrl_qp_write_mem(rdev_p,
 				       stag_idx +
