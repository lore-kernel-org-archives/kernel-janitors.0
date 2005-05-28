From: Reiner Herrmann <reiner@reiner-h.de>
Date: Sat, 28 May 2005 10:50:40 +0000
Subject: [KJ] init_module / cleanup_module cleanup
Message-Id: <42984D00.8070003@reiner-h.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010009090403080509040306"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010009090403080509040306
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi!

This is my first kernel patch, so I did a rather simple cleanup.
Some network-drivers still used the old
init_module() / cleanup_module() way of de-/registering
at the kernel.

Regards,
Reiner

--------------010009090403080509040306
Content-Type: text/x-patch;
 name="netdrivers_module_cleanup.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="netdrivers_module_cleanup.diff"

diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/3c501.c linux-2.6.12-rc5-kj/drivers/net/3c501.c
--- vanilla-2.6.12-rc5-kj/drivers/net/3c501.c	2005-03-02 08:37:30.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/3c501.c	2005-05-28 01:09:05.000000000 +0200
@@ -888,8 +888,6 @@ static struct ethtool_ops netdev_ethtool
 	.set_msglevel		= netdev_set_msglevel,
 };
 
-#ifdef MODULE
-
 static struct net_device *dev_3c501;
 
 module_param(io, int, 0);
@@ -898,7 +896,7 @@ MODULE_PARM_DESC(io, "EtherLink I/O base
 MODULE_PARM_DESC(irq, "EtherLink IRQ number");
 
 /**
- * init_module:
+ * el_init_module:
  *
  * When the driver is loaded as a module this function is called. We fake up
  * a device structure with the base I/O and interrupt set as if it were being
@@ -909,7 +907,7 @@ MODULE_PARM_DESC(irq, "EtherLink IRQ num
  * here also causes the module to be unloaded
  */
  
-int init_module(void)
+static int __init el_init_module(void)
 {
 	dev_3c501 = el1_probe(-1);
 	if (IS_ERR(dev_3c501))
@@ -918,13 +916,13 @@ int init_module(void)
 }
 
 /**
- * cleanup_module:
+ * el_cleanup_module:
  * 
  * The module is being unloaded. We unhook our network device from the system
  * and then free up the resources we took when the card was found.
  */
  
-void cleanup_module(void)
+static void __exit el_cleanup_module(void)
 {
 	struct net_device *dev = dev_3c501;
 	unregister_netdev(dev);
@@ -932,7 +930,8 @@ void cleanup_module(void)
 	free_netdev(dev);
 }
 
-#endif /* MODULE */
+module_init(el_init_module)
+module_exit(el_cleanup_module)
 
 MODULE_AUTHOR("Donald Becker, Alan Cox");
 MODULE_DESCRIPTION("Support for the ancient 3Com 3c501 ethernet card");
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/3c507.c linux-2.6.12-rc5-kj/drivers/net/3c507.c
--- vanilla-2.6.12-rc5-kj/drivers/net/3c507.c	2005-03-02 08:38:17.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/3c507.c	2005-05-28 00:09:39.000000000 +0200
@@ -925,14 +925,13 @@ static struct ethtool_ops netdev_ethtool
 	.set_msglevel		= netdev_set_msglevel,
 };
 
-#ifdef MODULE
 static struct net_device *dev_3c507;
 module_param(io, int, 0);
 module_param(irq, int, 0);
 MODULE_PARM_DESC(io, "EtherLink16 I/O base address");
 MODULE_PARM_DESC(irq, "(ignored)");
 
-int init_module(void)
+static int __init netdev_init_module(void)
 {
 	if (io == 0)
 		printk("3c507: You should not use auto-probing with insmod!\n");
@@ -940,8 +939,7 @@ int init_module(void)
 	return IS_ERR(dev_3c507) ? PTR_ERR(dev_3c507) : 0;
 }
 
-void
-cleanup_module(void)
+static void __exit netdev_cleanup_module(void)
 {
 	struct net_device *dev = dev_3c507;
 	unregister_netdev(dev);
@@ -950,10 +948,11 @@ cleanup_module(void)
 	release_region(dev->base_addr, EL16_IO_EXTENT);
 	free_netdev(dev);
 }
-#endif /* MODULE */
+
 MODULE_LICENSE("GPL");
+module_init(netdev_init_module)
+module_exit(netdev_cleanup_module)
 
-
 /*
  * Local variables:
  *  compile-command: "gcc -D__KERNEL__ -I/usr/src/linux/net/inet -I/usr/src/linux/drivers/net -Wall -Wstrict-prototypes -O6 -m486 -c 3c507.c"
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/3c523.c linux-2.6.12-rc5-kj/drivers/net/3c523.c
--- vanilla-2.6.12-rc5-kj/drivers/net/3c523.c	2005-03-02 08:38:38.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/3c523.c	2005-05-27 23:53:09.000000000 +0200
@@ -1263,20 +1263,18 @@ static struct ethtool_ops netdev_ethtool
 	.get_drvinfo		= netdev_get_drvinfo,
 };
 
-#ifdef MODULE
-
 /* Increase if needed ;) */
 #define MAX_3C523_CARDS 4
 
 static struct net_device *dev_elmc[MAX_3C523_CARDS];
-static int irq[MAX_3C523_CARDS];
-static int io[MAX_3C523_CARDS];
+static int irq[MAX_3C523_CARDS] __initdata;
+static int io[MAX_3C523_CARDS] __initdata;
 module_param_array(irq, int, NULL, 0);
 module_param_array(io, int, NULL, 0);
 MODULE_PARM_DESC(io, "EtherLink/MC I/O base address(es)");
 MODULE_PARM_DESC(irq, "EtherLink/MC IRQ number(s)");
 
-int init_module(void)
+static int __init netdev_init_module(void)
 {
 	int this_dev,found = 0;
 
@@ -1307,7 +1305,7 @@ int init_module(void)
 	} else return 0;
 }
 
-void cleanup_module(void)
+static void __exit netdev_cleanup_module(void)
 {
 	int this_dev;
 	for (this_dev=0; this_dev<MAX_3C523_CARDS; this_dev++) {
@@ -1320,4 +1318,5 @@ void cleanup_module(void)
 	}
 }
 
-#endif				/* MODULE */
+module_init(netdev_init_module)
+module_exit(netdev_exit_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/3c527.c linux-2.6.12-rc5-kj/drivers/net/3c527.c
--- vanilla-2.6.12-rc5-kj/drivers/net/3c527.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/3c527.c	2005-05-27 23:49:01.000000000 +0200
@@ -1634,19 +1634,17 @@ static struct ethtool_ops netdev_ethtool
 	.set_msglevel		= netdev_set_msglevel,
 };
 
-#ifdef MODULE
-
 static struct net_device *this_device;
 
 /**
- *	init_module		-	entry point
+ *	netdev_init_module		-	entry point
  *
  *	Probe and locate a 3c527 card. This really should probe and locate
  *	all the 3c527 cards in the machine not just one of them. Yes you can
  *	insmod multiple modules for now but it's a hack.
  */
 
-int init_module(void)
+static int __init netdev_init_module(void)
 {
 	this_device = mc32_probe(-1);
 	if (IS_ERR(this_device))
@@ -1655,7 +1653,7 @@ int init_module(void)
 }
 
 /**
- *	cleanup_module	-	free resources for an unload
+ *	netdev_cleanup_module	-	free resources for an unload
  *
  *	Unloading time. We release the MCA bus resources and the interrupt
  *	at which point everything is ready to unload. The card must be stopped
@@ -1665,11 +1663,12 @@ int init_module(void)
  *	transmit operations are allowed to start scribbling into memory.
  */
 
-void cleanup_module(void)
+static void __exit netdev_cleanup_module(void)
 {
 	unregister_netdev(this_device);
 	cleanup_card(this_device);
 	free_netdev(this_device);
 }
 
