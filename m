From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 20:47:53 +0000
Subject: [PATCH 01/29] IB/mlx4: Use kcalloc() in mlx4_ib_alloc_pv_bufs()
Message-Id: <e2a30e40-a7ad-585b-a694-ab1e9bd532c2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
In-Reply-To: <1935365a-bd7c-461e-6a84-0c5d3a501fff-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Feb 2017 20:00:34 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx4/mad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
index db564ccc0f92..61bd81baeb29 100644
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@ -1600,8 +1600,8 @@ static int mlx4_ib_alloc_pv_bufs(struct mlx4_ib_demux_pv_ctx *ctx,
 		return -EINVAL;
 
 	tun_qp = &ctx->qp[qp_type];
-
-	tun_qp->ring = kzalloc(sizeof (struct mlx4_ib_buf) * MLX4_NUM_TUNNEL_BUFS,
+	tun_qp->ring = kcalloc(MLX4_NUM_TUNNEL_BUFS,
+			       sizeof(*tun_qp->ring),
 			       GFP_KERNEL);
 	if (!tun_qp->ring)
 		return -ENOMEM;
-- 
2.11.1

