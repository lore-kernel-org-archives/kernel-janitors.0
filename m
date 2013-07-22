From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 08:02:01 +0000
Subject: [patch] mlx5: use after free in mlx5_cmd_comp_handler()
Message-Id: <20130722080201.GG14617@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We can't dereference "ent" after passing it to free_cmd().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/cmd.c b/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
index 205753a..4037406 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/cmd.c
@@ -1113,7 +1113,13 @@ void mlx5_cmd_comp_handler(struct mlx5_core_dev *dev, unsigned long vector)
 
 	for (i = 0; i < (1 << cmd->log_sz); i++) {
 		if (test_bit(i, &vector)) {
+			struct semaphore *sem;
+
 			ent = cmd->ent_arr[i];
+			if (ent->page_queue)
+				sem = &cmd->pages_sem;
+			else
+				sem = &cmd->sem;
 			ktime_get_ts(&ent->ts2);
 			memcpy(ent->out->first.data, ent->lay->out, sizeof(ent->lay->out));
 			dump_command(dev, ent, 0);
@@ -1136,10 +1142,7 @@ void mlx5_cmd_comp_handler(struct mlx5_core_dev *dev, unsigned long vector)
 			} else {
 				complete(&ent->done);
 			}
-			if (ent->page_queue)
-				up(&cmd->pages_sem);
-			else
-				up(&cmd->sem);
+			up(sem);
 		}
 	}
 }
