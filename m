From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 11:53:48 +0000
Subject: [PATCH] net/mlx4_en: ethtool: make array modes static const, makes object smaller
Message-Id: <20190906115348.16621-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Toukan <tariqt@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array modes on the stack but instead make it
static const. Makes the object code smaller by 303 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  51240	   5008	   1312	  57560	   e0d8 mellanox/mlx4/en_ethtool.o

After:
   text	   data	    bss	    dec	    hex	filename
  50937	   5008	   1312	  57257	   dfa9	mellanox/mlx4/en_ethtool.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
index 94c59939a8cf..d8313e2ee600 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
@@ -639,7 +639,7 @@ static unsigned long *ptys2ethtool_link_mode(struct ptys2ethtool_config *cfg,
 #define MLX4_BUILD_PTYS2ETHTOOL_CONFIG(reg_, speed_, ...)		\
 	({								\
 		struct ptys2ethtool_config *cfg;			\
-		const unsigned int modes[] = { __VA_ARGS__ };		\
+		static const unsigned int modes[] = { __VA_ARGS__ };	\
 		unsigned int i;						\
 		cfg = &ptys2ethtool_map[reg_];				\
 		cfg->speed = speed_;					\
-- 
2.20.1
