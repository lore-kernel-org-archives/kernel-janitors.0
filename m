From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 18:44:59 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring/lanstreamer.c : Use of
Message-Id: <42CEC9AB.6000605@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/tokenring/lanstreamer.c   2005-07-07
19:13:16.000000000 -0300
+++ linux-kj/drivers/net/tokenring/lanstreamer.c        2005-07-07
23:02:53.839970136 -0300
@@ -123,6 +123,7 @@
 #include <linux/version.h>
 #include <linux/bitops.h>
 #include <linux/wait.h>
+#include <linux/jiffies.h>

 #include <net/checksum.h>

@@ -513,7 +514,7 @@

        while (!((readw(streamer_mmio + SISR)) & SISR_SRB_REPLY)) {
                msleep_interruptible(100);
-               if (jiffies - t > 40 * HZ) {
+               if (time_after(jiffies, t + 40 * HZ)) {
                        printk(KERN_ERR
                               "IBM PCI tokenring card not responding\n");
                        release_region(dev->base_addr, STREAMER_IO_SPACE);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
