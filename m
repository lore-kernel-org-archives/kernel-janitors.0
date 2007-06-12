From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 12 Jun 2007 05:36:28 +0000
Subject: [KJ] [PATCH]is_power_of_2-rtc/rtc-s3c.c
Message-Id: <1181625868.11780.22.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 54b6130..e20bd6f 100644
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
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
