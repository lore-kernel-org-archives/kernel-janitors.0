From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 08 Aug 2018 03:53:15 +0000
Subject: [PATCH -next] platform/x86: mlx-platform: Fix copy-paste error in mlxplat_init()
Message-Id: <1533700830-137279-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The return value from platform_device_register_resndata() is not checked
correctly. The test is done against a wrong variable. This patch fix it.

Fixes: 0378123c5800 ("platform/x86: mlx-platform: Add mlxreg-fan platform driver activation")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/mlx-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index e1f9fce..d89936c 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1704,8 +1704,8 @@ static int __init mlxplat_init(void)
 					PLATFORM_DEVID_NONE, NULL, 0,
 					mlxplat_fan,
 					sizeof(*mlxplat_fan));
-		if (IS_ERR(priv->pdev_io_regs)) {
-			err = PTR_ERR(priv->pdev_io_regs);
+		if (IS_ERR(priv->pdev_fan)) {
+			err = PTR_ERR(priv->pdev_fan);
 			goto fail_platform_io_regs_register;
 		}
 	}

