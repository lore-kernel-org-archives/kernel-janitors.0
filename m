From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 05 Sep 2019 09:53:26 +0000
Subject: [PATCH net-next] net/mlx5: DR, Remove useless set memory to zero use memset()
Message-Id: <20190905095326.127277-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Mark Bloch <markb@mellanox.com>, Alex Vesker <valex@mellanox.com>, Erez Shitrit <erezsh@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The memory return by kzalloc() has already be set to zero, so
remove useless memset(0).

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c
index ef0dea44f3b3..5df8436b2ae3 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.c
@@ -899,7 +899,6 @@ int mlx5dr_send_ring_alloc(struct mlx5dr_domain *dmn)
 		goto clean_qp;
 	}
 
-	memset(dmn->send_ring->buf, 0, size);
 	dmn->send_ring->buf_size = size;
 
 	dmn->send_ring->mr = dr_reg_mr(dmn->mdev,
