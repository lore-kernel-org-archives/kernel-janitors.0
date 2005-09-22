From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:23:38 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_tsunami.c
Message-Id: <20050922092338.GJ3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11400566127436518=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11400566127436518==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



Index: linux-2.6.14-rc2/arch/alpha/kernel/core_tsunami.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_tsunami.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_tsunami.c
@@ -211,7 +211,7 @@ tsunami_probe_read(volatile unsigned lon
 	mcheck_taken(cpu) = 0;
 	setipl(s);
 
-	printk("dont_care == 0x%lx\n", dont_care);
+	printk(KERN_INFO "dont_care == 0x%lx\n", dont_care);
 
 	return probe_result;
 }
@@ -229,7 +229,7 @@ tsunami_probe_write(volatile unsigned lo
 		int source = (TSUNAMI_cchip->misc.csr >> 29) & 7;
 		TSUNAMI_cchip->misc.csr |= (1L << 28); /* ...and unlock NXS. */
 		probe_result = 0;
-		printk("tsunami_probe_write: unit %d at 0x%016lx\n", source,
+		printk(KERN_INFO "tsunami_probe_write: unit %d at 0x%016lx\n", source,
 		       (unsigned long)vaddr);
 	}
 	if (probe_result)
@@ -362,27 +362,27 @@ tsunami_init_arch(void)
 	/* NXMs just don't matter to Tsunami--unless they make it
 	   choke completely. */
 	tmp = (unsigned long)(TSUNAMI_cchip - 1);
-	printk("%s: probing bogus address:  0x%016lx\n", FN, bogus_addr);
-	printk("\tprobe %s\n",
+	printk(KERN_INFO "%s: probing bogus address:  0x%016lx\n", FN, bogus_addr);
+	printk(KERN_INFO "\tprobe %s\n",
 	       tsunami_probe_write((unsigned long *)bogus_addr)
 	       ? "succeeded" : "failed");
 #endif /* NXM_MACHINE_CHECKS_ON_TSUNAMI */
 
 #if 0
-	printk("%s: CChip registers:\n", FN);
-	printk("%s: CSR_CSC 0x%lx\n", FN, TSUNAMI_cchip->csc.csr);
-	printk("%s: CSR_MTR 0x%lx\n", FN, TSUNAMI_cchip.mtr.csr);
-	printk("%s: CSR_MISC 0x%lx\n", FN, TSUNAMI_cchip->misc.csr);
-	printk("%s: CSR_DIM0 0x%lx\n", FN, TSUNAMI_cchip->dim0.csr);
-	printk("%s: CSR_DIM1 0x%lx\n", FN, TSUNAMI_cchip->dim1.csr);
-	printk("%s: CSR_DIR0 0x%lx\n", FN, TSUNAMI_cchip->dir0.csr);
-	printk("%s: CSR_DIR1 0x%lx\n", FN, TSUNAMI_cchip->dir1.csr);
-	printk("%s: CSR_DRIR 0x%lx\n", FN, TSUNAMI_cchip->drir.csr);
-
-	printk("%s: DChip registers:\n");
-	printk("%s: CSR_DSC 0x%lx\n", FN, TSUNAMI_dchip->dsc.csr);
-	printk("%s: CSR_STR 0x%lx\n", FN, TSUNAMI_dchip->str.csr);
-	printk("%s: CSR_DREV 0x%lx\n", FN, TSUNAMI_dchip->drev.csr);
+	printk(KERN_DEBUG "%s: CChip registers:\n", FN);
+	printk(KERN_DEBUG "%s: CSR_CSC 0x%lx\n", FN, TSUNAMI_cchip->csc.csr);
+	printk(KERN_DEBUG "%s: CSR_MTR 0x%lx\n", FN, TSUNAMI_cchip.mtr.csr);
+	printk(KERN_DEBUG "%s: CSR_MISC 0x%lx\n", FN, TSUNAMI_cchip->misc.csr);
+	printk(KERN_DEBUG "%s: CSR_DIM0 0x%lx\n", FN, TSUNAMI_cchip->dim0.csr);
+	printk(KERN_DEBUG "%s: CSR_DIM1 0x%lx\n", FN, TSUNAMI_cchip->dim1.csr);
+	printk(KERN_DEBUG "%s: CSR_DIR0 0x%lx\n", FN, TSUNAMI_cchip->dir0.csr);
+	printk(KERN_DEBUG "%s: CSR_DIR1 0x%lx\n", FN, TSUNAMI_cchip->dir1.csr);
+	printk(KERN_DEBUG "%s: CSR_DRIR 0x%lx\n", FN, TSUNAMI_cchip->drir.csr);
+
+	printk(KERN_DEBUG "%s: DChip registers:\n");
+	printk(KERN_DEBUG "%s: CSR_DSC 0x%lx\n", FN, TSUNAMI_dchip->dsc.csr);
+	printk(KERN_DEBUG "%s: CSR_STR 0x%lx\n", FN, TSUNAMI_dchip->str.csr);
+	printk(KERN_DEBUG "%s: CSR_DREV 0x%lx\n", FN, TSUNAMI_dchip->drev.csr);
 #endif
 	/* With multiple PCI busses, we play with I/O as physical addrs.  */
 	ioport_resource.end = ~0UL;


--===============11400566127436518==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11400566127436518==--
