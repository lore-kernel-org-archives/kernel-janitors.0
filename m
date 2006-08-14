From: Matthew Martin <lihnucks@gmail.com>
Date: Mon, 14 Aug 2006 23:16:08 +0000
Subject: [KJ] [PATCH] Convert DPRINTK to pr_debug in drivers/parport/daisy.c
Message-Id: <44E10438.7060900@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44B44D3A.8010101@gmail.com>
In-Reply-To: <44B44D3A.8010101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This converts a DPRINTK macro in drivers/parport/daisy.c to pr_debug.

Signed-Off-By: Matthew Martin <lihnucks@gmail.com>

---

--- vanilla-linux-2.6.18-rc4/drivers/parport/daisy.c	2006-08-09 19:55:17.000000000 -0500
+++ linux-2.6.18-rc4/drivers/parport/daisy.c	2006-08-14 17:22:38.000000000 -0500
@@ -23,17 +23,12 @@
 #include <linux/parport.h>
 #include <linux/delay.h>
 #include <linux/sched.h>
+#include <linux/kernel.h>
 
 #include <asm/current.h>
 #include <asm/uaccess.h>
 
-#undef DEBUG
 
-#ifdef DEBUG
-#define DPRINTK(stuff...) printk (stuff)
-#else
-#define DPRINTK(stuff...)
-#endif
 
 static struct daisydev {
 	struct daisydev *next;
@@ -322,8 +317,7 @@ static int cpp_daisy (struct parport *po
 		  | PARPORT_STATUS_PAPEROUT
 		  | PARPORT_STATUS_SELECT
 		  | PARPORT_STATUS_ERROR)) {
-		DPRINTK (KERN_DEBUG "%s: cpp_daisy: aa5500ff(%02x)\n",
-			 port->name, s);
+		pr_debug ("%s: cpp_daisy: aa5500ff(%02x)\n", port->name, s);
 		return -ENXIO;
 	}
 
@@ -333,8 +327,7 @@ static int cpp_daisy (struct parport *po
 					  | PARPORT_STATUS_SELECT
 					  | PARPORT_STATUS_ERROR);
 	if (s != (PARPORT_STATUS_SELECT | PARPORT_STATUS_ERROR)) {
-		DPRINTK (KERN_DEBUG "%s: cpp_daisy: aa5500ff87(%02x)\n",
-			 port->name, s);
+		pr_debug ("%s: cpp_daisy: aa5500ff87(%02x)\n", port->name, s);
 		return -ENXIO;
 	}
 
@@ -369,7 +362,7 @@ static int cpp_mux (struct parport *port
 
 	s = parport_read_status (port);
 	if (!(s & PARPORT_STATUS_ACK)) {
-		DPRINTK (KERN_DEBUG "%s: cpp_mux: aa55f00f52ad%02x(%02x)\n",
+		pr_debug ("%s: cpp_mux: aa55f00f52ad%02x(%02x)\n",
 			 port->name, cmd, s);
 		return -EIO;
 	}
@@ -455,8 +448,7 @@ static int assign_addrs (struct parport 
 		  | PARPORT_STATUS_PAPEROUT
 		  | PARPORT_STATUS_SELECT
 		  | PARPORT_STATUS_ERROR)) {
-		DPRINTK (KERN_DEBUG "%s: assign_addrs: aa5500ff(%02x)\n",
-			 port->name, s);
+		pr_debug ("%s: assign_addrs: aa5500ff(%02x)\n", port->name, s);
 		return 0;
 	}
 
@@ -466,7 +458,7 @@ static int assign_addrs (struct parport 
 					  | PARPORT_STATUS_SELECT
 					  | PARPORT_STATUS_ERROR);
 	if (s != (PARPORT_STATUS_SELECT | PARPORT_STATUS_ERROR)) {
-		DPRINTK (KERN_DEBUG "%s: assign_addrs: aa5500ff87(%02x)\n",
+		pr_debug ("%s: assign_addrs: aa5500ff87(%02x)\n",
 			 port->name, s);
 		return 0;
 	}
@@ -504,7 +496,7 @@ static int assign_addrs (struct parport 
 
 	parport_write_data (port, 0xff); udelay (2);
 	detected = numdevs - thisdev;
-	DPRINTK (KERN_DEBUG "%s: Found %d daisy-chained devices\n", port->name,
+	pr_debug ("%s: Found %d daisy-chained devices\n", port->name,
 		 detected);
 
 	/* Ask the new devices to introduce themselves. */


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
