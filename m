From: Nate Case <ncase@xes-inc.com>
Date: Thu, 08 May 2008 16:41:17 +0000
Subject: [PATCH] POWERPC: Get rid of leftover printk in isa-bridge.c
Message-Id: <1210264877.13845.274.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linuxppc-dev@ozlabs.org

This printk() appears twice in the same function.  Only the latter one
in the inval_range: section appears to be legitimate.

Signed-off-by: Nate Case <ncase@xes-inc.com>
---

diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
index ee172aa..e35092e 100644
--- a/arch/powerpc/kernel/isa-bridge.c
+++ b/arch/powerpc/kernel/isa-bridge.c
@@ -108,9 +108,6 @@ static void __devinit pci_process_ISA_OF_ranges(struct device_node *isa_node,
 	if (size > 0x10000)
 		size = 0x10000;
 
-	printk(KERN_ERR "no ISA IO ranges or unexpected isa range, "
-	       "mapping 64k\n");
-
 	__ioremap_at(phb_io_base_phys, (void *)ISA_IO_BASE,
 		     size, _PAGE_NO_CACHE|_PAGE_GUARDED);
 	return;


