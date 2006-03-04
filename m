From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 19:09:49 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/i386
Message-Id: <1141499389.30193.19.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57436805886358422=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============57436805886358422==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/block to kzalloc usage.
Compile tested with allyesconfig, which does not contain
the voyager file.

I noticed that voyager_cat_init() does not check if kmalloc() succeeds,
which might result in a NULL pointer dereference.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/intel_cacheinfo.c.orig	2006-03-04 19:41:58.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/intel_cacheinfo.c	2006-03-04 19:43:18.000000000 +0100
@@ -393,12 +393,10 @@ static int __cpuinit detect_cache_attrib
 	if (num_cache_leaves == 0)
 		return -ENOENT;
 
-	cpuid4_info[cpu] = kmalloc(
-	    sizeof(struct _cpuid4_info) * num_cache_leaves, GFP_KERNEL);
+	cpuid4_info[cpu] = kcalloc(num_cache_leaves,
+	    sizeof(struct _cpuid4_info), GFP_KERNEL);
 	if (unlikely(cpuid4_info[cpu] == NULL))
 		return -ENOMEM;
-	memset(cpuid4_info[cpu], 0,
-	    sizeof(struct _cpuid4_info) * num_cache_leaves);
 
 	oldmask = current->cpus_allowed;
 	retval = set_cpus_allowed(current, cpumask_of_cpu(cpu));
@@ -571,17 +569,14 @@ static int __cpuinit cpuid4_cache_sysfs_
 		return -ENOENT;
 
 	/* Allocate all required memory */
-	cache_kobject[cpu] = kmalloc(sizeof(struct kobject), GFP_KERNEL);
+	cache_kobject[cpu] = kzalloc(sizeof(struct kobject), GFP_KERNEL);
 	if (unlikely(cache_kobject[cpu] == NULL))
 		goto err_out;
-	memset(cache_kobject[cpu], 0, sizeof(struct kobject));
 
-	index_kobject[cpu] = kmalloc(
-	    sizeof(struct _index_kobject ) * num_cache_leaves, GFP_KERNEL);
+	index_kobject[cpu] = kcalloc(num_cache_leaves,
+	    sizeof(struct _index_kobject), GFP_KERNEL);
 	if (unlikely(index_kobject[cpu] == NULL))
 		goto err_out;
