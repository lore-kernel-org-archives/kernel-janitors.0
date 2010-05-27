From: Dan Carpenter <error27@gmail.com>
Date: Thu, 27 May 2010 09:10:46 +0000
Subject: [patch 2/3] rds/iw_rdma: spin_lock_irq() is not nestable
Message-Id: <20100527091046.GS22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The IRQs are already disabled here so we don't need to disable them
again.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/iw_rdma.c b/net/rds/iw_rdma.c
index 7365fa2..48d5073 100644
--- a/net/rds/iw_rdma.c
+++ b/net/rds/iw_rdma.c
@@ -213,9 +213,9 @@ void rds_iw_add_conn(struct rds_iw_device *rds_iwdev, struct rds_connection *con
 	BUG_ON(list_empty(&ic->iw_node));
 	list_del(&ic->iw_node);
 
-	spin_lock_irq(&rds_iwdev->spinlock);
+	spin_lock(&rds_iwdev->spinlock);
 	list_add_tail(&ic->iw_node, &rds_iwdev->conn_list);
-	spin_unlock_irq(&rds_iwdev->spinlock);
+	spin_unlock(&rds_iwdev->spinlock);
 	spin_unlock_irq(&iw_nodev_conns_lock);
 
 	ic->rds_iwdev = rds_iwdev;
