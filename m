From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:26:41 +0000
Subject: [PATCH] IB/mlx5: Fix a NULL vs IS_ERR() check
Message-Id: <20200320132641.GF95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The kzalloc() function returns NULL, not error pointers.

Fixes: 30f2fe40c72b ("IB/mlx5: Introduce UAPIs to manage packet pacing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/mlx5/qos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/qos.c b/drivers/infiniband/hw/mlx5/qos.c
index f822b06e7c9e..cac878a70edb 100644
--- a/drivers/infiniband/hw/mlx5/qos.c
+++ b/drivers/infiniband/hw/mlx5/qos.c
@@ -46,8 +46,8 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_PP_OBJ_ALLOC)(
 
 	dev = to_mdev(c->ibucontext.device);
 	pp_entry = kzalloc(sizeof(*pp_entry), GFP_KERNEL);
-	if (IS_ERR(pp_entry))
-		return PTR_ERR(pp_entry);
+	if (!pp_entry)
+		return -ENOMEM;
 
 	in_ctx = uverbs_attr_get_alloced_ptr(attrs,
 					     MLX5_IB_ATTR_PP_OBJ_ALLOC_CTX);
-- 
2.25.1
