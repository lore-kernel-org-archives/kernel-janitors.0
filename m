From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 14:49:46 +0000
Subject: [PATCH] net/mlx5: fix spelling mistake in Kconfig "accelaration" -> "acceleration"
Message-Id: <20201215144946.204104-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some spelling mistakes in the Kconfig. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
index 6e4d7bb7fea2..bcdee9dc4aa2 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
+++ b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
@@ -149,14 +149,14 @@ config MLX5_IPSEC
 	IPsec support for the Connect-X family.
 
 config MLX5_EN_IPSEC
-	bool "IPSec XFRM cryptography-offload accelaration"
+	bool "IPSec XFRM cryptography-offload acceleration"
 	depends on MLX5_CORE_EN
 	depends on XFRM_OFFLOAD
 	depends on INET_ESP_OFFLOAD || INET6_ESP_OFFLOAD
 	depends on MLX5_FPGA_IPSEC || MLX5_IPSEC
 	default n
 	help
-	  Build support for IPsec cryptography-offload accelaration in the NIC.
+	  Build support for IPsec cryptography-offload acceleration in the NIC.
 	  Note: Support for hardware with this capability needs to be selected
 	  for this option to become available.
 
@@ -192,7 +192,7 @@ config MLX5_TLS
 config MLX5_EN_TLS
 	bool
 	help
-	Build support for TLS cryptography-offload accelaration in the NIC.
+	Build support for TLS cryptography-offload acceleration in the NIC.
 	Note: Support for hardware with this capability needs to be selected
 	for this option to become available.
 
-- 
2.29.2
