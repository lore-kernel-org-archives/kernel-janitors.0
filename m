From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 12 Dec 2018 07:55:57 +0000
Subject: [PATCH net-next] net/mlx5: Remove duplicated include from eswitch.c
Message-Id: <1544601818-134205-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index e6a9b19..4f9dd0d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -39,7 +39,6 @@
 #include "lib/eq.h"
 #include "eswitch.h"
 #include "fs_core.h"
-#include "lib/eq.h"
 
 #define UPLINK_VPORT 0xFFFF
 
