From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 05 Sep 2019 09:56:00 +0000
Subject: [PATCH net-next] net/mlx5: DR, Fix error return code in dr_domain_init_resources()
Message-Id: <20190905095600.127371-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Mark Bloch <markb@mellanox.com>, Alex Vesker <valex@mellanox.com>, Erez Shitrit <erezsh@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 4ec9e7b02697 ("net/mlx5: DR, Expose steering domain functionality")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c
index 3b9cf0bccf4d..461cc2c30538 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c
@@ -66,6 +66,7 @@ static int dr_domain_init_resources(struct mlx5dr_domain *dmn)
 	dmn->uar = mlx5_get_uars_page(dmn->mdev);
 	if (!dmn->uar) {
 		mlx5dr_err(dmn, "Couldn't allocate UAR\n");
+		ret = -ENOMEM;
 		goto clean_pd;
 	}
 
@@ -73,6 +74,7 @@ static int dr_domain_init_resources(struct mlx5dr_domain *dmn)
 	if (!dmn->ste_icm_pool) {
 		mlx5dr_err(dmn, "Couldn't get icm memory for %s\n",
 			   dev_name(dmn->mdev->device));
+		ret = -ENOMEM;
 		goto clean_uar;
 	}
 
@@ -80,6 +82,7 @@ static int dr_domain_init_resources(struct mlx5dr_domain *dmn)
 	if (!dmn->action_icm_pool) {
 		mlx5dr_err(dmn, "Couldn't get action icm memory for %s\n",
 			   dev_name(dmn->mdev->device));
+		ret = -ENOMEM;
 		goto free_ste_icm_pool;
 	}
