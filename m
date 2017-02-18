From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 20:50:20 +0000
Subject: [PATCH 03/29] IB/mlx4: Improve another size determination in mlx4_ib_alloc_demux_ctx()
Message-Id: <73833337-ea01-edcb-d9a7-85ac8a03c0c7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
In-Reply-To: <1935365a-bd7c-461e-6a84-0c5d3a501fff-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Feb 2017 20:15:02 +0100

Replace the specification of a data type by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx4/mad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
index 858da8746d49..284634d36b1c 100644
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@ -2150,7 +2150,7 @@ static int mlx4_ib_alloc_demux_ctx(struct mlx4_ib_dev *dev,
 	int i;
 
 	ctx->tun = kcalloc(dev->dev->caps.sqp_demux,
-			   sizeof (struct mlx4_ib_demux_pv_ctx *), GFP_KERNEL);
+			   sizeof(*ctx->tun), GFP_KERNEL);
 	if (!ctx->tun)
 		return -ENOMEM;
 
-- 
2.11.1

