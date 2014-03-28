From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:21:39 +0000
Subject: [patch 1/2] net/mlx4: fix some indenting in mlx4_ib_add()
Message-Id: <20140328082139.GF25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland@kernel.org>
Cc: Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Or Gerlitz <ogerlitz@mellanox.com>, Matan Barak <matanb@mellanox.com>, Moni Shoua <monis@mellanox.co.il>, Jack Morgenstein <jackm@dev.mellanox.co.il>, Yann Droneaud <ydroneaud@opteya.com>, Hadar Hen Zion <hadarh@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The code was indented too far and also kernel style says we should have
curly braces.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/mlx4/main.c
index 6cb8546..8d9d6b8 100644
--- a/drivers/infiniband/hw/mlx4/main.c
+++ b/drivers/infiniband/hw/mlx4/main.c
@@ -2048,8 +2048,9 @@ static void *mlx4_ib_add(struct mlx4_dev *dev)
 			err = mlx4_counter_alloc(ibdev->dev, &ibdev->counters[i]);
 			if (err)
 				ibdev->counters[i] = -1;
-		} else
-				ibdev->counters[i] = -1;
+		} else {
+			ibdev->counters[i] = -1;
+		}
 	}
 
 	mlx4_foreach_port(i, dev, MLX4_PORT_TYPE_IB)
