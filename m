From: sebek64@post.cz (Marcel Sebek)
Date: Sun, 19 Dec 2004 20:38:56 +0000
Subject: [KJ] [PATCH] drivers/atm/he.c remove dead code
Message-Id: <20041219203856.GA11391@penguin.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54991234222384566=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54991234222384566==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch removes dead code from drivers/atm/he.c, replaces custom
debug printk with pr_debug and removes unneeded zero initializers.

Compile tested.

Signed-off-by: Marcel Sebek <sebek64@post.cz>

Index: linux-2.6-kj/drivers/atm/he.c
===================================================================
--- linux-2.6-kj.orig/drivers/atm/he.c	2004-12-04 14:00:13.000000000 +0100
+++ linux-2.6-kj/drivers/atm/he.c	2004-12-19 21:15:08.080994460 +0100
@@ -87,28 +87,6 @@
 #define USE_TPD_POOL
 /* #undef CONFIG_ATM_HE_USE_SUNI */
 
-/* compatibility */
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,69)
-typedef void irqreturn_t;
-#define IRQ_NONE
-#define IRQ_HANDLED
-#define IRQ_RETVAL(x)
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,9)
-#define __devexit_p(func)		func
-#endif
-
-#ifndef MODULE_LICENSE
-#define MODULE_LICENSE(x)
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,3)
-#define pci_set_drvdata(pci_dev, data)	(pci_dev)->driver_data = (data)
-#define pci_get_drvdata(pci_dev)	(pci_dev)->driver_data
-#endif
-
 #include "he.h"
 
 #include "suni.h"
@@ -117,12 +95,7 @@ typedef void irqreturn_t;
 
 #define hprintk(fmt,args...)	printk(KERN_ERR DEV_LABEL "%d: " fmt, he_dev->number , ##args)
 
-#undef DEBUG
-#ifdef DEBUG
-#define HPRINTK(fmt,args...)	printk(KERN_DEBUG DEV_LABEL "%d: " fmt, he_dev->number , ##args)
-#else
-#define HPRINTK(fmt,args...)	do { } while (0)
-#endif /* DEBUG */
+#define HPRINTK(fmt,args...)	pr_debug(DEV_LABEL "%d: " fmt, he_dev->number , ##args)
 
 
 /* version definition */
@@ -147,13 +120,13 @@ static u8 read_prom_byte(struct he_dev *
 
 /* globals */
 
-struct he_dev *he_devs = NULL;
-static int disable64 = 0;
+struct he_dev *he_devs;
+static int disable64;
 static short nvpibits = -1;
 static short nvcibits = -1;
 static short rx_skb_reserve = 16;
 static int irq_coalesce = 1;
-static int sdh = 0;
+static int sdh;
 
 static struct atmdev_ops he_ops =
 {


--===============54991234222384566==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54991234222384566==--
