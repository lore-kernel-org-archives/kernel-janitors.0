From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:37:14 +0000
Subject: [PATCH v2] RDMA/cm: Fix an error check in cm_alloc_id_priv()
Message-Id: <20200407093714.GA80285@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200406145109.GQ20941@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>
Cc: Leon Romanovsky <leon@kernel.org>, Danit Goldberg <danitg@mellanox.com>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The xa_alloc_cyclic_irq() function returns either 0 or 1 on success and
negatives on error.  This code treats 1 as an error and returns
ERR_PTR(1) which will cause an Oops in the caller.

Fixes: ae78ff3a0f0c ("RDMA/cm: Convert local_id_table to XArray")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use the correct Fixes tag and add Matthew to the CC list.

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
