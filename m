From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 18:37:41 +0000
Subject: [KJ] [PATCH] drivers/net/3c523.c : Use of time_after macro
Message-Id: <42CEC7F5.8090005@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A4AAB.9060400@feitoza.com.br>
In-Reply-To: <425A4AAB.9060400@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/3c523.c   2005-07-07 19:11:50.000000000 -0300
+++ linux-kj/drivers/net/3c523.c        2005-07-07 20:32:54.379096144 -0300
@@ -105,6 +105,7 @@
 #include <linux/mca-legacy.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>

 #include <asm/uaccess.h>
 #include <asm/processor.h>
@@ -658,7 +659,7 @@

        s = jiffies;            /* warning: only active with interrupts
on !! */
        while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
-               if (jiffies - s > 30*HZ/100)
+               if (time_after(jiffies, s + 30*HZ/100))
                        break;
        }

@@ -684,7 +685,7 @@

        s = jiffies;
        while (!(ias_cmd->cmd_status & STAT_COMPL)) {
-               if (jiffies - s > 30*HZ/100)
+               if (time_after(jiffies, s + 30*HZ/100))
                        break;
        }

@@ -709,7 +710,7 @@

        s = jiffies;
        while (!(tdr_cmd->cmd_status & STAT_COMPL)) {
-               if (jiffies - s > 30*HZ/100) {
+               if (time_after(jiffies, s + 30*HZ/100)) {
                        printk(KERN_WARNING "%s: %d Problems while
running the TDR.\n", dev->name, __LINE__);
                        result = 1;
                        break;
@@ -798,7 +799,7 @@
                        elmc_id_attn586();
                        s = jiffies;
                        while (!(mc_cmd->cmd_status & STAT_COMPL)) {
-                               if (jiffies - s > 30*HZ/100)
+                               if (time_after(jiffies, s + 30*HZ/100))
                                        break;
                        }
                        if (!(mc_cmd->cmd_status & STAT_COMPL)) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
