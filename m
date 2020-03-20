From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:23:05 +0000
Subject: [PATCH net-next] net/mlx5e: Fix actions_match_supported() return
Message-Id: <20200320132305.GB95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Paul Blakey <paulb@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Roi Dayan <roid@mellanox.com>, Oz Shlomo <ozsh@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The actions_match_supported() function returns a bool, true for success
and false for failure.  This error path is returning a negative which
is cast to true but it should return false.

Fixes: 4c3844d9e97e ("net/mlx5e: CT: Introduce connection tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 044891a03be3..e5de7d2bac2b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3058,7 +3058,7 @@ static bool actions_match_supported(struct mlx5e_priv *priv,
 			 */
 			NL_SET_ERR_MSG_MOD(extack,
 					   "Can't offload mirroring with action ct");
-			return -EOPNOTSUPP;
+			return false;
 		}
 	} else {
 		actions = flow->nic_attr->action;
-- 
2.25.1
