From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:10 +0000
Subject: [KJ] [PATCH 07/72] arm: add KERN_ constants to
Message-Id: <20060908015710.10114.91633.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-iop3xx/iop331-pci.c b/arch/arm/mach-iop3xx/iop331-pci.c
index 44dd213..99ef936 100644
--- a/arch/arm/mach-iop3xx/iop331-pci.c
+++ b/arch/arm/mach-iop3xx/iop331-pci.c
@@ -29,14 +29,10 @@ #include <asm/arch/iop331.h>
 #undef DEBUG
 #undef DEBUG1
 
-#ifdef DEBUG
-#define  DBG(x...) printk(x)
-#else
-#define  DBG(x...) do { } while (0)
-#endif
+#define  DBG(x...) pr_debug(x)
 
 #ifdef DEBUG1
-#define  DBG1(x...) printk(x)
+#define  DBG1(x...) printk(KERN_DEBUG x)
 #else
 #define  DBG1(x...) do { } while (0)
 #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
