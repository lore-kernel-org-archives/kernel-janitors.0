From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 09:28:43 +0000
Subject: [KJ] [PATCH] printk : drivers/block/cciss.c
Message-Id: <20050401092843.GH5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="eHhjakXzOLJAF9wJ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="2.6.12-rc1-printk_drivers_block_cciss.c.patch"

diff -urpN -X dontdiff a/drivers/block/cciss.c b/drivers/block/cciss.c
--- a/drivers/block/cciss.c	2005-03-18 02:34:36.000000000 +0100
+++ b/drivers/block/cciss.c	2005-04-01 10:53:45.000000000 +0200
@@ -1542,9 +1541,6 @@ static int register_new_disk(ctlr_info_t
 
 	if( return_code == IO_OK)
 	{
-		
-		// printk("LUN Data\n--------------------------\n");
-
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[0])) << 24;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[1])) << 16;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[2])) << 8;	
@@ -1580,7 +1576,7 @@ static int register_new_disk(ctlr_info_t
 		for(j=0; j <= h->highest_lun; j++)
 		{
 #ifdef CCISS_DEBUG
-			printk("Checking %d %x against %x\n", j,h->drv[j].LunID,
+			printk(KERN_DEBUG "Checking %d %x against %x\n", j,h->drv[j].LunID,
 						lunid);
 #endif /* CCISS_DEBUG */
 			if (h->drv[j].LunID == lunid)
@@ -1595,7 +1591,7 @@ static int register_new_disk(ctlr_info_t
 		else
 		{	/* It is the new lun we have been looking for */
 #ifdef CCISS_DEBUG
-			printk("new lun found at %d\n", i);
+			printk(KERN_DEBUG "new lun found at %d\n", i);
 #endif /* CCISS_DEBUG */
 			new_lun_index = i;
 			new_lun_found = 1;
@@ -1611,12 +1607,12 @@ static int register_new_disk(ctlr_info_t
 	for(i=0; i <CISS_MAX_LUN; i++)
 	{
 #ifdef CCISS_DEBUG
-		printk("Checking Index %d\n", i);
+		printk(KERN_DEBUG "Checking Index %d\n", i);
 #endif /* CCISS_DEBUG */
 		if(h->drv[i].LunID == 0)
 		{
 #ifdef CCISS_DEBUG
-			printk("free index found at %d\n", i);
+			printk(KERN_DEBUG "free index found at %d\n", i);
 #endif /* CCISS_DEBUG */
 			free_index_found = 1;
 			free_index = i;
@@ -2069,7 +2065,7 @@ static inline void complete_command( ctl
 	complete_buffers(cmd->rq->bio, status);
 
 #ifdef CCISS_DEBUG
-	printk("Done with %p\n", cmd->rq);
+	printk(KERN_DEBUG "Done with %p\n", cmd->rq);
 #endif /* CCISS_DEBUG */ 
 
 	end_that_request_last(cmd->rq);
@@ -2296,31 +2292,31 @@ static void print_cfg_table( CfgTable_st
 	int i;
 	char temp_name[17];
 
-	printk("Controller Configuration information\n");
-	printk("------------------------------------\n");
+	printk(KERN_DEBUG "Controller Configuration information\n");
+	printk(KERN_DEBUG "------------------------------------\n");
 	for(i=0;i<4;i++)
 		temp_name[i] = readb(&(tb->Signature[i]));
 	temp_name[4]='\0';
-	printk("   Signature = %s\n", temp_name); 
-	printk("   Spec Number = %d\n", readl(&(tb->SpecValence)));
-	printk("   Transport methods supported = 0x%x\n", 
+	printk(KERN_DEBUG "   Signature = %s\n", temp_name); 
+	printk(KERN_DEBUG "   Spec Number = %d\n", readl(&(tb->SpecValence)));
+	printk(KERN_DEBUG "   Transport methods supported = 0x%x\n", 
 				readl(&(tb-> TransportSupport)));
-	printk("   Transport methods active = 0x%x\n", 
+	printk(KERN_DEBUG "   Transport methods active = 0x%x\n", 
 				readl(&(tb->TransportActive)));
-	printk("   Requested transport Method = 0x%x\n", 
+	printk(KERN_DEBUG "   Requested transport Method = 0x%x\n", 
 			readl(&(tb->HostWrite.TransportRequest)));
-	printk("   Coalese Interrupt Delay = 0x%x\n", 
+	printk(KERN_DEBUG "   Coalese Interrupt Delay = 0x%x\n", 
 			readl(&(tb->HostWrite.CoalIntDelay)));
-	printk("   Coalese Interrupt Count = 0x%x\n", 
+	printk(KERN_DEBUG "   Coalese Interrupt Count = 0x%x\n", 
 			readl(&(tb->HostWrite.CoalIntCount)));
-	printk("   Max outstanding commands = 0x%d\n", 
+	printk(KERN_DEBUG "   Max outstanding commands = 0x%d\n", 
 			readl(&(tb->CmdsOutMax)));
-	printk("   Bus Types = 0x%x\n", readl(&(tb-> BusTypes)));
+	printk(KERN_DEBUG "   Bus Types = 0x%x\n", readl(&(tb-> BusTypes)));
 	for(i=0;i<16;i++)
 		temp_name[i] = readb(&(tb->ServerName[i]));
 	temp_name[16] = '\0';
-	printk("   Server Name = %s\n", temp_name);
-	printk("   Heartbeat Counter = 0x%x\n\n\n", 
+	printk(KERN_DEBUG "   Server Name = %s\n", temp_name);
+	printk(KERN_DEBUG "   Heartbeat Counter = 0x%x\n\n\n", 
 			readl(&(tb->HeartBeat)));
 }
 #endif /* CCISS_DEBUG */ 
@@ -2413,7 +2409,7 @@ static int cciss_pci_init(ctlr_info_t *c
 			c->io_mem_length = pci_resource_end(pdev, i) -
 				pci_resource_start(pdev, i) +1;
 #ifdef CCISS_DEBUG
-			printk("IO value found base_addr[%d] %lx %lx\n", i,
+			printk(KERN_DEBUG "IO value found base_addr[%d] %lx %lx\n", i,
 				c->io_mem_addr, c->io_mem_length);
 #endif /* CCISS_DEBUG */
 			/* register the IO range */ 
@@ -2430,9 +2426,9 @@ static int cciss_pci_init(ctlr_info_t *c
 	}
 
 #ifdef CCISS_DEBUG
-	printk("command = %x\n", command);
-	printk("irq = %x\n", pdev->irq);
-	printk("board_id = %x\n", board_id);
+	printk(KERN_DEBUG "command = %x\n", command);
+	printk(KERN_DEBUG "irq = %x\n", pdev->irq);
+	printk(KERN_DEBUG "board_id = %x\n", board_id);
 #endif /* CCISS_DEBUG */ 
 
 	c->intr = pdev->irq;
@@ -2444,7 +2440,7 @@ static int cciss_pci_init(ctlr_info_t *c
 
 	c->paddr = pci_resource_start(pdev, 0); /* addressing mode bits already removed */
 #ifdef CCISS_DEBUG
-	printk("address 0 = %x\n", c->paddr);
+	printk(KERN_DEBUG "address 0 = %x\n", c->paddr);
 #endif /* CCISS_DEBUG */ 
 	c->vaddr = remap_pci_mem(c->paddr, 200);
 
@@ -2466,12 +2462,12 @@ static int cciss_pci_init(ctlr_info_t *c
 	cfg_base_addr = readl(c->vaddr + SA5_CTCFG_OFFSET);
 	cfg_base_addr &= (__u32) 0x0000ffff;
 #ifdef CCISS_DEBUG
-	printk("cfg base address = %x\n", cfg_base_addr);
+	printk(KERN_DEBUG "cfg base address = %x\n", cfg_base_addr);
 #endif /* CCISS_DEBUG */
 	cfg_base_addr_index =
 		find_PCI_BAR_index(pdev, cfg_base_addr);
 #ifdef CCISS_DEBUG
-	printk("cfg base address index = %x\n", cfg_base_addr_index);
+	printk(KERN_DEBUG "cfg base address index = %x\n", cfg_base_addr_index);
 #endif /* CCISS_DEBUG */
 	if (cfg_base_addr_index == -1) {
 		printk(KERN_WARNING "cciss: Cannot find cfg_base_addr_index\n");
@@ -2481,7 +2477,7 @@ static int cciss_pci_init(ctlr_info_t *c
 
 	cfg_offset = readl(c->vaddr + SA5_CTMEM_OFFSET);
 #ifdef CCISS_DEBUG
-	printk("cfg offset = %x\n", cfg_offset);
+	printk(KERN_DEBUG "cfg offset = %x\n", cfg_offset);
 #endif /* CCISS_DEBUG */
 	c->cfgtable =  remap_pci_mem(pci_resource_start(pdev,
 				cfg_base_addr_index) + cfg_offset,
@@ -2510,7 +2506,7 @@ static int cciss_pci_init(ctlr_info_t *c
 	      (readb(&c->cfgtable->Signature[2]) != 'S') ||
 	      (readb(&c->cfgtable->Signature[3]) != 'S') )
 	{
-		printk("Does not appear to be a valid CISS config table\n");
+		printk(KERN_WARNING "Does not appear to be a valid CISS config table\n");
 		return -1;
 	}
 
@@ -2525,7 +2521,7 @@ static int cciss_pci_init(ctlr_info_t *c
 #endif
 
 #ifdef CCISS_DEBUG
-	printk("Trying to put board into Simple mode\n");
+	printk(KERN_DEBUG "Trying to put board into Simple mode\n");
 #endif /* CCISS_DEBUG */ 
 	c->max_commands = readl(&(c->cfgtable->CmdsOutMax));
 	/* Update the field, and then ring the doorbell */ 
@@ -2619,7 +2615,7 @@ static void cciss_getgeometry(int cntl_n
 	if( return_code == IO_OK)
 	{
 #ifdef CCISS_DEBUG
-		printk("LUN Data\n--------------------------\n");
+		printk(KERN_DEBUG "LUN Data\n--------------------------\n");
 #endif /* CCISS_DEBUG */ 
 
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[0])) << 24;
@@ -2748,11 +2744,11 @@ static int __devinit cciss_init_one(stru
 
 	/* configure PCI DMA stuff */
 	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL))
-		printk("cciss: using DAC cycles\n");
+		printk(KERN_INFO "cciss: using DAC cycles\n");
 	else if (!pci_set_dma_mask(pdev, 0xffffffff))
-		printk("cciss: not using DAC cycles\n");
+		printk(KERN_INFO "cciss: not using DAC cycles\n");
 	else {
-		printk("cciss: no suitable DMA available\n");
+		printk(KERN_INFO "cciss: no suitable DMA available\n");
 		goto clean1;
 	}
 
@@ -2889,7 +2885,7 @@ static void __devexit cciss_remove_one (
 
 	if (pci_get_drvdata(pdev) == NULL)
 	{
-		printk( KERN_ERR "cciss: Unable to remove device \n");
+		printk(KERN_ERR "cciss: Unable to remove device \n");
 		return;
 	}
 	tmp_ptr = pci_get_drvdata(pdev);

--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--eHhjakXzOLJAF9wJ--
