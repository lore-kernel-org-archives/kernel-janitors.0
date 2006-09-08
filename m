From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:04 +0000
Subject: [KJ] [PATCH 06/72] arm: add KERN_ constants to
Message-Id: <20060908015703.10114.74637.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-iop3xx/iop321-pci.c b/arch/arm/mach-iop3xx/iop321-pci.c
index 8ba6a0e..0a70f4d 100644
--- a/arch/arm/mach-iop3xx/iop321-pci.c
+++ b/arch/arm/mach-iop3xx/iop321-pci.c
@@ -28,11 +28,7 @@ #include <asm/arch/iop321.h>
 
 // #define DEBUG
 
-#ifdef DEBUG
-#define  DBG(x...) printk(x)
-#else
-#define  DBG(x...) do { } while (0)
-#endif
+#define  DBG(x...) pr_debug(x)
 
 /*
  * This routine builds either a type0 or type1 configuration command.  If the
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
