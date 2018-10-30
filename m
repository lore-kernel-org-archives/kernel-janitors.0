From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 30 Oct 2018 02:22:42 +0000
Subject: [PATCH -next] nds32: Remove duplicated include from pm.c
Message-Id: <1540866162-149564-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Pavel Machek <pavel@ucw.cz>, Nick Hu <nickhu@andestech.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/nds32/kernel/pm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/nds32/kernel/pm.c b/arch/nds32/kernel/pm.c
index 6989560..ffa8040 100644
--- a/arch/nds32/kernel/pm.c
+++ b/arch/nds32/kernel/pm.c
@@ -5,7 +5,6 @@
 #include <linux/suspend.h>
 #include <linux/device.h>
 #include <linux/printk.h>
-#include <linux/suspend.h>
 #include <asm/suspend.h>
 #include <nds32_intrinsic.h>
 
