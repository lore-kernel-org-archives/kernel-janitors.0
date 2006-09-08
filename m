From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:24 +0000
Subject: [KJ] [PATCH 09/72] arm: add KERN_ constants to
Message-Id: <20060908015724.10114.77861.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-ixp23xx/pci.c b/arch/arm/mach-ixp23xx/pci.c
index 3b34fa3..b5c3a41 100644
--- a/arch/arm/mach-ixp23xx/pci.c
+++ b/arch/arm/mach-ixp23xx/pci.c
@@ -38,11 +38,7 @@ extern int (*external_fault) (unsigned l
 
 static int pci_master_aborts = 0;
 
-#ifdef DEBUG
-#define DBG(x...)	printk(x)
-#else
-#define DBG(x...)
-#endif
+#define DBG(x...)	pr_debug(x)
 
 int clear_master_aborts(void);
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
