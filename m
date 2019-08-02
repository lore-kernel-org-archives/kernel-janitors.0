From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Aug 2019 10:22:23 +0000
Subject: [PATCH][net-next] net/mlx5: remove self-assignment on esw->dev
Message-Id: <20190802102223.26198-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a self assignment of esw->dev to itself, clean this up by
removing it.

Addresses-Coverity: ("Self assignment")
Fixes: 6cedde451399 ("net/mlx5: E-Switch, Verify support QoS element type")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index f4ace5f8e884..de0894b695e3 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -1413,7 +1413,7 @@ static int esw_vport_egress_config(struct mlx5_eswitch *esw,
 
 static bool element_type_supported(struct mlx5_eswitch *esw, int type)
 {
-	struct mlx5_core_dev *dev = esw->dev = esw->dev;
+	struct mlx5_core_dev *dev = esw->dev;
 
 	switch (type) {
 	case SCHEDULING_CONTEXT_ELEMENT_TYPE_TSAR:
-- 
2.20.1
