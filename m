From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:37 +0000
Subject: [KJ] [patch 2.6.13-rc1 03/23] Audit return code of create_proc_*
Message-Id: <20050707154524.160751000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0094771942229541217=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0094771942229541217==
Content-Disposition: inline;
	filename=proc_create_drivers_net_tokenring_olympic.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/net/tokenring/olympic.c 2.6.13-rc1/drivers/net/tokenring/olympic.c
--- 2.6.13-rc1.orig/drivers/net/tokenring/olympic.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/net/tokenring/olympic.c	2005-07-05 11:39:00.923086424 +0200
@@ -265,13 +265,16 @@ static int __devinit olympic_probe(struc
 
 	pci_set_drvdata(pdev,dev) ; 
 	register_netdev(dev) ; 
-	printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
+	printk(KERN_INFO "Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
 	if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */ 
+		struct proc_dir_entry* ent;
 		char proc_name[20] ; 
 		strcpy(proc_name,"net/olympic_") ; 
 		strcat(proc_name,dev->name) ; 
-		create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
-		printk("Olympic: Network Monitor information: /proc/%s\n",proc_name); 
+		ent = create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ;
+		if (!ent)
+			printk(KERN_WARNING "Olympic: Unable to create /proc entry.\n");
+		printk(KERN_INFO "Olympic: Network Monitor information: /proc/%s\n",proc_name); 
 	}
 	return  0 ;
 
@@ -300,8 +303,10 @@ static int __devinit olympic_init(struct
     	olympic_priv=(struct olympic_private *)dev->priv;
 	olympic_mmio=olympic_priv->olympic_mmio;
 
-	printk("%s \n", version);
-	printk("%s. I/O at %hx, MMIO at %p, LAP at %p, using irq %d\n", olympic_priv->olympic_card_name, (unsigned int) dev->base_addr,olympic_priv->olympic_mmio, olympic_priv->olympic_lap, dev->irq);
+	printk(KERN_INFO "%s \n", version);
+	printk(KERN_INFO "%s. I/O at %hx, MMIO at %p, LAP at %p, using irq %d\n",
+		olympic_priv->olympic_card_name, (unsigned int) dev->base_addr,
+		olympic_priv->olympic_mmio, olympic_priv->olympic_lap, dev->irq);
 
 	writel(readl(olympic_mmio+BCTL) | BCTL_SOFTRESET,olympic_mmio+BCTL);
 	t=jiffies;
@@ -320,9 +325,9 @@ static int __devinit olympic_init(struct
 	}
 	
 #if OLYMPIC_DEBUG
-	printk("BCTL: %x\n",readl(olympic_mmio+BCTL));
-	printk("GPR: %x\n",readw(olympic_mmio+GPR));
-	printk("SISRMASK: %x\n",readl(olympic_mmio+SISR_MASK));
+	printk(KERN_DEBUG "BCTL: %x\n",readl(olympic_mmio+BCTL));
+	printk(KERN_DEBUG "GPR: %x\n",readw(olympic_mmio+GPR));
+	printk(KERN_DEBUG "SISRMASK: %x\n",readl(olympic_mmio+SISR_MASK));
 #endif
 	/* Aaaahhh, You have got to be real careful setting GPR, the card
 	   holds the previous values from flash memory, including autosense 
@@ -347,7 +352,7 @@ static int __devinit olympic_init(struct
 	writew(readw(olympic_mmio+GPR)|GPR_NEPTUNE_BF,olympic_mmio+GPR);
 
 #if OLYMPIC_DEBUG
-	printk("GPR = %x\n",readw(olympic_mmio + GPR) ) ; 
+	printk(KERN_DEBUG "GPR = %x\n",readw(olympic_mmio + GPR) ) ; 
 #endif
 	/* Solo has been paused to meet the Cardbus power
 	 * specs if the adapter is cardbus. Check to 
@@ -382,7 +387,7 @@ static int __devinit olympic_init(struct
 	writel(readw(olympic_mmio+LAPWWO),olympic_mmio+LAPA);
 
 #if OLYMPIC_DEBUG
-	printk("LAPWWO: %x, LAPA: %x\n",readl(olympic_mmio+LAPWWO), readl(olympic_mmio+LAPA));
+	printk(KERN_DEBUG "LAPWWO: %x, LAPA: %x\n",readl(olympic_mmio+LAPWWO), readl(olympic_mmio+LAPA));
 #endif
 
 	init_srb=olympic_priv->olympic_lap + ((readw(olympic_mmio+LAPWWO)) & (~0xf800));
@@ -390,7 +395,7 @@ static int __devinit olympic_init(struct
 #if OLYMPIC_DEBUG		
 {
 	int i;
-	printk("init_srb(%p): ",init_srb);
+	printk(KERN_INFO "init_srb(%p): ",init_srb);
 	for(i=0;i<20;i++)
 		printk("%x ",readb(init_srb+i));
 	printk("\n");
@@ -412,14 +417,14 @@ static int __devinit olympic_init(struct
 	uaa_addr=swab16(readw(init_srb+8));
 
 #if OLYMPIC_DEBUG
-	printk("UAA resides at %x\n",uaa_addr);
+	printk(KERN_DEBUG "UAA resides at %x\n",uaa_addr);
 #endif
 
 	writel(uaa_addr,olympic_mmio+LAPA);
 	adapter_addr=olympic_priv->olympic_lap + (uaa_addr & (~0xf800));
 
 #if OLYMPIC_DEBUG
-	printk("adapter address: %02x:%02x:%02x:%02x:%02x:%02x\n",
+	printk(KERN_DEBUG "adapter address: %02x:%02x:%02x:%02x:%02x:%02x\n",
 			readb(adapter_addr), readb(adapter_addr+1),readb(adapter_addr+2),
 			readb(adapter_addr+3),readb(adapter_addr+4),readb(adapter_addr+5));
 #endif
@@ -450,8 +455,8 @@ static int olympic_open(struct net_devic
 	}
 
 #if OLYMPIC_DEBUG
-	printk("BMCTL: %x\n",readl(olympic_mmio+BMCTL_SUM));
-	printk("pending ints: %x\n",readl(olympic_mmio+SISR_RR));
+	printk(KERN_DEBUG "BMCTL: %x\n",readl(olympic_mmio+BMCTL_SUM));
+	printk(KERN_DEBUG "pending ints: %x\n",readl(olympic_mmio+SISR_RR));
 #endif
 
 	writel(SISR_MI,olympic_mmio+SISR_MASK_SUM);
@@ -466,9 +471,9 @@ static int olympic_open(struct net_devic
 	init_srb=olympic_priv->olympic_lap + ((readw(olympic_mmio+LAPWWO)) & (~0xf800));
 	
 #if OLYMPIC_DEBUG
-	printk("LAPWWO: %x, LAPA: %x\n",readw(olympic_mmio+LAPWWO), readl(olympic_mmio+LAPA));
-	printk("SISR Mask = %04x\n", readl(olympic_mmio+SISR_MASK));
-	printk("Before the open command \n");
+	printk(KERN_DEBUG "LAPWWO: %x, LAPA: %x\n",readw(olympic_mmio+LAPWWO), readl(olympic_mmio+LAPA));
+	printk(KERN_DEBUG "SISR Mask = %04x\n", readl(olympic_mmio+SISR_MASK));
+	printk(KERN_DEBUG "Before the open command \n");
 #endif	
 	do {
 		memset_io(init_srb,0,SRB_COMMAND_SIZE);
@@ -530,7 +535,7 @@ static int olympic_open(struct net_devic
 		set_current_state(TASK_RUNNING) ; 
 		olympic_priv->srb_queued = 0 ; 
 #if OLYMPIC_DEBUG
-		printk("init_srb(%p): ",init_srb);
+		printk(KERN_DEBUG "init_srb(%p): ",init_srb);
 		for(i=0;i<20;i++)
 			printk("%02x ",readb(init_srb+i));
 		printk("\n");
@@ -650,23 +655,35 @@ static int olympic_open(struct net_devic
 	writew(i, olympic_mmio+RXSTATQCNT);
 
 #if OLYMPIC_DEBUG 
-	printk("# of rx buffers: %d, RXENQ: %x\n",i, readw(olympic_mmio+RXENQ));
-	printk("RXCSA: %x, rx_status_ring[0]: %p\n",readl(olympic_mmio+RXCSA),&olympic_priv->olympic_rx_status_ring[0]);
-	printk(" stat_ring[1]: %p, stat_ring[2]: %p, stat_ring[3]: %p\n", &(olympic_priv->olympic_rx_status_ring[1]), &(olympic_priv->olympic_rx_status_ring[2]), &(olympic_priv->olympic_rx_status_ring[3]) );
-	printk(" stat_ring[4]: %p, stat_ring[5]: %p, stat_ring[6]: %p\n", &(olympic_priv->olympic_rx_status_ring[4]), &(olympic_priv->olympic_rx_status_ring[5]), &(olympic_priv->olympic_rx_status_ring[6]) );
-	printk(" stat_ring[7]: %p\n", &(olympic_priv->olympic_rx_status_ring[7])  );
-
-	printk("RXCDA: %x, rx_ring[0]: %p\n",readl(olympic_mmio+RXCDA),&olympic_priv->olympic_rx_ring[0]);
-	printk("Rx_ring_dma_addr = %08x, rx_status_dma_addr = %08x\n",
-		olympic_priv->rx_ring_dma_addr,olympic_priv->rx_status_ring_dma_addr) ; 
+	printk(KERN_DEBUG "# of rx buffers: %d, RXENQ: %x\n",i,
+				readw(olympic_mmio+RXENQ));
+	printk(KERN_DEBUG "RXCSA: %x, rx_status_ring[0]: %p\n",
+		readl(olympic_mmio+RXCSA),
+		&olympic_priv->olympic_rx_status_ring[0]);
+	printk(KERN_DEBUG " stat_ring[1]: %p, stat_ring[2]: %p, stat_ring[3]: %p\n", 
+		&(olympic_priv->olympic_rx_status_ring[1]), 
+		&(olympic_priv->olympic_rx_status_ring[2]), 
+		&(olympic_priv->olympic_rx_status_ring[3]) );
+	printk(KERN_DEBUG " stat_ring[4]: %p, stat_ring[5]: %p, stat_ring[6]: %p\n", 
+		&(olympic_priv->olympic_rx_status_ring[4]), 
+		&(olympic_priv->olympic_rx_status_ring[5]), 
+		&(olympic_priv->olympic_rx_status_ring[6]) );
+	printk(KERN_DEBUG " stat_ring[7]: %p\n", 
+		&(olympic_priv->olympic_rx_status_ring[7]) );
+
+	printk(KERN_DEBUG "RXCDA: %x, rx_ring[0]: %p\n",
+		readl(olympic_mmio+RXCDA),&olympic_priv->olympic_rx_ring[0]);
+	printk(KERN_DEBUG "Rx_ring_dma_addr = %08x, rx_status_dma_addr = %08x\n",
+		olympic_priv->rx_ring_dma_addr,
+		olympic_priv->rx_status_ring_dma_addr); 
 #endif
 
 	writew((((readw(olympic_mmio+RXENQ)) & 0x8000) ^ 0x8000) | i,olympic_mmio+RXENQ);
 
 #if OLYMPIC_DEBUG 
-	printk("# of rx buffers: %d, RXENQ: %x\n",i, readw(olympic_mmio+RXENQ));
-	printk("RXCSA: %x, rx_ring[0]: %p\n",readl(olympic_mmio+RXCSA),&olympic_priv->olympic_rx_status_ring[0]);
-	printk("RXCDA: %x, rx_ring[0]: %p\n",readl(olympic_mmio+RXCDA),&olympic_priv->olympic_rx_ring[0]);
+	printk(KERN_DEBUG "# of rx buffers: %d, RXENQ: %x\n",i, readw(olympic_mmio+RXENQ));
+	printk(KERN_DEBUG "RXCSA: %x, rx_ring[0]: %p\n",readl(olympic_mmio+RXCSA),&olympic_priv->olympic_rx_status_ring[0]);
+	printk(KERN_DEBUG "RXCDA: %x, rx_ring[0]: %p\n",readl(olympic_mmio+RXCDA),&olympic_priv->olympic_rx_ring[0]);
 #endif 
 
 	writel(SISR_RX_STATUS | SISR_RX_NOBUF,olympic_mmio+SISR_MASK_SUM);
@@ -699,8 +716,8 @@ static int olympic_open(struct net_devic
 	writel(SISR_TX1_EOF | SISR_ADAPTER_CHECK | SISR_ARB_CMD | SISR_TRB_REPLY | SISR_ASB_FREE | SISR_ERR,olympic_mmio+SISR_MASK_SUM);
 
 #if OLYMPIC_DEBUG 
-	printk("BMCTL: %x\n",readl(olympic_mmio+BMCTL_SUM));
-	printk("SISR MASK: %x\n",readl(olympic_mmio+SISR_MASK));
+	printk(KERN_DEBUG "BMCTL: %x\n",readl(olympic_mmio+BMCTL_SUM));
+	printk(KERN_DEBUG "SISR MASK: %x\n",readl(olympic_mmio+SISR_MASK));
 #endif
 
 	if (olympic_priv->olympic_network_monitor) { 
@@ -709,19 +726,19 @@ static int olympic_open(struct net_devic
 		oat = (olympic_priv->olympic_lap + olympic_priv->olympic_addr_table_addr) ; 
 		opt = (olympic_priv->olympic_lap + olympic_priv->olympic_parms_addr) ; 
 
-		printk("%s: Node Address: %02x:%02x:%02x:%02x:%02x:%02x\n",dev->name, 
+		printk(KERN_INFO "%s: Node Address: %02x:%02x:%02x:%02x:%02x:%02x\n",dev->name, 
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)), 
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)+1),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)+2),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)+3),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)+4),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,node_addr)+5));
-		printk("%s: Functional Address: %02x:%02x:%02x:%02x\n",dev->name, 
+		printk(KERN_INFO "%s: Functional Address: %02x:%02x:%02x:%02x\n",dev->name, 
 			readb(oat+offsetof(struct olympic_adapter_addr_table,func_addr)), 
 			readb(oat+offsetof(struct olympic_adapter_addr_table,func_addr)+1),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,func_addr)+2),
 			readb(oat+offsetof(struct olympic_adapter_addr_table,func_addr)+3));
-		printk("%s: NAUN Address: %02x:%02x:%02x:%02x:%02x:%02x\n",dev->name, 
+		printk(KERN_INFO "%s: NAUN Address: %02x:%02x:%02x:%02x:%02x:%02x\n",dev->name, 
 			readb(opt+offsetof(struct olympic_parameters_table, up_node_addr)),
 			readb(opt+offsetof(struct olympic_parameters_table, up_node_addr)+1),
 			readb(opt+offsetof(struct olympic_parameters_table, up_node_addr)+2),
@@ -771,7 +788,9 @@ static void olympic_rx(struct net_device
 		olympic_priv->rx_status_last_received++ ;
 		olympic_priv->rx_status_last_received &= (OLYMPIC_RX_RING_SIZE -1);
 #if OLYMPIC_DEBUG
-		printk("rx status: %x rx len: %x \n", le32_to_cpu(rx_status->status_buffercnt), le32_to_cpu(rx_status->fragmentcnt_framelen));
+		printk(KERN_DEBUG "rx status: %x rx len: %x \n", 
+			le32_to_cpu(rx_status->status_buffercnt), 
+			le32_to_cpu(rx_status->fragmentcnt_framelen));
 #endif
 		length = le32_to_cpu(rx_status->fragmentcnt_framelen) & 0xffff;
 		buffer_cnt = le32_to_cpu(rx_status->status_buffercnt) & 0xffff; 
@@ -779,7 +798,8 @@ static void olympic_rx(struct net_device
 		frag_len = le32_to_cpu(rx_status->fragmentcnt_framelen) >> 16; 
 
 #if OLYMPIC_DEBUG 
-		printk("length: %x, frag_len: %x, buffer_cnt: %x\n", length, frag_len, buffer_cnt);
+		printk(KERN_DEBUG "length: %x, frag_len: %x, buffer_cnt: %x\n",
+			length, frag_len, buffer_cnt);
 #endif
                 l_status_buffercnt = le32_to_cpu(rx_status->status_buffercnt);
 		if(l_status_buffercnt & 0xC0000000) {
@@ -1131,7 +1151,7 @@ static int olympic_close(struct net_devi
 #if OLYMPIC_DEBUG
 	{
 	int i ; 
-	printk("srb(%p): ",srb);
+	printk(KERN_DEBUG "srb(%p): ",srb);
 	for(i=0;i<4;i++)
 		printk("%x ",readb(srb+i));
 	printk("\n");
@@ -1419,10 +1439,13 @@ static void olympic_arb_cmd(struct net_d
 		frame_data = buf_ptr+offsetof(struct mac_receive_buffer,frame_data) ; 
 
 		for (i=0 ;  i < 14 ; i++) { 
-			printk("Loc %d = %02x\n",i,readb(frame_data + i)); 
+			printk(KERN_DEBUG "Loc %d = %02x\n",i,readb(frame_data + i)); 
 		}
 
-		printk("next %04x, fs %02x, len %04x \n",readw(buf_ptr+offsetof(struct mac_receive_buffer,next)), readb(buf_ptr+offsetof(struct mac_receive_buffer,frame_status)), readw(buf_ptr+offsetof(struct mac_receive_buffer,buffer_length))); 
+		printk(KERN_DEBUG "next %04x, fs %02x, len %04x \n",
+			readw(buf_ptr+offsetof(struct mac_receive_buffer,next)), 
+			readb(buf_ptr+offsetof(struct mac_receive_buffer,frame_status)), 
+			readw(buf_ptr+offsetof(struct mac_receive_buffer,buffer_length)));
 }
 #endif 
 		mac_frame = dev_alloc_skb(frame_len) ; 

--

--===============0094771942229541217==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0094771942229541217==--
