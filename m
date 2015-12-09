From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 10:41:29 +0000
Subject: [patch -next] mlxsw: core: remove an unneeded condition
Message-Id: <20151209104129.GJ3173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We already know "err" is zero so there is no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
index 4dad146..913106d 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
@@ -169,7 +169,7 @@ static ssize_t mlxsw_hwmon_pwm_store(struct device *dev,
 		dev_err(mlxsw_hwmon->bus_info->dev, "Failed to write PWM\n");
 		return err;
 	}
-	return err ? err : len;
+	return len;
 }
 
 enum mlxsw_hwmon_attr_type {
