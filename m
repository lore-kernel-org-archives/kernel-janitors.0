From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:22:41 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_titan.c
Message-Id: <20050922092241.GI3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78930371528695875=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78930371528695875==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



Index: linux-2.6.14-rc2/arch/alpha/kernel/core_titan.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_titan.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_titan.c
@@ -374,7 +374,7 @@ titan_init_vga_hose(void)
 		}
 
 		if (hose) {
-			printk("Console graphics on hose %d\n", hose->index);
+			printk(KERN_INFO "Console graphics on hose %d\n", hose->index);
 			pci_vga_hose = hose;
 		}
 	}
@@ -385,21 +385,21 @@ void __init
 titan_init_arch(void)
 {
 #if 0
-	printk("%s: titan_init_arch()\n", __FUNCTION__);
-	printk("%s: CChip registers:\n", __FUNCTION__);
-	printk("%s: CSR_CSC 0x%lx\n", __FUNCTION__, TITAN_cchip->csc.csr);
-	printk("%s: CSR_MTR 0x%lx\n", __FUNCTION__, TITAN_cchip->mtr.csr);
-	printk("%s: CSR_MISC 0x%lx\n", __FUNCTION__, TITAN_cchip->misc.csr);
-	printk("%s: CSR_DIM0 0x%lx\n", __FUNCTION__, TITAN_cchip->dim0.csr);
-	printk("%s: CSR_DIM1 0x%lx\n", __FUNCTION__, TITAN_cchip->dim1.csr);
-	printk("%s: CSR_DIR0 0x%lx\n", __FUNCTION__, TITAN_cchip->dir0.csr);
-	printk("%s: CSR_DIR1 0x%lx\n", __FUNCTION__, TITAN_cchip->dir1.csr);
-	printk("%s: CSR_DRIR 0x%lx\n", __FUNCTION__, TITAN_cchip->drir.csr);
-
-	printk("%s: DChip registers:\n", __FUNCTION__);
-	printk("%s: CSR_DSC 0x%lx\n", __FUNCTION__, TITAN_dchip->dsc.csr);
-	printk("%s: CSR_STR 0x%lx\n", __FUNCTION__, TITAN_dchip->str.csr);
-	printk("%s: CSR_DREV 0x%lx\n", __FUNCTION__, TITAN_dchip->drev.csr);
+	printk(KERN_DEBUG "%s: titan_init_arch()\n", __FUNCTION__);
+	printk(KERN_DEBUG "%s: CChip registers:\n", __FUNCTION__);
+	printk(KERN_DEBUG "%s: CSR_CSC 0x%lx\n", __FUNCTION__, TITAN_cchip->csc.csr);
+	printk(KERN_DEBUG "%s: CSR_MTR 0x%lx\n", __FUNCTION__, TITAN_cchip->mtr.csr);
+	printk(KERN_DEBUG "%s: CSR_MISC 0x%lx\n", __FUNCTION__, TITAN_cchip->misc.csr);
+	printk(KERN_DEBUG "%s: CSR_DIM0 0x%lx\n", __FUNCTION__, TITAN_cchip->dim0.csr);
+	printk(KERN_DEBUG "%s: CSR_DIM1 0x%lx\n", __FUNCTION__, TITAN_cchip->dim1.csr);
+	printk(KERN_DEBUG "%s: CSR_DIR0 0x%lx\n", __FUNCTION__, TITAN_cchip->dir0.csr);
+	printk(KERN_DEBUG "%s: CSR_DIR1 0x%lx\n", __FUNCTION__, TITAN_cchip->dir1.csr);
+	printk(KERN_DEBUG "%s: CSR_DRIR 0x%lx\n", __FUNCTION__, TITAN_cchip->drir.csr);
+
+	printk(KERN_DEBUG "%s: DChip registers:\n", __FUNCTION__);
+	printk(KERN_DEBUG "%s: CSR_DSC 0x%lx\n", __FUNCTION__, TITAN_dchip->dsc.csr);
+	printk(KERN_DEBUG "%s: CSR_STR 0x%lx\n", __FUNCTION__, TITAN_dchip->str.csr);
+	printk(KERN_DEBUG "%s: CSR_DREV 0x%lx\n", __FUNCTION__, TITAN_dchip->drev.csr);
 #endif
 
 	boot_cpuid = __hard_smp_processor_id();
@@ -530,7 +530,7 @@ titan_ioremap(unsigned long addr, unsign
 		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
 			pfn = ptes[baddr >> PAGE_SHIFT];
 			if (!(pfn & 1)) {
-				printk("ioremap failed... pte not valid...\n");
+				printk(KERN_ERR "ioremap failed... pte not valid...\n");
 				vfree(area->addr);
 				return NULL;
 			}
@@ -539,7 +539,7 @@ titan_ioremap(unsigned long addr, unsign
 			if (__alpha_remap_area_pages(vaddr,
 						     pfn << PAGE_SHIFT, 
 						     PAGE_SIZE, 0)) {
-				printk("FAILED to map...\n");
+				printk(KERN_ERR "FAILED to map...\n");
 				vfree(area->addr);
 				return NULL;
 			}
@@ -711,13 +711,13 @@ titan_agp_translate(alpha_agp_info *agp,
 
 	if (addr < agp->aperture.bus_base ||
 	    addr >= agp->aperture.bus_base + agp->aperture.size) {
-		printk("%s: addr out of range\n", __FUNCTION__);
+		printk(KERN_ERR "%s: addr out of range\n", __FUNCTION__);
 		return -EINVAL;
 	}
 
 	pte = aper->arena->ptes[baddr >> PAGE_SHIFT];
 	if (!(pte & 1)) {
-		printk("%s: pte not valid\n", __FUNCTION__);
+		printk(KERN_ERR "%s: pte not valid\n", __FUNCTION__);
 		return -EINVAL;
 	}
 


--===============78930371528695875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78930371528695875==--
