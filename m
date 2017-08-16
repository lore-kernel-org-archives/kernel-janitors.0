From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Aug 2017 09:29:40 +0000
Subject: [PATCH] IB/mlx5: make function mlx5_ib_get_vector_affinity
Message-Id: <20170816092940.11158-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The function mlx5_ib_get_vector_affinity is local to the source
and does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'mlx5_ib_get_vector_affinity' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/mlx5/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index cde7d1ce4a3c..a9e684deb6a4 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -3816,8 +3816,8 @@ static void init_delay_drop(struct mlx5_ib_dev *dev)
 		mlx5_ib_warn(dev, "Failed to init delay drop debugfs\n");
 }
 
-const struct cpumask *mlx5_ib_get_vector_affinity(struct ib_device *ibdev,
-		int comp_vector)
+static const struct cpumask *mlx5_ib_get_vector_affinity(
+	struct ib_device *ibdev, int comp_vector)
 {
 	struct mlx5_ib_dev *dev = to_mdev(ibdev);
 
-- 
2.11.0