-#endif /* MODULE */
+module_init(netdev_init_module)
+module_exit(netdev_exit_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/82596.c linux-2.6.12-rc5-kj/drivers/net/82596.c
--- vanilla-2.6.12-rc5-kj/drivers/net/82596.c	2005-03-02 08:38:13.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/82596.c	2005-05-28 00:16:42.000000000 +0200
@@ -1130,8 +1130,8 @@ static void print_eth(unsigned char *add
 	printk(" %02X%02X, %s\n", add[12], add[13], str);
 }
 
-static int io = 0x300;
-static int irq = 10;
+static int io __initdata = 0x300;
+static int irq __initdata = 10;
 
 struct net_device * __init i82596_probe(int unit)
 {
@@ -1568,7 +1568,6 @@ static void set_multicast_list(struct ne
 	}
 }
 
-#ifdef MODULE
 static struct net_device *dev_82596;
 
 #ifdef ENABLE_APRICOT
@@ -1576,11 +1575,11 @@ module_param(irq, int, 0);
 MODULE_PARM_DESC(irq, "Apricot IRQ number");
 #endif
 
-static int debug = -1;
+static int debug __initdata = -1;
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "i82596 debug mask");
 
-int init_module(void)
+static int __init i596_init_module(void)
 {
 	if (debug >= 0)
 		i596_debug = debug;
@@ -1590,7 +1589,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit i596_cleanup_module(void)
 {
 	unregister_netdev(dev_82596);
 #ifdef __mc68000__
@@ -1609,8 +1608,9 @@ void cleanup_module(void)
 	free_netdev(dev_82596);
 }
 
-#endif				/* MODULE */
-
+module_init(i596_init_module)
+module_exit(i596_cleanup_module)
+
 /*
  * Local variables:
  *  compile-command: "gcc -D__KERNEL__ -I/usr/src/linux/net/inet -Wall -Wstrict-prototypes -O6 -m486 -c 82596.c"
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/8390.c linux-2.6.12-rc5-kj/drivers/net/8390.c
--- vanilla-2.6.12-rc5-kj/drivers/net/8390.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/8390.c	2005-05-27 23:47:17.000000000 +0200
@@ -1115,16 +1115,16 @@ EXPORT_SYMBOL(ei_poll);
 EXPORT_SYMBOL(NS8390_init);
 EXPORT_SYMBOL(__alloc_ei_netdev);
 
-#if defined(MODULE)
-
-int init_module(void)
+static int __init NS8390_init_module(void)
 {
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit NS8390_cleanup_module(void)
 {
 }
 
-#endif /* MODULE */
+module_init(NS8390_init_module)
+module_exit(NS8390_cleanup_module)
+
 MODULE_LICENSE("GPL");
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/apne.c linux-2.6.12-rc5-kj/drivers/net/apne.c
--- vanilla-2.6.12-rc5-kj/drivers/net/apne.c	2005-05-28 00:28:08.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/apne.c	2005-05-27 23:02:38.000000000 +0200
@@ -565,10 +565,9 @@ static irqreturn_t apne_interrupt(int ir
     return IRQ_HANDLED;
 }
 
-#ifdef MODULE
 static struct net_device *apne_dev;
 
-int init_module(void)
+static int __init apne_init_module(void)
 {
 	apne_dev = apne_probe(-1);
 	if (IS_ERR(apne_dev))
@@ -576,7 +575,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit apne_cleanup_module(void)
 {
 	unregister_netdev(apne_dev);
 
@@ -591,8 +590,6 @@ void cleanup_module(void)
 	free_netdev(apne_dev);
 }
 
-#endif
-
 static int init_pcmcia(void)
 {
 	u_char config;
@@ -636,3 +633,6 @@ static int init_pcmcia(void)
 }
 
 MODULE_LICENSE("GPL");
+module_init(apne_init_module)
+module_exit(apne_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/appletalk/cops.c linux-2.6.12-rc5-kj/drivers/net/appletalk/cops.c
--- vanilla-2.6.12-rc5-kj/drivers/net/appletalk/cops.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/appletalk/cops.c	2005-05-28 00:54:43.000000000 +0200
@@ -1023,7 +1023,6 @@ static struct net_device_stats *cops_get
         return &lp->stats;
 }
 
-#ifdef MODULE
 static struct net_device *cops_dev;
 
 MODULE_LICENSE("GPL");
@@ -1031,7 +1030,7 @@ module_param(io, int, 0);
 module_param(irq, int, 0);
 module_param(board_type, int, 0);
 
-int init_module(void)
+static int __init cops_init_module(void)
 {
 	if (io == 0)
 		printk(KERN_WARNING "%s: You shouldn't autoprobe with insmod\n",
@@ -1042,13 +1041,14 @@ int init_module(void)
         return 0;
 }
 
-void cleanup_module(void)
+static void __exit cops_cleanup_module(void)
 {
 	unregister_netdev(cops_dev);
 	cleanup_card(cops_dev);
 	free_netdev(cops_dev);
 }
-#endif /* MODULE */
+module_init(cops_init_module)
+module_exit(cops_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/arcnet/capmode.c linux-2.6.12-rc5-kj/drivers/net/arcnet/capmode.c
--- vanilla-2.6.12-rc5-kj/drivers/net/arcnet/capmode.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/arcnet/capmode.c	2005-05-28 00:52:16.000000000 +0200
@@ -78,23 +78,21 @@ void arcnet_cap_init(void)
 }
 
 
-#ifdef MODULE
-
-int __init init_module(void)
+static int __init capmode_init_module(void)
 {
 	printk(VERSION);
 	arcnet_cap_init();
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit capmode_cleanup_module(void)
 {
 	arcnet_unregister_proto(&capmode_proto);
 }
 
 MODULE_LICENSE("GPL");
-#endif				/* MODULE */
-
+module_init(capmode_init_module)
+module_exit(capmode_cleanup_module)
 
 
 /* packet receiver */
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/arcnet/com20020.c linux-2.6.12-rc5-kj/drivers/net/arcnet/com20020.c
--- vanilla-2.6.12-rc5-kj/drivers/net/arcnet/com20020.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/arcnet/com20020.c	2005-05-28 00:50:10.000000000 +0200
@@ -337,21 +337,21 @@ static void com20020_set_mc_list(struct 
 	}
 }
 
-#ifdef MODULE
-
 EXPORT_SYMBOL(com20020_check);
 EXPORT_SYMBOL(com20020_found);
 
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init com20020_init_module(void)
 {
 	BUGLVL(D_NORMAL) printk(VERSION);
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit com20020_cleanup_module(void)
 {
 }
 
-#endif				/* MODULE */
+module_init(com20020_init_module)
+module_exit(com20020_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/at1700.c linux-2.6.12-rc5-kj/drivers/net/at1700.c
--- vanilla-2.6.12-rc5-kj/drivers/net/at1700.c	2005-03-02 08:38:07.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/at1700.c	2005-05-28 00:37:35.000000000 +0200
@@ -896,7 +896,6 @@ set_rx_mode(struct net_device *dev)
 	return;
 }
 
-#ifdef MODULE
 static struct net_device *dev_at1700;
 
 module_param(io, int, 0);
@@ -906,7 +905,7 @@ MODULE_PARM_DESC(io, "AT1700/FMV18X I/O 
 MODULE_PARM_DESC(irq, "AT1700/FMV18X IRQ number");
 MODULE_PARM_DESC(net_debug, "AT1700/FMV18X debug level (0-6)");
 
-int init_module(void)
+static int __init at1700_init_module(void)
 {
 	if (io == 0)
 		printk("at1700: You should not use auto-probing with insmod!\n");
@@ -916,16 +915,15 @@ int init_module(void)
 	return 0;
 }
 
-void
-cleanup_module(void)
+static void __exit at1700_cleanup_module(void)
 {
 	unregister_netdev(dev_at1700);
 	cleanup_card(dev_at1700);
 	free_netdev(dev_at1700);
 }
-#endif /* MODULE */
 MODULE_LICENSE("GPL");
-
+module_init(at1700_init_module)
+module_exit(at1700_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/atari_bionet.c linux-2.6.12-rc5-kj/drivers/net/atari_bionet.c
--- vanilla-2.6.12-rc5-kj/drivers/net/atari_bionet.c	2005-03-02 08:38:10.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/atari_bionet.c	2005-05-28 00:17:42.000000000 +0200
@@ -642,12 +642,9 @@ static struct net_device_stats *net_get_
 	return &lp->stats;
 }
 
-
-#ifdef MODULE
-
 static struct net_device *bio_dev;
 
-int init_module(void)
+static int __init bionet_init_module(void)
 {
 	bio_dev = bionet_probe(-1);
 	if (IS_ERR(bio_dev))
@@ -655,13 +652,15 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit bionet_cleanup_module(void)
 {
 	unregister_netdev(bio_dev);
 	free_netdev(bio_dev);
 }
 
-#endif /* MODULE */
+module_init(bionet_init_module)
+module_exit(bionet_cleanup_module)
+
 
 /* Local variables:
  *  compile-command: "gcc -D__KERNEL__ -I/usr/src/linux/include
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/atarilance.c linux-2.6.12-rc5-kj/drivers/net/atarilance.c
--- vanilla-2.6.12-rc5-kj/drivers/net/atarilance.c	2005-03-02 08:38:37.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/atarilance.c	2005-05-28 00:01:09.000000000 +0200
@@ -1176,11 +1176,9 @@ static int lance_set_mac_address( struct
 	return( 0 );
 }
 
-
-#ifdef MODULE
 static struct net_device *atarilance_dev;
 
-int init_module(void)
+static int __init lance_init_module(void)
 {
 	atarilance_dev = atarilance_probe(-1);
 	if (IS_ERR(atarilance_dev))
@@ -1188,15 +1186,15 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit lance_cleanup_module(void)
 {
 	unregister_netdev(atarilance_dev);
 	free_irq(atarilance_dev->irq, atarilance_dev);
 	free_netdev(atarilance_dev);
 }
 
-#endif /* MODULE */
-
+module_init(lance_init_module)
+module_exit(lance_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/atari_pamsnet.c linux-2.6.12-rc5-kj/drivers/net/atari_pamsnet.c
--- vanilla-2.6.12-rc5-kj/drivers/net/atari_pamsnet.c	2005-03-02 08:37:55.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/atari_pamsnet.c	2005-05-28 00:41:44.000000000 +0200
@@ -863,12 +863,9 @@ static struct net_device_stats *net_get_
 	return &lp->stats;
 }
 
-
-#ifdef MODULE
-
 static struct net_device *pam_dev;
 
-int init_module(void)
+static int __init pamsnet_init_module(void)
 {
 	pam_dev = pamsnet_probe(-1);
 	if (IS_ERR(pam_dev))
@@ -876,13 +873,14 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit pamsnet_cleanup_module(void)
 {
 	unregister_netdev(pam_dev);
 	free_netdev(pam_dev);
 }
 
-#endif /* MODULE */
+module_init(pamsnet_init_module)
+module_exit(pamsnet_cleanup_module)
 
 /* Local variables:
  *  compile-command: "gcc -D__KERNEL__ -I/usr/src/linux/include
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/cs89x0.c linux-2.6.12-rc5-kj/drivers/net/cs89x0.c
--- vanilla-2.6.12-rc5-kj/drivers/net/cs89x0.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/cs89x0.c	2005-05-27 23:44:44.000000000 +0200
@@ -1691,8 +1691,6 @@ static int set_mac_address(struct net_de
 	return 0;
 }
 
-#ifdef MODULE
-
 static struct net_device *dev_cs89x0;
 
 /*
@@ -1700,15 +1698,15 @@ static struct net_device *dev_cs89x0;
  * avoid breaking someone's startup scripts 
  */
 
-static int io;
-static int irq;
-static int debug;
-static char media[8];
-static int duplex=-1;
-
-static int use_dma;			/* These generate unused var warnings if ALLOW_DMA = 0 */
-static int dma;
-static int dmasize=16;			/* or 64 */
+static int io __initdata;
+static int irq __initdata;
+static int debug __initdata;
+static char media[8] __initdata;
+static int duplex __initdata = -1;
+
+static int use_dma __initdata;			/* These generate unused var warnings if ALLOW_DMA = 0 */
+static int dma __initdata;
+static int dmasize __initdata = 16;		/* or 64 */
 
 module_param(io, int, 0);
 module_param(irq, int, 0);
@@ -1768,8 +1766,8 @@ MODULE_LICENSE("GPL");
 
 */
 
-int
-init_module(void)
+static int __init
+net_init_module(void)
 {
 	struct net_device *dev = alloc_etherdev(sizeof(struct net_local));
 	struct net_local *lp;
@@ -1845,16 +1843,18 @@ out:
 	return ret;
 }
 
-void
-cleanup_module(void)
+static void __exit
+net_cleanup_module(void)
 {
 	unregister_netdev(dev_cs89x0);
 	outw(PP_ChipID, dev_cs89x0->base_addr + ADD_PORT);
 	release_region(dev_cs89x0->base_addr, NETCARD_IO_EXTENT);
 	free_netdev(dev_cs89x0);
 }
-#endif /* MODULE */
-
+
+module_init(net_init_module)
+module_exit(net_cleanup_module)
+
 /*
  * Local variables:
  *  version-control: t
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/de620.c linux-2.6.12-rc5-kj/drivers/net/de620.c
--- vanilla-2.6.12-rc5-kj/drivers/net/de620.c	2005-03-02 08:38:09.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/de620.c	2005-05-28 00:25:19.000000000 +0200
@@ -1009,10 +1009,10 @@ static int __init read_eeprom(struct net
  * Loadable module skeleton
  *
  */
-#ifdef MODULE
+
 static struct net_device *de620_dev;
 
-int init_module(void)
+static int __init de620_init_module(void)
 {
 	de620_dev = de620_probe(-1);
 	if (IS_ERR(de620_dev))
@@ -1020,16 +1020,17 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit de620_cleanup_module(void)
 {
 	unregister_netdev(de620_dev);
 	release_region(de620_dev->base_addr, 3);
 	free_netdev(de620_dev);
 }
-#endif /* MODULE */
+
 MODULE_LICENSE("GPL");
+module_init(de620_init_module)
+module_exit(de620_cleanup_module)
 
-
 /*
  * (add '-DMODULE' when compiling as loadable module)
  *
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/eexpress.c linux-2.6.12-rc5-kj/drivers/net/eexpress.c
--- vanilla-2.6.12-rc5-kj/drivers/net/eexpress.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/eexpress.c	2005-05-27 23:27:55.000000000 +0200
@@ -1683,13 +1683,11 @@ eexp_set_multicast(struct net_device *de
  * MODULE stuff
  */
 
-#ifdef MODULE
-
 #define EEXP_MAX_CARDS     4    /* max number of cards to support */
 
 static struct net_device *dev_eexp[EEXP_MAX_CARDS];
-static int irq[EEXP_MAX_CARDS];
-static int io[EEXP_MAX_CARDS];
+static int irq[EEXP_MAX_CARDS] __initdata;
+static int io[EEXP_MAX_CARDS] __initdata;
 
 module_param_array(io, int, NULL, 0);
 module_param_array(irq, int, NULL, 0);
@@ -1702,7 +1700,7 @@ MODULE_LICENSE("GPL");
  * are specified, we verify and then use them.  If no parameters are given, we
  * autoprobe for one card only.
  */
-int init_module(void)
+static int __init eexp_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -1730,7 +1728,7 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void cleanup_module(void)
+static void __exit eexp_cleanup_module(void)
 {
 	int this_dev;
 
@@ -1742,7 +1740,9 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif
+
+module_init(eexp_init_module)
+module_exit(eexp_cleanup_module)
 
 /*
  * Local Variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/eth16i.c linux-2.6.12-rc5-kj/drivers/net/eth16i.c
--- vanilla-2.6.12-rc5-kj/drivers/net/eth16i.c	2005-03-02 08:38:25.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/eth16i.c	2005-05-28 00:07:48.000000000 +0200
@@ -1386,8 +1386,6 @@ static void eth16i_select_regbank(unsign
 	outb( ((data & 0xF3) | ( (banknbr & 0x03) << 2)), ioaddr + CONFIG_REG_1); 
 }
 
-#ifdef MODULE
-
 static ushort eth16i_parse_mediatype(const char* s)
 {
 	if(!s)
@@ -1408,12 +1406,12 @@ static ushort eth16i_parse_mediatype(con
 #define MAX_ETH16I_CARDS 4  /* Max number of Eth16i cards per module */
 
 static struct net_device *dev_eth16i[MAX_ETH16I_CARDS];
-static int io[MAX_ETH16I_CARDS];
+static int io[MAX_ETH16I_CARDS] __initdata;
 #if 0
-static int irq[MAX_ETH16I_CARDS];
+static int irq[MAX_ETH16I_CARDS] __initdata;
 #endif
-static char* mediatype[MAX_ETH16I_CARDS];
-static int debug = -1;
+static char* mediatype[MAX_ETH16I_CARDS] __initdata;
+static int debug __initdata = -1;
 
 MODULE_AUTHOR("Mika Kuoppala <miku@iki.fi>");
 MODULE_DESCRIPTION("ICL EtherTeam 16i/32 driver");
@@ -1434,7 +1432,7 @@ MODULE_PARM_DESC(mediatype, "eth16i medi
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "eth16i debug level (0-6)");
 
-int init_module(void)
+static int __init eth16i_init_module(void)
 {
 	int this_dev, found = 0;
 	struct net_device *dev;
@@ -1479,7 +1477,7 @@ int init_module(void)
 	return -ENXIO;
 }
 	
-void cleanup_module(void)
+static void __exit eth16i_cleanup_module(void)
 {
 	int this_dev;
 
@@ -1494,7 +1492,9 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(eth16i_init_module)
+module_exit(eth16i_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/fmv18x.c linux-2.6.12-rc5-kj/drivers/net/fmv18x.c
--- vanilla-2.6.12-rc5-kj/drivers/net/fmv18x.c	2005-03-02 08:37:48.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/fmv18x.c	2005-05-28 00:44:16.000000000 +0200
@@ -647,7 +647,6 @@ static void set_multicast_list(struct ne
 		outb(2, ioaddr + RX_MODE);	/* Disable promiscuous, use normal mode */
 }
 
-#ifdef MODULE
 static struct net_device *dev_fmv18x;
 
 MODULE_PARM(io, "i");
@@ -658,7 +657,7 @@ MODULE_PARM_DESC(irq, "FMV-18X IRQ numbe
 MODULE_PARM_DESC(net_debug, "FMV-18X debug level (0-1,5-6)");
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init fmv18x_init_module(void)
 {
 	if (io == 0)
 		printk("fmv18x: You should not use auto-probing with insmod!\n");
@@ -668,15 +667,16 @@ int init_module(void)
 	return 0;
 }
 
-void
-cleanup_module(void)
+static void __exit fmv18x_cleanup_module(void)
 {
 	unregister_netdev(dev_fmv18x);
 	free_irq(dev_fmv18x->irq, dev_fmv18x);
 	release_region(dev_fmv18x->base_addr, FMV18X_IO_EXTENT);
 	free_netdev(dev_fmv18x);
 }
-#endif /* MODULE */
+
+module_init(fmv18x_init_module)
+module_exit(fmv18x_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ibmlana.c linux-2.6.12-rc5-kj/drivers/net/ibmlana.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ibmlana.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/ibmlana.c	2005-05-27 23:18:58.000000000 +0200
@@ -1015,13 +1015,11 @@ static int ibmlana_probe(struct net_devi
  * modularization support
  * ------------------------------------------------------------------------ */
 
-#ifdef MODULE
-
 #define DEVMAX 5
 
 static struct net_device *moddevs[DEVMAX];
-static int irq;
-static int io;
+static int irq __initdata;
+static int io __initdata;
 
 module_param(irq, int, 0);
 module_param(io, int, 0);
@@ -1029,7 +1027,7 @@ MODULE_PARM_DESC(irq, "IBM LAN/A IRQ num
 MODULE_PARM_DESC(io, "IBM LAN/A I/O base address");
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init ibmlana_init_module(void)
 {
 	int z;
 
@@ -1059,7 +1057,7 @@ int init_module(void)
 	return (z > 0) ? 0 : -EIO;
 }
 
-void cleanup_module(void)
+static void __exit ibmlana_cleanup_module(void)
 {
 	int z;
 	for (z = 0; z < DEVMAX; z++) {
@@ -1077,4 +1075,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif				/* MODULE */
+
+module_init(ibmlana_init_module)
+module_exit(ibmlana_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/isa-skeleton.c linux-2.6.12-rc5-kj/drivers/net/isa-skeleton.c
--- vanilla-2.6.12-rc5-kj/drivers/net/isa-skeleton.c	2005-03-02 08:38:32.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/isa-skeleton.c	2005-05-28 00:03:40.000000000 +0200
@@ -664,16 +664,14 @@ set_multicast_list(struct net_device *de
 		outw(0, ioaddr);
 }
 
-#ifdef MODULE
-
 static struct net_device *this_device;
-static int io = 0x300;
-static int irq;
-static int dma;
-static int mem;
+static int io __initdata = 0x300;
+static int irq __initdata;
+static int dma __initdata;
+static int mem __initdata;
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init net_init_module(void)
 {
 	struct net_device *dev;
 	int result;
@@ -701,15 +699,15 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void
-cleanup_module(void)
+static void __exit net_cleanup_module(void)
 {
 	unregister_netdev(this_device);
 	cleanup_card(this_device);
 	free_netdev(this_device);
 }
 
-#endif /* MODULE */
+module_init(net_init_module)
+module_exit(net_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/lance.c linux-2.6.12-rc5-kj/drivers/net/lance.c
--- vanilla-2.6.12-rc5-kj/drivers/net/lance.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/lance.c	2005-05-27 23:20:17.000000000 +0200
@@ -307,7 +307,6 @@ static struct net_device_stats *lance_ge
 static void set_multicast_list(struct net_device *dev);
 static void lance_tx_timeout (struct net_device *dev);
 
-
 
 static void cleanup_card(struct net_device *dev)
 {
@@ -320,13 +319,12 @@ static void cleanup_card(struct net_devi
 	kfree(lp);
 }
 
-#ifdef MODULE
 #define MAX_CARDS		8	/* Max number of interfaces (cards) per module */
 
 static struct net_device *dev_lance[MAX_CARDS];
-static int io[MAX_CARDS];
-static int dma[MAX_CARDS];
-static int irq[MAX_CARDS];
+static int io[MAX_CARDS] __initdata;
+static int dma[MAX_CARDS] __initdata;
+static int irq[MAX_CARDS] __initdata;
 
 module_param_array(io, int, NULL, 0);
 module_param_array(dma, int, NULL, 0);
@@ -337,7 +335,7 @@ MODULE_PARM_DESC(dma, "LANCE/PCnet ISA D
 MODULE_PARM_DESC(irq, "LANCE/PCnet IRQ number (ignored for some devices)");
 MODULE_PARM_DESC(lance_debug, "LANCE/PCnet debug level (0-7)");
 
-int init_module(void)
+static int __init lance_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -370,7 +368,7 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void cleanup_module(void)
+static void __exit lance_cleanup_module(void)
 {
 	int this_dev;
 
@@ -383,8 +381,10 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
 MODULE_LICENSE("GPL");
+module_init(lance_init_module)
+module_exit(lance_cleanup_module)
 
 
 /* Starting in v2.1.*, the LANCE/PCnet probe is now similar to the other
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/lne390.c linux-2.6.12-rc5-kj/drivers/net/lne390.c
--- vanilla-2.6.12-rc5-kj/drivers/net/lne390.c	2005-03-02 08:38:26.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/lne390.c	2005-05-28 00:05:02.000000000 +0200
@@ -395,12 +395,11 @@ static int lne390_close(struct net_devic
 	return 0;
 }
 
-#ifdef MODULE
 #define MAX_LNE_CARDS	4	/* Max number of LNE390 cards per module */
 static struct net_device *dev_lne[MAX_LNE_CARDS];
-static int io[MAX_LNE_CARDS];
-static int irq[MAX_LNE_CARDS];
-static int mem[MAX_LNE_CARDS];
+static int io[MAX_LNE_CARDS] __initdata;
+static int irq[MAX_LNE_CARDS] __initdata;
+static int mem[MAX_LNE_CARDS] __initdata;
 
 module_param_array(io, int, NULL, 0);
 module_param_array(irq, int, NULL, 0);
@@ -411,7 +410,7 @@ MODULE_PARM_DESC(mem, "memory base addre
 MODULE_DESCRIPTION("Mylex LNE390A/B EISA Ethernet driver");
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init lne390_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -441,7 +440,7 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void cleanup_module(void)
+static void __exit lne390_cleanup_module(void)
 {
 	int this_dev;
 
@@ -454,5 +453,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(lne390_init_module)
+module_exit(lne390_cleanup_module)
 
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/mac8390.c linux-2.6.12-rc5-kj/drivers/net/mac8390.c
--- vanilla-2.6.12-rc5-kj/drivers/net/mac8390.c	2005-03-02 08:38:10.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/mac8390.c	2005-05-28 00:22:15.000000000 +0200
@@ -374,14 +374,13 @@ out:
 	return ERR_PTR(err);
 }
 
-#ifdef MODULE
 MODULE_AUTHOR("David Huggins-Daines <dhd@debian.org> and others");
 MODULE_DESCRIPTION("Macintosh NS8390-based Nubus Ethernet driver");
 MODULE_LICENSE("GPL");
 
 /* overkill, of course */
 static struct net_device *dev_mac8390[15];
-int init_module(void)
+static int __init mac8390_init_module(void)
 {
 	int i;
 	for (i = 0; i < 15; i++) {
@@ -397,7 +396,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit mac8390_cleanup_module(void)
 {
 	int i;
 	for (i = 0; i < 15; i++) {
@@ -409,7 +408,8 @@ void cleanup_module(void)
 	}
 }
 
-#endif /* MODULE */
+module_init(mac8390_init_module)
+module_exit(mac8390_cleanup_module)
 
 static int __init mac8390_initdev(struct net_device * dev, struct nubus_dev * ndev,
 			    enum mac8390_type type)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/mac89x0.c linux-2.6.12-rc5-kj/drivers/net/mac89x0.c
--- vanilla-2.6.12-rc5-kj/drivers/net/mac89x0.c	2005-03-02 08:38:09.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/mac89x0.c	2005-05-28 00:31:01.000000000 +0200
@@ -624,17 +624,15 @@ static int set_mac_address(struct net_de
 	return 0;
 }
 
-#ifdef MODULE
-
 static struct net_device *dev_cs89x0;
-static int debug;
+static int debug __initdata;
 
 MODULE_PARM(debug, "i");
 MODULE_PARM_DESC(debug, "CS89[02]0 debug level (0-5)");
 MODULE_LICENSE("GPL");
 
-int
-init_module(void)
+static int __init
+mac90x0_init_module(void)
 {
 	net_debug = debug;
         dev_cs89x0 = mac89x0_probe(-1);
@@ -645,14 +643,16 @@ init_module(void)
 	return 0;
 }
 
-void
-cleanup_module(void)
+static void __exit
+mac90x0cleanup_module(void)
 {
 	unregister_netdev(dev_cs89x0);
 	nubus_writew(0, dev_cs89x0->base_addr + ADD_PORT);
 	free_netdev(dev_cs89x0);
 }
-#endif /* MODULE */
+
+module_init(mac90x0_init_module)
+module_exit(mac90x0_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/mvme147.c linux-2.6.12-rc5-kj/drivers/net/mvme147.c
--- vanilla-2.6.12-rc5-kj/drivers/net/mvme147.c	2005-03-02 08:38:00.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/mvme147.c	2005-05-28 00:39:22.000000000 +0200
@@ -180,11 +180,10 @@ static int m147lance_close(struct net_de
 	return 0;
 }
 
-#ifdef MODULE
 MODULE_LICENSE("GPL");
 
 static struct net_device *dev_mvme147_lance;
-int init_module(void)
+static int __init m147lance_init_module(void)
 {
 	dev_mvme147_lance = mvme147lance_probe(-1);
 	if (IS_ERR(dev_mvme147_lance))
@@ -192,7 +191,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit m147lance_cleanup_module(void)
 {
 	struct m147lance_private *lp = dev_mvme147_lance->priv;
 	unregister_netdev(dev_mvme147_lance);
@@ -200,4 +199,5 @@ void cleanup_module(void)
 	free_netdev(dev_mvme147_lance);
 }
 
-#endif /* MODULE */
+module_init(m147lance_init_module)
+module_exit(m147lance_cleanup_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ne2.c linux-2.6.12-rc5-kj/drivers/net/ne2.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ne2.c	2005-05-28 00:28:08.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/ne2.c	2005-05-27 23:25:46.000000000 +0200
@@ -769,12 +769,11 @@ retry:
 }
 
 
-#ifdef MODULE
 #define MAX_NE_CARDS	4	/* Max number of NE cards per module */
 static struct net_device *dev_ne[MAX_NE_CARDS];
-static int io[MAX_NE_CARDS];
-static int irq[MAX_NE_CARDS];
-static int bad[MAX_NE_CARDS];	/* 0xbad = bad sig or no reset ack */
+static int io[MAX_NE_CARDS] __initdata;
+static int irq[MAX_NE_CARDS] __initdata;
+static int bad[MAX_NE_CARDS] __initdata;	/* 0xbad = bad sig or no reset ack */
 MODULE_LICENSE("GPL");
 
 module_param_array(io, int, NULL, 0);
@@ -786,7 +785,7 @@ MODULE_PARM_DESC(bad, "(ignored)");
 
 /* Module code fixed by David Weinehall */
 
-int init_module(void)
+static int __init ne_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -814,7 +813,7 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void cleanup_module(void)
+static void __exit ne_cleanup_module(void)
 {
 	int this_dev;
 
@@ -827,4 +826,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(ne_init_module)
+module_exit(ne_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ne.c linux-2.6.12-rc5-kj/drivers/net/ne.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ne.c	2005-05-28 00:28:08.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/ne.c	2005-05-27 23:25:24.000000000 +0200
@@ -793,13 +793,11 @@ retry:
 	return;
 }
 
-
-#ifdef MODULE
 #define MAX_NE_CARDS	4	/* Max number of NE cards per module */
 static struct net_device *dev_ne[MAX_NE_CARDS];
-static int io[MAX_NE_CARDS];
-static int irq[MAX_NE_CARDS];
-static int bad[MAX_NE_CARDS];	/* 0xbad = bad sig or no reset ack */
+static int io[MAX_NE_CARDS] __initdata;
+static int irq[MAX_NE_CARDS] __initdata;
+static int bad[MAX_NE_CARDS] __initdata;	/* 0xbad = bad sig or no reset ack */
 
 module_param_array(io, int, NULL, 0);
 module_param_array(irq, int, NULL, 0);
@@ -815,7 +813,7 @@ that the ne2k probe is the last 8390 bas
 is at boot) and so the probe will get confused by any other 8390 cards.
 ISA device autoprobes on a running machine are not recommended anyway. */
 
-int init_module(void)
+static int __init ne_init_module(void)
 {
 	int this_dev, found = 0;
 
@@ -847,7 +845,7 @@ int init_module(void)
 	return -ENODEV;
 }
 
-void cleanup_module(void)
+static void __exit ne_cleanup_module(void)
 {
 	int this_dev;
 
@@ -860,4 +858,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(ne_init_module)
+module_exit(ne_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ne-h8300.c linux-2.6.12-rc5-kj/drivers/net/ne-h8300.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ne-h8300.c	2005-05-28 00:28:08.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/ne-h8300.c	2005-05-27 23:24:54.000000000 +0200
@@ -593,13 +593,11 @@ retry:
 	return;
 }
 
-
-#ifdef MODULE
 #define MAX_NE_CARDS	1	/* Max number of NE cards per module */
 static struct net_device *dev_ne[MAX_NE_CARDS];
-static int io[MAX_NE_CARDS];
-static int irq[MAX_NE_CARDS];
-static int bad[MAX_NE_CARDS];	/* 0xbad = bad sig or no reset ack */
+static int io[MAX_NE_CARDS] __initdata;
+static int irq[MAX_NE_CARDS] __initdata;
+static int bad[MAX_NE_CARDS] __initdata;	/* 0xbad = bad sig or no reset ack */
 
 MODULE_PARM(io, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
 MODULE_PARM(irq, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
@@ -614,7 +612,7 @@ that the ne2k probe is the last 8390 bas
 is at boot) and so the probe will get confused by any other 8390 cards.
 ISA device autoprobes on a running machine are not recommended anyway. */
 
-int init_module(void)
+static int __init ne_init_module(void)
 {
 	int this_dev, found = 0;
 	int err;
@@ -655,7 +653,7 @@ int init_module(void)
 	return -ENODEV;
 }
 
-void cleanup_module(void)
+static void __exit ne_cleanup_module(void)
 {
 	int this_dev;
 
@@ -668,4 +666,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(ne_init_module)
+module_exit(ne_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ni5010.c linux-2.6.12-rc5-kj/drivers/net/ni5010.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ni5010.c	2005-03-02 08:38:08.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/ni5010.c	2005-05-28 00:34:50.000000000 +0200
@@ -763,7 +763,6 @@ static void ni5010_show_registers(struct
 	PRINTK3((KERN_DEBUG "%s: ISTAT %#2.2x\n", dev->name, inb(IE_ISTAT)));
 }
 
-#ifdef MODULE
 static struct net_device *dev_ni5010;
 
 MODULE_PARM(io, "i");
@@ -771,7 +770,7 @@ MODULE_PARM(irq, "i");
 MODULE_PARM_DESC(io, "ni5010 I/O base address");
 MODULE_PARM_DESC(irq, "ni5010 IRQ number");
 
-int init_module(void)
+static int __init ni5010_init_module(void)
 {
 	PRINTK2((KERN_DEBUG "%s: entering init_module\n", boardname));
 	/*
@@ -792,15 +791,16 @@ int init_module(void)
         return 0;
 }
 
-void cleanup_module(void)
+static void __exit ni5010_cleanup_module(void)
 {
 	PRINTK2((KERN_DEBUG "%s: entering cleanup_module\n", boardname));
 	unregister_netdev(dev_ni5010);
 	release_region(dev_ni5010->base_addr, NI5010_IO_EXTENT);
 	free_netdev(dev_ni5010);
 }
-#endif /* MODULE */
 MODULE_LICENSE("GPL");
+module_init(ni5010_init_module)
+module_exit(ni5010_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ni52.c linux-2.6.12-rc5-kj/drivers/net/ni52.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ni52.c	2005-03-02 08:38:10.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/ni52.c	2005-05-28 00:20:03.000000000 +0200
@@ -1311,7 +1311,6 @@ static void set_multicast_list(struct ne
 	netif_wake_queue(dev);
 }
 
-#ifdef MODULE
 static struct net_device *dev_ni52;
 
 module_param(io, int, 0);
@@ -1323,7 +1322,7 @@ MODULE_PARM_DESC(irq, "NI5210 IRQ number
 MODULE_PARM_DESC(memstart, "NI5210 memory base address,required");
 MODULE_PARM_DESC(memend, "NI5210 memory end address,required");
 
-int init_module(void)
+static int __init ni52_init_module(void)
 {
 	if(io <= 0x0 || !memend || !memstart || irq < 2) {
 		printk("ni52: Autoprobing not allowed for modules.\nni52: Set symbols 'io' 'irq' 'memstart' and 'memend'\n");
@@ -1335,13 +1334,12 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit ni52_cleanup_module(void)
 {
 	unregister_netdev(dev_ni52);
 	release_region(dev_ni52->base_addr, NI52_TOTAL_SIZE);
 	free_netdev(dev_ni52);
 }
-#endif /* MODULE */
 
 #if 0
 /*
@@ -1380,6 +1378,8 @@ void ni52_dump(struct net_device *dev,vo
 }
 #endif
 MODULE_LICENSE("GPL");
+module_init(ni52_init_module)
+module_exit(ni52_cleanup_module)
 
 /*
  * END: linux/drivers/net/ni52.c
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/ni65.c linux-2.6.12-rc5-kj/drivers/net/ni65.c
--- vanilla-2.6.12-rc5-kj/drivers/net/ni65.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/ni65.c	2005-05-27 23:09:56.000000000 +0200
@@ -1246,7 +1246,6 @@ static void set_multicast_list(struct ne
 	netif_wake_queue(dev);
 }
 
-#ifdef MODULE
 static struct net_device *dev_ni65;
 
 module_param(irq, int, 0);
@@ -1256,21 +1255,22 @@ MODULE_PARM_DESC(irq, "ni6510 IRQ number
 MODULE_PARM_DESC(io, "ni6510 I/O base address");
 MODULE_PARM_DESC(dma, "ni6510 ISA DMA channel (ignored for some cards)");
 
-int init_module(void)
+static int __init ni65_init_module(void)
 {
  	dev_ni65 = ni65_probe(-1);
 	return IS_ERR(dev_ni65) ? PTR_ERR(dev_ni65) : 0;
 }
 
-void cleanup_module(void)
+static void __exit ni65_cleanup_module(void)
 {
  	unregister_netdev(dev_ni65);
  	cleanup_card(dev_ni65);
  	free_netdev(dev_ni65);
 }
-#endif /* MODULE */
 
 MODULE_LICENSE("GPL");
+module_init(ni65_init_module)
+module_exit(ni65_cleanup_module)
 
 /*
  * END of ni65.c
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/seeq8005.c linux-2.6.12-rc5-kj/drivers/net/seeq8005.c
--- vanilla-2.6.12-rc5-kj/drivers/net/seeq8005.c	2005-03-02 08:38:17.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/seeq8005.c	2005-05-28 00:12:32.000000000 +0200
@@ -733,8 +733,6 @@ static void hardware_send_packet(struct 
 }
 
 
-#ifdef MODULE
-
 static struct net_device *dev_seeq;
 MODULE_LICENSE("GPL");
 module_param(io, int, 0);
@@ -742,7 +740,7 @@ module_param(irq, int, 0);
 MODULE_PARM_DESC(io, "SEEQ 8005 I/O base address");
 MODULE_PARM_DESC(irq, "SEEQ 8005 IRQ number");
 
-int init_module(void)
+static int __init seeq8005_init_module(void)
 {
 	dev_seeq = seeq8005_probe(-1);
 	if (IS_ERR(dev_seeq))
@@ -750,15 +748,16 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit seeq8005_cleanup_module(void)
 {
 	unregister_netdev(dev_seeq);
 	release_region(dev_seeq->base_addr, SEEQ8005_IO_EXTENT);
 	free_netdev(dev_seeq);
 }
 
-#endif /* MODULE */
-
+module_init(seeq8005_init_module)
+module_exit(seeq8005_cleanup_module)
+
 /*
  * Local variables:
  *  compile-command: "gcc -D__KERNEL__ -I/usr/src/linux/net/inet -Wall -Wstrict-prototypes -O6 -m486 -c skeleton.c"
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/sk_mca.c linux-2.6.12-rc5-kj/drivers/net/sk_mca.c
--- vanilla-2.6.12-rc5-kj/drivers/net/sk_mca.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/sk_mca.c	2005-05-27 23:08:08.000000000 +0200
@@ -1178,14 +1178,13 @@ struct net_device * __init skmca_probe(i
  * modularization support
  * ------------------------------------------------------------------------ */
 
-#ifdef MODULE
 MODULE_LICENSE("GPL");
 
 #define DEVMAX 5
 
 static struct net_device *moddevs[DEVMAX];
 
-int init_module(void)
+static int __init skmca_init_module(void)
 {
 	int z;
 
@@ -1201,7 +1200,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit skmca_cleanup_module(void)
 {
 	int z;
 
@@ -1214,4 +1213,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif				/* MODULE */
+
+module_init(skmca_init_module)
+module_exit(skmca_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/slhc.c linux-2.6.12-rc5-kj/drivers/net/slhc.c
--- vanilla-2.6.12-rc5-kj/drivers/net/slhc.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/slhc.c	2005-05-27 23:06:45.000000000 +0200
@@ -701,20 +701,17 @@ EXPORT_SYMBOL(slhc_compress);
 EXPORT_SYMBOL(slhc_uncompress);
 EXPORT_SYMBOL(slhc_toss);
 
-#ifdef MODULE
-
-int init_module(void)
+static int __init slhc_init_module(void)
 {
 	printk(KERN_INFO "CSLIP: code copyright 1989 Regents of the University of California\n");
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit slhc_cleanup_module(void)
 {
 	return;
 }
 
-#endif /* MODULE */
 #else /* CONFIG_INET */
 
 
@@ -766,3 +763,6 @@ EXPORT_SYMBOL(slhc_toss);
 
 #endif /* CONFIG_INET */
 MODULE_LICENSE("Dual BSD/GPL");
+module_init(slhc_init_module)
+module_exit(slhc_cleanup_module)
+
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/smc9194.c linux-2.6.12-rc5-kj/drivers/net/smc9194.c
--- vanilla-2.6.12-rc5-kj/drivers/net/smc9194.c	2005-03-02 08:38:17.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/smc9194.c	2005-05-28 00:11:23.000000000 +0200
@@ -1595,8 +1595,6 @@ static void smc_set_multicast_list(struc
 	}
 }
 
-#ifdef MODULE
-
 static struct net_device *devSMC9194;
 MODULE_LICENSE("GPL");
 
@@ -1607,7 +1605,7 @@ MODULE_PARM_DESC(io, "SMC 99194 I/O base
 MODULE_PARM_DESC(irq, "SMC 99194 IRQ number");
 MODULE_PARM_DESC(ifport, "SMC 99194 interface port (0-default, 1-TP, 2-AUI)");
 
-int init_module(void)
+static int __init smc_init_module(void)
 {
 	if (io == 0)
 		printk(KERN_WARNING
@@ -1620,7 +1618,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit smc_cleanup_module(void)
 {
 	unregister_netdev(devSMC9194);
 	free_irq(devSMC9194->irq, devSMC9194);
@@ -1628,4 +1626,5 @@ void cleanup_module(void)
 	free_netdev(devSMC9194);
 }
 
-#endif /* MODULE */
+module_init(smc_init_module)
+module_exit(smc_cleanup_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/smc-ultra32.c linux-2.6.12-rc5-kj/drivers/net/smc-ultra32.c
--- vanilla-2.6.12-rc5-kj/drivers/net/smc-ultra32.c	2005-05-28 00:27:42.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/smc-ultra32.c	2005-05-27 23:05:28.000000000 +0200
@@ -413,15 +413,14 @@ static void ultra32_block_output(struct 
 
 	memcpy_toio(xfer_start, buf, count);
 }
-
-#ifdef MODULE
+
 #define MAX_ULTRA32_CARDS   4	/* Max number of Ultra cards per module */
 static struct net_device *dev_ultra[MAX_ULTRA32_CARDS];
 
 MODULE_DESCRIPTION("SMC Ultra32 EISA ethernet driver");
 MODULE_LICENSE("GPL");
 
-int init_module(void)
+static int __init ultra32_init_module(void)
 {
 	int this_dev, found = 0;
 
@@ -437,7 +436,7 @@ int init_module(void)
 	return -ENXIO;
 }
 
-void cleanup_module(void)
+static void __exit ultra32_cleanup_module(void)
 {
 	int this_dev;
 
@@ -450,5 +449,7 @@ void cleanup_module(void)
 		}
 	}
 }
-#endif /* MODULE */
+
+module_init(ultra32_init_module)
+module_exit(ultra32_cleanup_module)
 
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/sun3lance.c linux-2.6.12-rc5-kj/drivers/net/sun3lance.c
--- vanilla-2.6.12-rc5-kj/drivers/net/sun3lance.c	2005-03-02 08:38:25.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/sun3lance.c	2005-05-28 00:05:55.000000000 +0200
@@ -940,11 +940,9 @@ static void set_multicast_list( struct n
 }
 
 
-#ifdef MODULE
-
 static struct net_device *sun3lance_dev;
 
-int init_module(void)
+static int __init lance_init_module(void)
 {
 	sun3lance_dev = sun3lance_probe(-1);
 	if (IS_ERR(sun3lance_dev))
@@ -952,7 +950,7 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit lance_cleanup_module(void)
 {
 	unregister_netdev(sun3lance_dev);
 #ifdef CONFIG_SUN3
@@ -961,5 +959,6 @@ void cleanup_module(void)
 	free_netdev(sun3lance_dev);
 }
 
-#endif /* MODULE */
+module_init(lance_init_module)
+module_exit(lance_exit_module)
 
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/tokenring/proteon.c linux-2.6.12-rc5-kj/drivers/net/tokenring/proteon.c
--- vanilla-2.6.12-rc5-kj/drivers/net/tokenring/proteon.c	2005-03-02 08:38:26.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/tokenring/proteon.c	2005-05-28 00:58:22.000000000 +0200
@@ -352,13 +352,11 @@ static int proteon_open(struct net_devic
 	return tms380tr_open(dev);
 }
 
-#ifdef MODULE
-
 #define ISATR_MAX_ADAPTERS 3
 
-static int io[ISATR_MAX_ADAPTERS];
-static int irq[ISATR_MAX_ADAPTERS];
-static int dma[ISATR_MAX_ADAPTERS];
+static int io[ISATR_MAX_ADAPTERS] __initdata;
+static int irq[ISATR_MAX_ADAPTERS] __initdata;
+static int dma[ISATR_MAX_ADAPTERS] __initdata;
 
 MODULE_LICENSE("GPL");
 
@@ -368,7 +366,7 @@ module_param_array(dma, int, NULL, 0);
 
 static struct net_device *proteon_dev[ISATR_MAX_ADAPTERS];
 
-int init_module(void)
+static int __init proteon_init_module(void)
 {
 	struct net_device *dev;
 	int i, num = 0, err = 0;
@@ -399,7 +397,7 @@ int init_module(void)
 	return (0);
 }
 
-void cleanup_module(void)
+static void __exit proteon_cleanup_module(void)
 {
 	int i;
 
@@ -417,7 +415,8 @@ void cleanup_module(void)
 		free_netdev(dev);
 	}
 }
-#endif /* MODULE */
+module_init(proteon_init_module)
+module_exit(proteon_cleanup_module)
 
 
 /*
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/tokenring/skisa.c linux-2.6.12-rc5-kj/drivers/net/tokenring/skisa.c
--- vanilla-2.6.12-rc5-kj/drivers/net/tokenring/skisa.c	2005-03-02 08:37:48.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/tokenring/skisa.c	2005-05-28 01:04:53.000000000 +0200
@@ -361,13 +361,11 @@ static int sk_isa_open(struct net_device
 	return tms380tr_open(dev);
 }
 
-#ifdef MODULE
-
 #define ISATR_MAX_ADAPTERS 3
 
-static int io[ISATR_MAX_ADAPTERS];
-static int irq[ISATR_MAX_ADAPTERS];
-static int dma[ISATR_MAX_ADAPTERS];
+static int io[ISATR_MAX_ADAPTERS] __initdata;
+static int irq[ISATR_MAX_ADAPTERS] __initdata;
+static int dma[ISATR_MAX_ADAPTERS] __initdata;
 
 MODULE_LICENSE("GPL");
 
@@ -377,7 +375,7 @@ module_param_array(dma, int, NULL, 0);
 
 static struct net_device *sk_isa_dev[ISATR_MAX_ADAPTERS];
 
-int init_module(void)
+static int __init sk_isa_init_module(void)
 {
 	struct net_device *dev;
 	int i, num = 0, err = 0;
@@ -409,7 +407,7 @@ int init_module(void)
 	return (0);
 }
 
-void cleanup_module(void)
+static void __exit sk_isa_cleanup_module(void)
 {
 	int i;
 
@@ -427,8 +425,9 @@ void cleanup_module(void)
 		free_netdev(dev);
 	}
 }
-#endif /* MODULE */
 
+module_init(sk_isa_init_module)
+module_exit(sk_isa_cleanup_module)
 
 /*
  * Local variables:
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/tokenring/smctr.c linux-2.6.12-rc5-kj/drivers/net/tokenring/smctr.c
--- vanilla-2.6.12-rc5-kj/drivers/net/tokenring/smctr.c	2005-03-02 08:38:09.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/tokenring/smctr.c	2005-05-28 01:03:29.000000000 +0200
@@ -5655,11 +5655,9 @@ static int smctr_wait_while_cbusy(struct
                 return (HARDWARE_FAILED);
 }
 
-#ifdef MODULE
-
 static struct net_device* dev_smctr[SMCTR_MAX_ADAPTERS];
-static int io[SMCTR_MAX_ADAPTERS];
-static int irq[SMCTR_MAX_ADAPTERS];
+static int io[SMCTR_MAX_ADAPTERS] __initdata;
+static int irq[SMCTR_MAX_ADAPTERS] __initdata;
 
 MODULE_LICENSE("GPL");
 
@@ -5667,7 +5665,7 @@ module_param_array(io, int, NULL, 0);
 module_param_array(irq, int, NULL, 0);
 module_param(ringspeed, int, 0);
 
-static struct net_device *setup_card(int n)
+static struct net_device * __init setup_card(int n)
 {
 	struct net_device *dev = alloc_trdev(sizeof(struct net_local));
 	int err;
@@ -5699,7 +5697,7 @@ out:
 }
 			
 
-int init_module(void)
+static int __init smctr_init_module(void)
 {
         int i, found = 0;
 	struct net_device *dev;
@@ -5715,7 +5713,7 @@ int init_module(void)
         return found ? 0 : -ENODEV;
 }
 
-void cleanup_module(void)
+static void __exit smctr_cleanup_module(void)
 {
         int i;
 
@@ -5739,4 +5737,5 @@ void cleanup_module(void)
 		}
         }
 }
-#endif /* MODULE */
+module_init(smctr_init_module)
+module_exit(smctr_cleanup_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/tokenring/tms380tr.c linux-2.6.12-rc5-kj/drivers/net/tokenring/tms380tr.c
--- vanilla-2.6.12-rc5-kj/drivers/net/tokenring/tms380tr.c	2005-05-28 00:28:08.000000000 +0200
+++ linux-2.6.12-rc5-kj/drivers/net/tokenring/tms380tr.c	2005-05-28 00:56:50.000000000 +0200
@@ -2370,8 +2370,6 @@ int tmsdev_init(struct net_device *dev, 
 	return 0;
 }
 
-#ifdef MODULE
-
 EXPORT_SYMBOL(tms380tr_open);
 EXPORT_SYMBOL(tms380tr_close);
 EXPORT_SYMBOL(tms380tr_interrupt);
@@ -2381,7 +2379,7 @@ EXPORT_SYMBOL(tms380tr_wait);
 
 struct module *TMS380_module = NULL;
 
-int init_module(void)
+static int __init tms380_init_module(void)
 {
 	printk(KERN_DEBUG "%s", version);
 	
@@ -2389,13 +2387,14 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit tms380_cleanup_module(void)
 {
 	TMS380_module = NULL;
 }
-#endif
 
 MODULE_LICENSE("GPL");
+module_init(tms380_init_module)
+module_exit(tms380_cleanup_module)
 
 
 /*
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/wan/hostess_sv11.c linux-2.6.12-rc5-kj/drivers/net/wan/hostess_sv11.c
--- vanilla-2.6.12-rc5-kj/drivers/net/wan/hostess_sv11.c	2005-03-02 08:38:13.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/wan/hostess_sv11.c	2005-05-28 01:06:49.000000000 +0200
@@ -383,10 +383,8 @@ static void sv11_shutdown(struct sv11_de
 	kfree(dev);
 }
 
-#ifdef MODULE
-
-static int io=0x200;
-static int irq=9;
+static int io __initdata = 0x200;
+static int irq __initdata = 9;
 
 module_param(io, int, 0);
 MODULE_PARM_DESC(io, "The I/O base of the Comtrol Hostess SV11 card");
@@ -401,7 +399,7 @@ MODULE_DESCRIPTION("Modular driver for t
 
 static struct sv11_device *sv11_unit;
 
-int init_module(void)
+static int __init sv11_init_module(void)
 {
 	printk(KERN_INFO "SV-11 Z85230 Synchronous Driver v 0.03.\n");
 	printk(KERN_INFO "(c) Copyright 2001, Red Hat Inc.\n");	
@@ -410,11 +408,11 @@ int init_module(void)
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit sv11_cleanup_module(void)
 {
 	if(sv11_unit)
 		sv11_shutdown(sv11_unit);
 }
 
-#endif
-
+module_init(sv11_init_module)
+module_exit(sv11_cleanup_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/wireless/arlan-main.c linux-2.6.12-rc5-kj/drivers/net/wireless/arlan-main.c
--- vanilla-2.6.12-rc5-kj/drivers/net/wireless/arlan-main.c	2005-03-02 08:38:12.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/wireless/arlan-main.c	2005-05-28 01:12:36.000000000 +0200
@@ -1839,8 +1839,7 @@ struct net_device * __init arlan_probe(i
 	return dev;
 }
 
-#ifdef  MODULE
-int init_module(void)
+static int __init arlan_init_module(void)
 {
 	int i = 0;
 
@@ -1862,7 +1861,7 @@ int init_module(void)
 }
 
 
-void cleanup_module(void)
+static void __exit cleanup_module(void)
 {
 	int i = 0;
 	struct net_device *dev;
@@ -1891,6 +1890,6 @@ void cleanup_module(void)
 	ARLAN_DEBUG_EXIT("cleanup_module");
 }
 
-
-#endif
 MODULE_LICENSE("GPL");
+module_init(arlan_init_module)
+module_exit(arlan_cleanup_module)
diff -uprN vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c
--- vanilla-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-03-02 08:38:26.000000000 +0100
+++ linux-2.6.12-rc5-kj/drivers/net/wireless/wavelan.c	2005-05-28 01:10:59.000000000 +0200
@@ -4308,13 +4308,12 @@ out:
  * Module entry point: insertion and removal
  */
 
-#ifdef	MODULE
 /*------------------------------------------------------------------*/
 /*
  * Insertion of the module
  * I'm now quite proud of the multi-device support.
  */
-int init_module(void)
+static int __init wavelan_init_module(void)
 {
 	int ret = -EIO;		/* Return error if no cards found */
 	int i;
@@ -4378,7 +4377,7 @@ int init_module(void)
 /*
  * Removal of the module
  */
-void cleanup_module(void)
+static void __exit wavelan_cleanup_module(void)
 {
 #ifdef DEBUG_MODULE_TRACE
 	printk(KERN_DEBUG "-> cleanup_module()\n");
@@ -4405,8 +4404,9 @@ void cleanup_module(void)
 	printk(KERN_DEBUG "<- cleanup_module()\n");
 #endif
 }
-#endif				/* MODULE */
 MODULE_LICENSE("GPL");
+module_init(wavelan_init_module)
+module_exit(wavelan_cleanup_module)
 
 /*
  * This software may only be used and distributed

--------------010009090403080509040306
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010009090403080509040306--
