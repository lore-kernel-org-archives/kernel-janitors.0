From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:21:21 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-ixp4xx/common-pci.c
Message-Id: <20060515102121.GK12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36755774488887161=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515102005.GJ12726@rotomalug.org>
In-Reply-To: <20060515102005.GJ12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============36755774488887161==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-ixp4xx/common-pci.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-ixp4xx/common-pci.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-ixp4xx/common-pci.c	2006-05-15 11:59:20.000000000 +0200
@@ -375,7 +375,7 @@
 	 * Rev 0 IXP425 requires workaround.
 	 */
 	if (!(processor_id & 0xf) && !cpu_is_ixp46x()) {
-		printk("PCI: IXP42x A0 silicon detected - "
+		printk(KERN_INFO "PCI: IXP42x A0 silicon detected - "
 			"PCI Non-Prefetch Workaround Enabled\n");
 		ixp4xx_pci_read = ixp4xx_pci_read_errata;
 	} else
@@ -404,7 +404,7 @@
 		0x00010203;
 
 	if (*PCI_CSR & PCI_CSR_HOST) {
-		printk("PCI: IXP4xx is host\n");
+		printk(KERN_INFO "PCI: IXP4xx is host\n");
 
 		pr_debug("setup BARs in controller\n");
 
@@ -427,10 +427,10 @@
 		 */
 		local_write_config(PCI_BASE_ADDRESS_5, 4, 0xfffffc01);
 	} else {
-		printk("PCI: IXP4xx is target - No bus scan performed\n");
+		printk(KERN_INFO "PCI: IXP4xx is target - No bus scan performed\n");
 	}
 
-	printk("PCI: IXP4xx Using %s access for memory space\n",
+	printk(KERN_INFO "PCI: IXP4xx Using %s access for memory space\n",
 #ifndef CONFIG_IXP4XX_INDIRECT_PCI
 			"direct"
 #else

--===============36755774488887161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36755774488887161==--
