From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 12 Jan 2015 08:14:29 +0000
Subject: [patch] IB/mlx5: fix error code in get_port_caps()
Message-Id: <20150112081429.GA11818@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli@mellanox.com>
Cc: Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM on allocation failure instead of success.

Fixes: e126ba97dba9 ('mlx5: Add driver for Mellanox Connect-IB adapters')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index 8a87404..cc4ac1e 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -997,7 +997,7 @@ static int get_port_caps(struct mlx5_ib_dev *dev)
 	struct ib_device_attr *dprops = NULL;
 	struct ib_port_attr *pprops = NULL;
 	struct mlx5_general_caps *gen;
-	int err = 0;
+	int err = -ENOMEM;
 	int port;
 
 	gen = &dev->mdev->caps.gen;
