From: Richard <h.vanberkum@chello.nl>
Date: Mon, 03 Jul 2006 22:02:41 +0000
Subject: [KJ] [PATCH 3] drivers/atm/idt77252.c: Fix even more KERN_* in
Message-Id: <44A9B2BC.60002@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Last patch to fix KERN_* in printk statements in idt77252.c

Signed-of-by: Richard van Berkum





--- janitor-2.6/drivers/atm/idt77252.c	2006-07-02 23:11:30.504756912 +0200
+++ mytree/drivers/atm/idt77252.c	2006-07-02 23:20:56.138767472 +0200
@@ -2736,7 +2736,7 @@ idt77252_collect_stat(struct idt77252_de
 	icc = readl(SAR_REG_ICC);
 
 #ifdef	NOTDEF
-	printk("%s:", card->name);
+	printk(KERN_INFO "%s:", card->name);
 
 	if (cdc & 0x7f0000) {
 		char *s = "";
@@ -2789,7 +2789,7 @@ idt77252_interrupt(int irq, void *dev_id
 		return IRQ_NONE;
 
 	if (test_and_set_bit(IDT77252_BIT_INTERRUPT, &card->flags)) {
-		printk("%s: Re-entering irq_handler()\n", card->name);
+		printk(KERN_INFO "%s: Re-entering irq_handler()\n", card->name);
 		goto out;
 	}
 
@@ -2927,7 +2927,7 @@ open_card_oam(struct idt77252_dev *card)
 
 			vc = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
 			if (!vc) {
-				printk("%s: can't alloc vc\n", card->name);
+				printk(KERN_ERR "%s: can't alloc vc\n", card->name);
 				return -ENOMEM;
 			}
 			memset(vc, 0, sizeof(struct vc_map));
@@ -2996,7 +2996,7 @@ open_card_ubr0(struct idt77252_dev *card
 
 	vc = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
 	if (!vc) {
-		printk("%s: can't alloc vc\n", card->name);
+		printk(KERN_ERR "%s: can't alloc vc\n", card->name);
 		return -ENOMEM;
 	}
 	memset(vc, 0, sizeof(struct vc_map));
@@ -3005,7 +3005,7 @@ open_card_ubr0(struct idt77252_dev *card
 
 	vc->scq = alloc_scq(card, vc->class);
 	if (!vc->scq) {
-		printk("%s: can't get SCQ.\n", card->name);
+		printk(KERN_ERR "%s: can't get SCQ.\n", card->name);
 		return -ENOMEM;
 	}
 
@@ -3035,7 +3035,7 @@ idt77252_dev_open(struct idt77252_dev *c
 	u32 conf;
 
 	if (!test_bit(IDT77252_BIT_INIT, &card->flags)) {
-		printk("%s: SAR not yet initialized.\n", card->name);
+		printk(KERN_ERR "%s: SAR not yet initialized.\n", card->name);
 		return -1;
 	}
 
@@ -3060,12 +3060,12 @@ idt77252_dev_open(struct idt77252_dev *c
 	writel(readl(SAR_REG_CFG) | conf, SAR_REG_CFG);
 
 	if (open_card_oam(card)) {
-		printk("%s: Error initializing OAM.\n", card->name);
+		printk(KERN_ERR "%s: Error initializing OAM.\n", card->name);
 		return -1;
 	}
 
 	if (open_card_ubr0(card)) {
-		printk("%s: Error initializing UBR0.\n", card->name);
+		printk(KERN_ERR "%s: Error initializing UBR0.\n", card->name);
 		return -1;
 	}
 
@@ -3113,7 +3113,7 @@ deinit_card(struct idt77252_dev *card)
 	int i, j;
 
 	if (!test_bit(IDT77252_BIT_INIT, &card->flags)) {
-		printk("%s: SAR not yet initialized.\n", card->name);
+		printk(KERN_INFO "%s: SAR not yet initialized.\n", card->name);
 		return;
 	}
 	DIPRINTK("idt77252: deinitialize card %u\n", card->index);
@@ -3340,7 +3340,7 @@ init_card(struct atm_dev *dev)
 	int i, k;
 
 	if (test_bit(IDT77252_BIT_INIT, &card->flags)) {
-		printk("Error: SAR already initialized.\n");
+		printk(KERN_ERR "Error: SAR already initialized.\n");
 		return -1;
 	}
 
@@ -3351,7 +3351,7 @@ init_card(struct atm_dev *dev)
 	/* Set PCI Retry-Timeout and TRDY timeout */
 	IPRINTK("%s: Checking PCI retries.\n", card->name);
 	if (pci_read_config_byte(pcidev, 0x40, &pci_byte) != 0) {
-		printk("%s: can't read PCI retry timeout.\n", card->name);
+		printk(KERN_ERR "%s: can't read PCI retry timeout.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3359,7 +3359,7 @@ init_card(struct atm_dev *dev)
 		IPRINTK("%s: PCI retry timeout: %d, set to 0.\n",
 			card->name, pci_byte);
 		if (pci_write_config_byte(pcidev, 0x40, 0) != 0) {
-			printk("%s: can't set PCI retry timeout.\n",
+			printk(KERN_ERR "%s: can't set PCI retry timeout.\n",
 			       card->name);
 			deinit_card(card);
 			return -1;
@@ -3367,7 +3367,7 @@ init_card(struct atm_dev *dev)
 	}
 	IPRINTK("%s: Checking PCI TRDY.\n", card->name);
 	if (pci_read_config_byte(pcidev, 0x41, &pci_byte) != 0) {
-		printk("%s: can't read PCI TRDY timeout.\n", card->name);
+		printk(KERN_ERR "%s: can't read PCI TRDY timeout.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3375,20 +3375,20 @@ init_card(struct atm_dev *dev)
 		IPRINTK("%s: PCI TRDY timeout: %d, set to 0.\n",
 		        card->name, pci_byte);
 		if (pci_write_config_byte(pcidev, 0x41, 0) != 0) {
-			printk("%s: can't set PCI TRDY timeout.\n", card->name);
+			printk(KERN_ERR "%s: can't set PCI TRDY timeout.\n", card->name);
 			deinit_card(card);
 			return -1;
 		}
 	}
 	/* Reset Timer register */
 	if (readl(SAR_REG_STAT) & SAR_STAT_TMROF) {
-		printk("%s: resetting timer overflow.\n", card->name);
+		printk(KERN_INFO "%s: resetting timer overflow.\n", card->name);
 		writel(SAR_STAT_TMROF, SAR_REG_STAT);
 	}
 	IPRINTK("%s: Request IRQ ... ", card->name);
 	if (request_irq(pcidev->irq, idt77252_interrupt, SA_INTERRUPT|SA_SHIRQ,
 			card->name, card) != 0) {
-		printk("%s: can't allocate IRQ.\n", card->name);
+		printk(KERN_ERR "%s: can't allocate IRQ.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3472,7 +3472,7 @@ init_card(struct atm_dev *dev)
 	card->raw_cell_hnd = pci_alloc_consistent(card->pcidev, 2 * sizeof(u32),
 						  &card->raw_cell_paddr);
 	if (!card->raw_cell_hnd) {
-		printk("%s: memory allocation failure.\n", card->name);
+		printk(KERN_ERR "%s: memory allocation failure.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3484,7 +3484,7 @@ init_card(struct atm_dev *dev)
 	size = sizeof(struct vc_map *) * card->tct_size;
 	IPRINTK("%s: allocate %d byte for VC map.\n", card->name, size);
 	if (NULL = (card->vcs = vmalloc(size))) {
-		printk("%s: memory allocation failure.\n", card->name);
+		printk(KERN_ERR "%s: memory allocation failure.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3494,7 +3494,7 @@ init_card(struct atm_dev *dev)
 	IPRINTK("%s: allocate %d byte for SCD to VC mapping.\n",
 	        card->name, size);
 	if (NULL = (card->scd2vc = vmalloc(size))) {
-		printk("%s: memory allocation failure.\n", card->name);
+		printk(KERN_ERR "%s: memory allocation failure.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3504,7 +3504,7 @@ init_card(struct atm_dev *dev)
 	IPRINTK("%s: allocate %d byte for TST to VC mapping.\n",
 		card->name, size);
 	if (NULL = (card->soft_tst = vmalloc(size))) {
-		printk("%s: memory allocation failure.\n", card->name);
+		printk(KERN_ERR "%s: memory allocation failure.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3514,12 +3514,12 @@ init_card(struct atm_dev *dev)
 	}
 
 	if (dev->phy = NULL) {
-		printk("%s: No LT device defined.\n", card->name);
+		printk(KERN_ERR "%s: No LT device defined.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
 	if (dev->phy->ioctl = NULL) {
-		printk("%s: LT had no IOCTL funtion defined.\n", card->name);
+		printk(KERN_ERR "%s: LT had no IOCTL funtion defined.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3538,7 +3538,7 @@ init_card(struct atm_dev *dev)
 #endif
 
 	card->link_pcr = (linkrate / 8 / 53);
-	printk("%s: Linkrate on ATM line : %u bit/s, %u cell/s.\n",
+	printk(KERN_INFO "%s: Linkrate on ATM line : %u bit/s, %u cell/s.\n",
 	       card->name, linkrate, card->link_pcr);
 
 #ifdef CONFIG_ATM_IDT77252_SEND_IDLE
@@ -3561,7 +3561,7 @@ init_card(struct atm_dev *dev)
 
 #ifdef HAVE_EEPROM
 	idt77252_eeprom_init(card);
-	printk("%s: EEPROM: %02x:", card->name,
+	printk(KERN_INFO "%s: EEPROM: %02x:", card->name,
 		idt77252_eeprom_read_status(card));
 
 	for (i = 0; i < 0x80; i++) {
@@ -3580,7 +3580,7 @@ init_card(struct atm_dev *dev)
 	if (tmp) {
 		memcpy(card->atmdev->esi, tmp->dev_addr, 6);
 
-		printk("%s: ESI %02x:%02x:%02x:%02x:%02x:%02x\n",
+		printk(KERN_INFO "%s: ESI %02x:%02x:%02x:%02x:%02x:%02x\n",
 		       card->name, card->atmdev->esi[0], card->atmdev->esi[1],
 		       card->atmdev->esi[2], card->atmdev->esi[3],
 		       card->atmdev->esi[4], card->atmdev->esi[5]);
@@ -3618,19 +3618,19 @@ idt77252_preset(struct idt77252_dev *car
 	XPRINTK("%s: Enable PCI master and memory access for SAR.\n",
 		card->name);
 	if (pci_read_config_word(card->pcidev, PCI_COMMAND, &pci_command)) {
-		printk("%s: can't read PCI_COMMAND.\n", card->name);
+		printk(KERN_ERR "%s: can't read PCI_COMMAND.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
 	if (!(pci_command & PCI_COMMAND_IO)) {
-		printk("%s: PCI_COMMAND: %04x (???)\n",
+		printk(KERN_ERR "%s: PCI_COMMAND: %04x (???)\n",
 		       card->name, pci_command);
 		deinit_card(card);
 		return (-1);
 	}
 	pci_command |= (PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 	if (pci_write_config_word(card->pcidev, PCI_COMMAND, pci_command)) {
-		printk("%s: can't write PCI_COMMAND.\n", card->name);
+		printk(KERN_ERR "%s: can't write PCI_COMMAND.\n", card->name);
 		deinit_card(card);
 		return -1;
 	}
@@ -3684,19 +3684,19 @@ idt77252_init_one(struct pci_dev *pcidev
 
 
 	if ((err = pci_enable_device(pcidev))) {
-		printk("idt77252: can't enable PCI device at %s\n", pci_name(pcidev));
+		printk(KERN_ERR "idt77252: can't enable PCI device at %s\n", pci_name(pcidev));
 		return err;
 	}
 
 	if (pci_read_config_word(pcidev, PCI_REVISION_ID, &revision)) {
-		printk("idt77252-%d: can't read PCI_REVISION_ID\n", index);
+		printk(KERN_ERR "idt77252-%d: can't read PCI_REVISION_ID\n", index);
 		err = -ENODEV;
 		goto err_out_disable_pdev;
 	}
 
 	card = kmalloc(sizeof(struct idt77252_dev), GFP_KERNEL);
 	if (!card) {
-		printk("idt77252-%d: can't allocate private data\n", index);
+		printk(KERN_ERR "idt77252-%d: can't allocate private data\n", index);
 		err = -ENOMEM;
 		goto err_out_disable_pdev;
 	}
@@ -3723,20 +3723,20 @@ idt77252_init_one(struct pci_dev *pcidev
 	/* Do the I/O remapping... */
 	card->membase = ioremap(membase, 1024);
 	if (!card->membase) {
-		printk("%s: can't ioremap() membase\n", card->name);
+		printk(KERN_ERR "%s: can't ioremap() membase\n", card->name);
 		err = -EIO;
 		goto err_out_free_card;
 	}
 
 	if (idt77252_preset(card)) {
-		printk("%s: preset failed\n", card->name);
+		printk(KERN_ERR "%s: preset failed\n", card->name);
 		err = -EIO;
 		goto err_out_iounmap;
 	}
 
 	dev = atm_dev_register("idt77252", &idt77252_ops, -1, NULL);
 	if (!dev) {
-		printk("%s: can't register atm device\n", card->name);
+		printk(KERN_ERR "%s: can't register atm device\n", card->name);
 		err = -EIO;
 		goto err_out_iounmap;
 	}
@@ -3746,7 +3746,7 @@ idt77252_init_one(struct pci_dev *pcidev
 #ifdef	CONFIG_ATM_IDT77252_USE_SUNI
 	suni_init(dev);
 	if (!dev->phy) {
-		printk("%s: can't init SUNI\n", card->name);
+		printk(KERN_ERR "%s: can't init SUNI\n", card->name);
 		err = -EIO;
 		goto err_out_deinit_card;
 	}
@@ -3757,19 +3757,19 @@ idt77252_init_one(struct pci_dev *pcidev
 	for (i = 0; i < 4; i++) {
 		card->fbq[i] = ioremap(srambase | 0x200000 | (i << 18), 4);
 		if (!card->fbq[i]) {
-			printk("%s: can't ioremap() FBQ%d\n", card->name, i);
+			printk(KERN_ERR "%s: can't ioremap() FBQ%d\n", card->name, i);
 			err = -EIO;
 			goto err_out_deinit_card;
 		}
 	}
 
-	printk("%s: ABR SAR (Rev %c): MEM %08lx SRAM %08lx [%u KB]\n",
+	printk(KERN_INFO "%s: ABR SAR (Rev %c): MEM %08lx SRAM %08lx [%u KB]\n",
 	       card->name, ((revision > 1) && (revision < 25)) ?
 	       'A' + revision - 1 : '?', membase, srambase,
 	       card->sramsize / 1024);
 
 	if (init_card(dev)) {
-		printk("%s: init_card failed\n", card->name);
+		printk(KERN_ERR "%s: init_card failed\n", card->name);
 		err = -EIO;
 		goto err_out_deinit_card;
 	}
@@ -3782,7 +3782,7 @@ idt77252_init_one(struct pci_dev *pcidev
 		dev->phy->start(dev);
 
 	if (idt77252_dev_open(card)) {
-		printk("%s: dev_open failed\n", card->name);
+		printk(KERN_ERR "%s: dev_open failed\n", card->name);
 		err = -EIO;
 		goto err_out_stop;
 	}
@@ -3830,7 +3830,7 @@ static int __init idt77252_init(void)
 {
 	struct sk_buff *skb;
 
-	printk("%s: at %p\n", __FUNCTION__, idt77252_init);
+	printk(KERN_DEBUG "%s: at %p\n", __FUNCTION__, idt77252_init);
 
 	if (sizeof(skb->cb) < sizeof(struct atm_skb_data) +
 			      sizeof(struct idt77252_skb_prv)) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
