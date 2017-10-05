From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 10:42:11 +0000
Subject: [PATCH] platform/x86: mlx-platform: make a couple of structures static
Message-Id: <20171005104211.30440-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim Pasternak <vadimp@mellanox.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structures mlxplat_dev and mlxplat_hotplug are local to the source
and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'mlxplat_dev' was not declared. Should it be static?
symbol 'mlxplat_hotplug' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/mlx-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 4f3de2a8c4df..504256c3660d 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -216,8 +216,8 @@ static struct resource mlxplat_mlxcpld_resources[] = {
 	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxcpld-hotplug"),
 };
 
-struct platform_device *mlxplat_dev;
-struct mlxcpld_hotplug_platform_data *mlxplat_hotplug;
+static struct platform_device *mlxplat_dev;
+static struct mlxcpld_hotplug_platform_data *mlxplat_hotplug;
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
-- 
2.14.1

