From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sun, 01 Apr 2007 11:26:00 +0000
Subject: [KJ] [PATCH] ROUND_UP macro cleanup in drivers/pci
Message-Id: <20070401111400.GA9758@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, pcihpd-discuss@lists.sourceforge.net, scottm@somanetworks.com, linux-pci@atrey.karlin.mff.cuni.cz


ROUND_UP macro cleanup, use ALIGN where ever appropriate

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 hotplug/cpci_hotplug_pci.c |    2 --
 setup-bus.c                |    8 +++-----
 2 files changed, 3 insertions(+), 7 deletions(-)


diff --git a/drivers/pci/hotplug/cpci_hotplug_pci.c b/drivers/pci/hotplug/cpci_hotplug_pci.c
index 7b1beaa..5e9be44 100644
--- a/drivers/pci/hotplug/cpci_hotplug_pci.c
+++ b/drivers/pci/hotplug/cpci_hotplug_pci.c
@@ -45,8 +45,6 @@ extern int cpci_debug;
 #define info(format, arg...) printk(KERN_INFO "%s: " format "\n", MY_NAME , ## arg)
 #define warn(format, arg...) printk(KERN_WARNING "%s: " format "\n", MY_NAME , ## arg)
 
-#define ROUND_UP(x, a)		(((x) + (a) - 1) & ~((a) - 1))
-
 
 u8 cpci_get_attention_status(struct slot* slot)
 {
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 3554f39..e02766f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -34,8 +34,6 @@
 #define DBG(x...)
 #endif
 
-#define ROUND_UP(x, a)		(((x) + (a) - 1) & ~((a) - 1))
-
 static void __devinit
 pbus_assign_resources_sorted(struct pci_bus *bus)
 {
@@ -314,7 +312,7 @@ pbus_size_io(struct pci_bus *bus)
 #if defined(CONFIG_ISA) || defined(CONFIG_EISA)
 	size = (size & 0xff) + ((size & ~0xffUL) << 2);
 #endif
-	size = ROUND_UP(size + size1, 4096);
+	size = ALIGN(size + size1, 4096);
 	if (!size) {
 		b_res->flags = 0;
 		return;
@@ -383,11 +381,11 @@ pbus_size_mem(struct pci_bus *bus, unsigned long mask, unsigned long type)
 
 		if (!align)
 			min_align = align1;
-		else if (ROUND_UP(align + min_align, min_align) < align1)
+		else if (ALIGN(align + min_align, min_align) < align1)
 			min_align = align1 >> 1;
 		align += aligns[order];
 	}
-	size = ROUND_UP(size, min_align);
+	size = ALIGN(size, min_align);
 	if (!size) {
 		b_res->flags = 0;
 		return 1;

--
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
