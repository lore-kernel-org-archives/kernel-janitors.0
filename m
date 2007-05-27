From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sun, 27 May 2007 18:30:22 +0000
Subject: [KJ] [PATCH] drivers/cdrom/sbpcd.c: Array size calculations
Message-Id: <200705272030.23120.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch removes the macro replaces an array size calculation
that was done using sizeof with the ARRAY_SIZE macro.

Tested by compilation.

Maybe that the file needs some cleanup in other parts aswell. I get
quite some warnings when I compile it.

drivers/cdrom/sbpcd.c: In function ‘sbp_sleep’:
drivers/cdrom/sbpcd.c:832: warning: ‘sti’ is deprecated (declared at include/linux/interrupt.h:224)
drivers/cdrom/sbpcd.c:834: warning: ‘sti’ is deprecated (declared at include/linux/interrupt.h:224)
drivers/cdrom/sbpcd.c: In function ‘cmd_out_T’:
drivers/cdrom/sbpcd.c:1347: warning: ‘save_flags’ is deprecated (declared at include/linux/interrupt.h:228)
drivers/cdrom/sbpcd.c:1347: warning: ‘cli’ is deprecated (declared at include/linux/interrupt.h:220)
drivers/cdrom/sbpcd.c:1349: warning: ‘restore_flags’ is deprecated (declared at include/linux/interrupt.h:233)
drivers/cdrom/sbpcd.c: In function ‘cmd_out’:
drivers/cdrom/sbpcd.c:1483: warning: ‘save_flags’ is deprecated (declared at include/linux/interrupt.h:228)
drivers/cdrom/sbpcd.c:1483: warning: ‘cli’ is deprecated (declared at include/linux/interrupt.h:220)
drivers/cdrom/sbpcd.c:1485: warning: ‘restore_flags’ is deprecated (declared at include/linux/interrupt.h:233)
drivers/cdrom/sbpcd.c: In function ‘sbpcd_init’:
drivers/cdrom/sbpcd.c:5644: warning: ‘sti’ is deprecated (declared at include/linux/interrupt.h:224)
drivers/cdrom/sbpcd.c:5673: warning: ‘check_region’ is deprecated (declared at include/linux/ioport.h:136)

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
Compile tested with on i386.
Diffed against Linus' git-tree

diff --git a/drivers/cdrom/sbpcd.c b/drivers/cdrom/sbpcd.c
index a1283b1..5771f4d 100644
--- a/drivers/cdrom/sbpcd.c
+++ b/drivers/cdrom/sbpcd.c
@@ -470,8 +470,6 @@ static int sbpcd_set(const char *val, struct kernel_param *kp)
 }
 module_param_call(sbpcd, sbpcd_set, NULL, NULL, 0);
 
-#define NUM_PROBE  (sizeof(sbpcd) / sizeof(int))
-
 /*=====================================*/
 
 #define INLINE inline
@@ -5666,7 +5664,7 @@ int __init sbpcd_init(void)
 	sbpcd[1]=sbpro_type; /* possibly changed by kernel command line */
 #endif /* MODULE */
 	
-	for (port_index=0;port_index<NUM_PROBE;port_index+=2)
+	for (port_index=0;port_index<ARRAY_SIZE(sbpcd);port_index+=2)
 	{
 		addr[1]=sbpcd[port_index];
 		if (addr[1]=0) break;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
