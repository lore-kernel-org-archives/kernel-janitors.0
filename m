From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Dec 2018 07:43:32 +0000
Subject: [PATCH] RDMA/mlx5: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222074332.GA7662@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "num_actions" variable needs to be signed for the error handling to
work.  The maximum number of actions is less than 256 so int type is
large enough for that.

Fixes: cbfdd442c43e ("IB/uverbs: Add helper to get array size from ptr attribute")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/mlx5/flow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/flow.c b/drivers/infiniband/hw/mlx5/flow.c
index 95cf4b9fc65d..e8a1e4498e3f 100644
--- a/drivers/infiniband/hw/mlx5/flow.c
+++ b/drivers/infiniband/hw/mlx5/flow.c
@@ -329,7 +329,7 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_FLOW_ACTION_CREATE_MODIFY_HEADER)(
 	struct mlx5_ib_dev *mdev = to_mdev(uobj->context->device);
 	enum mlx5_ib_uapi_flow_table_type ft_type;
 	struct ib_flow_action *action;
-	size_t num_actions;
+	int num_actions;
 	void *in;
 	int ret;
 
-- 
2.17.1
