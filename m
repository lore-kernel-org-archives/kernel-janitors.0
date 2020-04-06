From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Apr 2020 14:43:35 +0000
Subject: [PATCH] RDMA/cm: Fix an error check in cm_alloc_id_priv()
Message-Id: <20200406144335.GD68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Danit Goldberg <danitg@mellanox.com>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The xa_alloc_cyclic_irq() function returns either 0 or 1 on success and
negatives on error.  This code treats 1 as an error and returns
ERR_PTR(1) which will cause an Oops in the caller.

Fixes: e8dc4e885c45 ("RDMA/cm: Fix ordering of xa_alloc_cyclic() in ib_create_cm_id()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The Fixes tag may not be correct.  That's the patch which introduces an
Oops but we may want to backport this further back.

 drivers/infiniband/core/cm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/cm.c b/drivers/infiniband/core/cm.c
index 4794113ecd59..f7ac5974176f 100644
--- a/drivers/infiniband/core/cm.c
+++ b/drivers/infiniband/core/cm.c
@@ -862,7 +862,7 @@ static struct cm_id_private *cm_alloc_id_priv(struct ib_device *device,
 
 	ret = xa_alloc_cyclic_irq(&cm.local_id_table, &id, NULL, xa_limit_32b,
 				  &cm.local_id_next, GFP_KERNEL);
-	if (ret)
+	if (ret < 0)
 		goto error;
 	cm_id_priv->id.local_id = (__force __be32)id ^ cm.random_id_operand;
 
-- 
2.25.1
