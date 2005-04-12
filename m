From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Tue, 12 Apr 2005 21:28:34 +0000
Subject: [KJ] [PATCH] drivers/atm/idt77252.c : Use of time_after() macro
Message-Id: <425C3D82.3030806@feitoza.com.br>
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

--- linux/drivers/atm/idt77252.c	2005-04-07 22:25:04.000000000 -0300
+++ development/drivers/atm/idt77252.c	2005-04-09 22:13:44.000000000 -0300
@@ -46,6 +46,7 @@ static char const rcsid[]  #include <linux/init.h>
 #include <linux/bitops.h>
 #include <linux/wait.h>
+#include <linux/jiffies.h>
 #include <asm/semaphore.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
@@ -780,7 +781,7 @@ push_on_scq(struct idt77252_dev *card, s
 	return 0;
 
 out:
-	if (jiffies - scq->trans_start > HZ) {
+	if (time_after(jiffies, scq->trans_start + HZ)) {
 		printk("%s: Error pushing TBD for %d.%d\n",
 		       card->name, vc->tx_vcc->vpi, vc->tx_vcc->vci);
 #ifdef CONFIG_ATM_IDT77252_DEBUG

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
