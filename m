From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Wed, 21 Feb 2007 13:32:21 +0000
Subject: [KJ] [PATCH] is_power_of_2 in rtctimer.c
Message-Id: <1172064021.6127.84.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
index 9f7b32e..7cd5e8f 100644
--- a/sound/core/rtctimer.c
+++ b/sound/core/rtctimer.c
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
+#include <linux/log2.h>
 #include <sound/core.h>
 #include <sound/timer.h>
 
@@ -129,7 +130,7 @@ static int __init rtctimer_init(void)
 	struct snd_timer *timer;
 
 	if (rtctimer_freq < 2 || rtctimer_freq > 8192 ||
-	    (rtctimer_freq & (rtctimer_freq - 1)) != 0) {
+	    !is_power_of_2(rtctimer_freq)) {
 		snd_printk(KERN_ERR "rtctimer: invalid frequency %d\n",
 			   rtctimer_freq);
 		return -EINVAL;

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
