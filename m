From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:54 +0000
Subject: [KJ] [PATCH 58/72] arm: add KERN_ constants to arch/arm/mm/fault.c
Message-Id: <20060908020254.10114.83973.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index c5e0622..3907bc5 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -266,7 +266,7 @@ do_page_fault(unsigned long addr, unsign
 		 * happened to us that made us unable to handle
 		 * the page fault gracefully.
 		 */
-		printk("VM: killing process %s\n", tsk->comm);
+		printk(KERN_WARNING "VM: killing process %s\n", tsk->comm);
 		do_exit(SIGKILL);
 		return 0;
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
