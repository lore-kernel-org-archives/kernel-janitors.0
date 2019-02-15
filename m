From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Feb 2019 15:11:53 +0000
Subject: [PATCH][next] mlxsw: core: fix spelling mistake "temprature" -> "temperature"
Message-Id: <20190215151153.17206-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in several dev_err messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
index f1ada4cdbd6b..6956bbebe2f1 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
@@ -208,7 +208,7 @@ static ssize_t mlxsw_hwmon_module_temp_show(struct device *dev,
 			    1);
 	err = mlxsw_reg_query(mlxsw_hwmon->core, MLXSW_REG(mtbr), mtbr_pl);
 	if (err) {
-		dev_err(dev, "Failed to query module temprature sensor\n");
+		dev_err(dev, "Failed to query module temperature sensor\n");
 		return err;
 	}
 
@@ -251,7 +251,7 @@ static ssize_t mlxsw_hwmon_module_temp_fault_show(struct device *dev,
 			    1);
 	err = mlxsw_reg_query(mlxsw_hwmon->core, MLXSW_REG(mtbr), mtbr_pl);
 	if (err) {
-		dev_err(dev, "Failed to query module temprature sensor\n");
+		dev_err(dev, "Failed to query module temperature sensor\n");
 		return err;
 	}
 
@@ -291,7 +291,7 @@ mlxsw_hwmon_module_temp_critical_show(struct device *dev,
 	err = mlxsw_env_module_temp_thresholds_get(mlxsw_hwmon->core, module,
 						   SFP_TEMP_HIGH_WARN, &temp);
 	if (err) {
-		dev_err(dev, "Failed to query module temprature thresholds\n");
+		dev_err(dev, "Failed to query module temperature thresholds\n");
 		return err;
 	}
 
@@ -314,7 +314,7 @@ mlxsw_hwmon_module_temp_emergency_show(struct device *dev,
 	err = mlxsw_env_module_temp_thresholds_get(mlxsw_hwmon->core, module,
 						   SFP_TEMP_HIGH_ALARM, &temp);
 	if (err) {
-		dev_err(dev, "Failed to query module temprature thresholds\n");
+		dev_err(dev, "Failed to query module temperature thresholds\n");
 		return err;
 	}
 
-- 
2.20.1
