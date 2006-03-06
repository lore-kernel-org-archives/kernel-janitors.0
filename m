From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 20:13:29 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/sparc
Message-Id: <1141676009.6349.7.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3483772683152333=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============3483772683152333==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts arch/sparc to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/sparc/kernel/sun4d_irq.c.orig	2006-03-06 20:36:52.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc/kernel/sun4d_irq.c	2006-03-06 20:37:27.000000000 +0100
@@ -542,8 +542,7 @@ void __init sun4d_init_sbi_irq(void)
 	nsbi = 0;
 	for_each_sbus(sbus)
 		nsbi++;
-	sbus_actions = (struct sbus_action *)kmalloc (nsbi * 8 * 4 * sizeof(struct sbus_action), GFP_ATOMIC);
-	memset (sbus_actions, 0, (nsbi * 8 * 4 * sizeof(struct sbus_action)));
+	sbus_actions = kzalloc(nsbi * 8 * 4 * sizeof(struct sbus_action), GFP_ATOMIC);
 	for_each_sbus(sbus) {
 #ifdef CONFIG_SMP	
 		extern unsigned char boot_cpu_id;
--- linux-2.6.16-rc5-mm1/arch/sparc/kernel/ioport.c.orig	2006-03-06 20:37:35.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc/kernel/ioport.c	2006-03-06 20:38:12.000000000 +0100
@@ -255,9 +255,8 @@ void *sbus_alloc_consistent(struct sbus_
 	if ((va = __get_free_pages(GFP_KERNEL|__GFP_COMP, order)) == 0)
 		goto err_nopages;
 
-	if ((res = kmalloc(sizeof(struct resource), GFP_KERNEL)) == NULL)
+	if ((res = kzalloc(sizeof(struct resource), GFP_KERNEL)) == NULL)
 		goto err_nomem;
-	memset((char*)res, 0, sizeof(struct resource));
 
 	if (allocate_resource(&_sparc_dvma, res, len_total,
 	    _sparc_dvma.start, _sparc_dvma.end, PAGE_SIZE, NULL, NULL) != 0) {
@@ -437,12 +436,11 @@ void *pci_alloc_consistent(struct pci_de
 		return NULL;
 	}
 
-	if ((res = kmalloc(sizeof(struct resource), GFP_KERNEL)) == NULL) {
+	if ((res = kzalloc(sizeof(struct resource), GFP_KERNEL)) == NULL) {
 		free_pages(va, order);
 		printk("pci_alloc_consistent: no core\n");
 		return NULL;
 	}
-	memset((char*)res, 0, sizeof(struct resource));
 
 	if (allocate_resource(&_sparc_dvma, res, len_total,
 	    _sparc_dvma.start, _sparc_dvma.end, PAGE_SIZE, NULL, NULL) != 0) {
--- linux-2.6.16-rc5-mm1/arch/sparc/mm/io-unit.c.orig	2006-03-06 20:38:26.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc/mm/io-unit.c	2006-03-06 20:38:40.000000000 +0100
@@ -42,9 +42,8 @@ iounit_init(int sbi_node, int io_node, s
 	struct linux_prom_registers iommu_promregs[PROMREG_MAX];
 	struct resource r;
 
-	iounit = kmalloc(sizeof(struct iounit_struct), GFP_ATOMIC);
+	iounit = kzalloc(sizeof(struct iounit_struct), GFP_ATOMIC);
 
-	memset(iounit, 0, sizeof(*iounit));
 	iounit->limit[0] = IOUNIT_BMAP1_START;
 	iounit->limit[1] = IOUNIT_BMAP2_START;
 	iounit->limit[2] = IOUNIT_BMAPM_START;



--===============3483772683152333==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3483772683152333==--
