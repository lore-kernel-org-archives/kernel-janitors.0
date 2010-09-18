From: Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Sep 2010 23:42:59 +0000
Subject: [patch -next] rds: double unlock in rds_ib_cm_handle_connect()
Message-Id: <20100918234259.GD6236@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Zach Brown <zach.brown@oracle.com>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We unlock after we goto out.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/ib_cm.c b/net/rds/ib_cm.c
index bc3dbc1..ee369d2 100644
--- a/net/rds/ib_cm.c
+++ b/net/rds/ib_cm.c
@@ -521,7 +521,6 @@ int rds_ib_cm_handle_connect(struct rdma_cm_id *cm_id,
 	err = rds_ib_setup_qp(conn);
 	if (err) {
 		rds_ib_conn_error(conn, "rds_ib_setup_qp failed (%d)\n", err);
-		mutex_unlock(&conn->c_cm_lock);
 		goto out;
 	}
 
