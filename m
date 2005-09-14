From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 14 Sep 2005 06:46:18 +0000
Subject: Re: [KJ] [PATCH] printk : arch/alpha/kernel/core_marvel.c
Message-Id: <20050914064618.GF32338@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45303996620164355=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============45303996620164355==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alexey Dobriyan (adobriyan@gmail.com) wrote:
> On Thu, Sep 08, 2005 at 10:49:11AM +0200, Christophe Lucas wrote:
> > printk() calls should include appropriate KERN_* constant.
> 
> > --- linux-2.6.13.orig/arch/alpha/kernel/core_marvel.c
> > +++ linux-2.6.13/arch/alpha/kernel/core_marvel.c
> > @@ -759,7 +759,7 @@ marvel_ioremap(unsigned long addr, unsig
> >  		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
> >  			pfn = ptes[baddr >> PAGE_SHIFT];
> >  			if (!(pfn & 1)) {
> > -				printk("ioremap failed... pte not valid...\n");
> > +				printk(KERN_WARNING "ioremap failed... pte not valid...\n");
> >  				vfree(area->addr);
> >  				return NULL;
> >  [...]
> >
> >  	pte = aper->arena->ptes[baddr >> PAGE_SHIFT];
> >  	if (!(pte & 1)) {
> > -		printk("%s: pte not valid\n", __FUNCTION__);
> > +		printk(KERN_WARNING "%s: pte not valid\n", __FUNCTION__);
> >  		return -EINVAL;
> >  	} 
> >  	return (pte >> 1) << PAGE_SHIFT;
> 
> Guess, these deserve KERN_ERR too.
> 

Ok, I resend it.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.13/arch/alpha/kernel/core_marvel.c
===================================================================
--- linux-2.6.13.orig/arch/alpha/kernel/core_marvel.c
+++ linux-2.6.13/arch/alpha/kernel/core_marvel.c
@@ -332,7 +332,7 @@ marvel_init_io7(struct io7 *io7)
 {
 	int i;
 
-	printk("Initializing IO7 at PID %d\n", io7->pe);
+	printk(KERN_INFO "Initializing IO7 at PID %d\n", io7->pe);
 
 	/*
 	 * Get the Port 7 CSR pointer.
@@ -361,7 +361,7 @@ marvel_io7_present(gct6_node *node)
 		return;
 
 	pe = (node->id >> 8) & 0xff;
-	printk("Found an IO7 at PID %d\n", pe);
+	printk(KERN_INFO "Found an IO7 at PID %d\n", pe);
 
 	alloc_io7(pe);
 }
@@ -383,7 +383,7 @@ marvel_init_vga_hose(void)
 		 *         need to fix this decode when the console 
 		 *         changes its encoding
 		 */
-		printk("console graphics is on hose %d (console)\n", h);
+		printk(KERN_INFO "console graphics is on hose %d (console)\n", h);
 
 		/*
 		 * The console's hose numbering is:
@@ -399,7 +399,7 @@ marvel_init_vga_hose(void)
 			hose = io7->ports[port].hose;
 
 		if (hose) {
-			printk("Console graphics on hose %d\n", hose->index);
+			printk(KERN_INFO "Console graphics on hose %d\n", hose->index);
 			pci_vga_hose = hose;
 		}
 	}
@@ -426,7 +426,7 @@ marvel_specify_io7(char *str)
 	do {
 		pid = simple_strtoul(str, &pchar, 0);
 		if (pchar != str) {
-			printk("User-specified IO7 at PID %lu\n", pid);
+			printk(KERN_INFO "User-specified IO7 at PID %lu\n", pid);
 			io7 = alloc_io7(pid);
 			if (io7) marvel_init_io7(io7);
 		}
@@ -759,7 +759,7 @@ marvel_ioremap(unsigned long addr, unsig
 		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
 			pfn = ptes[baddr >> PAGE_SHIFT];
 			if (!(pfn & 1)) {
-				printk("ioremap failed... pte not valid...\n");
+				printk(KERN_ERR "ioremap failed... pte not valid...\n");
 				vfree(area->addr);
 				return NULL;
 			}
@@ -768,7 +768,7 @@ marvel_ioremap(unsigned long addr, unsig
 			if (__alpha_remap_area_pages(vaddr,
 						     pfn << PAGE_SHIFT, 
 						     PAGE_SIZE, 0)) {
-				printk("FAILED to map...\n");
+				printk(KERN_ERR "FAILED to map...\n");
 				vfree(area->addr);
 				return NULL;
 			}
@@ -1002,7 +1002,7 @@ marvel_agp_configure(alpha_agp_info *agp
 		 * Don't know what this PLL setting is, take the requested
 		 * rate, but warn the user.
 		 */
-		printk("%s: unknown PLL setting RNGB=%lx (PLL6_CTL=%016lx)\n",
+		printk(KERN_INFO "%s: unknown PLL setting RNGB=%lx (PLL6_CTL=%016lx)\n",
 		       __FUNCTION__, IO7_PLL_RNGB(agp_pll), agp_pll);
 		break;
 	}
@@ -1011,7 +1011,7 @@ marvel_agp_configure(alpha_agp_info *agp
 	 * Set the new rate, if necessary.
 	 */
 	if (new_rate) {
-		printk("Requested AGP Rate %dX not compatible "
+		printk(KERN_INFO "Requested AGP Rate %dX not compatible "
 		       "with PLL setting - using %dX\n",
 		       agp->mode.bits.rate,
 		       new_rate);
@@ -1019,7 +1019,7 @@ marvel_agp_configure(alpha_agp_info *agp
 		agp->mode.bits.rate = new_rate;
 	}
 		
-	printk("Enabling AGP on hose %d: %dX%s RQ %d\n", 
+	printk(KERN_INFO "Enabling AGP on hose %d: %dX%s RQ %d\n", 
 	       agp->hose->index, agp->mode.bits.rate, 
 	       agp->mode.bits.sba ? " - SBA" : "", agp->mode.bits.rq);
 
@@ -1053,13 +1053,13 @@ marvel_agp_translate(alpha_agp_info *agp
 
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
 	return (pte >> 1) << PAGE_SHIFT;
@@ -1109,7 +1109,7 @@ marvel_agp_info(void)
 	if (!hose || !hose->sg_pci)
 		return NULL;
 
-	printk("MARVEL - using hose %d as AGP\n", hose->index);
+	printk(KERN_INFO "MARVEL - using hose %d as AGP\n", hose->index);
 
 	/* 
 	 * Get the csrs from the hose.


--===============45303996620164355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45303996620164355==--
