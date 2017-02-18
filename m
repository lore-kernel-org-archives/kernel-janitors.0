From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 21:04:44 +0000
Subject: [PATCH 16/29] IB/mlx4: Improve another size determination in do_slave_init()
Message-Id: <a6065921-c7d3-cdb2-1f77-4f0e1495cb7e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
In-Reply-To: <1935365a-bd7c-461e-6a84-0c5d3a501fff-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 15:25:19 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx4/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/mlx4/main.c
index b2b472977a39..b78f17623121 100644
--- a/drivers/infiniband/hw/mlx4/main.c
+++ b/drivers/infiniband/hw/mlx4/main.c
@@ -3106,7 +3106,7 @@ static void do_slave_init(struct mlx4_ib_dev *ibdev, int slave, int do_init)
 		return;
 
 	for (i = 0; i < ports; i++) {
-		dm[i] = kmalloc(sizeof (struct mlx4_ib_demux_work), GFP_ATOMIC);
+		dm[i] = kmalloc(sizeof(*dm[i]), GFP_ATOMIC);
 		if (!dm[i]) {
 			while (--i >= 0)
 				kfree(dm[i]);
-- 
2.11.1

