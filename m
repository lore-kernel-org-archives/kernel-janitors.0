From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Aug 2018 07:53:28 +0000
Subject: [PATCH] mlxsw: remove unused arrays mlxsw_i2c_driver_name and mlxsw_pci_driver_name
Message-Id: <20180810075328.26400-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Arrays mlxsw_i2c_driver_name and mlxsw_pci_driver_name are defined
but never used hence they are redundant and can be removed.

Cleans up clang warnings:
warning: 'mlxsw_i2c_driver_name' defined but not used
warning: 'mlxsw_pci_driver_name' defined but not used

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/i2c.c | 2 --
 drivers/net/ethernet/mellanox/mlxsw/pci.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/i2c.c b/drivers/net/ethernet/mellanox/mlxsw/i2c.c
index 25f9915ebd82..11a664eb5ce7 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/i2c.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/i2c.c
@@ -46,8 +46,6 @@
 #include "core.h"
 #include "i2c.h"
 
-static const char mlxsw_i2c_driver_name[] = "mlxsw_i2c";
-
 #define MLXSW_I2C_CIR2_BASE		0x72000
 #define MLXSW_I2C_CIR_STATUS_OFF	0x18
 #define MLXSW_I2C_CIR2_OFF_STATUS	(MLXSW_I2C_CIR2_BASE + \
diff --git a/drivers/net/ethernet/mellanox/mlxsw/pci.c b/drivers/net/ethernet/mellanox/mlxsw/pci.c
index fc4557245ff4..ce9157aeb0aa 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/pci.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/pci.c
@@ -53,8 +53,6 @@
 #include "port.h"
 #include "resources.h"
 
-static const char mlxsw_pci_driver_name[] = "mlxsw_pci";
-
 #define mlxsw_pci_write32(mlxsw_pci, reg, val) \
 	iowrite32be(val, (mlxsw_pci)->hw_addr + (MLXSW_PCI_ ## reg))
 #define mlxsw_pci_read32(mlxsw_pci, reg) \
-- 
2.17.1
