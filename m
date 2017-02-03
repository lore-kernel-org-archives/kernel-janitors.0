From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Feb 2017 09:54:59 +0000
Subject: [patch net-next] net/mlx4_en: fix a condition
Message-Id: <20170203095459.GA5704@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yishai Hadas <yishaih@mellanox.com>, Shaker Daibes <shakerd@mellanox.com>
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a "||" vs "|" typo here so we test 0x1 instead of 0x6.

Fixes: 1f8176f7352a ("net/mlx4_en: Check the enabling pptx/pprx flags in SET_PORT wrapper flow")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx4/port.c b/drivers/net/ethernet/mellanox/mlx4/port.c
index 5053c949148f..4e36e287d605 100644
--- a/drivers/net/ethernet/mellanox/mlx4/port.c
+++ b/drivers/net/ethernet/mellanox/mlx4/port.c
@@ -1395,7 +1395,7 @@ static int mlx4_common_set_port(struct mlx4_dev *dev, int slave, u32 in_mod,
 							  gen_context);
 
 			if (gen_context->flags &
-			    (MLX4_FLAG_V_PPRX_MASK || MLX4_FLAG_V_PPTX_MASK))
+			    (MLX4_FLAG_V_PPRX_MASK | MLX4_FLAG_V_PPTX_MASK))
 				mlx4_en_set_port_global_pause(dev, slave,
 							      gen_context);
 
