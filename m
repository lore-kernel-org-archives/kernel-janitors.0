From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 18:12:43 +0000
Subject: [PATCH][next] net/mlx5: Fix uininitialized pointer read on pointer attr
Message-Id: <20201006181243.546661-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error exit path err_free kfree's attr. In the case where
flow and parse_attr failed to be allocated this return path will free
the uninitialized pointer attr, which is not correct.  In the other
case where attr fails to allocate attr does not need to be freed. So
in both error exits via err_free attr should not be freed, so remove
it.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: ff7ea04ad579 ("net/mlx5e: Fix potential null pointer dereference")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index a0c356987e1a..e3a968e9e2a0 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -4569,7 +4569,6 @@ mlx5e_alloc_flow(struct mlx5e_priv *priv, int attr_size,
 err_free:
 	kfree(flow);
 	kvfree(parse_attr);
-	kfree(attr);
 	return err;
 }
 
-- 
2.27.0
