From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 09:56:30 +0000
Subject: [patch -next] mlxsw: core: remove an unnecessary condition
Message-Id: <20160106095630.GB23185@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We checked "err" on the lines before so we know it's zero here.

These cause a static checker warning because checking known things can
indicate a bug.  Maybe there is a missing assignment or we are checking
the wrong variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
index 5b9364f..1ac8bf1 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c
@@ -130,7 +130,7 @@ static ssize_t mlxsw_hwmon_temp_rst_store(struct device *dev,
 		dev_err(mlxsw_hwmon->bus_info->dev, "Failed to reset temp sensor history\n");
 		return err;
 	}
-	return err ? err : len;
+	return len;
 }
 
 static ssize_t mlxsw_hwmon_fan_rpm_show(struct device *dev,
