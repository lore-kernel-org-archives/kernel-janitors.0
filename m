From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Feb 2018 12:45:36 +0000
Subject: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
Message-Id: <20180206124536.GA9445@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioport_map() returns NULL on error but we accidentally check for
error pointers instead.

Fixes: c6acad68eb2d ("platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index dfecba4407ac..27de29961f5e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -522,8 +522,8 @@ static int __init mlxplat_init(void)
 
 	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
 			       mlxplat_lpc_resources[1].start, 1);
-	if (IS_ERR(mlxplat_mlxcpld_regmap_ctx.base)) {
-		err = PTR_ERR(mlxplat_mlxcpld_regmap_ctx.base);
+	if (!mlxplat_mlxcpld_regmap_ctx.base) {
+		err = -ENOMEM;
 		goto fail_platform_mux_register;
 	}
 
