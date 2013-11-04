From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Nov 2013 22:20:56 +0000
Subject: [patch v2] mlx5_core: delete some dead code
Message-Id: <20131104222056.GA4248@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131103070326.GA3051@mtldesk30>
In-Reply-To: <20131103070326.GA3051@mtldesk30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The printk() looks like it is left over debug code.  I have removed it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Remove the printk instead of moving it infront of the return.

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
index ba816c2..9b79067 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
@@ -192,10 +192,8 @@ static int alloc_4k(struct mlx5_core_dev *dev, u64 *addr)
 	struct fw_page *fp;
 	unsigned n;
 
-	if (list_empty(&dev->priv.free_list)) {
+	if (list_empty(&dev->priv.free_list))
 		return -ENOMEM;
-		mlx5_core_warn(dev, "\n");
-	}
 
 	fp = list_entry(dev->priv.free_list.next, struct fw_page, list);
 	n = find_first_bit(&fp->bitmask, 8 * sizeof(fp->bitmask));
