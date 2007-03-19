From: Amit Choudhary <amit2030@gmail.com>
Date: Mon, 19 Mar 2007 04:33:25 +0000
Subject: [KJ] [PATCH] [KERNEL] check kmalloc return value + error path leak
Message-Id: <20070318213325.d2d9bdca.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070318161821.931c0c3c.amit2030@gmail.com>
In-Reply-To: <20070318161821.931c0c3c.amit2030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

I have conlcuded going through the entire kernel and looking for places where kmalloc return value was not checked. In the process, I also found some error path leaks. It was heartening to see that the return value of kmalloc was checked everywhere in the kernel except at some 30 odd places. There might be a couple of places that I might have missed.

But I believe that many error path leaks still exist in the system.

There are 8 files remaining where kmalloc return value is not checked. I did not have compilers for these architectures so I didn't fix them. Also, I believe some of these are non-issues as it looks like they happen very early in the boot cycle, and if no memory is available at that time, then the system is not going to work anyway.

I am listing the files here and the relevant misbehaving code so that someone working on that platform can fix these.

I had written a perl program to check whether the return value of kmalloc is being checked or not. It can be downloaded from here: http://www.geocities.com/amit2030/findkmalloc.pl.txt.

I do not think it is perfect but it works and probably someone else can find it useful too. I had used some manual effort too.

The offending files (no check for kmalloc return values + error path leaks where they check) are:

--------------------------------------
arch/powerpc/kernel/ibmebus.c
arch/ppc/8260_io/fcc_enet.c
arch/cris/arch-v32/mm/intmem.c
drivers/net/sb1250-mac.c
drivers/atm/he.c
drivers/s390/scsi/zfcp_aux.c
arch/powerpc/platforms/iseries/iommu.c
arch/ppc/syslib/ppc85xx_rio.c
--------------------------------------

