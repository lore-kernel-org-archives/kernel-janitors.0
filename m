From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Oct 2018 20:06:38 +0000
Subject: [PATCH] net/mlx5: allocate enough space in
Message-Id: <20181019200638.dea3r4uocbij6d6j@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

FDB_MAX_CHAIN is 3.  We wanted to allocate enough memory to hold four
structs but there are missing parentheses so we only allocate enough
memory for three structs and the first byte of the fourth one.

Fixes: 328edb499f99 ("net/mlx5: Split FDB fast path prio to multiple namespaces")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
index 67ba4c975d81..9d73eb955f75 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
@@ -2470,7 +2470,7 @@ static int init_fdb_root_ns(struct mlx5_flow_steering *steering)
 		return -ENOMEM;
 
 	steering->fdb_sub_ns = kzalloc(sizeof(steering->fdb_sub_ns) *
-				       FDB_MAX_CHAIN + 1, GFP_KERNEL);
+				       (FDB_MAX_CHAIN + 1), GFP_KERNEL);
 	if (!steering->fdb_sub_ns)
 		return -ENOMEM;
 
-- 
2.11.0
