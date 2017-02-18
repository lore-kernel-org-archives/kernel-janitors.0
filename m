From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 20:56:17 +0000
Subject: [PATCH 08/29] IB/mlx4: Delete an unnecessary check before the function call "kfree" in free_pv_objec
Message-Id: <1070bd22-757a-e0c9-551d-44c31f5c11cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
In-Reply-To: <1935365a-bd7c-461e-6a84-0c5d3a501fff-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Feb 2017 22:06:24 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: kfree(NULL) is safe and this check is probably not required

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx4/mad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
index 75b6522b3a8f..9518b7244269 100644
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@ -1966,10 +1966,8 @@ static int alloc_pv_object(struct mlx4_ib_dev *dev, int slave, int port,
 
 static void free_pv_object(struct mlx4_ib_dev *dev, int slave, int port)
 {
-	if (dev->sriov.demux[port - 1].tun[slave]) {
-		kfree(dev->sriov.demux[port - 1].tun[slave]);
-		dev->sriov.demux[port - 1].tun[slave] = NULL;
-	}
+	kfree(dev->sriov.demux[port - 1].tun[slave]);
+	dev->sriov.demux[port - 1].tun[slave] = NULL;
 }
 
 static int create_pv_resources(struct ib_device *ibdev, int slave, int port,
-- 
2.11.1

