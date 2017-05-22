From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 14:12:21 +0000
Subject: [PATCH 2/3] RDS: IB: Improve a size determination in rds_ib_add_one()
Message-Id: <e8486283-62ac-ea77-1169-edca3e630637@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44b46c51-3665-5f14-dd3b-6e6f230258a7@users.sourceforge.net>
In-Reply-To: <44b46c51-3665-5f14-dd3b-6e6f230258a7-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Sowmini Varadhan <sowmini.varadhan-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 15:40:21 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/rds/ib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rds/ib.c b/net/rds/ib.c
index c5514d058171..ed37bf011704 100644
--- a/net/rds/ib.c
+++ b/net/rds/ib.c
@@ -131,7 +131,7 @@ static void rds_ib_add_one(struct ib_device *device)
 	if (device->node_type != RDMA_NODE_IB_CA)
 		return;
 
-	rds_ibdev = kzalloc_node(sizeof(struct rds_ib_device), GFP_KERNEL,
+	rds_ibdev = kzalloc_node(sizeof(*rds_ibdev), GFP_KERNEL,
 				 ibdev_to_node(device));
 	if (!rds_ibdev)
 		return;
-- 
2.13.0

