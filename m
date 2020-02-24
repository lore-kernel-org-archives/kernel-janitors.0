From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 10:32:15 +0000
Subject: [PATCH] net/rds: Fix a debug message
Message-Id: <20200224103215.utw3zaa6nmcb5vrz@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Hans Westgaard Ry <hans.westgaard.ry@oracle.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org

This should display the error code but instead it just prints "1".

Fixes: 2eafa1746f17 ("net/rds: Handle ODP mr registration/unregistration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/rds/ib_rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rds/ib_rdma.c b/net/rds/ib_rdma.c
index b34b24e237f8..82a25bf280e3 100644
--- a/net/rds/ib_rdma.c
+++ b/net/rds/ib_rdma.c
@@ -587,8 +587,8 @@ void *rds_ib_get_mr(struct scatterlist *sg, unsigned long nents,
 				       access_flags);
 
 		if (IS_ERR(ib_mr)) {
-			rdsdebug("rds_ib_get_user_mr returned %d\n",
-				 IS_ERR(ib_mr));
+			rdsdebug("rds_ib_get_user_mr returned %ld\n",
+				 PTR_ERR(ib_mr));
 			ret = PTR_ERR(ib_mr);
 			goto out;
 		}
-- 
2.11.0
