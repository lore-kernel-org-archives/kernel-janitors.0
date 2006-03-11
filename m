From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Mar 2006 16:08:42 +0000
Subject: [KJ][Patch] fix indentation in axnet_cs.c
Message-Id: <1142093323.7820.40.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92640696991790972=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92640696991790972==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list.

Here is the patch to fix the indentation in axnet_cs.c.

Now before Alexey notices I also removed some un-needed brackets,
removed an un-needed else and ensured there was no more than one
statement per line. So they should all be fine in the one patch.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/net/pcmcia/axnet_cs.c.orig	2006-03-12 01:37:33.000000000 +1100
+++ linux-2.6.16-rc5/drivers/net/pcmcia/axnet_cs.c	2006-03-12 02:36:39.000000000 +1100
@@ -116,15 +116,15 @@ static irqreturn_t ax_interrupt(int irq,
 /*====================================================================*/
 
 typedef struct axnet_dev_t {
-    dev_link_t		link;
-    dev_node_t		node;
-    caddr_t		base;
-    struct timer_list	watchdog;
-    int			stale, fast_poll;
-    u_short		link_status;
-    u_char		duplex_flag;
-    int			phy_id;
-    int			flags;
+	dev_link_t		link;
+	dev_node_t		node;
+	caddr_t			base;
+	struct timer_list	watchdog;
+	int			stale, fast_poll;
+	u_short			link_status;
+	u_char			duplex_flag;
+	int			phy_id;
+	int			flags;
 } axnet_dev_t;
 
 static inline axnet_dev_t *PRIV(struct net_device *dev)
@@ -143,38 +143,38 @@ static inline axnet_dev_t *PRIV(struct n
 
 static int axnet_attach(struct pcmcia_device *p_dev)
 {
-    axnet_dev_t *info;
-    dev_link_t *link;
-    struct net_device *dev;
+	axnet_dev_t *info;
+	dev_link_t *link;
+	struct net_device *dev;
 
-    DEBUG(0, "axnet_attach()\n");
+	DEBUG(0, "axnet_attach()\n");
 
-    dev = alloc_netdev(sizeof(struct ei_device) + sizeof(axnet_dev_t),
+	dev = alloc_netdev(sizeof(struct ei_device) + sizeof(axnet_dev_t),
 			"eth%d", axdev_setup);
 
-    if (!dev)
-	return -ENOMEM;
+	if (!dev)
+		return -ENOMEM;
 
-    info = PRIV(dev);
-    link = &info->link;
-    link->priv = dev;
-    link->irq.Attributes = IRQ_TYPE_EXCLUSIVE;
-    link->irq.IRQInfo1 = IRQ_LEVEL_ID;
-    link->conf.Attributes = CONF_ENABLE_IRQ;
-    link->conf.IntType = INT_MEMORY_AND_IO;
-
-    dev->open = &axnet_open;
-    dev->stop = &axnet_close;
-    dev->do_ioctl = &axnet_ioctl;
-    SET_ETHTOOL_OPS(dev, &netdev_ethtool_ops);
+	info = PRIV(dev);
+	link = &info->link;
+	link->priv = dev;
+	link->irq.Attributes = IRQ_TYPE_EXCLUSIVE;
+	link->irq.IRQInfo1 = IRQ_LEVEL_ID;
+	link->conf.Attributes = CONF_ENABLE_IRQ;
+	link->conf.IntType = INT_MEMORY_AND_IO;
+
+	dev->open = &axnet_open;
+	dev->stop = &axnet_close;
+	dev->do_ioctl = &axnet_ioctl;
+	SET_ETHTOOL_OPS(dev, &netdev_ethtool_ops);
 
-    link->handle = p_dev;
-    p_dev->instance = link;
+	link->handle = p_dev;
+	p_dev->instance = link;
 
-    link->state |= DEV_PRESENT | DEV_CONFIG_PENDING;
-    axnet_config(link);
+	link->state |= DEV_PRESENT | DEV_CONFIG_PENDING;
+	axnet_config(link);
 
-    return 0;
+	return 0;
 } /* axnet_attach */
 
 /*======================================================================
@@ -188,18 +188,18 @@ static int axnet_attach(struct pcmcia_de
 
 static void axnet_detach(struct pcmcia_device *p_dev)
 {
-    dev_link_t *link = dev_to_instance(p_dev);
-    struct net_device *dev = link->priv;
+	dev_link_t *link = dev_to_instance(p_dev);
+	struct net_device *dev = link->priv;
 
-    DEBUG(0, "axnet_detach(0x%p)\n", link);
+	DEBUG(0, "axnet_detach(0x%p)\n", link);
 
-    if (link->dev)
-	unregister_netdev(dev);
+	if (link->dev)
+		unregister_netdev(dev);
 
-    if (link->state & DEV_CONFIG)
-	axnet_release(link);
+	if (link->state & DEV_CONFIG)
+		axnet_release(link);
 
-    free_netdev(dev);
+	free_netdev(dev);
 } /* axnet_detach */
 
 /*======================================================================
@@ -210,45 +210,45 @@ static void axnet_detach(struct pcmcia_d
 
 static int get_prom(dev_link_t *link)
 {
-    struct net_device *dev = link->priv;
-    kio_addr_t ioaddr = dev->base_addr;
-    int i, j;
+	struct net_device *dev = link->priv;
+	kio_addr_t ioaddr = dev->base_addr;
+	int i, j;
 
     /* This is based on drivers/net/ne.c */
-    struct {
-	u_char value, offset;
-    } program_seq[] = {
-	{E8390_NODMA+E8390_PAGE0+E8390_STOP, E8390_CMD}, /* Select page 0*/
-	{0x01,	EN0_DCFG},	/* Set word-wide access. */
-	{0x00,	EN0_RCNTLO},	/* Clear the count regs. */
-	{0x00,	EN0_RCNTHI},
-	{0x00,	EN0_IMR},	/* Mask completion irq. */
-	{0xFF,	EN0_ISR},
-	{E8390_RXOFF|0x40, EN0_RXCR},	/* 0x60  Set to monitor */
-	{E8390_TXOFF, EN0_TXCR},	/* 0x02  and loopback mode. */
-	{0x10,	EN0_RCNTLO},
-	{0x00,	EN0_RCNTHI},
-	{0x00,	EN0_RSARLO},	/* DMA starting at 0x0400. */
-	{0x04,	EN0_RSARHI},
-	{E8390_RREAD+E8390_START, E8390_CMD},
-    };
+	struct {
+		u_char value, offset;
+	} program_seq[] = {
+		{E8390_NODMA+E8390_PAGE0+E8390_STOP, E8390_CMD},/*Select page0*/
+		{0x01,	EN0_DCFG},	/* Set word-wide access. */
+		{0x00,	EN0_RCNTLO},	/* Clear the count regs. */
+		{0x00,	EN0_RCNTHI},
+		{0x00,	EN0_IMR},	/* Mask completion irq. */
+		{0xFF,	EN0_ISR},
+		{E8390_RXOFF|0x40, EN0_RXCR},	/* 0x60  Set to monitor */
+		{E8390_TXOFF, EN0_TXCR},	/* 0x02  and loopback mode. */
+		{0x10,	EN0_RCNTLO},
+		{0x00,	EN0_RCNTHI},
+		{0x00,	EN0_RSARLO},	/* DMA starting at 0x0400. */
+		{0x04,	EN0_RSARHI},
+		{E8390_RREAD+E8390_START, E8390_CMD},
+	};
 
     /* Not much of a test, but the alternatives are messy */
-    if (link->conf.ConfigBase != 0x03c0)
-	return 0;
+	if (link->conf.ConfigBase != 0x03c0)
+		return 0;
 
-    axnet_reset_8390(dev);
-    mdelay(10);
+	axnet_reset_8390(dev);
+	mdelay(10);
 
-    for (i = 0; i < sizeof(program_seq)/sizeof(program_seq[0]); i++)
-	outb_p(program_seq[i].value, ioaddr + program_seq[i].offset);
+	for (i = 0; i < sizeof(program_seq)/sizeof(program_seq[0]); i++)
+		outb_p(program_seq[i].value, ioaddr + program_seq[i].offset);
 
-    for (i = 0; i < 6; i += 2) {
-	j = inw(ioaddr + AXNET_DATAPORT);
-	dev->dev_addr[i] = j & 0xff;
-	dev->dev_addr[i+1] = j >> 8;
-    }
-    return 1;
+	for (i = 0; i < 6; i += 2) {
+		j = inw(ioaddr + AXNET_DATAPORT);
+		dev->dev_addr[i] = j & 0xff;
+		dev->dev_addr[i+1] = j >> 8;
+	}
+	return 1;
 } /* get_prom */
 
 /*======================================================================
@@ -264,185 +264,193 @@ do { last_fn = (fn); if ((last_ret = (re
 
 static int try_io_port(dev_link_t *link)
 {
-    int j, ret;
-    if (link->io.NumPorts1 == 32) {
-	link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-	if (link->io.NumPorts2 > 0) {
-	    /* for master/slave multifunction cards */
-	    link->io.Attributes2 = IO_DATA_PATH_WIDTH_8;
-	    link->irq.Attributes = 
-		IRQ_TYPE_DYNAMIC_SHARING|IRQ_FIRST_SHARED;
-	}
-    } else {
+	int j, ret;
+	if (link->io.NumPorts1 == 32) {
+		link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (link->io.NumPorts2 > 0) {
+		    /* for master/slave multifunction cards */
+			link->io.Attributes2 = IO_DATA_PATH_WIDTH_8;
+			link->irq.Attributes = 
+				IRQ_TYPE_DYNAMIC_SHARING|IRQ_FIRST_SHARED;
+		}
+	} else {
 	/* This should be two 16-port windows */
-	link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-	link->io.Attributes2 = IO_DATA_PATH_WIDTH_16;
-    }
-    if (link->io.BasePort1 == 0) {
-	link->io.IOAddrLines = 16;
-	for (j = 0; j < 0x400; j += 0x20) {
-	    link->io.BasePort1 = j ^ 0x300;
-	    link->io.BasePort2 = (j ^ 0x300) + 0x10;
-	    ret = pcmcia_request_io(link->handle, &link->io);
-	    if (ret == CS_SUCCESS) return ret;
+		link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		link->io.Attributes2 = IO_DATA_PATH_WIDTH_16;
+	}
+
+	if (link->io.BasePort1 == 0) {
+		link->io.IOAddrLines = 16;
+		for (j = 0; j < 0x400; j += 0x20) {
+			link->io.BasePort1 = j ^ 0x300;
+			link->io.BasePort2 = (j ^ 0x300) + 0x10;
+			ret = pcmcia_request_io(link->handle, &link->io);
+			if (ret == CS_SUCCESS)
+				return ret;
+		}
+		return ret;
 	}
-	return ret;
-    } else {
 	return pcmcia_request_io(link->handle, &link->io);
-    }
 }
 
 static void axnet_config(dev_link_t *link)
 {
-    client_handle_t handle = link->handle;
-    struct net_device *dev = link->priv;
-    axnet_dev_t *info = PRIV(dev);
-    tuple_t tuple;
-    cisparse_t parse;
-    int i, j, last_ret, last_fn;
-    u_short buf[64];
-    config_info_t conf;
-
-    DEBUG(0, "axnet_config(0x%p)\n", link);
-
-    tuple.Attributes = 0;
-    tuple.TupleData = (cisdata_t *)buf;
-    tuple.TupleDataMax = sizeof(buf);
-    tuple.TupleOffset = 0;
-    tuple.DesiredTuple = CISTPL_CONFIG;
-    CS_CHECK(GetFirstTuple, pcmcia_get_first_tuple(handle, &tuple));
-    CS_CHECK(GetTupleData, pcmcia_get_tuple_data(handle, &tuple));
-    CS_CHECK(ParseTuple, pcmcia_parse_tuple(handle, &tuple, &parse));
-    link->conf.ConfigBase = parse.config.base;
-    /* don't trust the CIS on this; Linksys got it wrong */
-    link->conf.Present = 0x63;
-
-    /* Configure card */
-    link->state |= DEV_CONFIG;
-
-    /* Look up current Vcc */
-    CS_CHECK(GetConfigurationInfo, pcmcia_get_configuration_info(handle, &conf));
-    link->conf.Vcc = conf.Vcc;
-
-    tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-    tuple.Attributes = 0;
-    CS_CHECK(GetFirstTuple, pcmcia_get_first_tuple(handle, &tuple));
-    while (last_ret == CS_SUCCESS) {
-	cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-	cistpl_io_t *io = &(parse.cftable_entry.io);
+	client_handle_t handle = link->handle;
+	struct net_device *dev = link->priv;
+	axnet_dev_t *info = PRIV(dev);
+	tuple_t tuple;
+	cisparse_t parse;
+	int i, j, last_ret, last_fn;
+	u_short buf[64];
+	config_info_t conf;
+
+	DEBUG(0, "axnet_config(0x%p)\n", link);
+
+	tuple.Attributes = 0;
+	tuple.TupleData = (cisdata_t *)buf;
+	tuple.TupleDataMax = sizeof(buf);
+	tuple.TupleOffset = 0;
+	tuple.DesiredTuple = CISTPL_CONFIG;
+	CS_CHECK(GetFirstTuple, pcmcia_get_first_tuple(handle, &tuple));
+	CS_CHECK(GetTupleData, pcmcia_get_tuple_data(handle, &tuple));
+	CS_CHECK(ParseTuple, pcmcia_parse_tuple(handle, &tuple, &parse));
+	link->conf.ConfigBase = parse.config.base;
+	/* don't trust the CIS on this; Linksys got it wrong */
+	link->conf.Present = 0x63;
+
+	/* Configure card */
+	link->state |= DEV_CONFIG;
+
+	/* Look up current Vcc */
+	CS_CHECK(GetConfigurationInfo,
+				pcmcia_get_configuration_info(handle, &conf));
+	link->conf.Vcc = conf.Vcc;
+
+	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
+	tuple.Attributes = 0;
+	CS_CHECK(GetFirstTuple, pcmcia_get_first_tuple(handle, &tuple));
+	while (last_ret == CS_SUCCESS) {
+		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
+		cistpl_io_t *io = &(parse.cftable_entry.io);
+	
+		if (pcmcia_get_tuple_data(handle, &tuple) != 0 ||
+				pcmcia_parse_tuple(handle, &tuple, &parse) !=0 
+				|| cfg->index == 0 || cfg->io.nwin == 0)
+			goto next_entry;
 	
-	if (pcmcia_get_tuple_data(handle, &tuple) != 0 ||
-		pcmcia_parse_tuple(handle, &tuple, &parse) != 0 ||
-		cfg->index == 0 || cfg->io.nwin == 0)
-	    goto next_entry;
+		link->conf.ConfigIndex = 0x05;
 	
-	link->conf.ConfigIndex = 0x05;
 	/* For multifunction cards, by convention, we configure the
-	   network function with window 0, and serial with window 1 */
-	if (io->nwin > 1) {
-	    i = (io->win[1].len > io->win[0].len);
-	    link->io.BasePort2 = io->win[1-i].base;
-	    link->io.NumPorts2 = io->win[1-i].len;
-	} else {
-	    i = link->io.NumPorts2 = 0;
+	network function with window 0, and serial with window 1 */
+	
+		if (io->nwin > 1) {
+			i = (io->win[1].len > io->win[0].len);
+			link->io.BasePort2 = io->win[1-i].base;
+			link->io.NumPorts2 = io->win[1-i].len;
+		} else {
+			i = link->io.NumPorts2 = 0;
+		}
+		link->io.BasePort1 = io->win[i].base;
+		link->io.NumPorts1 = io->win[i].len;
+		link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		if (link->io.NumPorts1 + link->io.NumPorts2 >= 32) {
+			last_ret = try_io_port(link);
+			if (last_ret == CS_SUCCESS) 
+				break;
+		}
+    next_entry:
+		last_ret = pcmcia_get_next_tuple(handle, &tuple);
 	}
-	link->io.BasePort1 = io->win[i].base;
-	link->io.NumPorts1 = io->win[i].len;
-	link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-	if (link->io.NumPorts1 + link->io.NumPorts2 >= 32) {
-	    last_ret = try_io_port(link);
-	    if (last_ret == CS_SUCCESS) break;
+	if (last_ret != CS_SUCCESS) {
+		cs_error(handle, RequestIO, last_ret);
+		goto failed;
+	}
+
+	CS_CHECK(RequestIRQ, pcmcia_request_irq(handle, &link->irq));
+    
+	if (link->io.NumPorts2 == 8) {
+		link->conf.Attributes |= CONF_ENABLE_SPKR;
+		link->conf.Status = CCSR_AUDIO_ENA;
+	}
+
+	CS_CHECK(RequestConfiguration,
+			pcmcia_request_configuration(handle, &link->conf));
+	dev->irq = link->irq.AssignedIRQ;
+	dev->base_addr = link->io.BasePort1;
+
+	if (!get_prom(link)) {
+		printk(KERN_NOTICE "axnet_cs: this is not an AX88190 card!\n");
+		printk(KERN_NOTICE "axnet_cs: use pcnet_cs instead.\n");
+		goto failed;
+	}
+
+	ei_status.name = "AX88190";
+	ei_status.word16 = 1;
+	ei_status.tx_start_page = AXNET_START_PG;
+	ei_status.rx_start_page = AXNET_START_PG + TX_PAGES;
+	ei_status.stop_page = AXNET_STOP_PG;
+	ei_status.reset_8390 = &axnet_reset_8390;
+	ei_status.get_8390_hdr = &get_8390_hdr;
+	ei_status.block_input = &block_input;
+	ei_status.block_output = &block_output;
+
+	if (inb(dev->base_addr + AXNET_TEST) != 0)
+		info->flags |= IS_AX88790;
+	else
+		info->flags |= IS_AX88190;
+
+	if (info->flags & IS_AX88790)
+		outb(0x10, dev->base_addr + AXNET_GPIO); /*select Internal PHY*/
+
+	for (i = 0; i < 32; i++) {
+		j = mdio_read(dev->base_addr + AXNET_MII_EEP, i, 1);
+		if ((j != 0) && (j != 0xffff)) break;
 	}
-    next_entry:
-	last_ret = pcmcia_get_next_tuple(handle, &tuple);
-    }
-    if (last_ret != CS_SUCCESS) {
-	cs_error(handle, RequestIO, last_ret);
-	goto failed;
-    }
-
-    CS_CHECK(RequestIRQ, pcmcia_request_irq(handle, &link->irq));
-    
-    if (link->io.NumPorts2 == 8) {
-	link->conf.Attributes |= CONF_ENABLE_SPKR;
-	link->conf.Status = CCSR_AUDIO_ENA;
-    }
-    
-    CS_CHECK(RequestConfiguration, pcmcia_request_configuration(handle, &link->conf));
-    dev->irq = link->irq.AssignedIRQ;
-    dev->base_addr = link->io.BasePort1;
-
-    if (!get_prom(link)) {
-	printk(KERN_NOTICE "axnet_cs: this is not an AX88190 card!\n");
-	printk(KERN_NOTICE "axnet_cs: use pcnet_cs instead.\n");
-	goto failed;
-    }
-
-    ei_status.name = "AX88190";
-    ei_status.word16 = 1;
-    ei_status.tx_start_page = AXNET_START_PG;
-    ei_status.rx_start_page = AXNET_START_PG + TX_PAGES;
-    ei_status.stop_page = AXNET_STOP_PG;
-    ei_status.reset_8390 = &axnet_reset_8390;
-    ei_status.get_8390_hdr = &get_8390_hdr;
-    ei_status.block_input = &block_input;
-    ei_status.block_output = &block_output;
-
-    if (inb(dev->base_addr + AXNET_TEST) != 0)
-	info->flags |= IS_AX88790;
-    else
-	info->flags |= IS_AX88190;
-
-    if (info->flags & IS_AX88790)
-	outb(0x10, dev->base_addr + AXNET_GPIO);  /* select Internal PHY */
-
-    for (i = 0; i < 32; i++) {
-	j = mdio_read(dev->base_addr + AXNET_MII_EEP, i, 1);
-	if ((j != 0) && (j != 0xffff)) break;
-    }
 
     /* Maybe PHY is in power down mode. (PPD_SET = 1) 
        Bit 2 of CCSR is active low. */ 
-    if (i == 32) {
-	conf_reg_t reg = { 0, CS_WRITE, CISREG_CCSR, 0x04 };
- 	pcmcia_access_configuration_register(link->handle, &reg);
-	for (i = 0; i < 32; i++) {
-	    j = mdio_read(dev->base_addr + AXNET_MII_EEP, i, 1);
-	    if ((j != 0) && (j != 0xffff)) break;
+	if (i == 32) {
+		conf_reg_t reg = { 0, CS_WRITE, CISREG_CCSR, 0x04 };
+ 		pcmcia_access_configuration_register(link->handle, &reg);
+		for (i = 0; i < 32; i++) {
+			j = mdio_read(dev->base_addr + AXNET_MII_EEP, i, 1);
+			if ((j != 0) && (j != 0xffff)) 
+				break;
+		}
 	}
-    }
 
-    info->phy_id = (i < 32) ? i : -1;
-    link->dev = &info->node;
-    link->state &= ~DEV_CONFIG_PENDING;
-    SET_NETDEV_DEV(dev, &handle_to_dev(handle));
-
-    if (register_netdev(dev) != 0) {
-	printk(KERN_NOTICE "axnet_cs: register_netdev() failed\n");
-	link->dev = NULL;
-	goto failed;
-    }
-
-    strcpy(info->node.dev_name, dev->name);
-
-    printk(KERN_INFO "%s: Asix AX88%d90: io %#3lx, irq %d, hw_addr ",
-	   dev->name, ((info->flags & IS_AX88790) ? 7 : 1),
-	   dev->base_addr, dev->irq);
-    for (i = 0; i < 6; i++)
-	printk("%02X%s", dev->dev_addr[i], ((i<5) ? ":" : "\n"));
-    if (info->phy_id != -1) {
-	DEBUG(0, "  MII transceiver at index %d, status %x.\n", info->phy_id, j);
-    } else {
-	printk(KERN_NOTICE "  No MII transceivers found!\n");
-    }
-    return;
+	info->phy_id = (i < 32) ? i : -1;
+	link->dev = &info->node;
+	link->state &= ~DEV_CONFIG_PENDING;
+	SET_NETDEV_DEV(dev, &handle_to_dev(handle));
+
+	if (register_netdev(dev) != 0) {
+		printk(KERN_NOTICE "axnet_cs: register_netdev() failed\n");
+		link->dev = NULL;
+		goto failed;
+	}
+
+	strcpy(info->node.dev_name, dev->name);
+
+	printk(KERN_INFO "%s: Asix AX88%d90: io %#3lx, irq %d, hw_addr ",
+			dev->name, ((info->flags & IS_AX88790) ? 7 : 1),
+			dev->base_addr, dev->irq);
+	for (i = 0; i < 6; i++)
+		printk("%02X%s", dev->dev_addr[i], ((i<5) ? ":" : "\n"));
+	if (info->phy_id != -1) {
+		DEBUG(0, "  MII transceiver at index %d, status %x.\n",
+							info->phy_id, j);
+	} else {
+		printk(KERN_NOTICE "  No MII transceivers found!\n");
+	}
+	return;
 
 cs_failed:
-    cs_error(link->handle, last_fn, last_ret);
+	cs_error(link->handle, last_fn, last_ret);
 failed:
-    axnet_release(link);
-    link->state &= ~DEV_CONFIG_PENDING;
-    return;
+	axnet_release(link);
+	link->state &= ~DEV_CONFIG_PENDING;
+	return;
 } /* axnet_config */
 
 /*======================================================================
@@ -455,13 +463,13 @@ failed:
 
 static void axnet_release(dev_link_t *link)
 {
-    DEBUG(0, "axnet_release(0x%p)\n", link);
+	DEBUG(0, "axnet_release(0x%p)\n", link);
 
-    pcmcia_release_configuration(link->handle);
-    pcmcia_release_io(link->handle, &link->io);
-    pcmcia_release_irq(link->handle, &link->irq);
+	pcmcia_release_configuration(link->handle);
+	pcmcia_release_io(link->handle, &link->io);
+	pcmcia_release_irq(link->handle, &link->irq);
 
-    link->state &= ~DEV_CONFIG;
+	link->state &= ~DEV_CONFIG;
 }
 
 static int axnet_suspend(struct pcmcia_device *p_dev)
@@ -513,92 +521,93 @@ static int axnet_resume(struct pcmcia_de
 
 static void mdio_sync(kio_addr_t addr)
 {
-    int bits;
-    for (bits = 0; bits < 32; bits++) {
-	outb_p(MDIO_DATA_WRITE1, addr);
-	outb_p(MDIO_DATA_WRITE1 | MDIO_SHIFT_CLK, addr);
-    }
+	int bits;
+	for (bits = 0; bits < 32; bits++) {
+		outb_p(MDIO_DATA_WRITE1, addr);
+		outb_p(MDIO_DATA_WRITE1 | MDIO_SHIFT_CLK, addr);
+	}
 }
 
 static int mdio_read(kio_addr_t addr, int phy_id, int loc)
 {
-    u_int cmd = (0xf6<<10)|(phy_id<<5)|loc;
-    int i, retval = 0;
+	u_int cmd = (0xf6<<10)|(phy_id<<5)|loc;
+	int i, retval = 0;
 
-    mdio_sync(addr);
-    for (i = 14; i >= 0; i--) {
-	int dat = (cmd&(1<<i)) ? MDIO_DATA_WRITE1 : MDIO_DATA_WRITE0;
-	outb_p(dat, addr);
-	outb_p(dat | MDIO_SHIFT_CLK, addr);
-    }
-    for (i = 19; i > 0; i--) {
-	outb_p(MDIO_ENB_IN, addr);
-	retval = (retval << 1) | ((inb_p(addr) & MDIO_DATA_READ) != 0);
-	outb_p(MDIO_ENB_IN | MDIO_SHIFT_CLK, addr);
-    }
-    return (retval>>1) & 0xffff;
+	mdio_sync(addr);
+	for (i = 14; i >= 0; i--) {
+		int dat = (cmd&(1<<i)) ? MDIO_DATA_WRITE1 : MDIO_DATA_WRITE0;
+		outb_p(dat, addr);
+		outb_p(dat | MDIO_SHIFT_CLK, addr);
+	}
+	for (i = 19; i > 0; i--) {
+		outb_p(MDIO_ENB_IN, addr);
+		retval = (retval << 1) | ((inb_p(addr) & MDIO_DATA_READ) != 0);
+		outb_p(MDIO_ENB_IN | MDIO_SHIFT_CLK, addr);
+	}
+	return (retval>>1) & 0xffff;
 }
 
 static void mdio_write(kio_addr_t addr, int phy_id, int loc, int value)
 {
-    u_int cmd = (0x05<<28)|(phy_id<<23)|(loc<<18)|(1<<17)|value;
-    int i;
+	u_int cmd = (0x05<<28)|(phy_id<<23)|(loc<<18)|(1<<17)|value;
+	int i;
 
-    mdio_sync(addr);
-    for (i = 31; i >= 0; i--) {
-	int dat = (cmd&(1<<i)) ? MDIO_DATA_WRITE1 : MDIO_DATA_WRITE0;
-	outb_p(dat, addr);
-	outb_p(dat | MDIO_SHIFT_CLK, addr);
-    }
-    for (i = 1; i >= 0; i--) {
-	outb_p(MDIO_ENB_IN, addr);
-	outb_p(MDIO_ENB_IN | MDIO_SHIFT_CLK, addr);
-    }
+	mdio_sync(addr);
+	for (i = 31; i >= 0; i--) {
+		int dat = (cmd&(1<<i)) ? MDIO_DATA_WRITE1 : MDIO_DATA_WRITE0;
+		outb_p(dat, addr);
+		outb_p(dat | MDIO_SHIFT_CLK, addr);
+	}
+	for (i = 1; i >= 0; i--) {
+		outb_p(MDIO_ENB_IN, addr);
+		outb_p(MDIO_ENB_IN | MDIO_SHIFT_CLK, addr);
+	}
 }
 
 /*====================================================================*/
 
 static int axnet_open(struct net_device *dev)
 {
-    axnet_dev_t *info = PRIV(dev);
-    dev_link_t *link = &info->link;
+	axnet_dev_t *info = PRIV(dev);
+	dev_link_t *link = &info->link;
     
-    DEBUG(2, "axnet_open('%s')\n", dev->name);
+	DEBUG(2, "axnet_open('%s')\n", dev->name);
 
-    if (!DEV_OK(link))
-	return -ENODEV;
+	if (!DEV_OK(link))
+		return -ENODEV;
 
-    link->open++;
+	link->open++;
 
-    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, "axnet_cs", dev);
+	if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, "axnet_cs", dev)< 0)
+		return -EBUSY;
 
-    info->link_status = 0x00;
-    init_timer(&info->watchdog);
-    info->watchdog.function = &ei_watchdog;
-    info->watchdog.data = (u_long)dev;
-    info->watchdog.expires = jiffies + HZ;
-    add_timer(&info->watchdog);
+	info->link_status = 0x00;
+	init_timer(&info->watchdog);
+	info->watchdog.function = &ei_watchdog;
+	info->watchdog.data = (u_long)dev;
+	info->watchdog.expires = jiffies + HZ;
+	add_timer(&info->watchdog);
 
-    return ax_open(dev);
+	return ax_open(dev);
 } /* axnet_open */
 
 /*====================================================================*/
 
 static int axnet_close(struct net_device *dev)
 {
-    axnet_dev_t *info = PRIV(dev);
-    dev_link_t *link = &info->link;
+	axnet_dev_t *info = PRIV(dev);
+	dev_link_t *link = &info->link;
 
-    DEBUG(2, "axnet_close('%s')\n", dev->name);
+	DEBUG(2, "axnet_close('%s')\n", dev->name);
 
-    ax_close(dev);
-    free_irq(dev->irq, dev);
+	ax_close(dev);
+	free_irq(dev->irq, dev);
     
-    link->open--;
-    netif_stop_queue(dev);
-    del_timer_sync(&info->watchdog);
+	link->open--;
+	netif_stop_queue(dev);
+	del_timer_sync(&info->watchdog);
 
-    return 0;
+	return 0;
 } /* axnet_close */
 
 /*======================================================================
@@ -610,25 +619,25 @@ static int axnet_close(struct net_device
 
 static void axnet_reset_8390(struct net_device *dev)
 {
-    kio_addr_t nic_base = dev->base_addr;
-    int i;
+	kio_addr_t nic_base = dev->base_addr;
+	int i;
 
-    ei_status.txing = ei_status.dmaing = 0;
+	ei_status.txing = ei_status.dmaing = 0;
 
-    outb_p(E8390_NODMA+E8390_PAGE0+E8390_STOP, nic_base + E8390_CMD);
+	outb_p(E8390_NODMA+E8390_PAGE0+E8390_STOP, nic_base + E8390_CMD);
 
-    outb(inb(nic_base + AXNET_RESET), nic_base + AXNET_RESET);
+	outb(inb(nic_base + AXNET_RESET), nic_base + AXNET_RESET);
 
-    for (i = 0; i < 100; i++) {
-	if ((inb_p(nic_base+EN0_ISR) & ENISR_RESET) != 0)
-	    break;
-	udelay(100);
-    }
-    outb_p(ENISR_RESET, nic_base + EN0_ISR); /* Ack intr. */
+	for (i = 0; i < 100; i++) {
+		if ((inb_p(nic_base+EN0_ISR) & ENISR_RESET) != 0)
+			break;
+		udelay(100);
+	}
+	outb_p(ENISR_RESET, nic_base + EN0_ISR); /* Ack intr. */
     
