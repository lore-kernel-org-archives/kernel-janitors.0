From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:05:37 +0000
Subject: [kj] is_power_of_2 in drivers/rtc/rtc-s3c.c
Message-Id: <1187009617.7273.5.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 8c1012b..9b06dc3 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -20,6 +20,7 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 #include <linux/clk.h>
+#include <linux/log2.h>
 
 #include <asm/hardware.h>
 #include <asm/uaccess.h>
@@ -311,7 +312,7 @@ static int s3c_rtc_ioctl(struct device *dev,
 	case RTC_IRQP_SET:
 		/* check for power of 2 */
 
-		if ((arg & (arg-1)) != 0 || arg < 1) {
+		if (!is_power_of_2(arg)) {
 			ret = -EINVAL;
 			goto exit;
 		}

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
