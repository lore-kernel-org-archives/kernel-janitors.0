From: James Nelson <james4765@verizon.net>
Date: Sun, 26 Dec 2004 14:50:16 +0000
Subject: [KJ] [PATCH] tipar: Code cleanup
Message-Id: <20041226145037.15696.18777.54291@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32737140629803174=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32737140629803174==

Correct the following issues:
Remove reference to 2.5 kernel code.
Switch some ints to unsigned ints.
Correct KERN_ constants in printk's, and move most to pr_debug & pr_info
Fix some >80 column lines and indenting.

Compile tested.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-original/drivers/char/tipar.c linux-2.6.10/drivers/char/tipar.c
--- linux-2.6.10-original/drivers/char/tipar.c	2004-12-24 16:35:23.000000000 -0500
+++ linux-2.6.10/drivers/char/tipar.c	2004-12-26 09:35:42.864403836 -0500
@@ -40,10 +40,10 @@
  * the minor number.
  *
  */
-
+#undef DEBUG				/* change to #define to get debugging
+					 * output - for pr_debug() */
 #include <linux/config.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -57,7 +57,7 @@
 #include <asm/io.h>
 #include <linux/bitops.h>
 #include <linux/devfs_fs_kernel.h>	/* DevFs support */
-#include <linux/parport.h>	/* Our code depend on parport */
+#include <linux/parport.h>		/* Our code depend on parport */
 #include <linux/device.h>
 
 /*
@@ -74,9 +74,6 @@
 #define DRIVER_LICENSE "GPL"
 
 #define VERSION(ver,rel,seq) (((ver)<<16) | ((rel)<<8) | (seq))
-#if LINUX_VERSION_CODE < VERSION(2,5,0)
-# define need_resched() (current->need_resched)
-#endif
 
 /* ----- global variables --------------------------------------------- */
 
@@ -143,7 +140,7 @@
 static int
 put_ti_parallel(int minor, unsigned char data)
 {
-	int bit;
+	unsigned int bit;
 	unsigned long max;
 
 	for (bit = 0; bit < 8; bit++) {
@@ -187,7 +184,7 @@
 static int
 get_ti_parallel(int minor)
 {
-	int bit;
+	unsigned int bit;
 	unsigned char v, data = 0;
 	unsigned long max;
 
@@ -234,7 +231,8 @@
 		outbyte(3, minor);
 		outbyte(i, minor);
 		udelay(delay);
-		/*printk(KERN_DEBUG "Probing -> %i: 0x%02x 0x%02x\n", i, data & 0x30, seq[i]); */
+		pr_debug("tipar: Probing -> %i: 0x%02x 0x%02x\n", i,
+			data & 0x30, seq[i]);
 		if ((inbyte(minor) & 0x30) != seq[i]) {
 			outbyte(3, minor);
 			return -1;
@@ -279,7 +277,8 @@
 }
 
 static ssize_t
-tipar_write(struct file *file, const char __user *buf, size_t count, loff_t * ppos)
+tipar_write (struct file *file, const char __user *buf, size_t count,
+		loff_t * ppos)
 {
 	unsigned int minor = iminor(file->f_dentry->d_inode) - TIPAR_MINOR;
 	ssize_t n;
@@ -405,7 +404,8 @@
 		if (ints[1] != 0)
                         timeout = ints[1];
                 else
-                        printk("tipar: wrong timeout value (0), using default value instead.");
+                        printk(KERN_WARNING "tipar: bad timeout value (0), "
+				"using default value instead");
 		if (ints[0] > 1) {
 			delay = ints[2];
 		}
@@ -436,8 +436,8 @@
 		goto out;
 	}
 
-	class_simple_device_add(tipar_class, MKDEV(TIPAR_MAJOR, TIPAR_MINOR + nr),
-			NULL, "par%d", nr);
+	class_simple_device_add(tipar_class, MKDEV(TIPAR_MAJOR,
+			TIPAR_MINOR + nr), NULL, "par%d", nr);
 	/* Use devfs, tree: /dev/ticables/par/[0..2] */
 	err = devfs_mk_cdev(MKDEV(TIPAR_MAJOR, TIPAR_MINOR + nr),
 			S_IFCHR | S_IRUGO | S_IWUGO,
@@ -446,14 +446,13 @@
 		goto out_class;
 
 	/* Display informations */
-	printk(KERN_INFO "tipar%d: using %s (%s).\n", nr, port->name,
-	       (port->irq ==
+	pr_info("tipar%d: using %s (%s)\n", nr, port->name, (port->irq ==
 		PARPORT_IRQ_NONE) ? "polling" : "interrupt-driven");
 
 	if (probe_ti_parallel(nr) != -1)
-		printk("tipar%d: link cable found !\n", nr);
+		pr_info("tipar%d: link cable found\n", nr);
 	else
-		printk("tipar%d: link cable not found.\n", nr);
+		pr_info("tipar%d: link cable not found\n", nr);
 
 	err = 0;
 	goto out;
@@ -469,7 +468,7 @@
 tipar_attach(struct parport *port)
 {
 	if (tp_count == PP_NO) {
-		printk("tipar: ignoring parallel port (max. %d)\n", PP_NO);
+		pr_info("tipar: ignoring parallel port (max. %d)\n", PP_NO);
 		return;
 	}
 
@@ -494,11 +493,11 @@
 {
 	int err = 0;
 
-	printk("tipar: parallel link cable driver, version %s\n",
-	       DRIVER_VERSION);
+	pr_info("tipar: parallel link cable driver, version %s\n",
+		DRIVER_VERSION);
 
 	if (register_chrdev(TIPAR_MAJOR, "tipar", &tipar_fops)) {
-		printk("tipar: unable to get major %d\n", TIPAR_MAJOR);
+		printk(KERN_ERR "tipar: unable to get major %d\n", TIPAR_MAJOR);
 		err = -EIO;
 		goto out;
 	}
@@ -512,7 +511,7 @@
 		goto out_chrdev;
 	}
 	if (parport_register_driver(&tipar_driver)) {
-		printk("tipar: unable to register with parport\n");
+		printk(KERN_ERR "tipar: unable to register with parport\n");
 		err = -EIO;
 		goto out;
 	}
@@ -546,7 +545,7 @@
 	class_simple_destroy(tipar_class);
 	devfs_remove("ticables/par");
 
-	printk("tipar: module unloaded !\n");
+	pr_info("tipar: module unloaded\n");
 }
 
 /* --------------------------------------------------------------------- */

--===============32737140629803174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32737140629803174==--
