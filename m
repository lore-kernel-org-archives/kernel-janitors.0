From: Asmaa Mnebhi <Asmaa@mellanox.com>
Date: Wed, 08 Apr 2020 12:50:44 +0000
Subject: RE: [PATCH -next] gpio: remove unused including <linux/version.h>
Message-Id: <AM4PR0501MB2705406363FC5D9DBB60F517DAC00@AM4PR0501MB2705.eurprd05.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200408070832.137037-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070832.137037-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Acked-by: asmaa@mellanox.com

-----Original Message-----
From: YueHaibing <yuehaibing@huawei.com> 
Sent: Wednesday, April 8, 2020 3:09 AM
To: Linus Walleij <linus.walleij@linaro.org>; Asmaa Mnebhi <Asmaa@mellanox.com>; Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: YueHaibing <yuehaibing@huawei.com>; linux-gpio@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: [PATCH -next] gpio: remove unused including <linux/version.h>

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-mlxbf2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c index 7b7085050219..240b488609ac 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -14,7 +14,6 @@
 #include <linux/resource.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/version.h>
 
 /*
  * There are 3 YU GPIO blocks:
