From: "Shakthi Kannan" <shakthimaan@gmail.com>
Date: Tue, 22 Aug 2006 13:25:35 +0000
Subject: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Shakthi Kannan <shakthimaan at gmail.com>

Changed init_module, cleanup_module to use module_init, module_exit in
all necessary files in 2.6.18-rc4.

Signed-off-by: Shakthi Kannan <shakthimaan at gmail.com>

Index: linux-2.6.17/arch/sparc64/solaris/misc.c
=================================--- linux-2.6.17.orig/arch/sparc64/solaris/misc.c	2006-08-18
20:51:45.000000000 +0530
+++ linux-2.6.17/arch/sparc64/solaris/misc.c	2006-08-22 11:52:58.000000000 +0530
@@ -757,7 +757,7 @@

 extern u32 entry64_personality_patch;

-int init_module(void)
+static int __int sparc_misc_init(void)
 {
 	int ret;

@@ -777,13 +777,16 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit sparc_misc_exit(void)
 {
 	update_ttable(solaris_syscall);
 	cleanup_socksys();
 	unregister_exec_domain(&solaris_exec_domain);
 }

+module_init(sparc_misc_init);
+module_exit(sparc_misc_exit);
+
 #else
 int init_solaris_emul(void)
 {
Index: linux-2.6.17/drivers/block/acsi.c
=================================--- linux-2.6.17.orig/drivers/block/acsi.c	2006-08-18 20:51:48.000000000 +0530
+++ linux-2.6.17/drivers/block/acsi.c	2006-08-22 12:10:04.000000000 +0530
@@ -1760,7 +1760,7 @@

 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init acsi_init_module(void)
 {
 	int err;

@@ -1770,7 +1770,7 @@
 	return( 0 );
 }

-void cleanup_module(void)
+static void __exit acsi_exit_module(void)
 {
 	int i;
 	del_timer( &acsi_timer );
@@ -1785,6 +1785,10 @@
 		put_disk(acsi_gendisk[i]);
 	}
 }
+
+module_init(acsi_init_module);
+module_exit(acsi_exit_module);
+
 #endif

 /*
Index: linux-2.6.17/drivers/block/acsi_slm.c
=================================--- linux-2.6.17.orig/drivers/block/acsi_slm.c	2006-08-18
20:51:48.000000000 +0530
+++ linux-2.6.17/drivers/block/acsi_slm.c	2006-08-22 15:17:31.000000000 +0530
@@ -1012,7 +1012,7 @@
 /* from acsi.c */
 void acsi_attach_SLMs( int (*attach_func)( int, int ) );

-int init_module(void)
+static int __init acsi_slm_init(void)
 {
 	int err;

@@ -1024,10 +1024,14 @@
 	return( 0 );
 }

-void cleanup_module(void)
+static void __exit acsi_slm_exit(void)
 {
 	if (unregister_chrdev( ACSI_MAJOR, "slm" ) != 0)
 		printk( KERN_ERR "acsi_slm: cleanup_module failed\n");
 	atari_stram_free( SLMBuffer );
 }
+
+module_init(acsi_slm_init);
+module_exit(acsi_slm_exit);
+
 #endif
Index: linux-2.6.17/drivers/block/amiflop.c
=================================--- linux-2.6.17.orig/drivers/block/amiflop.c	2006-08-18
20:51:48.000000000 +0530
+++ linux-2.6.17/drivers/block/amiflop.c	2006-08-22 12:11:14.000000000 +0530
@@ -1811,7 +1811,7 @@

 #ifdef MODULE

-int init_module(void)
+static int __init amiflop_init_module(void)
 {
 	if (!MACH_IS_AMIGA)
 		return -ENXIO;
@@ -1819,7 +1819,7 @@
 }

 #if 0 /* not safe to unload */
-void cleanup_module(void)
+static void __exit amiflop_exit_module(void)
 {
 	int i;

@@ -1839,6 +1839,10 @@
 	release_mem_region(CUSTOM_PHYSADDR+0x20, 8);
 	unregister_blkdev(FLOPPY_MAJOR, "fd");
 }
+
+module_init(amiflop_init_module);
+module_exit(amiflop_exit_module);
+
 #endif

 #else
Index: linux-2.6.17/drivers/block/ps2esdi.c
=================================--- linux-2.6.17.orig/drivers/block/ps2esdi.c	2006-08-18
20:51:49.000000000 +0530
+++ linux-2.6.17/drivers/block/ps2esdi.c	2006-08-22 12:05:33.000000000 +0530
@@ -181,7 +181,7 @@
 module_param_array(sect, int, NULL, 0);
 MODULE_LICENSE("GPL");

-int init_module(void) {
+static int __init ps2esdi_init_module(void) {
 	int drive;

 	for(drive = 0; drive < MAX_HD; drive++) {
@@ -200,8 +200,8 @@
 	return ps2esdi_init();
 }

-void
-cleanup_module(void) {
+static void __exit
+ps2esdi_exit_module(void) {
 	int i;
 	if(ps2esdi_slot) {
 		mca_mark_as_unused(ps2esdi_slot);
@@ -217,6 +217,10 @@
 		put_disk(ps2esdi_gendisk[i]);
 	}
 }
+
+module_init(ps2esdi_init_module);
+module_exit(ps2esdi_exit_module);
+
 #endif /* MODULE */

 /* handles boot time command line parameters */
Index: linux-2.6.17/drivers/char/ftape/compressor/zftape-compress.c
=================================--- linux-2.6.17.orig/drivers/char/ftape/compressor/zftape-compress.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/char/ftape/compressor/zftape-compress.c	2006-08-22
12:13:45.000000000 +0530
@@ -1195,9 +1195,11 @@

 /* Called by modules package when installing the driver
  */
-int init_module(void)
+static int __init zftape_compress_init_module(void)
 {
 	return zft_compressor_init();
 }

+module_init(zftape_compress_init_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/char/ip2/ip2main.c
=================================--- linux-2.6.17.orig/drivers/char/ip2/ip2main.c	2006-08-18
20:51:49.000000000 +0530
+++ linux-2.6.17/drivers/char/ip2/ip2main.c	2006-08-22 12:16:17.000000000 +0530
@@ -357,14 +357,17 @@
 /* the driver initialisation function and returns what it returns.
        */
 /******************************************************************************/
 #ifdef MODULE
-int
-init_module(void)
+static int __init
+ip2main_init_module(void)
 {
 #ifdef IP2DEBUG_INIT
 	printk (KERN_DEBUG "Loading module ...\n" );
 #endif
     return 0;
 }
+
+module_init(ip2main_init_module);
+
 #endif /* MODULE */

 /******************************************************************************/
@@ -383,8 +386,8 @@
 /* driver should be returned since it may be unloaded from memory.
        */
 /******************************************************************************/
 #ifdef MODULE
-void
-cleanup_module(void)
+static void __exit
+ip2main_cleanup_module(void)
 {
 	int err;
 	int i;
@@ -455,6 +458,9 @@
 	printk (KERN_DEBUG "IP2 Unloaded\n" );
 #endif
 }
+
+module_exit(ip2main_cleanup_module);
+
 #endif /* MODULE */

 static struct tty_operations ip2_ops = {
Index: linux-2.6.17/drivers/i2c/algos/i2c-algo-sibyte.c
=================================--- linux-2.6.17.orig/drivers/i2c/algos/i2c-algo-sibyte.c	2006-08-18
20:51:50.000000000 +0530
+++ linux-2.6.17/drivers/i2c/algos/i2c-algo-sibyte.c	2006-08-22
12:17:49.000000000 +0530
@@ -204,12 +204,16 @@
 MODULE_PARM_DESC(bit_scan, "Scan for active chips on the bus");
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init i2c_algo_init_module(void)
 {
 	return i2c_algo_sibyte_init();
 }

-void cleanup_module(void)
+static void __exit i2c_algo_cleanup_module(void)
 {
 }
+
+module_init(i2c_algo_init_module);
+module_exit(i2c_algo_cleanup_module);
+
 #endif
Index: linux-2.6.17/drivers/ide/ide.c
=================================--- linux-2.6.17.orig/drivers/ide/ide.c	2006-08-18 20:51:50.000000000 +0530
+++ linux-2.6.17/drivers/ide/ide.c	2006-08-22 12:19:33.000000000 +0530
@@ -2053,13 +2053,13 @@
 	}
 }

-int __init init_module (void)
+static int __init ide_init_module (void)
 {
 	parse_options(options);
 	return ide_init();
 }

-void cleanup_module (void)
+static void __exit ide_cleanup_module (void)
 {
 	int index;

@@ -2073,6 +2073,9 @@
 	bus_unregister(&ide_bus_type);
 }

+module_init(ide_init_module);
+module_exit(ide_cleanup_module);
+
 #else /* !MODULE */

 __setup("", ide_setup);
Index: linux-2.6.17/drivers/media/video/cpia_pp.c
=================================--- linux-2.6.17.orig/drivers/media/video/cpia_pp.c	2006-08-18
20:51:55.000000000 +0530
+++ linux-2.6.17/drivers/media/video/cpia_pp.c	2006-08-22
12:21:03.000000000 +0530
@@ -822,7 +822,7 @@
 }

 #ifdef MODULE
-int init_module(void)
+static int __init cpia_pp_init_module(void)
 {
 	if (parport[0]) {
 		/* The user gave some parameters.  Let's see what they were. */
@@ -849,12 +849,15 @@
 	return cpia_pp_init();
 }

-void cleanup_module(void)
+static void __exit cpia_pp_cleanup_module(void)
 {
 	parport_unregister_driver (&cpia_pp_driver);
 	return;
 }

+module_init(cpia_pp_init_module);
+module_exit(cpia_pp_cleanup_module);
+
 #else /* !MODULE */

 static int __init cpia_pp_setup(char *str)
Index: linux-2.6.17/drivers/net/3c501.c
=================================--- linux-2.6.17.orig/drivers/net/3c501.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c501.c	2006-08-22 15:50:59.000000000 +0530
@@ -909,7 +909,7 @@
  * here also causes the module to be unloaded
  */

-int __init init_module(void)
+static int __init net_3c501_init(void)
 {
 	dev_3c501 = el1_probe(-1);
 	if (IS_ERR(dev_3c501))
@@ -924,7 +924,7 @@
  * and then free up the resources we took when the card was found.
  */

-void cleanup_module(void)
+static void __exit net_3c501_cleanup(void)
 {
 	struct net_device *dev = dev_3c501;
 	unregister_netdev(dev);
@@ -932,6 +932,9 @@
 	free_netdev(dev);
 }

+module_init(net_3c501_init);
+module_exit(net_3c501_cleanup);
+
 #endif /* MODULE */

 MODULE_AUTHOR("Donald Becker, Alan Cox");
Index: linux-2.6.17/drivers/net/3c503.c
=================================--- linux-2.6.17.orig/drivers/net/3c503.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c503.c	2006-08-22 15:52:03.000000000 +0530
@@ -688,8 +688,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int __init
-init_module(void)
+static int __init
+net_3c503_init(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -726,8 +726,8 @@
 		iounmap(ei_status.mem);
 }

-void
-cleanup_module(void)
+static void __exit
+net_3c503_cleanup(void)
 {
 	int this_dev;

@@ -740,4 +740,8 @@
 		}
 	}
 }
+
+module_init(net_3c503_init);
+module_exit(net_3c503_cleanup);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/3c505.c
=================================--- linux-2.6.17.orig/drivers/net/3c505.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c505.c	2006-08-22 15:52:47.000000000 +0530
@@ -1633,7 +1633,7 @@
 MODULE_PARM_DESC(irq, "EtherLink Plus IRQ number(s) (assigned)");
 MODULE_PARM_DESC(dma, "EtherLink Plus DMA channel(s)");

-int __init init_module(void)
+static int __init net_3c505_init(void)
 {
 	int this_dev, found = 0;

@@ -1670,7 +1670,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit net_3c505_cleanup(void)
 {
 	int this_dev;

@@ -1684,5 +1684,8 @@
 	}
 }

+module_init(net_3c505_init);
+module_exit(net_3c505_cleanup);
+
 #endif				/* MODULE */
 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/net/3c507.c
=================================--- linux-2.6.17.orig/drivers/net/3c507.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c507.c	2006-08-22 15:53:29.000000000 +0530
@@ -932,7 +932,7 @@
 MODULE_PARM_DESC(io, "EtherLink16 I/O base address");
 MODULE_PARM_DESC(irq, "(ignored)");

-int __init init_module(void)
+static int __init net_3c507_init(void)
 {
 	if (io = 0)
 		printk("3c507: You should not use auto-probing with insmod!\n");
@@ -940,8 +940,8 @@
 	return IS_ERR(dev_3c507) ? PTR_ERR(dev_3c507) : 0;
 }

-void
-cleanup_module(void)
+static void __exit
+net_3c507_cleanup(void)
 {
 	struct net_device *dev = dev_3c507;
 	unregister_netdev(dev);
@@ -950,6 +950,10 @@
 	release_region(dev->base_addr, EL16_IO_EXTENT);
 	free_netdev(dev);
 }
+
+module_init(net_3c507_init);
+module_exit(net_3c507_cleanup);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");

Index: linux-2.6.17/drivers/net/3c515.c
=================================--- linux-2.6.17.orig/drivers/net/3c515.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c515.c	2006-08-22 15:54:37.000000000 +0530
@@ -414,7 +414,7 @@
 /* we will need locking (and refcounting) if we ever use it for more */
 static LIST_HEAD(root_corkscrew_dev);

-int init_module(void)
+static int __init net_3c515_init(void)
 {
 	int found = 0;
 	if (debug >= 0)
@@ -426,6 +426,8 @@
 	return found ? 0 : -ENODEV;
 }

+module_init(net_3c515_init);
+
 #else
 struct net_device *tc515_probe(int unit)
 {
@@ -1568,7 +1570,7 @@

 
 #ifdef MODULE
-void cleanup_module(void)
+static void __exit net_3c515_cleanup(void)
 {
 	while (!list_empty(&root_corkscrew_dev)) {
 		struct net_device *dev;
@@ -1582,6 +1584,9 @@
 		free_netdev(dev);
 	}
 }
+
+module_exit(net_3c515_cleanup);
+
 #endif				/* MODULE */
 
 /*
Index: linux-2.6.17/drivers/net/3c523.c
=================================--- linux-2.6.17.orig/drivers/net/3c523.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c523.c	2006-08-22 15:55:25.000000000 +0530
@@ -1277,7 +1277,7 @@
 MODULE_PARM_DESC(irq, "EtherLink/MC IRQ number(s)");
 MODULE_LICENSE("GPL");

-int __init init_module(void)
+static int __init net_3c523_init(void)
 {
 	int this_dev,found = 0;

@@ -1305,7 +1305,7 @@
 	} else return 0;
 }

-void cleanup_module(void)
+static void __exit net_3c523_cleanup(void)
 {
 	int this_dev;
 	for (this_dev=0; this_dev<MAX_3C523_CARDS; this_dev++) {
@@ -1318,4 +1318,7 @@
 	}
 }

+module_init(net_3c523_init);
+module_exit(net_3c523_cleanup);
+
 #endif				/* MODULE */
Index: linux-2.6.17/drivers/net/3c527.c
=================================--- linux-2.6.17.orig/drivers/net/3c527.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/3c527.c	2006-08-22 15:56:06.000000000 +0530
@@ -1645,7 +1645,7 @@
  *	insmod multiple modules for now but it's a hack.
  */

-int __init init_module(void)
+static int __init net_3c527_init(void)
 {
 	this_device = mc32_probe(-1);
 	if (IS_ERR(this_device))
@@ -1664,11 +1664,14 @@
  *	transmit operations are allowed to start scribbling into memory.
  */

-void cleanup_module(void)
+static void __exit net_3c527_cleanup(void)
 {
 	unregister_netdev(this_device);
 	cleanup_card(this_device);
 	free_netdev(this_device);
 }

+module_init(net_3c527_init);
+module_exit(net_3c527_cleanup);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/82596.c
=================================--- linux-2.6.17.orig/drivers/net/82596.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/82596.c	2006-08-22 15:56:57.000000000 +0530
@@ -1578,7 +1578,7 @@
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "i82596 debug mask");

-int init_module(void)
+static int __init net_82596_init(void)
 {
 	if (debug >= 0)
 		i596_debug = debug;
@@ -1588,7 +1588,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit net_82596_cleanup(void)
 {
 	unregister_netdev(dev_82596);
 #ifdef __mc68000__
@@ -1607,6 +1607,9 @@
 	free_netdev(dev_82596);
 }

+module_init(net_82596_init);
+module_exit(net_82596_cleanup);
+
 #endif				/* MODULE */
 
 /*
Index: linux-2.6.17/drivers/net/8390.c
=================================--- linux-2.6.17.orig/drivers/net/8390.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/8390.c	2006-08-22 15:57:53.000000000 +0530
@@ -1119,14 +1119,17 @@

 #if defined(MODULE)

-int init_module(void)
+static int __init net_8390_init(void)
 {
 	return 0;
 }

-void cleanup_module(void)
+static void __exit net_8390_cleanup(void)
 {
 }

+module_init(net_8390_init);
+module_exit(net_8390_cleanup);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/net/ac3200.c
=================================--- linux-2.6.17.orig/drivers/net/ac3200.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/ac3200.c	2006-08-22 12:36:51.000000000 +0530
@@ -370,8 +370,8 @@
 MODULE_DESCRIPTION("Ansel AC3200 EISA ethernet driver");
 MODULE_LICENSE("GPL");

-int
-init_module(void)
+static int __init
+ac3200_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -406,8 +406,8 @@
 	iounmap(ei_status.mem);
 }

-void
-cleanup_module(void)
+static void __exit
+ac3200_cleanup_module(void)
 {
 	int this_dev;

@@ -420,4 +420,8 @@
 		}
 	}
 }
+
+module_init(ac3200_init_module);
+module_exit(ac3200_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/apne.c
=================================--- linux-2.6.17.orig/drivers/net/apne.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/apne.c	2006-08-22 12:37:55.000000000 +0530
@@ -568,7 +568,7 @@
 #ifdef MODULE
 static struct net_device *apne_dev;

-int init_module(void)
+static int __init apne_init_module(void)
 {
 	apne_dev = apne_probe(-1);
 	if (IS_ERR(apne_dev))
@@ -576,7 +576,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit apne_cleanup_module(void)
 {
 	unregister_netdev(apne_dev);

@@ -591,6 +591,9 @@
 	free_netdev(apne_dev);
 }

+module_init(apne_init_module);
+module_exit(apne_cleanup_module);
+
 #endif

 static int init_pcmcia(void)
Index: linux-2.6.17/drivers/net/appletalk/cops.c
=================================--- linux-2.6.17.orig/drivers/net/appletalk/cops.c	2006-08-18
20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/appletalk/cops.c	2006-08-22
12:39:10.000000000 +0530
@@ -1030,7 +1030,7 @@
 module_param(irq, int, 0);
 module_param(board_type, int, 0);

-int init_module(void)
+static int __init cops_init_module(void)
 {
 	if (io = 0)
 		printk(KERN_WARNING "%s: You shouldn't autoprobe with insmod\n",
@@ -1041,12 +1041,16 @@
         return 0;
 }

-void cleanup_module(void)
+static void __exit cops_cleanup_module(void)
 {
 	unregister_netdev(cops_dev);
 	cleanup_card(cops_dev);
 	free_netdev(cops_dev);
 }
+
+module_init(cops_init_module);
+module_exit(cops_cleanup_module);
+
 #endif /* MODULE */

 /*
Index: linux-2.6.17/drivers/net/appletalk/ltpc.c
=================================--- linux-2.6.17.orig/drivers/net/appletalk/ltpc.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/appletalk/ltpc.c	2006-08-22
12:41:10.000000000 +0530
@@ -1260,8 +1260,7 @@
 module_param(irq, int, 0);
 module_param(dma, int, 0);

-
-int __init init_module(void)
+static int __init ltpc_init_module(void)
 {
         if(io = 0)
 		printk(KERN_NOTICE
@@ -1272,6 +1271,9 @@
 		return PTR_ERR(dev_ltpc);
 	return 0;
 }
+
+module_init(ltpc_init_module);
+
 #endif

 static void __exit ltpc_cleanup(void)
Index: linux-2.6.17/drivers/net/arcnet/capmode.c
=================================--- linux-2.6.17.orig/drivers/net/arcnet/capmode.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/arcnet/capmode.c	2006-08-22
12:42:15.000000000 +0530
@@ -80,18 +80,21 @@

 #ifdef MODULE

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

+module_init(capmode_init_module);
+module_exit(capmode_cleanup_module);
+
 MODULE_LICENSE("GPL");
 #endif				/* MODULE */

Index: linux-2.6.17/drivers/net/arcnet/com20020.c
=================================--- linux-2.6.17.orig/drivers/net/arcnet/com20020.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/arcnet/com20020.c	2006-08-22
12:43:16.000000000 +0530
@@ -344,14 +344,17 @@

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

+module_init(com20020_init_module);
+module_exit(com20020_cleanup_module);
+
 #endif				/* MODULE */
Index: linux-2.6.17/drivers/net/at1700.c
=================================--- linux-2.6.17.orig/drivers/net/at1700.c	2006-08-18 20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/at1700.c	2006-08-22 12:44:46.000000000 +0530
@@ -901,7 +901,7 @@
 MODULE_PARM_DESC(irq, "AT1700/FMV18X IRQ number");
 MODULE_PARM_DESC(net_debug, "AT1700/FMV18X debug level (0-6)");

-int init_module(void)
+static int __init at1700_init_module(void)
 {
 	if (io = 0)
 		printk("at1700: You should not use auto-probing with insmod!\n");
@@ -911,13 +911,17 @@
 	return 0;
 }

-void
-cleanup_module(void)
+static void __exit
+at1700_cleanup_module(void)
 {
 	unregister_netdev(dev_at1700);
 	cleanup_card(dev_at1700);
 	free_netdev(dev_at1700);
 }
+
+module_init(at1700_init_module);
+module_exit(at1700_cleanup_module);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");

Index: linux-2.6.17/drivers/net/atari_bionet.c
=================================--- linux-2.6.17.orig/drivers/net/atari_bionet.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/atari_bionet.c	2006-08-22 12:46:05.000000000 +0530
@@ -647,7 +647,7 @@

 static struct net_device *bio_dev;

-int init_module(void)
+static int __init atari_bionet_init_module(void)
 {
 	bio_dev = bionet_probe(-1);
 	if (IS_ERR(bio_dev))
@@ -655,12 +655,15 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit atari_bionet_cleanup_module(void)
 {
 	unregister_netdev(bio_dev);
 	free_netdev(bio_dev);
 }

+module_init(atari_bionet_init_module);
+module_exit(atari_bionet_cleanup_module);
+
 #endif /* MODULE */

 /* Local variables:
Index: linux-2.6.17/drivers/net/atari_pamsnet.c
=================================--- linux-2.6.17.orig/drivers/net/atari_pamsnet.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/atari_pamsnet.c	2006-08-22 12:47:22.000000000 +0530
@@ -868,7 +868,7 @@

 static struct net_device *pam_dev;

-int init_module(void)
+static int __init atari_pamsnet_init_module(void)
 {
 	pam_dev = pamsnet_probe(-1);
 	if (IS_ERR(pam_dev))
@@ -876,12 +876,15 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit atari_pamsnet_cleanup_module(void)
 {
 	unregister_netdev(pam_dev);
 	free_netdev(pam_dev);
 }

+module_init(atari_pamsnet_init_module);
+module_exit(atari_pamsnet_cleanup_module);
+
 #endif /* MODULE */

 /* Local variables:
Index: linux-2.6.17/drivers/net/atarilance.c
=================================--- linux-2.6.17.orig/drivers/net/atarilance.c	2006-08-18
20:51:57.000000000 +0530
+++ linux-2.6.17/drivers/net/atarilance.c	2006-08-22 12:48:52.000000000 +0530
@@ -1175,11 +1175,11 @@
 	return( 0 );
 }

-
+
 #ifdef MODULE
 static struct net_device *atarilance_dev;

-int init_module(void)
+static int __init atarilance_init_module(void)
 {
 	atarilance_dev = atarilance_probe(-1);
 	if (IS_ERR(atarilance_dev))
@@ -1187,15 +1187,18 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit atarilance_cleanup_module(void)
 {
 	unregister_netdev(atarilance_dev);
 	free_irq(atarilance_dev->irq, atarilance_dev);
 	free_netdev(atarilance_dev);
 }

+module_init(atarilance_init_module);
+module_exit(atarliance_cleanup_module);
+
 #endif /* MODULE */
-
+

 /*
  * Local variables:
Index: linux-2.6.17/drivers/net/cs89x0.c
=================================--- linux-2.6.17.orig/drivers/net/cs89x0.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/cs89x0.c	2006-08-22 12:51:47.000000000 +0530
@@ -1905,8 +1905,8 @@

 */

-int
-init_module(void)
+static int __init
+cs89x0_init_module(void)
 {
 	struct net_device *dev = alloc_etherdev(sizeof(struct net_local));
 	struct net_local *lp;
@@ -1975,16 +1975,20 @@
 	return ret;
 }

-void
-cleanup_module(void)
+static void __exit
+cs89x0_cleanup_module(void)
 {
 	unregister_netdev(dev_cs89x0);
 	writeword(dev_cs89x0->base_addr, ADD_PORT, PP_ChipID);
 	release_region(dev_cs89x0->base_addr, NETCARD_IO_EXTENT);
 	free_netdev(dev_cs89x0);
 }
+
+module_init(cs89x0_init_module);
+module_exit(cs89x0_cleanup_module);
+
 #endif /* MODULE */
-
+
 /*
  * Local variables:
  *  version-control: t
Index: linux-2.6.17/drivers/net/de620.c
=================================--- linux-2.6.17.orig/drivers/net/de620.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/de620.c	2006-08-22 12:53:00.000000000 +0530
@@ -1012,7 +1012,7 @@
 #ifdef MODULE
 static struct net_device *de620_dev;

-int __init init_module(void)
+static int __init de620_init_module(void)
 {
 	de620_dev = de620_probe(-1);
 	if (IS_ERR(de620_dev))
@@ -1020,12 +1020,16 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit de620_cleanup_module(void)
 {
 	unregister_netdev(de620_dev);
 	release_region(de620_dev->base_addr, 3);
 	free_netdev(de620_dev);
 }
+
+module_init(de620_init_module);
+module_exit(de620_cleanup_module);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");

Index: linux-2.6.17/drivers/net/e2100.c
=================================--- linux-2.6.17.orig/drivers/net/e2100.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/e2100.c	2006-08-22 12:53:58.000000000 +0530
@@ -425,8 +425,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int
-init_module(void)
+static int __init
+e2100_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -463,8 +463,8 @@
 	release_region(dev->base_addr, E21_IO_EXTENT);
 }

-void
-cleanup_module(void)
+static void __exit
+e2100_cleanup_module(void)
 {
 	int this_dev;

@@ -477,4 +477,8 @@
 		}
 	}
 }
+
+module_init(e2100_init_module);
+module_exit(e2100_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/eepro.c
=================================--- linux-2.6.17.orig/drivers/net/eepro.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/eepro.c	2006-08-22 12:55:04.000000000 +0530
@@ -1807,8 +1807,8 @@
 MODULE_PARM_DESC(mem, "EtherExpress Pro/10 Rx buffer size(es) in kB (3-29)");
 MODULE_PARM_DESC(autodetect, "EtherExpress Pro/10 force board(s)
detection (0-1)");

-int
-init_module(void)
+static int __init
+eepro_init_module(void)
 {
 	struct net_device *dev;
 	int i;
@@ -1849,8 +1849,8 @@
 	return n_eepro ? 0 : -ENODEV;
 }

-void
-cleanup_module(void)
+static void __exit
+eepro_cleanup_module(void)
 {
 	int i;

@@ -1861,4 +1861,8 @@
 		free_netdev(dev);
 	}
 }
+
+module_init(eepro_init_module);
+module_exit(eepro_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/eexpress.c
=================================--- linux-2.6.17.orig/drivers/net/eexpress.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/eexpress.c	2006-08-22 12:56:17.000000000 +0530
@@ -1698,7 +1698,7 @@
  * are specified, we verify and then use them.  If no parameters are given, we
  * autoprobe for one card only.
  */
-int init_module(void)
+static int __init eexpress_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -1726,7 +1726,7 @@
 	return -ENXIO;
 }

-void cleanup_module(void)
+static void __exit eexpress_cleanup_module(void)
 {
 	int this_dev;

@@ -1738,6 +1738,10 @@
 		}
 	}
 }
+
+module_init(eexpress_init_module);
+module_exit(eexpress_cleanup_module);
+
 #endif

 /*
Index: linux-2.6.17/drivers/net/es3210.c
=================================--- linux-2.6.17.orig/drivers/net/es3210.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/es3210.c	2006-08-22 12:57:21.000000000 +0530
@@ -421,8 +421,8 @@
 MODULE_DESCRIPTION("Racal-Interlan ES3210 EISA ethernet driver");
 MODULE_LICENSE("GPL");

-int
-init_module(void)
+static int __init
+es3210_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -456,8 +456,8 @@
 	iounmap(ei_status.mem);
 }

-void
-cleanup_module(void)
+static void __exit
+es3210_cleanup_module(void)
 {
 	int this_dev;

@@ -470,5 +470,9 @@
 		}
 	}
 }
+
+module_init(es3210_init_module);
+module_exit(es3210_cleanup_module);
+
 #endif /* MODULE */

Index: linux-2.6.17/drivers/net/eth16i.c
=================================--- linux-2.6.17.orig/drivers/net/eth16i.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/eth16i.c	2006-08-22 12:58:24.000000000 +0530
@@ -1434,7 +1434,7 @@
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "eth16i debug level (0-6)");

-int init_module(void)
+static int __init  eth16i_init_module(void)
 {
 	int this_dev, found = 0;
 	struct net_device *dev;
@@ -1475,7 +1475,7 @@
 	return -ENXIO;
 }
 	
-void cleanup_module(void)
+static void __exit eth16i_cleanup_module(void)
 {
 	int this_dev;

@@ -1490,6 +1490,10 @@
 		}
 	}
 }
