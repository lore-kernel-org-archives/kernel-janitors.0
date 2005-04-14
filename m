From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Thu, 14 Apr 2005 21:37:16 +0000
Subject: [KJ] [PATCH] drivers/net/3c523.c : time_after() macro
Message-Id: <425EE28C.1020604@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

According to Nish's suggestion, here is the patch correction, using the 
time_after() macro,
defined in linux/jiffies.h. Any problem, please, mail-me.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/3c523.c    2005-03-02 04:38:38.000000000 -0300
+++ development/drivers/net/3c523.c    2005-04-14 18:31:24.000000000 -0300
@@ -105,6 +105,7 @@
 #include <linux/mca-legacy.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/uaccess.h>
 #include <asm/processor.h>
@@ -620,7 +621,7 @@
 static int init586(struct net_device *dev)
 {
     void *ptr;
-    unsigned long s;
+    unsigned long end_jiffies;
     int i, result = 0;
     struct priv *p = (struct priv *) dev->priv;
     volatile struct configure_cmd_struct *cfg_cmd;
@@ -657,9 +658,9 @@
     p->scb->cmd = CUC_START;    /* cmd.-unit start */
     elmc_id_attn586();
 
-    s = jiffies;        /* warning: only active with interrupts on !! */
+    end_jiffies = jiffies + 30*HZ/100;        /* warning: only active 
with interrupts on !! */
     while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
-        if (jiffies - s > 30*HZ/100)
+        if (time_after(jiffies, end_jiffies))
             break;
     }
 
@@ -683,9 +684,9 @@
     p->scb->cmd = CUC_START;    /* cmd.-unit start */
     elmc_id_attn586();
 
-    s = jiffies;
+    end_jiffies = jiffies + 30*HZ/100;
     while (!(ias_cmd->cmd_status & STAT_COMPL)) {
-        if (jiffies - s > 30*HZ/100)
+        if (time_after(jiffies, end_jiffies))
             break;
     }
 
@@ -708,9 +709,9 @@
     p->scb->cmd = CUC_START;    /* cmd.-unit start */
     elmc_attn586();
 
-    s = jiffies;
+    end_jiffies = jiffies + 30*HZ/100;
     while (!(tdr_cmd->cmd_status & STAT_COMPL)) {
-        if (jiffies - s > 30*HZ/100) {
+        if (time_after(jiffies, end_jiffies)) {
             printk(KERN_WARNING "%s: %d Problems while running the 
TDR.\n", dev->name, __LINE__);
             result = 1;
             break;
@@ -797,9 +798,9 @@
             p->scb->cbl_offset = make16(mc_cmd);
             p->scb->cmd = CUC_START;
             elmc_id_attn586();
-            s = jiffies;
+            end_jiffies = jiffies + 30*HZ/100;
             while (!(mc_cmd->cmd_status & STAT_COMPL)) {
-                if (jiffies - s > 30*HZ/100)
+                if (time_after(jiffies, end_jiffies))
                     break;
             }
             if (!(mc_cmd->cmd_status & STAT_COMPL)) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
