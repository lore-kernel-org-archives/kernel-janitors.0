From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:33:36 +0000
Subject: [patch] net/mlx4: off by one in parse_trans_rule()
Message-Id: <20120711063336.GC11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hadar Hen Zion <hadarh@mellanox.co.il>
Cc: "David S. Miller" <davem@davemloft.net>, Or Gerlitz <ogerlitz@mellanox.com>, Eugenia Emantayev <eugenia@mellanox.co.il>, Yevgeny Petrilin <yevgenyp@mellanox.co.il>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be ">=" here instead of ">".  MLX4_NET_TRANS_RULE_NUM is 6.
We use "spec->id" as an array offset into the __rule_hw_sz[] and
__sw_id_hw[] arrays which have 6 elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx4/mcg.c b/drivers/net/ethernet/mellanox/mlx4/mcg.c
index bc62f53..5bac0df 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mcg.c
+++ b/drivers/net/ethernet/mellanox/mlx4/mcg.c
@@ -773,7 +773,7 @@ static int parse_trans_rule(struct mlx4_dev *dev, struct mlx4_spec_list *spec,
 		[MLX4_NET_TRANS_RULE_ID_UDP]  			sizeof(struct mlx4_net_trans_rule_hw_tcp_udp)
 	};
-	if (spec->id > MLX4_NET_TRANS_RULE_NUM) {
+	if (spec->id >= MLX4_NET_TRANS_RULE_NUM) {
 		mlx4_err(dev, "Invalid network rule id. id = %d\n", spec->id);
 		return -EINVAL;
 	}
