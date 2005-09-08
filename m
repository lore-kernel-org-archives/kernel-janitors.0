From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 08 Sep 2005 07:08:49 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/core_cia.c
Message-Id: <20050908070849.GB26072@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96868799154943686=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96868799154943686==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.13/arch/alpha/kernel/core_cia.c
===================================================================
--- linux-2.6.13.orig/arch/alpha/kernel/core_cia.c
+++ linux-2.6.13/arch/alpha/kernel/core_cia.c
@@ -428,7 +428,7 @@ verify_tb_operation(void)
 	mcheck_expected(0) = 0;
 	mb();
 	if (mcheck_taken(0)) {
-		printk("pci: failed sg loopback i/o read test (mcheck)\n");
+		printk(KERN_WARNING "pci: failed sg loopback i/o read test (mcheck)\n");
 		goto failed;
 	}
 	if (temp != data0) {
@@ -445,9 +445,9 @@ verify_tb_operation(void)
 		temp = *(vip)CIA_IOC_TB_TAGn(0);
 		if (temp & 1) {
 			use_tbia_try2 = 1;
-			printk("pci: failed tbia test; workaround available\n");
+			printk(KERN_WARNING "pci: failed tbia test; workaround available\n");
 		} else {
-			printk("pci: passed tbia test\n");
+			printk(KERN_INFO "pci: passed tbia test\n");
 		}
 	}
 
@@ -465,7 +465,7 @@ verify_tb_operation(void)
 	mcheck_expected(0) = 0;
 	mb();
 	if (mcheck_taken(0)) {
-		printk("pci: failed pte write cache snoop test (mcheck)\n");
+		printk(KERN_WARNING "pci: failed pte write cache snoop test (mcheck)\n");
 		goto failed;
 	}
 	if (temp != data0) {
@@ -512,7 +512,7 @@ verify_tb_operation(void)
 	mb();
 	mcheck_expected(0) = 0;
 	mb();
-	printk("pci: %s pci machine check test\n",
+	printk(KERN_INFO "pci: %s pci machine check test\n",
 	       mcheck_taken(0) ? "passed" : "failed");
 
 	/* Clean up after the tests.  */
@@ -529,7 +529,7 @@ verify_tb_operation(void)
 		*(vip)CIA_IOC_TB_TAGn(2) = 2;
 		*(vip)CIA_IOC_TB_TAGn(3) = 2;
 
-		printk("pci: tbia workaround enabled\n");
+		printk(KERN_INFO "pci: tbia workaround enabled\n");
 	}
 	alpha_mv.mv_pci_tbi(arena->hose, 0, -1);
 
@@ -546,7 +546,7 @@ exit:
 	return;
 
 failed:
-	printk("pci: disabling sg translation window\n");
+	printk(KERN_INFO "pci: disabling sg translation window\n");
 	*(vip)CIA_IOC_PCI_W0_BASE = 0;
 	*(vip)CIA_IOC_PCI_W1_BASE = 0;
 	pci_isa_hose->sg_isa = NULL;
@@ -632,7 +632,7 @@ do_init_arch(int is_pyxis)
 	int temp, cia_rev, tbia_window;
 
 	cia_rev = *(vip)CIA_IOC_CIA_REV & CIA_REV_MASK;
-	printk("pci: cia revision %d%s\n",
+	printk(KERN_INFO "pci: cia revision %d%s\n",
 	       cia_rev, is_pyxis ? " (pyxis)" : "");
 
 	if (alpha_using_srm)


--===============96868799154943686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96868799154943686==--