-	memset(index_kobject[cpu], 0,
-	    sizeof(struct _index_kobject) * num_cache_leaves);
 
 	return 0;
 
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/mtrr/main.c.orig	2006-03-04 19:43:30.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/mtrr/main.c	2006-03-04 19:43:46.000000000 +0100
@@ -565,10 +565,8 @@ static int mtrr_save(struct sys_device *
 	int i;
 	int size = num_var_ranges * sizeof(struct mtrr_value);
 
-	mtrr_state = kmalloc(size,GFP_ATOMIC);
-	if (mtrr_state)
-		memset(mtrr_state,0,size);
-	else
+	mtrr_state = kzalloc(size,GFP_ATOMIC);
+	if (!mtrr_state)
 		return -ENOMEM;
 
 	for (i = 0; i < num_var_ranges; i++) {
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/mtrr/if.c.orig	2006-03-04 19:43:53.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/mtrr/if.c	2006-03-04 19:44:21.000000000 +0100
@@ -44,10 +44,9 @@ mtrr_file_add(unsigned long base, unsign
 
 	max = num_var_ranges;
 	if (fcount == NULL) {
-		fcount = kmalloc(max * sizeof *fcount, GFP_KERNEL);
+		fcount = kcalloc(max, sizeof(*fcount), GFP_KERNEL);
 		if (!fcount)
 			return -ENOMEM;
-		memset(fcount, 0, max * sizeof *fcount);
 		FILE_FCOUNT(file) = fcount;
 	}
 	if (!page) {
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c.orig	2006-03-04 19:44:37.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2006-03-04 19:44:46.000000000 +0100
@@ -459,10 +459,9 @@ static int __init cpufreq_gx_init(void)
 
 	dprintk("geode suspend modulation available.\n");
 
-	params = kmalloc(sizeof(struct gxfreq_params), GFP_KERNEL);
+	params = kzalloc(sizeof(struct gxfreq_params), GFP_KERNEL);
 	if (params == NULL)
 		return -ENOMEM;
-	memset(params, 0, sizeof(struct gxfreq_params));
 
 	params->cs55x0 = gx_pci;
 	gx_params = params;
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/mca.c.orig	2006-03-04 19:44:56.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/mca.c	2006-03-04 19:45:25.000000000 +0100
@@ -283,10 +283,9 @@ static int __init mca_init(void)
 	bus->f.mca_transform_memory = mca_dummy_transform_memory;
 
 	/* get the motherboard device */
-	mca_dev = kmalloc(sizeof(struct mca_device), GFP_KERNEL);
+	mca_dev = kzalloc(sizeof(struct mca_device), GFP_KERNEL);
 	if(unlikely(!mca_dev))
 		goto out_nomem;
-	memset(mca_dev, 0, sizeof(struct mca_device));
 
 	/*
 	 * We do not expect many MCA interrupts during initialization,
@@ -310,10 +309,9 @@ static int __init mca_init(void)
 	mca_dev->slot = MCA_MOTHERBOARD;
 	mca_register_device(MCA_PRIMARY_BUS, mca_dev);
 
-	mca_dev = kmalloc(sizeof(struct mca_device), GFP_ATOMIC);
+	mca_dev = kzalloc(sizeof(struct mca_device), GFP_ATOMIC);
 	if(unlikely(!mca_dev))
 		goto out_unlock_nomem;
-	memset(mca_dev, 0, sizeof(struct mca_device));
 
 
 	/* Put motherboard into video setup mode, read integrated video
@@ -349,10 +347,9 @@ static int __init mca_init(void)
 	}
 	if(which_scsi) {
 		/* found a scsi card */
-		mca_dev = kmalloc(sizeof(struct mca_device), GFP_ATOMIC);
+		mca_dev = kzalloc(sizeof(struct mca_device), GFP_ATOMIC);
 		if(unlikely(!mca_dev))
 			goto out_unlock_nomem;
-		memset(mca_dev, 0, sizeof(struct mca_device));
 
 		for(j = 0; j < 8; j++)
 			mca_dev->pos[j] = pos[j];
@@ -378,10 +375,9 @@ static int __init mca_init(void)
 		if(!mca_read_and_store_pos(pos))
 			continue;
 
-		mca_dev = kmalloc(sizeof(struct mca_device), GFP_ATOMIC);
+		mca_dev = kzalloc(sizeof(struct mca_device), GFP_ATOMIC);
 		if(unlikely(!mca_dev))
 			goto out_unlock_nomem;
-		memset(mca_dev, 0, sizeof(struct mca_device));
 
 		for(j=0; j<8; j++)
 			mca_dev->pos[j]=pos[j];
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/pci-dma.c.orig	2006-03-04 19:45:32.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/pci-dma.c	2006-03-04 19:46:01.000000000 +0100
@@ -92,14 +92,12 @@ int dma_declare_coherent_memory(struct d
 	if (!mem_base)
 		goto out;
 
-	dev->dma_mem = kmalloc(sizeof(struct dma_coherent_mem), GFP_KERNEL);
+	dev->dma_mem = kzalloc(sizeof(struct dma_coherent_mem), GFP_KERNEL);
 	if (!dev->dma_mem)
 		goto out;
-	memset(dev->dma_mem, 0, sizeof(struct dma_coherent_mem));
-	dev->dma_mem->bitmap = kmalloc(bitmap_size, GFP_KERNEL);
+	dev->dma_mem->bitmap = kzalloc(bitmap_size, GFP_KERNEL);
 	if (!dev->dma_mem->bitmap)
 		goto free1_out;
-	memset(dev->dma_mem->bitmap, 0, bitmap_size);
 
 	dev->dma_mem->virt_base = mem_base;
 	dev->dma_mem->device_base = device_addr;
--- linux-2.6.16-rc5-mm1/arch/i386/kernel/io_apic.c.orig	2006-03-04 19:46:10.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/kernel/io_apic.c	2006-03-04 19:46:42.000000000 +0100
@@ -614,14 +614,12 @@ static int __init balanced_irq_init(void
 		physical_balance = 1;
 
 	for_each_online_cpu(i) {
-		irq_cpu_data[i].irq_delta = kmalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
-		irq_cpu_data[i].last_irq = kmalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
+		irq_cpu_data[i].irq_delta = kzalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
+		irq_cpu_data[i].last_irq = kzalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
 		if (irq_cpu_data[i].irq_delta == NULL || irq_cpu_data[i].last_irq == NULL) {
 			printk(KERN_ERR "balanced_irq_init: out of memory");
 			goto failed;
 		}
-		memset(irq_cpu_data[i].irq_delta,0,sizeof(unsigned long) * NR_IRQS);
-		memset(irq_cpu_data[i].last_irq,0,sizeof(unsigned long) * NR_IRQS);
 	}
 	
 	printk(KERN_INFO "Starting balanced_irq\n");
--- linux-2.6.16-rc5-mm1/arch/i386/mach-voyager/voyager_cat.c.orig	2006-03-04 19:46:58.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/mach-voyager/voyager_cat.c	2006-03-04 19:48:39.000000000 +0100
@@ -644,20 +644,18 @@ voyager_cat_init(void)
 		}
 		CDEBUG(("VOYAGER DEBUG: found module id 0x%x, %s\n", i,
 			cat_module_name(i)));
-		*modpp = kmalloc(sizeof(voyager_module_t), GFP_KERNEL); /*&voyager_module_storage[cat_count++];*/
+		*modpp = kzalloc(sizeof(voyager_module_t), GFP_KERNEL); /*&voyager_module_storage[cat_count++];*/
 		if(*modpp == NULL) {
 			printk("**WARNING** kmalloc failure in cat_init\n");
 			continue;
 		}
-		memset(*modpp, 0, sizeof(voyager_module_t));
 		/* need temporary asic for cat_subread.  It will be
 		 * filled in correctly later */
-		(*modpp)->asic = kmalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count];*/
+		(*modpp)->asic = kzalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count];*/
 		if((*modpp)->asic == NULL) {
 			printk("**WARNING** kmalloc failure in cat_init\n");
 			continue;
 		}
-		memset((*modpp)->asic, 0, sizeof(voyager_asic_t));
 		(*modpp)->asic->asic_id = VOYAGER_CAT_ID;
 		(*modpp)->asic->subaddr = VOYAGER_SUBADDR_HI;
 		(*modpp)->module_addr = i;
@@ -772,7 +770,7 @@ voyager_cat_init(void)
 		for(asic=0; asic < (*modpp)->num_asics; asic++) {
 			int j;
 			voyager_asic_t *asicp = *asicpp 
-				= kmalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count++];*/
+				= kzalloc(sizeof(voyager_asic_t), GFP_KERNEL); /*&voyager_asic_storage[asic_count++];*/
 			voyager_sp_table_t *sp_table;
 			voyager_at_t *asic_table;
 			voyager_jtt_t *jtag_table;
@@ -781,7 +779,6 @@ voyager_cat_init(void)
 				printk("**WARNING** kmalloc failure in cat_init\n");
 				continue;
 			}
-			memset(asicp, 0, sizeof(voyager_asic_t));
 			asicpp = &(asicp->next);
 			asicp->asic_location = asic;
 			sp_table = (voyager_sp_table_t *)(eprom_buf + sp_offset);
@@ -847,8 +844,7 @@ voyager_cat_init(void)
 #endif
 
 		{
-			struct resource *res = kmalloc(sizeof(struct resource),GFP_KERNEL);
-			memset(res, 0, sizeof(struct resource));
+			struct resource *res = kzalloc(sizeof(struct resource),GFP_KERNEL);
 			res->name = kmalloc(128, GFP_KERNEL);
 			sprintf((char *)res->name, "Voyager %s Quad CPI", cat_module_name(i));
 			res->start = qic_addr;
--- linux-2.6.16-rc5-mm1/arch/i386/pci/pcbios.c.orig	2006-03-04 19:49:03.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/i386/pci/pcbios.c	2006-03-04 19:49:11.000000000 +0100
@@ -445,9 +445,8 @@ struct irq_routing_table * __devinit pci
 	if (ret & 0xff00)
 		printk(KERN_ERR "PCI: Error %02x when fetching IRQ routing table.\n", (ret >> 8) & 0xff);
 	else if (opt.size) {
-		rt = kmalloc(sizeof(struct irq_routing_table) + opt.size, GFP_KERNEL);
+		rt = kzalloc(sizeof(struct irq_routing_table) + opt.size, GFP_KERNEL);
 		if (rt) {
-			memset(rt, 0, sizeof(struct irq_routing_table));
 			rt->size = opt.size + sizeof(struct irq_routing_table);
 			rt->exclusive_irqs = map;
 			memcpy(rt->slots, (void *) page, opt.size);



--===============57436805886358422==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57436805886358422==--