--
drivers/s390/scsi/zfcp_aux.c- */
drivers/s390/scsi/zfcp_aux.c-static int
drivers/s390/scsi/zfcp_aux.c-zfcp_allocate_low_mem_buffers(struct zfcp_adapter *adapter)
drivers/s390/scsi/zfcp_aux.c-{
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_erp drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ERP_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_erp)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_scsi drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_SCSI_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_scsi)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_abort drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ABORT_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_abort)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_status_read drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					    sizeof(struct zfcp_fsf_req));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_status_read drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					sizeof(struct fsf_status_read_buffer));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.data_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_gid_pn drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_DATA_GID_PN_NR,
drivers/s390/scsi/zfcp_aux.c-					    sizeof(struct zfcp_gid_pn_data));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.data_gid_pn)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	return 0;
--
arch/powerpc/platforms/iseries/iommu.c-void iommu_devnode_init_iSeries(struct device_node *dn)
arch/powerpc/platforms/iseries/iommu.c-{
arch/powerpc/platforms/iseries/iommu.c-	struct iommu_table *tbl;
arch/powerpc/platforms/iseries/iommu.c-	struct pci_dn *pdn = PCI_DN(dn);
arch/powerpc/platforms/iseries/iommu.c-
arch/powerpc/platforms/iseries/iommu.c:	tbl = kmalloc(sizeof(struct iommu_table), GFP_KERNEL);
arch/powerpc/platforms/iseries/iommu.c-
arch/powerpc/platforms/iseries/iommu.c-	iommu_table_getparms_iSeries(pdn->busno, pdn->LogicalSlot, 0, tbl);
arch/powerpc/platforms/iseries/iommu.c-
arch/powerpc/platforms/iseries/iommu.c-	/* Look for existing tce table */
arch/powerpc/platforms/iseries/iommu.c-	pdn->iommu_table = iommu_table_find(tbl);
--
arch/powerpc/platforms/pseries/iommu.c-	 * space.
arch/powerpc/platforms/pseries/iommu.c-	 */
arch/powerpc/platforms/pseries/iommu.c-	pci->phb->dma_window_size = 0x8000000ul;
arch/powerpc/platforms/pseries/iommu.c-	pci->phb->dma_window_base_cur = 0x8000000ul;
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c:	tbl = kmalloc(sizeof(struct iommu_table), GFP_KERNEL);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-	iommu_table_setparms(pci->phb, dn, tbl);
arch/powerpc/platforms/pseries/iommu.c-	pci->iommu_table = iommu_init_table(tbl);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-	/* Divide the rest (1.75GB) among the children */
--
arch/powerpc/platforms/pseries/iommu.c-		 * Do it now because iommu_table_setparms_lpar needs it.
arch/powerpc/platforms/pseries/iommu.c-		 */
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-		ppci->bussubno = bus->number;
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c:		tbl = (struct iommu_table *)kmalloc(sizeof(struct iommu_table),
arch/powerpc/platforms/pseries/iommu.c-						    GFP_KERNEL);
arch/powerpc/platforms/pseries/iommu.c-	
arch/powerpc/platforms/pseries/iommu.c-		iommu_table_setparms_lpar(ppci->phb, pdn, tbl, dma_window);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-		ppci->iommu_table = iommu_init_table(tbl);
--
arch/powerpc/platforms/pseries/iommu.c-	 * an iommu table ourselves. The bus setup code should have setup
arch/powerpc/platforms/pseries/iommu.c-	 * the window sizes already.
arch/powerpc/platforms/pseries/iommu.c-	 */
arch/powerpc/platforms/pseries/iommu.c-	if (!dev->bus->self) {
arch/powerpc/platforms/pseries/iommu.c-		DBG(" --> first child, no bridge. Allocating iommu table.\n");
arch/powerpc/platforms/pseries/iommu.c:		tbl = kmalloc(sizeof(struct iommu_table), GFP_KERNEL);
arch/powerpc/platforms/pseries/iommu.c-		iommu_table_setparms(PCI_DN(dn)->phb, dn, tbl);
arch/powerpc/platforms/pseries/iommu.c-		PCI_DN(mydn)->iommu_table = iommu_init_table(tbl);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-		return;
arch/powerpc/platforms/pseries/iommu.c-	}
--
arch/powerpc/platforms/pseries/iommu.c-	pci = PCI_DN(pdn);
arch/powerpc/platforms/pseries/iommu.c-	if (!pci->iommu_table) {
arch/powerpc/platforms/pseries/iommu.c-		/* iommu_table_setparms_lpar needs bussubno. */
arch/powerpc/platforms/pseries/iommu.c-		pci->bussubno = pci->phb->bus->number;
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c:		tbl = (struct iommu_table *)kmalloc(sizeof(struct iommu_table),
arch/powerpc/platforms/pseries/iommu.c-						    GFP_KERNEL);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-		iommu_table_setparms_lpar(pci->phb, pdn, tbl, dma_window);
arch/powerpc/platforms/pseries/iommu.c-
arch/powerpc/platforms/pseries/iommu.c-		pci->iommu_table = iommu_init_table(tbl);
--
arch/ppc/syslib/ppc85xx_rio.c-void mpc85xx_rio_setup(int law_start, int law_size)
arch/ppc/syslib/ppc85xx_rio.c-{
arch/ppc/syslib/ppc85xx_rio.c-	struct rio_ops *ops;
arch/ppc/syslib/ppc85xx_rio.c-	struct rio_mport *port;
arch/ppc/syslib/ppc85xx_rio.c-
arch/ppc/syslib/ppc85xx_rio.c:	ops = kmalloc(sizeof(struct rio_ops), GFP_KERNEL);
arch/ppc/syslib/ppc85xx_rio.c-	ops->lcread = mpc85xx_local_config_read;
arch/ppc/syslib/ppc85xx_rio.c-	ops->lcwrite = mpc85xx_local_config_write;
arch/ppc/syslib/ppc85xx_rio.c-	ops->cread = mpc85xx_rio_config_read;
arch/ppc/syslib/ppc85xx_rio.c-	ops->cwrite = mpc85xx_rio_config_write;
arch/ppc/syslib/ppc85xx_rio.c-	ops->dsend = mpc85xx_rio_doorbell_send;
arch/ppc/syslib/ppc85xx_rio.c-
arch/ppc/syslib/ppc85xx_rio.c:	port = kmalloc(sizeof(struct rio_mport), GFP_KERNEL);
arch/ppc/syslib/ppc85xx_rio.c-	port->id = 0;
arch/ppc/syslib/ppc85xx_rio.c-	port->index = 0;
arch/ppc/syslib/ppc85xx_rio.c-	INIT_LIST_HEAD(&port->dbells);
arch/ppc/syslib/ppc85xx_rio.c-	port->iores.start = law_start;
arch/ppc/syslib/ppc85xx_rio.c-	port->iores.end = law_start + law_size;
--
arch/powerpc/kernel/ibmebus.c-				    dma_addr_t *dma_handle,
arch/powerpc/kernel/ibmebus.c-				    gfp_t flag)
arch/powerpc/kernel/ibmebus.c-{
arch/powerpc/kernel/ibmebus.c-	void *mem;
arch/powerpc/kernel/ibmebus.c-	
arch/powerpc/kernel/ibmebus.c:	mem = kmalloc(size, flag);
arch/powerpc/kernel/ibmebus.c-	*dma_handle = (dma_addr_t)mem;
arch/powerpc/kernel/ibmebus.c-
arch/powerpc/kernel/ibmebus.c-	return mem;
arch/powerpc/kernel/ibmebus.c-}
arch/powerpc/kernel/ibmebus.c-
--
arch/ppc/8260_io/fcc_enet.c-	memset((char *)ep, 0, sizeof(fcc_enet_t));
arch/ppc/8260_io/fcc_enet.c-
arch/ppc/8260_io/fcc_enet.c-	/* Allocate space for the buffer descriptors from regular memory.
arch/ppc/8260_io/fcc_enet.c-	 * Initialize base addresses for the buffer descriptors.
arch/ppc/8260_io/fcc_enet.c-	 */
arch/ppc/8260_io/fcc_enet.c:	cep->rx_bd_base = (cbd_t *)kmalloc(sizeof(cbd_t) * RX_RING_SIZE,
arch/ppc/8260_io/fcc_enet.c-			GFP_KERNEL | GFP_DMA);
arch/ppc/8260_io/fcc_enet.c-	ep->fen_genfcc.fcc_rbase = __pa(cep->rx_bd_base);
arch/ppc/8260_io/fcc_enet.c:	cep->tx_bd_base = (cbd_t *)kmalloc(sizeof(cbd_t) * TX_RING_SIZE,
arch/ppc/8260_io/fcc_enet.c-			GFP_KERNEL | GFP_DMA);
arch/ppc/8260_io/fcc_enet.c-	ep->fen_genfcc.fcc_tbase = __pa(cep->tx_bd_base);
arch/ppc/8260_io/fcc_enet.c-
arch/ppc/8260_io/fcc_enet.c-	cep->dirty_tx = cep->cur_tx = cep->tx_bd_base;
arch/ppc/8260_io/fcc_enet.c-	cep->cur_rx = cep->rx_bd_base;
--
arch/cris/arch-v32/mm/intmem.c-		if (allocation->status = STATUS_FREE &&
arch/cris/arch-v32/mm/intmem.c-		    allocation->size >= size + alignment) {
arch/cris/arch-v32/mm/intmem.c-			if (allocation->size > size + alignment) {
arch/cris/arch-v32/mm/intmem.c-				struct intmem_allocation* alloc arch/cris/arch-v32/mm/intmem.c-					(struct intmem_allocation*)
arch/cris/arch-v32/mm/intmem.c:					kmalloc(sizeof *alloc, GFP_ATOMIC);
arch/cris/arch-v32/mm/intmem.c-				alloc->status = STATUS_FREE;
arch/cris/arch-v32/mm/intmem.c-				alloc->size = allocation->size - size - alignment;
arch/cris/arch-v32/mm/intmem.c-				alloc->offset = allocation->offset + size;
arch/cris/arch-v32/mm/intmem.c-				list_add(&alloc->entry, &allocation->entry);
arch/cris/arch-v32/mm/intmem.c-
arch/cris/arch-v32/mm/intmem.c-				if (alignment) {
arch/cris/arch-v32/mm/intmem.c-					struct intmem_allocation* tmp;
arch/cris/arch-v32/mm/intmem.c-					tmp = (struct intmem_allocation*)
arch/cris/arch-v32/mm/intmem.c:						kmalloc(sizeof *tmp, GFP_ATOMIC);
arch/cris/arch-v32/mm/intmem.c-					tmp->offset = allocation->offset;
arch/cris/arch-v32/mm/intmem.c-					tmp->size = alignment;
arch/cris/arch-v32/mm/intmem.c-					tmp->status = STATUS_FREE;
arch/cris/arch-v32/mm/intmem.c-					allocation->offset += alignment;
arch/cris/arch-v32/mm/intmem.c-					list_add_tail(&tmp->entry, &allocation->entry);
--
arch/cris/arch-v32/mm/intmem.c-static void crisv32_intmem_init(void)
arch/cris/arch-v32/mm/intmem.c-{
arch/cris/arch-v32/mm/intmem.c-	static int initiated = 0;
arch/cris/arch-v32/mm/intmem.c-	if (!initiated) {
arch/cris/arch-v32/mm/intmem.c-		struct intmem_allocation* alloc arch/cris/arch-v32/mm/intmem.c:		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
arch/cris/arch-v32/mm/intmem.c-		INIT_LIST_HEAD(&intmem_allocations);
arch/cris/arch-v32/mm/intmem.c-		intmem_virtual = ioremap(MEM_INTMEM_START, MEM_INTMEM_SIZE);
arch/cris/arch-v32/mm/intmem.c-		initiated = 1;
arch/cris/arch-v32/mm/intmem.c-		alloc->size = MEM_INTMEM_SIZE;
arch/cris/arch-v32/mm/intmem.c-		alloc->offset = 0;
--
drivers/net/sb1250-mac.c-	/*
drivers/net/sb1250-mac.c-	 * And context table
drivers/net/sb1250-mac.c-	 */
drivers/net/sb1250-mac.c-
drivers/net/sb1250-mac.c-	d->sbdma_ctxtable = (struct sk_buff **)
drivers/net/sb1250-mac.c:		kmalloc(d->sbdma_maxdescr*sizeof(struct sk_buff *), GFP_KERNEL);
drivers/net/sb1250-mac.c-
drivers/net/sb1250-mac.c-	memset(d->sbdma_ctxtable,0,d->sbdma_maxdescr*sizeof(struct sk_buff *));
drivers/net/sb1250-mac.c-
drivers/net/sb1250-mac.c-#ifdef CONFIG_SBMAC_COALESCE
drivers/net/sb1250-mac.c-	/*
--
drivers/net/sb1250-mac.c- 	 */
drivers/net/sb1250-mac.c- 
drivers/net/sb1250-mac.c- 	d->sbdma_maxdescr = maxdescr;
drivers/net/sb1250-mac.c- 
drivers/net/sb1250-mac.c- 	d->sbdma_dscrtable = (sbdmadscr_t *)
drivers/net/sb1250-mac.c- 		kmalloc((d->sbdma_maxdescr+1)*sizeof(sbdmadscr_t), GFP_KERNEL);
drivers/net/sb1250-mac.c- 
drivers/net/sb1250-mac.c- 	/*
drivers/net/sb1250-mac.c- 	 * The descriptor table must be aligned to at least 16 bytes or the
drivers/net/sb1250-mac.c- 	 * MAC will corrupt it.
drivers/net/sb1250-mac.c- 	 */
--
drivers/atm/he.c-	if (he_dev->rbps_base = NULL) {
drivers/atm/he.c-		hprintk("failed to alloc rbps\n");
drivers/atm/he.c-		return -ENOMEM;
drivers/atm/he.c-	}
drivers/atm/he.c-	memset(he_dev->rbps_base, 0, CONFIG_RBPS_SIZE * sizeof(struct he_rbp));
drivers/atm/he.c:	he_dev->rbps_virt = kmalloc(CONFIG_RBPS_SIZE * sizeof(struct he_virt), GFP_KERNEL);
drivers/atm/he.c-
drivers/atm/he.c-	for (i = 0; i < CONFIG_RBPS_SIZE; ++i) {
drivers/atm/he.c-		dma_addr_t dma_handle;
drivers/atm/he.c-		void *cpuaddr;
drivers/atm/he.c-

Regards,
Amit


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