+
+module_init(eth16i_init_module);
+module_exit(eth16i_cleanup_module);
+
 #endif /* MODULE */

 /*
Index: linux-2.6.17/drivers/net/hp-plus.c
=================================--- linux-2.6.17.orig/drivers/net/hp-plus.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/hp-plus.c	2006-08-22 12:59:51.000000000 +0530
@@ -446,8 +446,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int __init
-init_module(void)
+static int __init
+hp_plus_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -482,8 +482,8 @@
 	release_region(dev->base_addr - NIC_OFFSET, HP_IO_EXTENT);
 }

-void
-cleanup_module(void)
+static void __exit
+hp_plus_cleanup_module(void)
 {
 	int this_dev;

@@ -496,4 +496,8 @@
 		}
 	}
 }
+
+module_init(hp_plus_init_module);
+module_exit(hp_plus_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/hp.c
=================================--- linux-2.6.17.orig/drivers/net/hp.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/hp.c	2006-08-22 13:00:55.000000000 +0530
@@ -409,8 +409,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int __init
-init_module(void)
+static int __init
+hp_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -444,8 +444,8 @@
 	release_region(dev->base_addr - NIC_OFFSET, HP_IO_EXTENT);
 }

-void
-cleanup_module(void)
+static void __exit
+hp_cleanup_module(void)
 {
 	int this_dev;

@@ -458,4 +458,8 @@
 		}
 	}
 }
+
+module_init(hp_init_module);
+module_exit(hp_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/ibmlana.c
=================================--- linux-2.6.17.orig/drivers/net/ibmlana.c	2006-08-18 20:51:58.000000000 +0530
+++ linux-2.6.17/drivers/net/ibmlana.c	2006-08-22 13:36:24.000000000 +0530
@@ -1029,7 +1029,7 @@
 MODULE_PARM_DESC(io, "IBM LAN/A I/O base address");
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init ibmlana_init_module(void)
 {
 	int z;

@@ -1059,7 +1059,7 @@
 	return (z > 0) ? 0 : -EIO;
 }

-void cleanup_module(void)
+static void __exit ibmlana_cleanup_module(void)
 {
 	int z;
 	for (z = 0; z < DEVMAX; z++) {
@@ -1077,4 +1077,8 @@
 		}
 	}
 }
+
+module_init(ibmlana_init_module);
+module_exit(ibmlana_cleanup_module);
+
 #endif				/* MODULE */
Index: linux-2.6.17/drivers/net/isa-skeleton.c
=================================--- linux-2.6.17.orig/drivers/net/isa-skeleton.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/isa-skeleton.c	2006-08-22 13:37:40.000000000 +0530
@@ -676,7 +676,7 @@
 static int mem;
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init isa_skeleton_init_module(void)
 {
 	struct net_device *dev;
 	int result;
@@ -701,14 +701,17 @@
 	return -ENXIO;
 }

-void
-cleanup_module(void)
+static void __exit
+isa_skeleton_cleanup_module(void)
 {
 	unregister_netdev(this_device);
 	cleanup_card(this_device);
 	free_netdev(this_device);
 }

+module_init(isa_skeleton_init_module);
+module_exit(isa_skeleton_cleanup_module);
+
 #endif /* MODULE */

 /*
Index: linux-2.6.17/drivers/net/lance.c
=================================--- linux-2.6.17.orig/drivers/net/lance.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/lance.c	2006-08-22 13:38:38.000000000 +0530
@@ -326,7 +326,7 @@
 MODULE_PARM_DESC(irq, "LANCE/PCnet IRQ number (ignored for some devices)");
 MODULE_PARM_DESC(lance_debug, "LANCE/PCnet debug level (0-7)");

-int init_module(void)
+static int __init lance_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -367,7 +367,7 @@
 	kfree(lp);
 }

-void cleanup_module(void)
+static void __exit lance_cleanup_module(void)
 {
 	int this_dev;

@@ -380,6 +380,10 @@
 		}
 	}
 }
+
+module_init(lance_init_module);
+module_exit(lance_cleanup_module);
+
 #endif /* MODULE */
 MODULE_LICENSE("GPL");

Index: linux-2.6.17/drivers/net/lne390.c
=================================--- linux-2.6.17.orig/drivers/net/lne390.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/lne390.c	2006-08-22 13:40:11.000000000 +0530
@@ -406,7 +406,7 @@
 MODULE_DESCRIPTION("Mylex LNE390A/B EISA Ethernet driver");
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init lne390_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -440,7 +440,7 @@
 	iounmap(ei_status.mem);
 }

-void cleanup_module(void)
+static void __exit lne390_cleanup_module(void)
 {
 	int this_dev;

@@ -453,5 +453,9 @@
 		}
 	}
 }
+
+module_init(lne390_init_module);
+module_exit(lne390_cleanup_module);
+
 #endif /* MODULE */

Index: linux-2.6.17/drivers/net/mac8390.c
=================================--- linux-2.6.17.orig/drivers/net/mac8390.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/mac8390.c	2006-08-22 13:41:18.000000000 +0530
@@ -380,7 +380,7 @@

 /* overkill, of course */
 static struct net_device *dev_mac8390[15];
-int init_module(void)
+static int __init mac8390_init_module(void)
 {
 	int i;
 	for (i = 0; i < 15; i++) {
@@ -396,7 +396,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit mac8390_cleanup_module(void)
 {
 	int i;
 	for (i = 0; i < 15; i++) {
@@ -408,6 +408,9 @@
 	}
 }

+module_init(mac8390_init_module);
+module_exit(mac8390_cleanup_module);
+
 #endif /* MODULE */

 static int __init mac8390_initdev(struct net_device * dev, struct
nubus_dev * ndev,
Index: linux-2.6.17/drivers/net/mac89x0.c
=================================--- linux-2.6.17.orig/drivers/net/mac89x0.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/mac89x0.c	2006-08-22 13:42:23.000000000 +0530
@@ -633,8 +633,8 @@
 MODULE_PARM_DESC(debug, "CS89[02]0 debug level (0-5)");
 MODULE_LICENSE("GPL");

-int
-init_module(void)
+static int __init
+mac89x0_init_module(void)
 {
 	net_debug = debug;
         dev_cs89x0 = mac89x0_probe(-1);
@@ -645,13 +645,17 @@
 	return 0;
 }

-void
-cleanup_module(void)
+static void __exit
+mac89x0_cleanup_module(void)
 {
 	unregister_netdev(dev_cs89x0);
 	nubus_writew(0, dev_cs89x0->base_addr + ADD_PORT);
 	free_netdev(dev_cs89x0);
 }
+
+module_init(mac89x0_init_module);
+module_exit(mac89x0_cleanup_module);
+
 #endif /* MODULE */
 
 /*
Index: linux-2.6.17/drivers/net/mvme147.c
=================================--- linux-2.6.17.orig/drivers/net/mvme147.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/mvme147.c	2006-08-22 13:43:18.000000000 +0530
@@ -184,7 +184,7 @@
 MODULE_LICENSE("GPL");

 static struct net_device *dev_mvme147_lance;
-int init_module(void)
+static int __init mvme147_init_module(void)
 {
 	dev_mvme147_lance = mvme147lance_probe(-1);
 	if (IS_ERR(dev_mvme147_lance))
@@ -192,7 +192,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit mvme147_cleanup_module(void)
 {
 	struct m147lance_private *lp = dev_mvme147_lance->priv;
 	unregister_netdev(dev_mvme147_lance);
@@ -200,4 +200,7 @@
 	free_netdev(dev_mvme147_lance);
 }

+module_init(mvme147_init_module);
+module_exit(mvme147_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/ne-h8300.c
=================================--- linux-2.6.17.orig/drivers/net/ne-h8300.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/ne-h8300.c	2006-08-22 13:44:42.000000000 +0530
@@ -614,7 +614,7 @@
 is at boot) and so the probe will get confused by any other 8390 cards.
 ISA device autoprobes on a running machine are not recommended anyway. */

-int init_module(void)
+static int __init neh8300_init_module(void)
 {
 	int this_dev, found = 0;
 	int err;
@@ -652,7 +652,7 @@
 	return -ENODEV;
 }

-void cleanup_module(void)
+static void __exit neh8300_cleanup_module(void)
 {
 	int this_dev;

@@ -665,4 +665,8 @@
 		}
 	}
 }
+
+module_init(neh8300_init_module);
+module_exit(neh8300_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/ne.c
=================================--- linux-2.6.17.orig/drivers/net/ne.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/ne.c	2006-08-22 13:45:34.000000000 +0530
@@ -829,7 +829,7 @@
 is at boot) and so the probe will get confused by any other 8390 cards.
 ISA device autoprobes on a running machine are not recommended anyway. */

-int __init init_module(void)
+static int __init ne_init_module(void)
 {
 	int this_dev, found = 0;

@@ -867,7 +867,7 @@
 	release_region(dev->base_addr, NE_IO_EXTENT);
 }

-void cleanup_module(void)
+static void __exit ne_cleanup_module(void)
 {
 	int this_dev;

@@ -880,4 +880,8 @@
 		}
 	}
 }
+
+module_init(ne_init_module);
+module_exit(ne_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/ne2.c
=================================--- linux-2.6.17.orig/drivers/net/ne2.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/ne2.c	2006-08-22 13:46:38.000000000 +0530
@@ -780,7 +780,7 @@

 /* Module code fixed by David Weinehall */

-int __init init_module(void)
+static int __init ne2_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -813,7 +813,7 @@
 	release_region(dev->base_addr, NE_IO_EXTENT);
 }

-void cleanup_module(void)
+static void __exit ne2_cleanup_module(void)
 {
 	int this_dev;

@@ -826,4 +826,8 @@
 		}
 	}
 }
+
+module_init(ne2_init_module);
+module_exit(ne2_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/ni52.c
=================================--- linux-2.6.17.orig/drivers/net/ni52.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/ni52.c	2006-08-22 13:56:25.000000000 +0530
@@ -1323,7 +1323,7 @@
 MODULE_PARM_DESC(memstart, "NI5210 memory base address,required");
 MODULE_PARM_DESC(memend, "NI5210 memory end address,required");

-int init_module(void)
+static int __init ni52_init_module(void)
 {
 	if(io <= 0x0 || !memend || !memstart || irq < 2) {
 		printk("ni52: Autoprobing not allowed for modules.\nni52: Set
symbols 'io' 'irq' 'memstart' and 'memend'\n");
@@ -1335,12 +1335,16 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit ni52_cleanup_module(void)
 {
 	unregister_netdev(dev_ni52);
 	release_region(dev_ni52->base_addr, NI52_TOTAL_SIZE);
 	free_netdev(dev_ni52);
 }
+
+module_init(ni52_init_module);
+module_exit(ni52_cleanup_module);
+
 #endif /* MODULE */

 #if 0
Index: linux-2.6.17/drivers/net/ni65.c
=================================--- linux-2.6.17.orig/drivers/net/ni65.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/ni65.c	2006-08-22 14:16:28.000000000 +0530
@@ -1253,18 +1253,22 @@
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
+
+module_init(ni65_init_module);
+module_exit(ni65_cleanup_module);
+
 #endif /* MODULE */

 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/net/seeq8005.c
=================================--- linux-2.6.17.orig/drivers/net/seeq8005.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/seeq8005.c	2006-08-22 14:17:38.000000000 +0530
@@ -742,7 +742,7 @@
 MODULE_PARM_DESC(io, "SEEQ 8005 I/O base address");
 MODULE_PARM_DESC(irq, "SEEQ 8005 IRQ number");

-int init_module(void)
+static int __init seeq8005_init_module(void)
 {
 	dev_seeq = seeq8005_probe(-1);
 	if (IS_ERR(dev_seeq))
@@ -750,13 +750,16 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit seeq8005_cleanup_module(void)
 {
 	unregister_netdev(dev_seeq);
 	release_region(dev_seeq->base_addr, SEEQ8005_IO_EXTENT);
 	free_netdev(dev_seeq);
 }

+module_init(seeq8005_init_module);
+module_exit(seeq8005_cleanup_module);
+
 #endif /* MODULE */
 
 /*
Index: linux-2.6.17/drivers/net/sk_mca.c
=================================--- linux-2.6.17.orig/drivers/net/sk_mca.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/sk_mca.c	2006-08-22 14:18:32.000000000 +0530
@@ -1184,7 +1184,7 @@

 static struct net_device *moddevs[DEVMAX];

-int init_module(void)
+static int __init sk_mca_init_module(void)
 {
 	int z;

@@ -1200,7 +1200,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit sk_mca_cleanup_module(void)
 {
 	int z;

@@ -1213,4 +1213,8 @@
 		}
 	}
 }
+
+module_init(sk_mca_init_module);
+module_exit(sk_mca_cleanup_module);
+
 #endif				/* MODULE */
Index: linux-2.6.17/drivers/net/slhc.c
=================================--- linux-2.6.17.orig/drivers/net/slhc.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/slhc.c	2006-08-22 14:19:38.000000000 +0530
@@ -702,17 +702,20 @@

 #ifdef MODULE

-int init_module(void)
+static int __init slhc_init_module(void)
 {
 	printk(KERN_INFO "CSLIP: code copyright 1989 Regents of the
University of California\n");
 	return 0;
 }

-void cleanup_module(void)
+static void __exit slhc_cleanup_module(void)
 {
 	return;
 }

+module_init(slhc_init_module);
+module_exit(slhc_cleanup_module);
+
 #endif /* MODULE */
 #else /* CONFIG_INET */

Index: linux-2.6.17/drivers/net/smc-ultra.c
=================================--- linux-2.6.17.orig/drivers/net/smc-ultra.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/smc-ultra.c	2006-08-22 14:21:12.000000000 +0530
@@ -552,8 +552,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int __init
-init_module(void)
+static int __init
+smc_ultra_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -593,8 +593,8 @@
 	iounmap(ei_status.mem);
 }

-void
-cleanup_module(void)
+static void __exit
+smc_ultra_cleanup_module(void)
 {
 	int this_dev;

@@ -607,4 +607,8 @@
 		}
 	}
 }
+
+module_init(smc_ultra_init_module);
+module_exit(smc_ultra_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/smc-ultra32.c
=================================--- linux-2.6.17.orig/drivers/net/smc-ultra32.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/smc-ultra32.c	2006-08-22 14:22:29.000000000 +0530
@@ -421,7 +421,7 @@
 MODULE_DESCRIPTION("SMC Ultra32 EISA ethernet driver");
 MODULE_LICENSE("GPL");

-int __init init_module(void)
+static int __init smc_ultra32_init_module(void)
 {
 	int this_dev, found = 0;

@@ -437,7 +437,7 @@
 	return -ENXIO;
 }

-void cleanup_module(void)
+static void __exit smc_ultra32_cleanup_module(void)
 {
 	int this_dev;

@@ -450,5 +450,9 @@
 		}
 	}
 }
+
+module_init(smc_ultra32_init_module);
+module_exit(smc_ultra32_cleanup_module);
+
 #endif /* MODULE */

Index: linux-2.6.17/drivers/net/smc9194.c
=================================--- linux-2.6.17.orig/drivers/net/smc9194.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/smc9194.c	2006-08-22 14:23:54.000000000 +0530
@@ -1603,7 +1603,7 @@
 MODULE_PARM_DESC(irq, "SMC 99194 IRQ number");
 MODULE_PARM_DESC(ifport, "SMC 99194 interface port (0-default, 1-TP, 2-AUI)");

-int __init init_module(void)
+static int __init smc9194_init_module(void)
 {
 	if (io = 0)
 		printk(KERN_WARNING
@@ -1616,7 +1616,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit smc9194_cleanup_module(void)
 {
 	unregister_netdev(devSMC9194);
 	free_irq(devSMC9194->irq, devSMC9194);
@@ -1624,4 +1624,7 @@
 	free_netdev(devSMC9194);
 }

+module_init(smc9194_init_module);
+module_exit(smc9194_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/sun3_82586.c
=================================--- linux-2.6.17.orig/drivers/net/sun3_82586.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/sun3_82586.c	2006-08-22 14:25:13.000000000 +0530
@@ -1153,7 +1153,7 @@
 #error This code is not currently supported as a module
 static struct net_device *dev_sun3_82586;

-int init_module(void)
+static int __init sun3_82586_init_module(void)
 {
 	dev_sun3_82586 = sun3_82586_probe(-1);
 	if (IS_ERR(dev_sun3_82586))
@@ -1161,7 +1161,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit sun3_82586_cleanup_module(void)
 {
 	unsigned long ioaddr = dev_sun3_82586->base_addr;
 	unregister_netdev(dev_sun3_82586);
@@ -1169,6 +1169,10 @@
 	iounmap((void *)ioaddr);
 	free_netdev(dev_sun3_82586);
 }
+
+module_init(sun3_82586_init_module);
+module_exit(sun3_82586_cleanup_module);
+
 #endif /* MODULE */

 #if 0
Index: linux-2.6.17/drivers/net/sun3lance.c
=================================--- linux-2.6.17.orig/drivers/net/sun3lance.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/sun3lance.c	2006-08-22 14:26:24.000000000 +0530
@@ -944,7 +944,7 @@

 static struct net_device *sun3lance_dev;

-int init_module(void)
+static int __init sun3lance_init_module(void)
 {
 	sun3lance_dev = sun3lance_probe(-1);
 	if (IS_ERR(sun3lance_dev))
@@ -952,7 +952,7 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit sun3lance_cleanup_module(void)
 {
 	unregister_netdev(sun3lance_dev);
 #ifdef CONFIG_SUN3
@@ -961,5 +961,8 @@
 	free_netdev(sun3lance_dev);
 }

+module_init(sun3lance_init_module);
+module_exit(sun3lance_cleanup_module);
+
 #endif /* MODULE */

Index: linux-2.6.17/drivers/net/tokenring/smctr.c
=================================--- linux-2.6.17.orig/drivers/net/tokenring/smctr.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/tokenring/smctr.c	2006-08-22
14:27:36.000000000 +0530
@@ -5698,7 +5698,7 @@
 }
 			

-int init_module(void)
+static int __init smctr_init_module(void)
 {
         int i, found = 0;
 	struct net_device *dev;
@@ -5714,7 +5714,7 @@
         return found ? 0 : -ENODEV;
 }

-void cleanup_module(void)
+static void __exit smctr_cleanup_module(void)
 {
         int i;

@@ -5738,4 +5738,8 @@
 		}
         }
 }
+
+module_init(smctr_init_module);
+module_exit(smctr_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/tokenring/tms380tr.c
=================================--- linux-2.6.17.orig/drivers/net/tokenring/tms380tr.c	2006-06-18
07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/tokenring/tms380tr.c	2006-08-22
14:28:29.000000000 +0530
@@ -2380,7 +2380,7 @@

 static struct module *TMS380_module = NULL;

-int init_module(void)
+static int __init tms380tr_init_module(void)
 {
 	printk(KERN_DEBUG "%s", version);
 	
@@ -2388,10 +2388,14 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit tms380tr_cleanup_module(void)
 {
 	TMS380_module = NULL;
 }
+
+module_init(tms380tr_init_module);
+module_exit(tms380tr_cleanup_module);
+
 #endif

 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/net/wan/hostess_sv11.c
=================================--- linux-2.6.17.orig/drivers/net/wan/hostess_sv11.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/wan/hostess_sv11.c	2006-08-22
14:29:37.000000000 +0530
@@ -402,7 +402,7 @@

 static struct sv11_device *sv11_unit;

-int init_module(void)
+static int __init hostess_sv11_init_module(void)
 {
 	printk(KERN_INFO "SV-11 Z85230 Synchronous Driver v 0.03.\n");
 	printk(KERN_INFO "(c) Copyright 2001, Red Hat Inc.\n");	
@@ -411,11 +411,14 @@
 	return 0;
 }

-void cleanup_module(void)
+static void __exit hostess_sv11_cleanup_module(void)
 {
 	if(sv11_unit)
 		sv11_shutdown(sv11_unit);
 }

+module_init(hostess_sv11_init_module);
+module_exit(hostess_sv11_cleanup_module);
+
 #endif

Index: linux-2.6.17/drivers/net/wan/sbni.c
=================================--- linux-2.6.17.orig/drivers/net/wan/sbni.c	2006-08-18 20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/wan/sbni.c	2006-08-22 14:30:51.000000000 +0530
@@ -1494,7 +1494,7 @@
 MODULE_LICENSE("GPL");


-int __init init_module( void )
+static int __init sbni_init_module( void )
 {
 	struct net_device  *dev;
 	int err;
@@ -1523,8 +1523,8 @@
 	return  *sbni_cards  ?  0  :  -ENODEV;
 }

-void
-cleanup_module( void )
+static void __exit
+sbni_cleanup_module( void )
 {
 	struct net_device  *dev;
 	int  num;
@@ -1537,6 +1537,9 @@
 		}
 }

+module_init(sbni_init_module);
+module_exit(sbni_cleanup_module);
+
 #else	/* MODULE */

 static int __init
Index: linux-2.6.17/drivers/net/wd.c
=================================--- linux-2.6.17.orig/drivers/net/wd.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/net/wd.c	2006-08-22 14:31:57.000000000 +0530
@@ -500,8 +500,8 @@

 /* This is set up so that only a single autoprobe takes place per call.
 ISA device autoprobes on a running machine are not recommended. */
-int
-init_module(void)
+static int __init
+wd_init_module(void)
 {
 	struct net_device *dev;
 	int this_dev, found = 0;
@@ -538,8 +538,8 @@
 	iounmap(ei_status.mem);
 }

-void
-cleanup_module(void)
+static void __exit
+wd_cleanup_module(void)
 {
 	int this_dev;

@@ -552,4 +552,8 @@
 		}
 	}
 }
+
+module_init(wd_init_module);
+module_exit(wd_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/net/wireless/arlan-main.c
=================================--- linux-2.6.17.orig/drivers/net/wireless/arlan-main.c	2006-08-18
20:51:59.000000000 +0530
+++ linux-2.6.17/drivers/net/wireless/arlan-main.c	2006-08-22
14:32:59.000000000 +0530
@@ -1837,7 +1837,7 @@
 }

 #ifdef  MODULE
-int __init init_module(void)
+static int __init arlan_main_init_module(void)
 {
 	int i = 0;

@@ -1859,7 +1859,7 @@
 }


-void __exit cleanup_module(void)
+static void __exit arlan_main_cleanup_module(void)
 {
 	int i = 0;
 	struct net_device *dev;
@@ -1888,6 +1888,8 @@
 	ARLAN_DEBUG_EXIT("cleanup_module");
 }

+module_init(arlan_main_init_module);
+module_exit(arlan_main_cleanup_module);

 #endif
 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/net/wireless/wavelan.c
=================================--- linux-2.6.17.orig/drivers/net/wireless/wavelan.c	2006-08-18
20:52:00.000000000 +0530
+++ linux-2.6.17/drivers/net/wireless/wavelan.c	2006-08-22
14:34:21.000000000 +0530
@@ -4308,7 +4308,7 @@
  * Insertion of the module
  * I'm now quite proud of the multi-device support.
  */
-int __init init_module(void)
+static int __init wavelan_init_module(void)
 {
 	int ret = -EIO;		/* Return error if no cards found */
 	int i;
@@ -4372,7 +4372,7 @@
 /*
  * Removal of the module
  */
-void cleanup_module(void)
+static void __exit wavelan_cleanup_module(void)
 {
 #ifdef DEBUG_MODULE_TRACE
 	printk(KERN_DEBUG "-> cleanup_module()\n");
@@ -4399,6 +4399,10 @@
 	printk(KERN_DEBUG "<- cleanup_module()\n");
 #endif
 }
+
+module_init(wavelan_init_module);
+module_exit(wavelan_cleanup_module);
+
 #endif				/* MODULE */
 MODULE_LICENSE("GPL");

Index: linux-2.6.17/drivers/sbus/char/vfc_dev.c
=================================--- linux-2.6.17.orig/drivers/sbus/char/vfc_dev.c	2006-08-18
20:52:01.000000000 +0530
+++ linux-2.6.17/drivers/sbus/char/vfc_dev.c	2006-08-22 14:38:05.000000000 +0530
@@ -699,7 +699,7 @@
 }

 #ifdef MODULE
-int init_module(void)
+static int __init vfc_dev_init_module(void)
 #else
 int vfc_init(void)
 #endif
@@ -716,7 +716,7 @@
 	kfree(dev);
 }

-void cleanup_module(void)
+static void __exit vfc_dev_cleanup_module(void)
 {
 	struct vfc_dev **devp;

@@ -728,6 +728,10 @@
 	kfree(vfc_dev_lst);
 	return;
 }
+
+module_init(vfc_dev_init_module);
+module_exit(vfc_dev_cleanup_module);
+
 #endif

 MODULE_LICENSE("GPL");
Index: linux-2.6.17/drivers/scsi/NCR53C9x.c
=================================--- linux-2.6.17.orig/drivers/scsi/NCR53C9x.c	2006-08-18
20:52:01.000000000 +0530
+++ linux-2.6.17/drivers/scsi/NCR53C9x.c	2006-08-22 14:39:21.000000000 +0530
@@ -3621,13 +3621,17 @@
 }

 #ifdef MODULE
-int init_module(void) { return 0; }
-void cleanup_module(void) {}
+static int __init NCR53C9x_init_module(void) { return 0; }
+static void __exit NCR53C9x_cleanup_module(void) {}
 void esp_release(void)
 {
 	esps_in_use--;
 	esps_running = esps_in_use;
 }
+
+module_init(NCR53C9x_init_module);
+module_exit(NCR53C9x_cleanup_module);
+
 #endif

 EXPORT_SYMBOL(esp_abort);
Index: linux-2.6.17/drivers/serial/dz.h
=================================--- linux-2.6.17.orig/drivers/serial/dz.h	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/drivers/serial/dz.h	2006-08-22 14:41:25.000000000 +0530
@@ -111,8 +111,11 @@
 #define DZ_WAKEUP_CHARS   DZ_XMIT_SIZE/4

 #ifdef MODULE
-int init_module (void)
-void cleanup_module (void)
+static int __init dz_init_module (void)
+static void __exit dz_cleanup_module (void)
+
+module_init(dz_init_module);
+module_exit(dz_cleanup_module);
 #endif

 #endif /* DZ_SERIAL_H */
Index: linux-2.6.17/drivers/video/atafb.c
=================================--- linux-2.6.17.orig/drivers/video/atafb.c	2006-08-18 20:52:05.000000000 +0530
+++ linux-2.6.17/drivers/video/atafb.c	2006-08-22 14:42:24.000000000 +0530
@@ -3089,8 +3089,11 @@
 #ifdef MODULE
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init atafb_init_module(void)
 {
 	return atafb_init();
 }
+
+module_init(atafb_init_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/video/controlfb.c
=================================--- linux-2.6.17.orig/drivers/video/controlfb.c	2006-08-18
20:52:05.000000000 +0530
+++ linux-2.6.17/drivers/video/controlfb.c	2006-08-22 14:43:38.000000000 +0530
@@ -176,7 +176,7 @@
 #ifdef MODULE
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init controlfb_init_module(void)
 {
 	struct device_node *dp;

@@ -187,10 +187,14 @@
 	return -ENXIO;
 }

-void cleanup_module(void)
+static void __exit controlfb_cleanup_module(void)
 {
 	control_cleanup();
 }
+
+module_init(controlfb_init_module);
+module_exit(controlfb_cleanup_module);
+
 #endif

 /*
Index: linux-2.6.17/drivers/video/cyberfb.c
=================================--- linux-2.6.17.orig/drivers/video/cyberfb.c	2006-08-18
20:52:05.000000000 +0530
+++ linux-2.6.17/drivers/video/cyberfb.c	2006-08-22 14:44:17.000000000 +0530
@@ -1200,10 +1200,13 @@
 #ifdef MODULE
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init cyberfb_init_module(void)
 {
 	return cyberfb_init();
 }
+
+module_init(cyberfb_init_module);
+
 #endif /* MODULE */

 /*
Index: linux-2.6.17/drivers/video/pm3fb.c
=================================--- linux-2.6.17.orig/drivers/video/pm3fb.c	2006-08-18 20:52:05.000000000 +0530
+++ linux-2.6.17/drivers/video/pm3fb.c	2006-08-22 14:45:19.000000000 +0530
@@ -3600,7 +3600,7 @@
 	DPRINTK(1, "pm3fb use options: %s\n", g_options);
 }

-int init_module(void)
+static int __init pm3fb_init_module(void)
 {
 	DTRACE;

@@ -3611,7 +3611,7 @@
 	return (0);
 }

-void cleanup_module(void)
+static void __exit pm3fb_cleanup_module(void)
 {
 	DTRACE;
 	{
@@ -3638,4 +3638,8 @@
 	}
 	return;
 }
+
+module_init(pm3fb_init_module);
+module_exit(pm3fb_cleanup_module);
+
 #endif /* MODULE */
Index: linux-2.6.17/drivers/video/retz3fb.c
=================================--- linux-2.6.17.orig/drivers/video/retz3fb.c	2006-08-18
20:52:05.000000000 +0530
+++ linux-2.6.17/drivers/video/retz3fb.c	2006-08-22 14:46:24.000000000 +0530
@@ -1484,10 +1484,12 @@
 #ifdef MODULE
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init retz3fb_init_module(void)
 {
 	return retz3fb_init();
 }
+
+module_init(retz3fb_init_module);
 #endif


Index: linux-2.6.17/drivers/video/virgefb.c
=================================--- linux-2.6.17.orig/drivers/video/virgefb.c	2006-08-18
20:52:06.000000000 +0530
+++ linux-2.6.17/drivers/video/virgefb.c	2006-08-22 14:46:55.000000000 +0530
@@ -2057,10 +2057,13 @@
 #ifdef MODULE
 MODULE_LICENSE("GPL");

-int init_module(void)
+static int __init virgefb_init_module(void)
 {
 	return virgefb_init();
 }
+
+module_init(virgefb_init_module);
+
 #endif /* MODULE */

 static int cv3d_has_4mb(void)
Index: linux-2.6.17/fs/jffs2/comprtest.c
=================================--- linux-2.6.17.orig/fs/jffs2/comprtest.c	2006-06-18 07:19:35.000000000 +0530
+++ linux-2.6.17/fs/jffs2/comprtest.c	2006-08-22 14:48:31.000000000 +0530
@@ -270,7 +270,7 @@
 unsigned char jffs2_compress(unsigned char *data_in, unsigned char *cpage_out,
 			     uint32_t *datalen, uint32_t *cdatalen);

-int init_module(void ) {
+static int __init comprtest_init_module(void ) {
 	unsigned char comprtype;
 	uint32_t c, d;
 	int ret;
@@ -305,3 +305,5 @@
 		printk("Compression good for %d bytes\n", d);
 	return 1;
 }
+
+module_init(comprtest_init_module);
Index: linux-2.6.17/sound/oss/msnd.c
=================================--- linux-2.6.17.orig/sound/oss/msnd.c	2006-08-18 20:52:14.000000000 +0530
+++ linux-2.6.17/sound/oss/msnd.c	2006-08-22 14:49:25.000000000 +0530
@@ -405,12 +405,16 @@
 MODULE_LICENSE("GPL");


-int init_module(void)
+static int __init msnd_init_module(void)
 {
 	return 0;
 }

-void cleanup_module(void)
+static void __exit msnd_cleanup_module(void)
 {
 }
+
+module_init(msnd_init_module);
+module_exit(msnd_cleanup_module);
+
 #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
