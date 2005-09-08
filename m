From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 08 Sep 2005 08:36:30 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/core_irongate.c
Message-Id: <20050908083630.GE26072@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50126113148772533=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============50126113148772533==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.13/arch/alpha/kernel/core_irongate.c
===================================================================
--- linux-2.6.13.orig/arch/alpha/kernel/core_irongate.c
+++ linux-2.6.13/arch/alpha/kernel/core_irongate.c
@@ -169,13 +169,13 @@ irongate_pci_clr_err(void)
 
 again:
 	IRONGATE_jd = IRONGATE0->stat_cmd;
-	printk("Iron stat_cmd %x\n", IRONGATE_jd);
+	printk(KERN_INFO "Iron stat_cmd %x\n", IRONGATE_jd);
 	IRONGATE0->stat_cmd = IRONGATE_jd; /* write again clears error bits */
 	mb();
 	IRONGATE_jd = IRONGATE0->stat_cmd;  /* re-read to force write */
 
 	IRONGATE_jd = *IronECC;
-	printk("Iron ECC %x\n", IRONGATE_jd);
+	printk(KERN_INFO "Iron ECC %x\n", IRONGATE_jd);
 	*IronECC = IRONGATE_jd; /* write again clears error bits */
 	mb();
 	IRONGATE_jd = *IronECC;  /* re-read to force write */
@@ -351,7 +351,7 @@ irongate_ioremap(unsigned long addr, uns
 	 * Adjust the limits (mappings must be page aligned)
 	 */
 	if (addr & ~PAGE_MASK) {
-		printk("AGP ioremap failed... addr not page aligned (0x%lx)\n",
+		printk(KERN_WARNING "AGP ioremap failed... addr not page aligned (0x%lx)\n",
 		       addr);
 		return (void __iomem *)(addr + IRONGATE_MEM);
 	}
@@ -359,17 +359,17 @@ irongate_ioremap(unsigned long addr, uns
 	size = PAGE_ALIGN(last) - addr;
 
 #if 0
-	printk("irongate_ioremap(0x%lx, 0x%lx)\n", addr, size);
-	printk("irongate_ioremap:  gart_bus_addr  0x%lx\n", gart_bus_addr);
-	printk("irongate_ioremap:  gart_aper_size 0x%lx\n", gart_aper_size);
-	printk("irongate_ioremap:  mmio_regs      %p\n", mmio_regs);
-	printk("irongate_ioremap:  gatt_pages     %p\n", gatt_pages);
+	printk(KERN_DEBUG "irongate_ioremap(0x%lx, 0x%lx)\n", addr, size);
+	printk(KERN_DEBUG "irongate_ioremap:  gart_bus_addr  0x%lx\n", gart_bus_addr);
+	printk(KERN_DEBUG "irongate_ioremap:  gart_aper_size 0x%lx\n", gart_aper_size);
+	printk(KERN_DEBUG "irongate_ioremap:  mmio_regs      %p\n", mmio_regs);
+	printk(KERN_DEBUG "irongate_ioremap:  gatt_pages     %p\n", gatt_pages);
 	
 	for(baddr = addr; baddr <= last; baddr += PAGE_SIZE)
 	{
 		cur_gatt = phys_to_virt(GET_GATT(baddr) & ~1);
 		pte = cur_gatt[GET_GATT_OFF(baddr)] & ~1;
-		printk("irongate_ioremap:  cur_gatt %p pte 0x%x\n",
+		printk(KERN_DEBUG "irongate_ioremap:  cur_gatt %p pte 0x%x\n",
 		       cur_gatt, pte);
 	}
 #endif
@@ -389,7 +389,7 @@ irongate_ioremap(unsigned long addr, uns
 
 		if (__alpha_remap_area_pages(vaddr,
 					     pte, PAGE_SIZE, 0)) {
-			printk("AGP ioremap: FAILED to map...\n");
+			printk(KERN_WARNING "AGP ioremap: FAILED to map...\n");
 			vfree(area->addr);
 			return NULL;
 		}
@@ -399,7 +399,7 @@ irongate_ioremap(unsigned long addr, uns
 
 	vaddr = (unsigned long)area->addr + (addr & ~PAGE_MASK);
 #if 0
-	printk("irongate_ioremap(0x%lx, 0x%lx) returning 0x%lx\n",
+	printk(KERN_DEBUG "irongate_ioremap(0x%lx, 0x%lx) returning 0x%lx\n",
 	       addr, size, vaddr);
 #endif
 	return (void __iomem *)vaddr;


--===============50126113148772533==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50126113148772533==--
