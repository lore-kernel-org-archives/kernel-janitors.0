From: Colin King <colin.king@canonical.com>
Date: Fri, 07 Apr 2017 07:57:23 +0000
Subject: [PATCH] RDS: IB: ensure an initialized ret is printed in pr_warn message
Message-Id: <20170407075723.9669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

There is a path where ibmr is null and ret has not been initialized
and hence a pr_warn message is printing an uninitialized value in
ret.  Fix this by initializing ret to zero.

Detected by CoverityScan, CID#1357946 ("Uninitialized scalar variable")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rds/ib_rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rds/ib_rdma.c b/net/rds/ib_rdma.c
index 977f69886c00..4fd637491dd5 100644
--- a/net/rds/ib_rdma.c
+++ b/net/rds/ib_rdma.c
@@ -542,7 +542,7 @@ void *rds_ib_get_mr(struct scatterlist *sg, unsigned long nents,
 	struct rds_ib_device *rds_ibdev;
 	struct rds_ib_mr *ibmr = NULL;
 	struct rds_ib_connection *ic = rs->rs_conn->c_transport_data;
-	int ret;
+	int ret = 0;
 
 	rds_ibdev = rds_ib_get_device(rs->rs_bound_addr);
 	if (!rds_ibdev) {
-- 
2.11.0

