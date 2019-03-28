From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 Mar 2019 01:39:58 +0000
Subject: [PATCH -next] gpio: mlxbf: remove unused including <linux/version.h>
Message-Id: <20190328013958.33849-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-mlxbf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index d428f42be74f..894aaf55fc96 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -11,7 +11,6 @@
 #include <linux/pm.h>
 #include <linux/resource.h>
 #include <linux/types.h>
-#include <linux/version.h>
 
 /* Number of pins on BlueField */
 #define MLXBF_GPIO_NR 54
