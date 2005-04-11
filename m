From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Apr 2005 10:00:11 +0000
Subject: [KJ] [PATCH] drivers/net/3c523.c : Use of time_after() macro
Message-Id: <425A4AAB.9060400@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

-- 

Marcelo Feitoza Parisi            
marcelo at feitoza.com.br
http://marcelo.feitoza.com.br/


Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/3c523.c	2005-03-02 04:38:38.000000000 -0300
+++ development/drivers/net/3c523.c	2005-04-09 18:37:48.000000000 -0300
@@ -105,7 +105,8 @@
 #include <linux/mca-legacy.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
-
+#include <linux/jiffies.h>
+ 
 #include <asm/uaccess.h>
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -659,7 +660,7 @@ static int init586(struct net_device *de
 
 	s = jiffies;		/* warning: only active with interrupts on !! */
 	while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100)
+		if (time_after(jiffies, s + 30*HZ/100))
 			break;
 	}
 
@@ -685,7 +686,7 @@ static int init586(struct net_device *de
 
 	s = jiffies;
 	while (!(ias_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100)
+		if (time_after(jiffies, s + 30*HZ/100))
 			break;
 	}
 
@@ -710,7 +711,7 @@ static int init586(struct net_device *de
 
 	s = jiffies;
 	while (!(tdr_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100) {
+		if (time_after(jiffies, s + 30*HZ/100)) {
 			printk(KERN_WARNING "%s: %d Problems while running the TDR.\n", dev->name, __LINE__);
 			result = 1;
 			break;
@@ -799,7 +800,7 @@ static int init586(struct net_device *de
 			elmc_id_attn586();
 			s = jiffies;
 			while (!(mc_cmd->cmd_status & STAT_COMPL)) {
-				if (jiffies - s > 30*HZ/100)
+				if (time_after(jiffies, s + 30*HZ/100))
 					break;
 			}
 			if (!(mc_cmd->cmd_status & STAT_COMPL)) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
