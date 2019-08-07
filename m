From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Aug 2019 12:32:36 +0000
Subject: [PATCH] IB/mlx5: Check the correct variable in error handling code
Message-Id: <20190807123236.GA11452@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The code accidentally checks "event_sub" instead of "event_sub->eventfd".

Fixes: 759738537142 ("IB/mlx5: Enable subscription for device events over DEVX")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/mlx5/devx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index fd577ffd7864..e24df414fd47 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -2041,7 +2041,7 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_DEVX_SUBSCRIBE_EVENT)(
 			event_sub->eventfd  				eventfd_ctx_fdget(redirect_fd);
 
-			if (IS_ERR(event_sub)) {
+			if (IS_ERR(event_sub->eventfd)) {
 				err = PTR_ERR(event_sub->eventfd);
 				event_sub->eventfd = NULL;
 				goto err;
-- 
2.20.1
