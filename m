From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 23 Sep 2019 19:07:46 +0000
Subject: [PATCH] RDMA/iw_cgxb4: Fix an error handling path in 'c4iw_connect()'
Message-Id: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bharat@chelsio.com, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should jump to fail3 in order to undo the 'xa_insert_irq()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure which Fixes tag to use because of the many refactorings in this
area. So I've choosen to use none :).
The issue was already there in 4a740838bf44c. This commit has renamed
all labels because a new fail1 was introduced. I've not searched further.

Naming of error labels should be improved. Having nowadays a fail5
between fail2 and fail3 (because fail5 was the last
error handling path added) is not that readable.
However, it goes beyong the purpose of this patch.

Maybe, just using a fail2a, just as already done in 9f5a9632e412 (which
introduced fail5) would be enough.
---
 drivers/infiniband/hw/cxgb4/cm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index e87fc0408470..81440eaf0a00 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -3381,7 +3381,7 @@ int c4iw_connect(struct iw_cm_id *cm_id, struct iw_cm_conn_param *conn_param)
 		if (raddr->sin_addr.s_addr = htonl(INADDR_ANY)) {
 			err = pick_local_ipaddrs(dev, cm_id);
 			if (err)
-				goto fail2;
+				goto fail3;
 		}
 
 		/* find a route */
@@ -3403,7 +3403,7 @@ int c4iw_connect(struct iw_cm_id *cm_id, struct iw_cm_conn_param *conn_param)
 		if (ipv6_addr_type(&raddr6->sin6_addr) = IPV6_ADDR_ANY) {
 			err = pick_local_ip6addrs(dev, cm_id);
 			if (err)
-				goto fail2;
+				goto fail3;
 		}
 
 		/* find a route */
-- 
2.20.1
