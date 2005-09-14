From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 14 Sep 2005 06:42:48 +0000
Subject: [KJ] [RESEND][PATCH] printk : arch/alpha/kernel/core_lca.c
Message-Id: <20050914064248.GE32338@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57368188778332074=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57368188778332074==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alexey Dobriyan (adobriyan@gmail.com) wrote:
> On Thu, Sep 08, 2005 at 10:47:08AM +0200, Christophe Lucas wrote:
> > printk() calls should include appropriate KERN_* constant.
> 
> > --- linux-2.6.13.orig/arch/alpha/kernel/core_lca.c
> > +++ linux-2.6.13/arch/alpha/kernel/core_lca.c
> > @@ -334,23 +334,23 @@ lca_init_arch(void)
> >  static void
> >  mem_error(unsigned long esr, unsigned long ear)
> >  {
> > -	printk("    %s %s error to %s occurred at address %x\n",
> > +	printk(KERN_WARNING "    %s %s error to %s occurred at address %x\n",
> 
> Looks like these should be printed with KERN_ERR.

Ok,

I resend it.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.13/arch/alpha/kernel/core_lca.c
===================================================================
--- linux-2.6.13.orig/arch/alpha/kernel/core_lca.c
+++ linux-2.6.13/arch/alpha/kernel/core_lca.c
@@ -334,23 +334,23 @@ lca_init_arch(void)
 static void
 mem_error(unsigned long esr, unsigned long ear)
 {
-	printk("    %s %s error to %s occurred at address %x\n",
+	printk(KERN_ERR "    %s %s error to %s occurred at address %x\n",
 	       ((esr & ESR_CEE) ? "Correctable" :
 		(esr & ESR_UEE) ? "Uncorrectable" : "A"),
 	       (esr & ESR_WRE) ? "write" : "read",
 	       (esr & ESR_SOR) ? "memory" : "b-cache",
 	       (unsigned) (ear & 0x1ffffff8));
 	if (esr & ESR_CTE) {
-		printk("    A b-cache tag parity error was detected.\n");
+		printk(KERN_ERR "    A b-cache tag parity error was detected.\n");
 	}
 	if (esr & ESR_MSE) {
-		printk("    Several other correctable errors occurred.\n");
+		printk(KERN_ERR "    Several other correctable errors occurred.\n");
 	}
 	if (esr & ESR_MHE) {
-		printk("    Several other uncorrectable errors occurred.\n");
+		printk(KERN_ERR "    Several other uncorrectable errors occurred.\n");
 	}
 	if (esr & ESR_NXM) {
-		printk("    Attempted to access non-existent memory.\n");
+		printk(KERN_ERR "    Attempted to access non-existent memory.\n");
 	}
 }
 
@@ -372,16 +372,16 @@ ioc_error(__u32 stat0, __u32 stat1)
 	unsigned code = (stat0 & IOC_CODE) >> IOC_CODE_SHIFT;
 	unsigned cmd  = (stat0 & IOC_CMD)  >> IOC_CMD_SHIFT;
 
-	printk("    %s initiated PCI %s cycle to address %x"
+	printk(KERN_ERR "    %s initiated PCI %s cycle to address %x"
 	       " failed due to %s.\n",
 	       code > 3 ? "PCI" : "CPU", pci_cmd[cmd], stat1, err_name[code]);
 
 	if (code == 5 || code == 6) {
-		printk("    (Error occurred at PCI memory address %x.)\n",
+		printk(KERN_ERR "    (Error occurred at PCI memory address %x.)\n",
 		       (stat0 & ~IOC_P_NBR));
 	}
 	if (stat0 & IOC_LOST) {
-		printk("    Other PCI errors occurred simultaneously.\n");
+		printk(KERN_ERR "    Other PCI errors occurred simultaneously.\n");
 	}
 }
 
@@ -482,12 +482,12 @@ lca_clock_print(void)
 
         pmr_reg = LCA_READ_PMR;
 
-        printk("Status of clock control:\n");
-        printk("\tPrimary clock divisor\t0x%lx\n", LCA_GET_PRIMARY(pmr_reg));
-        printk("\tOverride clock divisor\t0x%lx\n", LCA_GET_OVERRIDE(pmr_reg));
-        printk("\tInterrupt override is %s\n",
+        printk(KERN_INFO "Status of clock control:\n");
+        printk(KERN_INFO "\tPrimary clock divisor\t0x%lx\n", LCA_GET_PRIMARY(pmr_reg));
+        printk(KERN_INFO "\tOverride clock divisor\t0x%lx\n", LCA_GET_OVERRIDE(pmr_reg));
+        printk(KERN_INFO "\tInterrupt override is %s\n",
 	       (pmr_reg & LCA_PMR_INTO) ? "on" : "off"); 
-        printk("\tDMA override is %s\n",
+        printk(KERN_INFO "\tDMA override is %s\n",
 	       (pmr_reg & LCA_PMR_DMAO) ? "on" : "off"); 
 
 }


--===============57368188778332074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57368188778332074==--
