From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 12:48:03 +0000
Subject: [PATCH net-next] net/mlx5e: Uninitialized variable in mlx5e_attach_decap()
Message-Id: <20200528124803.GC1219412@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Vlad Buslov <vladbu@mellanox.com>, Roi Dayan <roid@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Eli Cohen <eli@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ret" variable isn't initialized on the success path.

There is an uninitentional behavior in current releases of GCC where
instead of warning about the uninitialized variable, it instead
initializes it to zero.  So that means that this bug likely doesn't
affect testing.

Fixes: 14e6b038afa0 ("net/mlx5e: Add support for hw decapsulation of MPLS over UDP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 571da14809fec..ae53bf5994215 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3637,7 +3637,7 @@ static int mlx5e_attach_decap(struct mlx5e_priv *priv,
 	struct mlx5e_decap_entry *d;
 	struct mlx5e_decap_key key;
 	uintptr_t hash_key;
-	int err;
+	int err = 0;
 
 	parse_attr = attr->parse_attr;
 	if (sizeof(parse_attr->eth) > MLX5_CAP_ESW(priv->mdev, max_encap_header_size)) {
-- 
2.26.2
