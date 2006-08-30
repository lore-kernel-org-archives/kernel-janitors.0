From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:13 +0000
Subject: [KJ] [PATCH] 07/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214613.15055.76089.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_polaris.c b/arch/alpha/kernel/core_polaris.c
index 277674a..c774d64 100644
--- a/arch/alpha/kernel/core_polaris.c
+++ b/arch/alpha/kernel/core_polaris.c
@@ -24,14 +24,14 @@ #include "pci_impl.h"
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: polaris: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
-
 /*
  * Given a bus, device, and function number, compute resulting
  * configuration space address.  This is fairly straightforward
@@ -72,9 +72,8 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	*pci_addr = (bus << 16) | (device_fn << 8) | (where) |
 		    POLARIS_DENSE_CONFIG_BASE;
 
-        DBG_CFG(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x,"
-                 " returning address 0x%p\n"
-                 bus, device_fn, where, *pci_addr));
+        DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, returning address 0x%p\n",
+                 bus, device_fn, where, *pci_addr);
 
 	return 0;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
