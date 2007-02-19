From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Mon, 19 Feb 2007 06:25:47 +0000
Subject: [KJ] [PATCH] is_power_of_2 in rtc
Message-Id: <1171865627.6127.32.camel@wriver-t81fb058.linuxcoe>
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
index f406a2b..212ec32 100644
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
+		if (!arg || !is_power_of_2(arg)) {
 			ret = -EINVAL;
 			goto exit;
 		}

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
