From: James Nelson <james4765@verizon.net>
Date: Sun, 26 Dec 2004 16:26:48 +0000
Subject: [KJ] [PATCH] hw_random: Minor cleanup to hw_random.c
Message-Id: <20041226162709.15894.42935.68246@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73377802414088045=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73377802414088045==

Clean up in drivers/char/hw_random.c:
Make debug #defines a little easier to understand.
Small whitespace cleanup.
Change some printk()'s into pr_info()'s.
Add KERN_ constant to debug printk().

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-original/drivers/char/hw_random.c linux-2.6.10/drivers/char/hw_random.c
--- linux-2.6.10-original/drivers/char/hw_random.c	2004-12-24 16:34:31.000000000 -0500
+++ linux-2.6.10/drivers/char/hw_random.c	2004-12-26 11:22:26.640871119 -0500
@@ -56,31 +56,27 @@
 /*
  * debugging macros
  */
-#undef RNG_DEBUG /* define to enable copious debugging info */
 
-#ifdef RNG_DEBUG
-/* note: prints function name for you */
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __FUNCTION__ , ## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
+/* pr_debug() collapses to a no-op if DEBUG is not defined */
+#define DPRINTK(fmt, args...) pr_debug(PFX "%s: " fmt, __FUNCTION__ , ## args)
+
 
-#define RNG_NDEBUG        /* define to disable lightweight runtime checks */
+#undef RNG_NDEBUG        /* define to enable lightweight runtime checks */
 #ifdef RNG_NDEBUG
-#define assert(expr)
+#define assert(expr)							\
+		if(!(expr)) {						\
+		printk(KERN_DEBUG PFX "Assertion failed! %s,%s,%s,"	\
+		"line=%d\n", #expr, __FILE__, __FUNCTION__, __LINE__);	\
+		}
 #else
-#define assert(expr) \
-        if(!(expr)) {                                   \
-        printk( "Assertion failed! %s,%s,%s,line=%d\n", \
-        #expr,__FILE__,__FUNCTION__,__LINE__);          \
-        }
+#define assert(expr)
 #endif
 
 #define RNG_MISCDEV_MINOR		183 /* official */
 
 static int rng_dev_open (struct inode *inode, struct file *filp);
 static ssize_t rng_dev_read (struct file *filp, char __user *buf, size_t size,
-			     loff_t * offp);
+				loff_t * offp);
 
 static int __init intel_init (struct pci_dev *dev);
 static void intel_cleanup(void);
@@ -322,7 +318,8 @@
 	rnen |= (1 << 7);	/* PMIO enable */
 	pci_write_config_byte(dev, 0x41, rnen);
 
-	printk(KERN_INFO PFX "AMD768 system management I/O registers at 0x%X.\n", pmbase);
+	pr_info( PFX "AMD768 system management I/O registers at 0x%X.\n",
+			pmbase);
 
 	amd_dev = dev;
 
@@ -483,7 +480,7 @@
 
 
 static ssize_t rng_dev_read (struct file *filp, char __user *buf, size_t size,
-			     loff_t * offp)
+				loff_t * offp)
 {
 	static spinlock_t rng_lock = SPIN_LOCK_UNLOCKED;
 	unsigned int have_data;
@@ -606,7 +603,7 @@
 	if (rc)
 		return rc;
 
-	printk (KERN_INFO RNG_DRIVER_NAME " loaded\n");
+	pr_info( RNG_DRIVER_NAME " loaded\n");
 
 	DPRINTK ("EXIT, returning 0\n");
 	return 0;

--===============73377802414088045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73377802414088045==--
