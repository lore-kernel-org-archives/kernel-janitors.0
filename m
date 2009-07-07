From: Florian Fainelli <florian@openwrt.org>
Date: Tue, 07 Jul 2009 21:36:14 +0000
Subject: [PATCH] vlynq: remove duplicated #include
Message-Id: <200907072336.14767.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Remove duplicated #include('s) in drivers/vlynq/vlynq.c

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
index f05d2a3..ba3d71f 100644
--- a/drivers/vlynq/vlynq.c
+++ b/drivers/vlynq/vlynq.c
@@ -28,7 +28,6 @@
 #include <linux/errno.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
-#include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 
