From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:31 +0000
Subject: [KJ] [PATCH] 01/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214531.15055.45661.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_apecs.c b/arch/alpha/kernel/core_apecs.c
index a27ba12..5ae277e 100644
--- a/arch/alpha/kernel/core_apecs.c
+++ b/arch/alpha/kernel/core_apecs.c
@@ -36,11 +36,12 @@ #include "pci_impl.h"
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: apecs: "
 
 #if DEBUG_CONFIG
-# define DBGC(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBGC(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 #define vuip	volatile unsigned int  *
@@ -94,9 +95,8 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBGC(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x,"
-	      " pci_addr=0x%p, type1=0x%p)\n",
-	      bus, device_fn, where, pci_addr, type1));
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, pci_addr=0x%p, type1=0x%p)\n",
+	      bus, device_fn, where, pci_addr, type1);
 
 	if (bus = 0) {
 		int device = device_fn >> 3;
@@ -104,8 +104,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 		/* type 0 configuration cycle: */
 
 		if (device > 20) {
-			DBGC(("mk_conf_addr: device (%d) > 20, returning -1\n",
-			      device));
+			DBG_CFG("device (%d) > 20, returning -1\n", device);
 			return -1;
 		}
 
@@ -117,7 +116,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 		addr = (bus << 16) | (device_fn << 8) | (where);
 	}
 	*pci_addr = addr;
-	DBGC(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -130,20 +129,20 @@ conf_read(unsigned long addr, unsigned c
 
 	local_irq_save(flags);	/* avoid getting hit by machine check */
 
-	DBGC(("conf_read(addr=0x%lx, type1=%d)\n", addr, type1));
+	DBG_CFG("(addr=0x%lx, type1=%d)\n", addr, type1);
 
 	/* Reset status register to avoid losing errors.  */
 	stat0 = *(vuip)APECS_IOC_DCSR;
 	*(vuip)APECS_IOC_DCSR = stat0;
 	mb();
-	DBGC(("conf_read: APECS DCSR was 0x%x\n", stat0));
+	DBG_CFG("APECS DCSR was 0x%x\n", stat0);
 
 	/* If Type1 access, must set HAE #2. */
 	if (type1) {
 		haxr2 = *(vuip)APECS_IOC_HAXR2;
 		mb();
 		*(vuip)APECS_IOC_HAXR2 = haxr2 | 1;
-		DBGC(("conf_read: TYPE1 access\n"));
+		DBG_CFG("TYPE1 access\n");
 	}
 
 	draina();
@@ -176,13 +175,13 @@ #if 1
 
 	/* Now look for any errors.  */
 	stat0 = *(vuip)APECS_IOC_DCSR;
-	DBGC(("conf_read: APECS DCSR after read 0x%x\n", stat0));
+	DBG_CFG("APECS DCSR after read 0x%x\n", stat0);
 
 	/* Is any error bit set? */
 	if (stat0 & 0xffe0U) {
 		/* If not NDEV, print status.  */
 		if (!(stat0 & 0x0800)) {
-			printk("apecs.c:conf_read: got stat0=%x\n", stat0);
+			pr_info(PFX "%s: got stat0=%x\n", __FUNCTION__, stat0);
 		}
 
 		/* Reset error status.  */
@@ -251,7 +250,7 @@ #if 1
 	if (stat0 & 0xffe0U) {
 		/* If not NDEV, print status.  */
 		if (!(stat0 & 0x0800)) {
-			printk("apecs.c:conf_write: got stat0=%x\n", stat0);
+			pr_info(PFX "%s: got stat0=%x\n", __FUNCTION__, stat0);
 		}
 
 		/* Reset error status.  */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
