From: Amit Choudhary <amit2030@gmail.com>
Date: Sun, 18 Mar 2007 23:18:21 +0000
Subject: [KJ] [PATCH] [KERNEL] check kmalloc return value + error path leak
Message-Id: <20070318161821.931c0c3c.amit2030@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi All,

I have conlcuded going through the entire kernel and looking for places where kmalloc return value was not checked. In the process, I also found some error path leaks. It was heartening to see that the return value of kmalloc was checked everywhere in the kernel except at some 30 odd places. There might be a couple of places that I might have missed.

But I believe that many error path leaks still exist in the system.

There are 8 files remaining where kmalloc return value is not checked. I did not have compilers for these architectures so I didn't fix them. Also, I believe some of these are non-issues as it looks like they happen very early in the boot cycle, and if no memory is available at that time, then the system is not going to work anyway.

I am listing the files here and also attaching the relevant misbehaving code so that someone working on that platform can fix these.

I had written a perl program to check whether the return value of kmalloc is being checked or not. I am attaching that program too. I do not think it is perfect but am just attaching it, in case someone finds it useful. I had used some manual effort too.

The name of the attached perl file is findkmalloc.pl (http://www.geocities.com/amit2030/findkmalloc.pl.txt). 
The name of the attached offending files code is check_kmalloc.txt. I am also including the code in the body of this mail.

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
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_erp =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ERP_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_erp)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_scsi =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_SCSI_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_scsi)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_abort =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ABORT_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_abort)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_status_read =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					    sizeof(struct zfcp_fsf_req));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_status_read =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					sizeof(struct fsf_status_read_buffer));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.data_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_gid_pn =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_DATA_GID_PN_NR,
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
arch/cris/arch-v32/mm/intmem.c-		if (allocation->status == STATUS_FREE &&
arch/cris/arch-v32/mm/intmem.c-		    allocation->size >= size + alignment) {
arch/cris/arch-v32/mm/intmem.c-			if (allocation->size > size + alignment) {
arch/cris/arch-v32/mm/intmem.c-				struct intmem_allocation* alloc =
arch/cris/arch-v32/mm/intmem.c-					(struct intmem_allocation*)
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
arch/cris/arch-v32/mm/intmem.c-		struct intmem_allocation* alloc =
arch/cris/arch-v32/mm/intmem.c:		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
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
drivers/atm/he.c-	if (he_dev->rbps_base == NULL) {
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


--Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7
Content-Type: application/octet-stream;
 name="findkmalloc.pl"
Content-Disposition: attachment;
 filename="findkmalloc.pl"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9wZXJsCgp1c2UgR2V0b3B0OjpMb25nOwoKCiNHZXRPcHRpb25zKFwlb3B0cywi
ZmlsZT1zIiwgInNlcD1zIik7CiNteSAkaW5maWxlID0gJG9wdHN7ImZpbGUifTsKI215ICRzZXAg
PSAkb3B0c3sic2VwIn0gfHwgIi0tIjsKCm15ICRzZXAgPSAiLS0iOwpteSAkaW5maWxlID0gIm1v
cmVwYXRjaGVzIjsKbXkgJG91dGJ1ZyA9ICRpbmZpbGUuIi5idWciOwpteSAkb3V0bm9idWcgPSAk
aW5maWxlLiIubm9idWciOwpteSAkb3V0MmttYWxsb2MgPSAkaW5maWxlLiIuYnVnLjJrbWFsbG9j
IjsKCnByaW50ICJpbmZpbGUgPSAkaW5maWxlXG4iOwpwcmludCAib3V0YnVnID0gJG91dGJ1Z1xu
IjsKcHJpbnQgIm91dG5vYnVnID0gJG91dG5vYnVnXG4iOwpwcmludCAib3V0MmttYWxsb2MgPSAk
b3V0MmttYWxsb2NcbiI7CgpteSBAYXJyYXk7Cm15ICRpbmRleCA9IDA7Cm15ICRpID0gMDsKbXkg
JG51bV9leHRyYV9zZXAgPSAwOwpteSAkdG90YWxfc2VwID0gMDsKbXkgJGxpbmUgPSAiIjsKbXkg
JGZpbGVuYW1lID0gIiI7CgpteSAkY29tbWFuZCA9ICJmaW5kIC4gLW5hbWUgXCIqXFwuY1wiIHwg
eGFyZ3MgZ3JlcCAtdyBcImttYWxsb2NcXFx8a3phbGxvY1wiIC1BIDUgLUIgNSA+ICRpbmZpbGUi
OwpwcmludCAiY29tbWFuZCA9ICRjb21tYW5kXG4iOwpzeXN0ZW0oIiRjb21tYW5kIik7CgoKb3Bl
biAoSU4sICI8JGluZmlsZSIpIG9yIGRpZTsKb3BlbiAoT1VUQlVHLCAiPiRvdXRidWciKSBvciBk
aWU7Cm9wZW4gKE9VVE5PQlVHLCAiPiRvdXRub2J1ZyIpIG9yIGRpZTsKb3BlbiAoT1VUMktNQUxM
T0MsICI+JG91dDJrbWFsbG9jIikgb3IgZGllOwoKCndoaWxlICgkTElORSA9IDxJTj4pCnsKCWNo
b21wKCRMSU5FKTsKCWlmICgkTElORSA9fiAvXiRzZXAkLykJewoJCSR0b3RhbF9zZXArKzsKCQkj
cHJpbnQgInJlYWQgc2VwYXJhdG9yIG9uY2VcbiI7CgkJaWYgKCRpbmRleCA9PSAwKSB7CgkJCSNw
cmludCAicmVhZCBzZXBhcmF0b3IgdHdpY2VcbiI7CgkJCSRudW1fZXh0cmFfc2VwKys7CgkJCW5l
eHQ7ICNyZWFkIHNlcGFyYXRvciB0d2ljZSBpbiBhIHJvdwoJCX0KCQlhbmFseXplX2FuZF9kdW1w
X2FycmF5KCk7CgkJJGluZGV4ID0gMDsKCQluZXh0OwoJfQoJJExJTkUgPX4gcy9eKFxTK1stOl0p
Ly87CglpZiAoJGZpbGVuYW1lIGVxICIiKSB7CgkJJGZpbGVuYW1lID0gJDE7Cgl9CgoJJGFycmF5
WyRpbmRleF0gPSAkTElORTsKCSRpbmRleCsrOwp9CgppZiAoJGluZGV4ICE9IDApIHsKCWFuYWx5
emVfYW5kX2R1bXBfYXJyYXkoKTsKCSRpbmRleCA9IDA7Cn0KCnByaW50IE9VVEJVRyAiJHNlcFxu
IjsKcHJpbnQgT1VUTk9CVUcgIiRzZXBcbiI7CnByaW50ICJFeHRyYSBzZXBhcmF0b3JzID0gJG51
bV9leHRyYV9zZXBcbiI7CnByaW50ICJUb3RhbCBzZXBhcmF0b3JzID0gJHRvdGFsX3NlcFxuIjsK
CnN1YiBhbmFseXplX2FuZF9kdW1wX2FycmF5CnsKCW15ICR2YXIgPSAiIjsKCW15ICRmb3VuZGtt
YWxsb2MgPSAwOwoKCWZvciAoJGkgPSAwOyAkaSA8ICRpbmRleDsgJGkrKykgewoJCSRsaW5lID0g
JGFycmF5WyRpXTsKCQkjaWYgKCRhcnJheVskaV0gPX4gL2ttYWxsb2N8a3phbGxvYy8pCgkJaWYg
KCRsaW5lID1+IC9rbWFsbG9jfGt6YWxsb2MvKSB7CgkJCSNpZiAoJHJldCA9PSAwKSB7CgkJCQkj
cHJpbnQgImxpbmUgPSAkbGluZVxuIjsKCQkJI30KCQkJI2lmICgoJGFycmF5WyRpXSA9fiAvTlVM
TC9pKSB8fAoJCQkjICAgICgkYXJyYXlbJGldID1+IC8hL2kpKQoJCQlpZiAoKCRsaW5lID1+IC9O
VUxML2kpIHx8CgkJCSAgICAoJGxpbmUgPX4gLyEvaSkpIHsKCQkJCSNwcmludCAiTlVMTCBvciAh
IGZvdW5kLi5kdW1waW5nIHRvIC5ub2J1ZyBmaWxlOiAkYXJyYXlbJGldXG4iOwoJCQkJcHJpbnQg
T1VUTk9CVUcgIiRzZXBcbiI7CgkJCQlmb3IgKCRpID0gMDsgJGkgPCAkaW5kZXg7ICRpKyspIHsK
CQkJCQlwcmludCBPVVROT0JVRyAiJGZpbGVuYW1lICRhcnJheVskaV1cbiI7CgkJCQl9CgkJCQkk
ZmlsZW5hbWUgPSAiIjsKCQkJCSRmb3VuZGttYWxsb2MgPSAwOwoJCQkJcmV0dXJuOwoJCQl9CgkJ
CSMkdmFyID0gJGFycmF5WyRpXTsKCQkJJHZhciA9ICIiOwoJCQkkdmFyID0gJGxpbmU7CgoJCQkj
IFdlIHNob3VsZCBub3Qgd29ycnkgaGVyZSBhcyBib3RoIGttYWxsb2MgYW5kCgkJCSMga3phbGxv
YyB3aWxsIG5vdCBvY2N1ciBpbiBvbmUgbGluZS4KCQkJJHZhciA9fiBzLyhcUyspXHMqPS4qa21h
bGxvYy4qLy87CgkJCSR2YXIgPX4gcy8oXFMrKVxzKj0uKmt6YWxsb2MuKi8vOwoKCQkJJHZhciA9
ICQxOwoJCQkkdmFyID1+IHMvXCovL2c7CgkJCSR2YXIgPX4gcy8uKlwoLy9nOwoJCQkkdmFyID1+
IHMvXCkvL2c7CgkJCSR2YXIgPX4gcy9cXS9cXFxdL2c7CgkJCSR2YXIgPX4gcy9cWy9cXFxbL2c7
CgkJCWlmICgkdmFyIGVxICIiKSB7CgkJCQkjcHJpbnQgInZhciBpcyBlbXB0eS4gZmlsZW5hbWUg
PSAkZmlsZW5hbWVcbiI7CgkJCQkkbGluZSA9ICIiOwoJCQkJJHJldCA9IGdldF9vbmVfbGluZSgk
aSk7CgkJCQlpZiAoJHJldCA9PSAxKSB7CgkJCQkJJGxpbmUgPSAkYXJyYXlbJGldOwoJCQkJfSBl
bHNlIHsKCQkJCQkjJHZhciA9ICRhcnJheVskaV07CgkJCQkJJHZhciA9ICIiOwoJCQkJCSR2YXIg
PSAkbGluZTsKCQkJCQkkdmFyID1+IHMvKFxTKylccyo9LiprbWFsbG9jLiovLzsKCQkJCQkkdmFy
ID1+IHMvKFxTKylccyo9LipremFsbG9jLiovLzsKCgkJCQkJJHZhciA9ICQxOwoJCQkJCSR2YXIg
PX4gcy9cKi8vZzsKCQkJCQkkdmFyID1+IHMvLipcKC8vZzsKCQkJCQkkdmFyID1+IHMvXCkvL2c7
CgkJCQkJJHZhciA9fiBzL1xdL1xcXF0vZzsKCQkJCQkkdmFyID1+IHMvXFsvXFxcWy9nOwoJCQkJ
fQoJCQl9CgoJCQkjcHJpbnQgInZhciA9ICR2YXJcbiI7CgoJCQkjdmFyIHN0aWxsIG5vdCBmb3Vu
ZCwgcHJpbnQgdG8gbm9idWcgZmlsZS4KCQkJaWYgKCR2YXIgZXEgIiIpIHsKCQkJCXByaW50IE9V
VE5PQlVHICIkc2VwXG4iOwoJCQkJZm9yICgkaSA9IDA7ICRpIDwgJGluZGV4OyAkaSsrKSB7CgkJ
CQkJcHJpbnQgT1VUTk9CVUcgIiRmaWxlbmFtZSAkYXJyYXlbJGldXG4iOwoJCQkJfQoJCQkJJGZp
bGVuYW1lID0gIiI7CgkJCQkkZm91bmRrbWFsbG9jID0gMDsKCQkJCXJldHVybjsKCQkJfQoJCQkj
cHJpbnQgImxpbmUgPSAkYXJyYXlbJGldXG4iOwoJCQkjcHJpbnQgImxpbmUgPSAkbGluZVxuIjsK
CQkJI3ByaW50ICJ2YXIgPSAkdmFyXG4iOwoJCQkjcHJpbnQgImdvdCBrbWFsbG9jOiBsaW5lID0g
JGFycmF5WyRpXVxuIjsKCQkJI3ByaW50ICJnb3Qga21hbGxvYzogbGluZSA9ICRsaW5lXG4iOwoJ
CQkjcHJpbnQgImdvdCBrbWFsbG9jOiB2YXJpYWJsZSA9ICR2YXJcbiI7CgkJCWlmICgkZm91bmRr
bWFsbG9jID09IDEpIHsKCQkJCSNwcmludCAidHdvIGttYWxsb2Mncy4uZHVtcGluZyB0byAuYnVn
IGZpbGVcbiI7CgkJCQlwcmludCBPVVQyS01BTExPQyAiJHNlcFxuIjsKCQkJCWZvciAoJGkgPSAw
OyAkaSA8ICRpbmRleDsgJGkrKykgewoJCQkJCXByaW50IE9VVDJLTUFMTE9DICIkZmlsZW5hbWUg
JGFycmF5WyRpXVxuIjsKCQkJCX0KCQkJCSRmaWxlbmFtZSA9ICIiOwoJCQkJJGZvdW5ka21hbGxv
YyA9IDA7CgkJCQlyZXR1cm47CgkJCX0KCQkJJGZvdW5ka21hbGxvYyA9IDE7CgkJCW5leHQ7CgkJ
fQoJCWlmICgkZm91bmRrbWFsbG9jID09IDEpIHsKCQkJI2lmICgkYXJyYXlbJGldID1+IC8kdmFy
LykKCQkJI3ByaW50ICJsaW5lID0gJGxpbmVcbiI7CgkJCSNwcmludCAidmFyID0gJHZhclxuIjsK
CQkJaWYgKCRsaW5lID1+IC8kdmFyLykgewoJCQkJI3ByaW50ICJ2YXJpYWJsZSAkdmFyIGZvdW5k
IGFnYWluLi5kdW1waW5nIHRvIC5ub2J1ZyBmaWxlXG4iOwoJCQkJcHJpbnQgT1VUTk9CVUcgIiRz
ZXBcbiI7CgkJCQlmb3IgKCRpID0gMDsgJGkgPCAkaW5kZXg7ICRpKyspIHsKCQkJCQlwcmludCBP
VVROT0JVRyAiJGZpbGVuYW1lICRhcnJheVskaV1cbiI7CgkJCQl9CgkJCQkkZmlsZW5hbWUgPSAi
IjsKCQkJCSRmb3VuZGttYWxsb2MgPSAwOwoJCQkJcmV0dXJuOwoJCQl9CgkJfQoJfQoJIyB2YXIg
bm90IGZvdW5kLiBkdW1wIHRvIGJ1ZyBmaWxlIGlmIGttYWxsb2N8a3phbGxvYyBmb3VuZC4KCSNw
cmludCAidmFyaWFibGUgJHZhciBOT1QgZm91bmQuLmR1bXBpbmcgdG8gLmJ1ZyBmaWxlXG4iOwoJ
aWYgKCRmb3VuZGttYWxsb2MgPT0gMSkgewoJCXByaW50IE9VVEJVRyAiJHNlcFxuIjsKCQlmb3Ig
KCRpID0gMDsgJGkgPCAkaW5kZXg7ICRpKyspIHsKCQkJcHJpbnQgT1VUQlVHICIkZmlsZW5hbWUg
JGFycmF5WyRpXVxuIjsKCQl9CgkJJGZpbGVuYW1lID0gIiI7Cgl9CgkjIGttYWxsb2Mgbm90IGZv
dW5kLiBkdW1wIHRvIG5vYnVnIGZpbGUuIGNhbiBoYXBwZW4gaWYKCSMgeW91IGdldCBhIGNhcGl0
YWwgS01BTExPQy4gKHNvbWV0aW1lcywgd2l0aGluIGNvbW1lbnRzKS4KCWlmICgkZm91bmRrbWFs
bG9jID09IDApIHsKCQlwcmludCBPVVROT0JVRyAiJHNlcFxuIjsKCQlmb3IgKCRpID0gMDsgJGkg
PCAkaW5kZXg7ICRpKyspIHsKCQkJcHJpbnQgT1VUTk9CVUcgIiRmaWxlbmFtZSAkYXJyYXlbJGld
XG4iOwoJCX0KCQkkZmlsZW5hbWUgPSAiIjsKCX0KCSRmb3VuZGttYWxsb2MgPSAwOwoJcmV0dXJu
Owp9CgpzdWIgZ2V0X29uZV9saW5lCnsKCSRsaW5lID0gIiI7CgkkayA9ICRqID0gJF9bMF07Cglm
b3IgKCRqID0gJGogLSAxOyAkaiA+PSAwOyAkai0tKSB7CgkJaWYgKCRhcnJheVskal0gPX4gLzso
LiopLykgewoJCQkkbGluZSA9ICRsaW5lLiQxOwoJCQlsYXN0OwoJCX0KCQllbHNpZiAoJGFycmF5
WyRqXSA9fiAveyguKikvKSB7CgkJCSRsaW5lID0gJGxpbmUuJDE7CgkJCWxhc3Q7CgkJfQoJCWVs
c2lmICgkYXJyYXlbJGpdID1+IC99KC4qKS8pIHsKCQkJJGxpbmUgPSAkbGluZS4kMTsKCQkJbGFz
dDsKCQl9Cgl9CglpZiAoJGogPCAwKSB7CgkJcmV0dXJuIDE7Cgl9CiAJZm9yICgkaiA9ICRqICsg
MTsgJGogPCAkaW5kZXg7ICRqKyspIHsKCQlpZiAoJGFycmF5WyRqXSA9fiAvKC4qKTsvKSB7CgkJ
CSRsaW5lID0gJGxpbmUuJDE7CgkJCWxhc3Q7CgkJfQoJCWVsc2lmICgkYXJyYXlbJGpdID1+IC8o
LiopfS8pIHsKCQkJJGxpbmUgPSAkbGluZS4kMTsKCQkJbGFzdDsKCQl9CgkJZWxzaWYgKCRhcnJh
eVskal0gPX4gLyguKil7LykgewoJCQkkbGluZSA9ICRsaW5lLiQxOwoJCQlsYXN0OwoJCX0KCQkk
bGluZSA9ICRsaW5lLiRhcnJheVskal07Cgl9CglpZiAoJGogPj0gJGluZGV4KSB7CgkJcmV0dXJu
IDE7Cgl9CglyZXR1cm4gMDsKCSNyZXR1cm4gMTsKfQo=

--Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7
Content-Type: text/plain;
 name="check_kmalloc.txt"
Content-Disposition: attachment;
 filename="check_kmalloc.txt"
Content-Transfer-Encoding: 7bit

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
arch/cris/arch-v32/mm/intmem.c-		if (allocation->status == STATUS_FREE &&
arch/cris/arch-v32/mm/intmem.c-		    allocation->size >= size + alignment) {
arch/cris/arch-v32/mm/intmem.c-			if (allocation->size > size + alignment) {
arch/cris/arch-v32/mm/intmem.c-				struct intmem_allocation* alloc =
arch/cris/arch-v32/mm/intmem.c-					(struct intmem_allocation*)
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
arch/cris/arch-v32/mm/intmem.c-		struct intmem_allocation* alloc =
arch/cris/arch-v32/mm/intmem.c:		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
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
drivers/atm/he.c-	if (he_dev->rbps_base == NULL) {
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
--
drivers/s390/scsi/zfcp_aux.c- */
drivers/s390/scsi/zfcp_aux.c-static int
drivers/s390/scsi/zfcp_aux.c-zfcp_allocate_low_mem_buffers(struct zfcp_adapter *adapter)
drivers/s390/scsi/zfcp_aux.c-{
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_erp =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ERP_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_erp)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_scsi =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_SCSI_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_scsi)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_abort =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_FSF_REQ_ABORT_NR,
drivers/s390/scsi/zfcp_aux.c-				sizeof(struct zfcp_fsf_req_pool_element));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_abort)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.fsf_req_status_read =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					    sizeof(struct zfcp_fsf_req));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.fsf_req_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_status_read =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_STATUS_READ_NR,
drivers/s390/scsi/zfcp_aux.c-					sizeof(struct fsf_status_read_buffer));
drivers/s390/scsi/zfcp_aux.c-	if (!adapter->pool.data_status_read)
drivers/s390/scsi/zfcp_aux.c-		return -ENOMEM;
drivers/s390/scsi/zfcp_aux.c-
drivers/s390/scsi/zfcp_aux.c-	adapter->pool.data_gid_pn =
drivers/s390/scsi/zfcp_aux.c:		mempool_create_kmalloc_pool(ZFCP_POOL_DATA_GID_PN_NR,
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

--Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--Multipart=_Sun__18_Mar_2007_16_18_21_-0700_6cEpBGKtOdFObxV7--
