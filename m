From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 15:58:36 +0000
Subject: [PATCH] [ARM] Tosa: remove double inclusion of linux/delay.h
Message-Id: <a4423d670807060858nf8ec980gcd0475ccdc55b94d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmk+kernel@arm.linux.org.uk, dbaryshkov@gmail.com, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

The patch applies to the linux-next tree.

[ARM] Tosa: Remove double inclusion of linux/delay.h

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 86f1ea5..f4d9d77 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -26,7 +26,6 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/pm.h>
-#include <linux/delay.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <linux/gpio.h>