-    if (i == 100)
-	printk(KERN_ERR "%s: axnet_reset_8390() did not complete.\n",
-	       dev->name);
+	if (i == 100)
+		printk(KERN_ERR "%s: axnet_reset_8390() did not complete.\n",
+								dev->name);
     
 } /* axnet_reset_8390 */
 
@@ -636,68 +645,70 @@ static void axnet_reset_8390(struct net_
 
 static irqreturn_t ei_irq_wrapper(int irq, void *dev_id, struct pt_regs *regs)
 {
-    struct net_device *dev = dev_id;
-    PRIV(dev)->stale = 0;
-    return ax_interrupt(irq, dev_id, regs);
+	struct net_device *dev = dev_id;
+	PRIV(dev)->stale = 0;
+	return ax_interrupt(irq, dev_id, regs);
 }
 
 static void ei_watchdog(u_long arg)
 {
-    struct net_device *dev = (struct net_device *)(arg);
-    axnet_dev_t *info = PRIV(dev);
-    kio_addr_t nic_base = dev->base_addr;
-    kio_addr_t mii_addr = nic_base + AXNET_MII_EEP;
-    u_short link;
+	struct net_device *dev = (struct net_device *)(arg);
+	axnet_dev_t *info = PRIV(dev);
+	kio_addr_t nic_base = dev->base_addr;
+	kio_addr_t mii_addr = nic_base + AXNET_MII_EEP;
+	u_short link;
 
-    if (!netif_device_present(dev)) goto reschedule;
+	if (!netif_device_present(dev)) 
+		goto reschedule;
 
     /* Check for pending interrupt with expired latency timer: with
        this, we can limp along even if the interrupt is blocked */
-    if (info->stale++ && (inb_p(nic_base + EN0_ISR) & ENISR_ALL)) {
-	if (!info->fast_poll)
-	    printk(KERN_INFO "%s: interrupt(s) dropped!\n", dev->name);
-	ei_irq_wrapper(dev->irq, dev, NULL);
-	info->fast_poll = HZ;
-    }
-    if (info->fast_poll) {
-	info->fast_poll--;
-	info->watchdog.expires = jiffies + 1;
-	add_timer(&info->watchdog);
-	return;
-    }
+	if (info->stale++ && (inb_p(nic_base + EN0_ISR) & ENISR_ALL)) {
+		if (!info->fast_poll)
+			printk(KERN_INFO "%s: interrupt(s) dropped!\n",
+								dev->name);
+		ei_irq_wrapper(dev->irq, dev, NULL);
+		info->fast_poll = HZ;
+	}
+	if (info->fast_poll) {
+		info->fast_poll--;
+		info->watchdog.expires = jiffies + 1;
+		add_timer(&info->watchdog);
+		return;
+	}
 
-    if (info->phy_id < 0)
-	goto reschedule;
-    link = mdio_read(mii_addr, info->phy_id, 1);
-    if (!link || (link == 0xffff)) {
-	printk(KERN_INFO "%s: MII is missing!\n", dev->name);
-	info->phy_id = -1;
-	goto reschedule;
-    }
-
-    link &= 0x0004;
-    if (link != info->link_status) {
-	u_short p = mdio_read(mii_addr, info->phy_id, 5);
-	printk(KERN_INFO "%s: %s link beat\n", dev->name,
-	       (link) ? "found" : "lost");
-	if (link) {
-	    info->duplex_flag = (p & 0x0140) ? 0x80 : 0x00;
-	    if (p)
-		printk(KERN_INFO "%s: autonegotiation complete: "
-		       "%sbaseT-%cD selected\n", dev->name,
-		       ((p & 0x0180) ? "100" : "10"),
-		       ((p & 0x0140) ? 'F' : 'H'));
-	    else
-		printk(KERN_INFO "%s: link partner did not autonegotiate\n",
-		       dev->name);
-	    AX88190_init(dev, 1);
+	if (info->phy_id < 0)
+		goto reschedule;
+	link = mdio_read(mii_addr, info->phy_id, 1);
+	if (!link || (link == 0xffff)) {
+		printk(KERN_INFO "%s: MII is missing!\n", dev->name);
+		info->phy_id = -1;
+		goto reschedule;
+	}
+
+	link &= 0x0004;
+	if (link != info->link_status) {
+		u_short p = mdio_read(mii_addr, info->phy_id, 5);
+		printk(KERN_INFO "%s: %s link beat\n", dev->name,
+						(link) ? "found" : "lost");
+		if (link) {
+			info->duplex_flag = (p & 0x0140) ? 0x80 : 0x00;
+			if (p)
+				printk(KERN_INFO "%s: autonegotiation complete:"
+					" %sbaseT-%cD selected\n", dev->name,
+					((p & 0x0180) ? "100" : "10"),
+					((p & 0x0140) ? 'F' : 'H'));
+			else
+				printk(KERN_INFO "%s: link partner did not"
+						" autonegotiate\n", dev->name);
+			AX88190_init(dev, 1);
+		}
+		info->link_status = link;
 	}
-	info->link_status = link;
-    }
 
 reschedule:
-    info->watchdog.expires = jiffies + HZ;
-    add_timer(&info->watchdog);
+	info->watchdog.expires = jiffies + HZ;
+	add_timer(&info->watchdog);
 }
 
 static void netdev_get_drvinfo(struct net_device *dev,
@@ -714,22 +725,22 @@ static struct ethtool_ops netdev_ethtool
 
 static int axnet_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-    axnet_dev_t *info = PRIV(dev);
-    u16 *data = (u16 *)&rq->ifr_ifru;
-    kio_addr_t mii_addr = dev->base_addr + AXNET_MII_EEP;
-    switch (cmd) {
-    case SIOCGMIIPHY:
-	data[0] = info->phy_id;
-    case SIOCGMIIREG:		/* Read MII PHY register. */
-	data[3] = mdio_read(mii_addr, data[0], data[1] & 0x1f);
-	return 0;
-    case SIOCSMIIREG:		/* Write MII PHY register. */
-	if (!capable(CAP_NET_ADMIN))
-	    return -EPERM;
-	mdio_write(mii_addr, data[0], data[1] & 0x1f, data[2]);
-	return 0;
-    }
-    return -EOPNOTSUPP;
+	axnet_dev_t *info = PRIV(dev);
+	u16 *data = (u16 *)&rq->ifr_ifru;
+	kio_addr_t mii_addr = dev->base_addr + AXNET_MII_EEP;
+	switch (cmd) {
+		case SIOCGMIIPHY:
+			data[0] = info->phy_id;
+		case SIOCGMIIREG:		/* Read MII PHY register. */
+			data[3] = mdio_read(mii_addr, data[0], data[1] & 0x1f);
+			return 0;
+		case SIOCSMIIREG:		/* Write MII PHY register. */
+			if (!capable(CAP_NET_ADMIN))
+				return -EPERM;
+			mdio_write(mii_addr, data[0], data[1] & 0x1f, data[2]);
+			return 0;
+	}
+	return -EOPNOTSUPP;
 }
 
 /*====================================================================*/
@@ -738,16 +749,16 @@ static void get_8390_hdr(struct net_devi
 			 struct e8390_pkt_hdr *hdr,
 			 int ring_page)
 {
-    kio_addr_t nic_base = dev->base_addr;
+	kio_addr_t nic_base = dev->base_addr;
 
-    outb_p(0, nic_base + EN0_RSARLO);		/* On page boundary */
-    outb_p(ring_page, nic_base + EN0_RSARHI);
-    outb_p(E8390_RREAD+E8390_START, nic_base + AXNET_CMD);
+	outb_p(0, nic_base + EN0_RSARLO);		/* On page boundary */
+	outb_p(ring_page, nic_base + EN0_RSARHI);
+	outb_p(E8390_RREAD+E8390_START, nic_base + AXNET_CMD);
 
-    insw(nic_base + AXNET_DATAPORT, hdr,
-	    sizeof(struct e8390_pkt_hdr)>>1);
+	insw(nic_base + AXNET_DATAPORT, hdr,
+				sizeof(struct e8390_pkt_hdr)>>1);
     /* Fix for big endian systems */
-    hdr->count = le16_to_cpu(hdr->count);
+	hdr->count = le16_to_cpu(hdr->count);
 
 }
 
@@ -756,21 +767,21 @@ static void get_8390_hdr(struct net_devi
 static void block_input(struct net_device *dev, int count,
 			struct sk_buff *skb, int ring_offset)
 {
-    kio_addr_t nic_base = dev->base_addr;
-    int xfer_count = count;
-    char *buf = skb->data;
+	kio_addr_t nic_base = dev->base_addr;
+	int xfer_count = count;
+	char *buf = skb->data;
 
 #ifdef PCMCIA_DEBUG
-    if ((ei_debug > 4) && (count != 4))
-	printk(KERN_DEBUG "%s: [bi=%d]\n", dev->name, count+4);
+	if ((ei_debug > 4) && (count != 4))
+		printk(KERN_DEBUG "%s: [bi=%d]\n", dev->name, count+4);
 #endif
-    outb_p(ring_offset & 0xff, nic_base + EN0_RSARLO);
-    outb_p(ring_offset >> 8, nic_base + EN0_RSARHI);
-    outb_p(E8390_RREAD+E8390_START, nic_base + AXNET_CMD);
-
-    insw(nic_base + AXNET_DATAPORT,buf,count>>1);
-    if (count & 0x01)
-	buf[count-1] = inb(nic_base + AXNET_DATAPORT), xfer_count++;
+	outb_p(ring_offset & 0xff, nic_base + EN0_RSARLO);
+	outb_p(ring_offset >> 8, nic_base + EN0_RSARHI);
+	outb_p(E8390_RREAD+E8390_START, nic_base + AXNET_CMD);
+
+	insw(nic_base + AXNET_DATAPORT,buf,count>>1);
+	if (count & 0x01)
+		buf[count-1] = inb(nic_base + AXNET_DATAPORT), xfer_count++;
 
 }
 
@@ -779,23 +790,23 @@ static void block_input(struct net_devic
 static void block_output(struct net_device *dev, int count,
 			 const u_char *buf, const int start_page)
 {
-    kio_addr_t nic_base = dev->base_addr;
+	kio_addr_t nic_base = dev->base_addr;
 
 #ifdef PCMCIA_DEBUG
-    if (ei_debug > 4)
-	printk(KERN_DEBUG "%s: [bo=%d]\n", dev->name, count);
+	if (ei_debug > 4)
+		printk(KERN_DEBUG "%s: [bo=%d]\n", dev->name, count);
 #endif
 
     /* Round the count up for word writes.  Do we need to do this?
        What effect will an odd byte count have on the 8390?
        I should check someday. */
-    if (count & 0x01)
-	count++;
+	if (count & 0x01)
+		count++;
 
-    outb_p(0x00, nic_base + EN0_RSARLO);
-    outb_p(start_page, nic_base + EN0_RSARHI);
-    outb_p(E8390_RWRITE+E8390_START, nic_base + AXNET_CMD);
-    outsw(nic_base + AXNET_DATAPORT, buf, count>>1);
+	outb_p(0x00, nic_base + EN0_RSARLO);
+	outb_p(start_page, nic_base + EN0_RSARHI);
+	outb_p(E8390_RWRITE+E8390_START, nic_base + AXNET_CMD);
+	outsw(nic_base + AXNET_DATAPORT, buf, count>>1);
 }
 
 static struct pcmcia_device_id axnet_ids[] = {
@@ -1693,12 +1704,12 @@ static void do_set_multicast_list(struct
 {
 	long e8390_base = dev->base_addr;
 
-  	if(dev->flags&IFF_PROMISC)
+	if(dev->flags&IFF_PROMISC)
   		outb_p(E8390_RXCONFIG | 0x58, e8390_base + EN0_RXCR);
 	else if(dev->flags&IFF_ALLMULTI || dev->mc_list)
-  		outb_p(E8390_RXCONFIG | 0x48, e8390_base + EN0_RXCR);
-  	else
-  		outb_p(E8390_RXCONFIG | 0x40, e8390_base + EN0_RXCR);
+		outb_p(E8390_RXCONFIG | 0x48, e8390_base + EN0_RXCR);
+	else
+		outb_p(E8390_RXCONFIG | 0x40, e8390_base + EN0_RXCR);
 }
 
 /*
@@ -1761,7 +1772,7 @@ static void AX88190_init(struct net_devi
 	struct ei_device *ei_local = (struct ei_device *) netdev_priv(dev);
 	int i;
 	int endcfg = ei_local->word16 ? (0x48 | ENDCFG_WTS) : 0x48;
-    
+
 	if(sizeof(struct e8390_pkt_hdr)!=4)
     		panic("8390.c: header struct mispacked\n");    
 	/* Follow National Semi's recommendations for initing the DP83902. */





--===============92640696991790972==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92640696991790972==--
