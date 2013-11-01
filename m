From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:20:44 +0000
Subject: [patch -next] mlx5_core: warn if no space left in alloc_4k()
Message-Id: <20131101102044.GB29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The warning was unreachable.  In the original code, it would print the
line number and the function but I have added an error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I haven't tested this, hopefully the warning is not annoying.

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
index ba816c2..cb86265 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
@@ -193,8 +193,8 @@ static int alloc_4k(struct mlx5_core_dev *dev, u64 *addr)
 	unsigned n;
 
 	if (list_empty(&dev->priv.free_list)) {
+		mlx5_core_warn(dev, "no available space\n");
 		return -ENOMEM;
-		mlx5_core_warn(dev, "\n");
 	}
 
 	fp = list_entry(dev->priv.free_list.next, struct fw_page, list);
