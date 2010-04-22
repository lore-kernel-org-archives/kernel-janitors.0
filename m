From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:55:27 +0000
Subject: [patch] rdma: potential ERR_PTR dereference
Message-Id: <20100422095527.GQ29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code, the "goto out" calls "rdma_destroy_id(cm_id);"
That isn't needed here and would cause problems because "cm_id" is an 
ERR_PTR.  The new code just returns directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/rdma_transport.c b/net/rds/rdma_transport.c
index 9ece910..7b15508 100644
--- a/net/rds/rdma_transport.c
+++ b/net/rds/rdma_transport.c
@@ -134,7 +134,7 @@ static int __init rds_rdma_listen_init(void)
 		ret = PTR_ERR(cm_id);
 		printk(KERN_ERR "RDS/RDMA: failed to setup listener, "
 		       "rdma_create_id() returned %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	sin.sin_family = AF_INET,
