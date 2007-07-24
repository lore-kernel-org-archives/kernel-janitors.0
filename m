From: Ravid Baruch Naali <ravid@codefidence.com>
Date: Tue, 24 Jul 2007 12:37:51 +0000
Subject: [KJ][PATCH]dev->mem_start default value (~0) test (final go)
Message-Id: <1185280671.11599.8.camel@crusaders>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46A5C2FE.6040602@codefidence.com>
In-Reply-To: <46A5C2FE.6040602@codefidence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch is now inserted as a text file (using Evolution), I hope
that's acceptable.
This patch applies to all the directory: drivers/net in which I've
checked and changed every check for the dev->mem_start = 0 to also
check for the default value hich is ~0.


diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/3c503.c ./drivers/net/3c503.c
--- ../vanilla/linux-2.6.22.1/drivers/net/3c503.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/3c503.c	2007-07-24 10:48:55.000000000 +0300
@@ -290,7 +290,8 @@ el2_probe1(struct net_device *dev, int i
 	}
 #endif  /* EL2MEMTEST */
 
-	if (dev->mem_start)
+	/*dev->mem_start can also be ~0 which is the default*/
+	if (dev->mem_start && dev->mem_start != ~0)
 		dev->mem_end = dev->mem_start + EL2_MEMSIZE;
 
 	if (wordlength) {	/* No Tx pages to skip over to get to Rx */
@@ -347,7 +348,8 @@ el2_probe1(struct net_device *dev, int i
     if (retval)
 	goto out1;
 
-    if (dev->mem_start)
+    /*dev->mem_start can also be ~0 which is the default*/
+    if (dev->mem_start && dev->mem_start != ~0)
 	printk("%s: %s - %dkB RAM, 8kB shared mem window at %#6lx-%#6lx.\n",
 		dev->name, ei_status.name, (wordlength+1)<<3,
 		dev->mem_start, dev->mem_end-1);
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/3c505.c ./drivers/net/3c505.c
--- ../vanilla/linux-2.6.22.1/drivers/net/3c505.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/3c505.c	2007-07-24 11:03:35.000000000 +0300
@@ -1526,7 +1526,8 @@ static int __init elplus_setup(struct ne
 
 	/* find a DMA channel */
 	if (!dev->dma) {
-		if (dev->mem_start) {
+		/*dev->mem_start can also be ~0 which is the default*/
+		if (dev->mem_start && dev->mem_start != ~0) {
 			dev->dma = dev->mem_start & 7;
 		}
 		else {
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/3c59x.c ./drivers/net/3c59x.c
--- ../vanilla/linux-2.6.22.1/drivers/net/3c59x.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/3c59x.c	2007-07-24 11:03:07.000000000 +0300
@@ -1040,7 +1040,8 @@ static int __devinit vortex_probe1(struc
 	option = global_options;
 
 	/* The lower four bits are the media type. */
-	if (dev->mem_start) {
+	/*dev->mem_start can also be ~0 which is the default*/
+	if (dev->mem_start && dev->mem_start != ~0) {
 		/*
 		 * The 'options' param is passed in as the third arg to the
 		 * LILO 'ether=' argument for non-modular use
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/ac3200.c ./drivers/net/ac3200.c
--- ../vanilla/linux-2.6.22.1/drivers/net/ac3200.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/ac3200.c	2007-07-24 11:01:35.000000000 +0300
@@ -204,7 +204,8 @@ static int __init ac_probe1(int ioaddr, 
 	dev->base_addr = ioaddr;
 
 #ifdef notyet
-	if (dev->mem_start)	{		/* Override the value from the board. */
+	/*dev->mem_start can also be ~0 which is the default*/
+	if (dev->mem_start && dev->mem_start != ~0) {	/* Override the value
from the board. */
 		for (i = 0; i < 7; i++)
 			if (addrmap[i] = dev->mem_start)
 				break;
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/depca.c ./drivers/net/depca.c
--- ../vanilla/linux-2.6.22.1/drivers/net/depca.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/depca.c	2007-07-24 11:10:56.000000000 +0300
@@ -604,8 +604,8 @@ static int __init depca_hw_init (struct 
 
 	lp = (struct depca_private *) dev->priv;
 	mem_start = lp->mem_start;
-
-	if (!mem_start || lp->adapter < DEPCA || lp->adapter >=unknown)
+	/*mem_start can also be ~0 which is the default*/
+	if (!mem_start || mem_start = ~0 || lp->adapter < DEPCA ||
lp->adapter >=unknown)
 		return -ENXIO;
 
 	printk ("%s: %s at 0x%04lx",
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/e2100.c ./drivers/net/e2100.c
--- ../vanilla/linux-2.6.22.1/drivers/net/e2100.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/e2100.c	2007-07-24 11:13:30.000000000 +0300
@@ -243,7 +243,8 @@ static int __init e21_probe1(struct net_
 	/* Never map in the E21 shared memory unless you are actively using
it.
 	   Also, the shared memory has effective only one setting -- spread
all
 	   over the 128K region! */
-	if (dev->mem_start = 0)
+	/*mem_start default is ~0 so an extra check was added*/   
+	if (dev->mem_start = 0 || dev->mem_start = ~0 )
 		dev->mem_start = 0xd0000;
 
 	ei_status.mem = ioremap(dev->mem_start, 2*1024);
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/eepro100.c ./drivers/net/eepro100.c
--- ../vanilla/linux-2.6.22.1/drivers/net/eepro100.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/eepro100.c	2007-07-24 11:16:00.000000000 +0300
@@ -637,8 +637,9 @@ static int __devinit speedo_found1(struc
 
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
-
-	if (dev->mem_start > 0)
+	/* Since mem_start is unsigned long an extra check of the default
+	 * value (~0) should be added*/
+	if (dev->mem_start > 0 && dev->mem_start != ~0)
 		option = dev->mem_start;
 	else if (card_idx >= 0  &&  options[card_idx] >= 0)
 		option = options[card_idx];
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/epic100.c ./drivers/net/epic100.c
--- ../vanilla/linux-2.6.22.1/drivers/net/epic100.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/epic100.c	2007-07-24 11:16:58.000000000 +0300
@@ -384,8 +384,8 @@ static int __devinit epic_init_one (stru
 		goto err_out_unmap_tx;
 	ep->rx_ring = (struct epic_rx_desc *)ring_space;
 	ep->rx_ring_dma = ring_dma;
-
-	if (dev->mem_start) {
+	/*dev->mem_start can also be ~0 which is the default*/
+        if (dev->mem_start && dev->mem_start != ~0) {
 		option = dev->mem_start;
 		duplex = (dev->mem_start & 16) ? 1 : 0;
 	} else if (card_idx >= 0  &&  card_idx < MAX_UNITS) {
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/es3210.c ./drivers/net/es3210.c
--- ../vanilla/linux-2.6.22.1/drivers/net/es3210.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/es3210.c	2007-07-24 11:18:34.000000000 +0300
@@ -244,8 +244,8 @@ static int __init es_probe1(struct net_d
 		retval = -EAGAIN;
 		goto out;
 	}
-
-	if (dev->mem_start = 0) {
+	/*dev->mem_start can also be ~0 which is the default*/
+        if (dev->mem_start = 0 || dev->mem_start = ~0) {
 		unsigned char mem_enabled = inb(ioaddr + ES_CFG2) & 0xc0;
 		unsigned char mem_bits = inb(ioaddr + ES_CFG3) & 0x07;
 
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/fealnx.c ./drivers/net/fealnx.c
--- ../vanilla/linux-2.6.22.1/drivers/net/fealnx.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/fealnx.c	2007-07-24 11:24:47.000000000 +0300
@@ -618,7 +618,8 @@ static int __devinit fealnx_init_one(str
 	}
 	np->mii.phy_id = np->phys[0];
 
-	if (dev->mem_start)
+	/*dev->mem_start can also be ~0 which is the default*/
+        if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* The lower four bits are the media type. */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/hamachi.c ./drivers/net/hamachi.c
--- ../vanilla/linux-2.6.22.1/drivers/net/hamachi.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/hamachi.c	2007-07-24 11:25:25.000000000 +0300
@@ -655,7 +655,8 @@ static int __devinit hamachi_init_one (s
 
 	/* Check for options being passed in */
 	option = card_idx < MAX_UNITS ? options[card_idx] : 0;
-	if (dev->mem_start)
+	/*dev->mem_start can also be ~0 which is the default*/
+        if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* If the bus size is misidentified, do the following. */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/ibmlana.c ./drivers/net/ibmlana.c
--- ../vanilla/linux-2.6.22.1/drivers/net/ibmlana.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/ibmlana.c	2007-07-24 11:28:52.000000000 +0300
@@ -926,7 +926,8 @@ static int ibmlana_probe(struct net_devi
 		/* were we looking for something different ? */
 		if (dev->irq && dev->irq != irq)
 			continue;
-		if (dev->mem_start && dev->mem_start != base)
+		/* Adding an extra check on mem_start's default value (~0)*/
+		if (dev->mem_start && dev->mem_start != ~0 && dev->mem_start != base)
 			continue;
 		/* found something that matches */
 		break;
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/lne390.c ./drivers/net/lne390.c
--- ../vanilla/linux-2.6.22.1/drivers/net/lne390.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/lne390.c	2007-07-24 11:31:49.000000000 +0300
@@ -223,8 +223,9 @@ static int __init lne390_probe1(struct n
 		printk (" unable to get IRQ %d.\n", dev->irq);
 		return ret;
 	}
-
-	if (dev->mem_start = 0) {
+	/* dev->mem_start default value is ~0 therefore additional check was
+	 * added*/
+	if (dev->mem_start = 0 && dev->mem_start != ~0) {
 		unsigned char mem_reg = inb(ioaddr + LNE390_CFG2) & 0x07;
 
 		if (revision)	/* LNE390B */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/natsemi.c ./drivers/net/natsemi.c
--- ../vanilla/linux-2.6.22.1/drivers/net/natsemi.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/natsemi.c	2007-07-24 11:35:48.000000000 +0300
@@ -906,7 +906,8 @@ static int __devinit natsemi_probe1 (str
 	}
 
 	option = find_cnt < MAX_UNITS ? options[find_cnt] : 0;
-	if (dev->mem_start)
+	/*Adding a check for dev->mem_start's default value ~0*/
+	if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* The lower four bits are the media type. */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/ni52.c ./drivers/net/ni52.c
--- ../vanilla/linux-2.6.22.1/drivers/net/ni52.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/ni52.c	2007-07-24 11:37:57.000000000 +0300
@@ -460,7 +460,8 @@ static int __init ni52_probe1(struct net
 		goto out;
 	}
 #else
-	if(dev->mem_start != 0) /* no auto-mem-probe */
+	/* Adding a check for dev->mem_start'd default value ~0*/
+	if(dev->mem_start != 0 && dev->mem_start != ~0) /* no auto-mem-probe
*/
 	{
 		size = 0x4000; /* check for 16K mem */
 		if(!check586(dev,(char *) dev->mem_start,size)) {
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/starfire.c ./drivers/net/starfire.c
--- ../vanilla/linux-2.6.22.1/drivers/net/starfire.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/starfire.c	2007-07-24 11:41:21.000000000 +0300
@@ -806,7 +806,8 @@ static int __devinit starfire_init_one(s
 	drv_flags = netdrv_tbl[chip_idx].drv_flags;
 
 	option = card_idx < MAX_UNITS ? options[card_idx] : 0;
-	if (dev->mem_start)
+	/* Adding a check for dev->mem_start's defult value ~0 */
+	if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* The lower four bits are the media type. */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/tlan.c ./drivers/net/tlan.c
--- ../vanilla/linux-2.6.22.1/drivers/net/tlan.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/tlan.c	2007-07-24 11:42:54.000000000 +0300
@@ -616,7 +616,8 @@ static int __devinit TLan_probe1(struct 
 	}
 
 	/* Kernel parameters */
-	if (dev->mem_start) {
+	/* Adding a check for dev->mem_start's default value ~0 */
+	if (dev->mem_start && dev->mem_start != ~0) {
 		priv->aui    = dev->mem_start & 0x01;
 		priv->duplex = ((dev->mem_start & 0x06) = 0x06) ? 0 :
(dev->mem_start & 0x06) >> 1;
 		priv->speed  = ((dev->mem_start & 0x18) = 0x18) ? 0 :
(dev->mem_start & 0x18) >> 3;
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/tulip/winbond-840.c ./drivers/net/tulip/winbond-840.c
--- ../vanilla/linux-2.6.22.1/drivers/net/tulip/winbond-840.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/tulip/winbond-840.c	2007-07-24 11:56:41.000000000
+0300
@@ -401,8 +401,8 @@ static int __devinit w840_probe1 (struct
 	np->base_addr = ioaddr;
 
 	pci_set_drvdata(pdev, dev);
-
-	if (dev->mem_start)
+	/*Adding a check for dev->mem_start's defualt value ~0 */
+	if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* The lower four bits are the media type. */
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/tulip/xircom_tulip_cb.c ./drivers/net/tulip/xircom_tulip_cb.c
--- ../vanilla/linux-2.6.22.1/drivers/net/tulip/xircom_tulip_cb.c
2007-07-10 21:56:30.000000000 +0300
+++ ./drivers/net/tulip/xircom_tulip_cb.c	2007-07-24 11:57:29.000000000
+0300
@@ -588,7 +588,8 @@ static int __devinit xircom_init_one(str
 		if (mtu[board_idx] > 0)
 			dev->mtu = mtu[board_idx];
 	}
-	if (dev->mem_start)
+	/*Adding a check for dev->mem_start's defualt value ~0 */
+	if (dev->mem_start && dev->mem_start != ~0)
 		tp->default_port = dev->mem_start;
 	if (tp->default_port) {
 		if (media_cap[tp->default_port] & MediaAlwaysFD)
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/wd.c ./drivers/net/wd.c
--- ../vanilla/linux-2.6.22.1/drivers/net/wd.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/wd.c	2007-07-24 11:44:42.000000000 +0300
@@ -239,7 +239,9 @@ static int __init wd_probe1(struct net_d
 	/* Allow a compile-time override.	 */
 	dev->mem_start = WD_SHMEM;
 #else
-	if (dev->mem_start = 0) {
+	/* dev->mem_start's default value is ~0 therefore an extra check was
+	 * added */ 
+	if (dev->mem_start = 0 || dev->mem_start = ~0) {
 		/* Sanity and old 8003 check */
 		int reg0 = inb(ioaddr);
 		if (reg0 = 0xff || reg0 = 0) {
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/wireless/arlan-main.c ./drivers/net/wireless/arlan-main.c
--- ../vanilla/linux-2.6.22.1/drivers/net/wireless/arlan-main.c
2007-07-10 21:56:30.000000000 +0300
+++ ./drivers/net/wireless/arlan-main.c	2007-07-24 10:13:19.000000000
+0300
@@ -1798,7 +1798,7 @@ struct net_device * __init arlan_probe(i
 		sprintf(dev->name, "eth%d", unit);
 		netdev_boot_setup_check(dev);
 		
-		if (dev->mem_start) {
+		if (dev->mem_start && dev->mem_start != ~0 ) {
 			if (arlan_probe_here(dev, dev->mem_start) = 0)
 				goto found;
 			goto not_found;
diff -uprN -X
Documentation/dontdiff ../vanilla/linux-2.6.22.1/drivers/net/yellowfin.c ./drivers/net/yellowfin.c
--- ../vanilla/linux-2.6.22.1/drivers/net/yellowfin.c	2007-07-10
21:56:30.000000000 +0300
+++ ./drivers/net/yellowfin.c	2007-07-24 11:46:06.000000000 +0300
@@ -448,8 +448,8 @@ static int __devinit yellowfin_init_one(
 		goto err_out_unmap_rx;
 	np->tx_status = (struct tx_status_words *)ring_space;
 	np->tx_status_dma = ring_dma;
-
-	if (dev->mem_start)
+	/* Adding a check for dev->mem_start's default value ~0 */
+	if (dev->mem_start && dev->mem_start != ~0)
 		option = dev->mem_start;
 
 	/* The lower four bits are the media type. */
 

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
