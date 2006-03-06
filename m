From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 20:13:30 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/sparc64
Message-Id: <1141676010.6349.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49039877411799959=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============49039877411799959==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/sparc64 to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/setup.c.orig	2006-03-06 20:50:25.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/setup.c	2006-03-06 20:50:36.000000000 +0100
@@ -537,9 +537,8 @@ static int __init topology_init(void)
 		ncpus_probed++;
 
 	for_each_cpu(i) {
-		struct cpu *p = kmalloc(sizeof(*p), GFP_KERNEL);
+		struct cpu *p = kzalloc(sizeof(*p), GFP_KERNEL);
 		if (p) {
-			memset(p, 0, sizeof(*p));
 			register_cpu(p, i, NULL);
 			err = 0;
 		}
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/us3_cpufreq.c.orig	2006-03-06 20:50:45.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/us3_cpufreq.c	2006-03-06 20:51:10.000000000 +0100
@@ -218,20 +218,16 @@ static int __init us3_freq_init(void)
 		struct cpufreq_driver *driver;
 
 		ret = -ENOMEM;
-		driver = kmalloc(sizeof(struct cpufreq_driver), GFP_KERNEL);
+		driver = kzalloc(sizeof(struct cpufreq_driver), GFP_KERNEL);
 		if (!driver)
 			goto err_out;
-		memset(driver, 0, sizeof(*driver));
 
-		us3_freq_table = kmalloc(
+		us3_freq_table = kzalloc(
 			(NR_CPUS * sizeof(struct us3_freq_percpu_info)),
 			GFP_KERNEL);
 		if (!us3_freq_table)
 			goto err_out;
 
-		memset(us3_freq_table, 0,
-		       (NR_CPUS * sizeof(struct us3_freq_percpu_info)));
-
 		driver->init = us3_freq_cpu_init;
 		driver->verify = us3_freq_verify;
 		driver->target = us3_freq_target;
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/sys_sparc.c.orig	2006-03-06 20:51:25.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/sys_sparc.c	2006-03-06 20:51:42.000000000 +0100
@@ -554,12 +554,10 @@ asmlinkage long sys_utrap_install(utrap_
 	}
 	if (!current_thread_info()->utraps) {
 		current_thread_info()->utraps =
-			kmalloc((UT_TRAP_INSTRUCTION_31+1)*sizeof(long), GFP_KERNEL);
+			kzalloc((UT_TRAP_INSTRUCTION_31+1)*sizeof(long), GFP_KERNEL);
 		if (!current_thread_info()->utraps)
 			return -ENOMEM;
 		current_thread_info()->utraps[0] = 1;
-		memset(current_thread_info()->utraps+1, 0,
-		       UT_TRAP_INSTRUCTION_31*sizeof(long));
 	} else {
 		if ((utrap_handler_t)current_thread_info()->utraps[type] != new_p &&
 		    current_thread_info()->utraps[0] > 1) {
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/irq.c.orig	2006-03-06 20:51:52.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/irq.c	2006-03-06 20:52:22.000000000 +0100
@@ -314,12 +314,11 @@ unsigned int build_irq(int pil, int inof
 		goto out;
 	}
 
-	bucket->irq_info = kmalloc(sizeof(struct irq_desc), GFP_ATOMIC);
+	bucket->irq_info = kzalloc(sizeof(struct irq_desc), GFP_ATOMIC);
 	if (!bucket->irq_info) {
 		prom_printf("IRQ: Error, kmalloc(irq_desc) failed.\n");
 		prom_halt();
 	}
-	memset(bucket->irq_info, 0, sizeof(struct irq_desc));
 
 	/* Ok, looks good, set it up.  Don't touch the irq_chain or
 	 * the pending flag.
@@ -355,12 +354,11 @@ unsigned int sun4v_build_irq(u32 devhand
 	bucket->pil = pil;
 	bucket->flags = flags;
 
-	bucket->irq_info = kmalloc(sizeof(struct irq_desc), GFP_ATOMIC);
+	bucket->irq_info = kzalloc(sizeof(struct irq_desc), GFP_ATOMIC);
 	if (!bucket->irq_info) {
 		prom_printf("IRQ: Error, kmalloc(irq_desc) failed.\n");
 		prom_halt();
 	}
-	memset(bucket->irq_info, 0, sizeof(struct irq_desc));
 
 	return __irq(bucket);
 }
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_iommu.c.orig	2006-03-06 20:52:31.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_iommu.c	2006-03-06 20:52:52.000000000 +0100
@@ -139,12 +139,11 @@ void pci_iommu_table_init(struct pci_iom
 	/* Allocate and initialize the free area map.  */
 	sz = num_tsb_entries / 8;
 	sz = (sz + 7UL) & ~7UL;
-	iommu->arena.map = kmalloc(sz, GFP_KERNEL);
+	iommu->arena.map = kzalloc(sz, GFP_KERNEL);
 	if (!iommu->arena.map) {
 		prom_printf("PCI_IOMMU: Error, kmalloc(arena.map) failed.\n");
 		prom_halt();
 	}
-	memset(iommu->arena.map, 0, sz);
 	iommu->arena.limit = num_tsb_entries;
 
 	/* Allocate and initialize the dummy page which we
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/us2e_cpufreq.c.orig	2006-03-06 20:53:00.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/us2e_cpufreq.c	2006-03-06 20:53:23.000000000 +0100
@@ -357,20 +357,16 @@ static int __init us2e_freq_init(void)
 		struct cpufreq_driver *driver;
 
 		ret = -ENOMEM;
-		driver = kmalloc(sizeof(struct cpufreq_driver), GFP_KERNEL);
+		driver = kzalloc(sizeof(struct cpufreq_driver), GFP_KERNEL);
 		if (!driver)
 			goto err_out;
-		memset(driver, 0, sizeof(*driver));
 
-		us2e_freq_table = kmalloc(
+		us2e_freq_table = kzalloc(
 			(NR_CPUS * sizeof(struct us2e_freq_percpu_info)),
 			GFP_KERNEL);
 		if (!us2e_freq_table)
 			goto err_out;
 
-		memset(us2e_freq_table, 0,
-		       (NR_CPUS * sizeof(struct us2e_freq_percpu_info)));
-
 		driver->init = us2e_freq_cpu_init;
 		driver->verify = us2e_freq_verify;
 		driver->target = us2e_freq_target;
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/ebus.c.orig	2006-03-06 20:53:31.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/ebus.c	2006-03-06 20:53:47.000000000 +0100
@@ -277,10 +277,9 @@ static inline void *ebus_alloc(size_t si
 {
 	void *mem;
 
-	mem = kmalloc(size, GFP_ATOMIC);
+	mem = kzalloc(size, GFP_ATOMIC);
 	if (!mem)
 		panic("ebus_alloc: out of memory");
-	memset((char *)mem, 0, size);
 	return mem;
 }
 
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_psycho.c.orig	2006-03-06 20:53:57.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_psycho.c	2006-03-06 20:54:31.000000000 +0100
@@ -1164,7 +1164,7 @@ static void pbm_config_busmastering(stru
 static void pbm_scan_bus(struct pci_controller_info *p,
 			 struct pci_pbm_info *pbm)
 {
-	struct pcidev_cookie *cookie = kmalloc(sizeof(*cookie), GFP_KERNEL);
+	struct pcidev_cookie *cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
 
 	if (!cookie) {
 		prom_printf("PSYCHO: Critical allocation failure.\n");
@@ -1172,7 +1172,6 @@ static void pbm_scan_bus(struct pci_cont
 	}
 
 	/* All we care about is the PBM. */
-	memset(cookie, 0, sizeof(*cookie));
 	cookie->pbm = pbm;
 
 	pbm->pci_bus = pci_scan_bus(pbm->pci_first_busno,
@@ -1465,18 +1464,16 @@ void psycho_init(int node, char *model_n
 		}
 	}
 
-	p = kmalloc(sizeof(struct pci_controller_info), GFP_ATOMIC);
+	p = kzalloc(sizeof(struct pci_controller_info), GFP_ATOMIC);
 	if (!p) {
 		prom_printf("PSYCHO: Fatal memory allocation error.\n");
 		prom_halt();
 	}
-	memset(p, 0, sizeof(*p));
-	iommu = kmalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
+	iommu = kzalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
 	if (!iommu) {
 		prom_printf("PSYCHO: Fatal memory allocation error.\n");
 		prom_halt();
 	}
-	memset(iommu, 0, sizeof(*iommu));
 	p->pbm_A.iommu = p->pbm_B.iommu = iommu;
 
 	p->next = pci_controller_root;
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_sabre.c.orig	2006-03-06 20:54:39.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_sabre.c	2006-03-06 20:55:18.000000000 +0100
@@ -1167,7 +1167,7 @@ static void apb_init(struct pci_controll
 
 static struct pcidev_cookie *alloc_bridge_cookie(struct pci_pbm_info *pbm)
 {
-	struct pcidev_cookie *cookie = kmalloc(sizeof(*cookie), GFP_KERNEL);
+	struct pcidev_cookie *cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
 
 	if (!cookie) {
 		prom_printf("SABRE: Critical allocation failure.\n");
@@ -1175,7 +1175,6 @@ static struct pcidev_cookie *alloc_bridg
 	}
 
 	/* All we care about is the PBM. */
-	memset(cookie, 0, sizeof(*cookie));
 	cookie->pbm = pbm;
 
 	return cookie;
@@ -1556,19 +1555,17 @@ void sabre_init(int pnode, char *model_n
 		}
 	}
 
-	p = kmalloc(sizeof(*p), GFP_ATOMIC);
+	p = kzalloc(sizeof(*p), GFP_ATOMIC);
 	if (!p) {
 		prom_printf("SABRE: Error, kmalloc(pci_controller_info) failed.\n");
 		prom_halt();
 	}
-	memset(p, 0, sizeof(*p));
 
-	iommu = kmalloc(sizeof(*iommu), GFP_ATOMIC);
+	iommu = kzalloc(sizeof(*iommu), GFP_ATOMIC);
 	if (!iommu) {
 		prom_printf("SABRE: Error, kmalloc(pci_iommu) failed.\n");
 		prom_halt();
 	}
-	memset(iommu, 0, sizeof(*iommu));
 	p->pbm_A.iommu = p->pbm_B.iommu = iommu;
 
 	upa_portid = prom_getintdefault(pnode, "upa-portid", 0xff);
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_common.c.orig	2006-03-06 20:55:26.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_common.c	2006-03-06 20:56:02.000000000 +0100
@@ -977,33 +977,30 @@ void pci_register_legacy_regions(struct 
 	struct resource *p;
 
 	/* VGA Video RAM. */
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return;
 
-	memset(p, 0, sizeof(*p));
 	p->name = "Video RAM area";
 	p->start = mem_res->start + 0xa0000UL;
 	p->end = p->start + 0x1ffffUL;
 	p->flags = IORESOURCE_BUSY;
 	request_resource(mem_res, p);
 
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return;
 
-	memset(p, 0, sizeof(*p));
 	p->name = "System ROM";
 	p->start = mem_res->start + 0xf0000UL;
 	p->end = p->start + 0xffffUL;
 	p->flags = IORESOURCE_BUSY;
 	request_resource(mem_res, p);
 
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return;
 
-	memset(p, 0, sizeof(*p));
 	p->name = "Video ROM";
 	p->start = mem_res->start + 0xc0000UL;
 	p->end = p->start + 0x7fffUL;
--- linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_schizo.c.orig	2006-03-06 20:56:12.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/sparc64/kernel/pci_schizo.c	2006-03-06 20:56:41.000000000 +0100
@@ -1525,7 +1525,7 @@ static void pbm_config_busmastering(stru
 static void pbm_scan_bus(struct pci_controller_info *p,
 			 struct pci_pbm_info *pbm)
 {
-	struct pcidev_cookie *cookie = kmalloc(sizeof(*cookie), GFP_KERNEL);
+	struct pcidev_cookie *cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
 
 	if (!cookie) {
 		prom_printf("%s: Critical allocation failure.\n", pbm->name);
@@ -1533,7 +1533,6 @@ static void pbm_scan_bus(struct pci_cont
 	}
 
 	/* All we care about is the PBM. */
-	memset(cookie, 0, sizeof(*cookie));
 	cookie->pbm = pbm;
 
 	pbm->pci_bus = pci_scan_bus(pbm->pci_first_busno,
@@ -2120,27 +2119,24 @@ static void __schizo_init(int node, char
 		}
 	}
 
-	p = kmalloc(sizeof(struct pci_controller_info), GFP_ATOMIC);
+	p = kzalloc(sizeof(struct pci_controller_info), GFP_ATOMIC);
 	if (!p) {
 		prom_printf("SCHIZO: Fatal memory allocation error.\n");
 		prom_halt();
 	}
-	memset(p, 0, sizeof(*p));
 
-	iommu = kmalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
+	iommu = kzalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
 	if (!iommu) {
 		prom_printf("SCHIZO: Fatal memory allocation error.\n");
 		prom_halt();
 	}
-	memset(iommu, 0, sizeof(*iommu));
 	p->pbm_A.iommu = iommu;
 
-	iommu = kmalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
+	iommu = kzalloc(sizeof(struct pci_iommu), GFP_ATOMIC);
 	if (!iommu) {
 		prom_printf("SCHIZO: Fatal memory allocation error.\n");
 		prom_halt();
 	}
-	memset(iommu, 0, sizeof(*iommu));
 	p->pbm_B.iommu = iommu;
 
 	p->next = pci_controller_root;



--===============49039877411799959==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49039877411799959==--
