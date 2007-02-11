From: Andi Kleen <ak@suse.de>
Date: Sun, 11 Feb 2007 13:57:53 +0000
Subject: [KJ] [PATCH] Don't panic the kernel when cyclades tty
Message-Id: <200702111457.54085.ak@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


I noticed this while grepping for something. There is no reason to panic
the kernel when a tty driver cannot be initialized.
Just error out in this case, no need to panic.

BTW there seem to be more bogus panics in a few drivers. Perhaps that
would be a fruitful target for some janitor activity (mailing list cc'ed) 

Signed-off-by: Andi Kleen <ak@suse.de

Index: linux-2.6.20-git6-hack/drivers/char/cyclades.c
=================================--- linux-2.6.20-git6-hack.orig/drivers/char/cyclades.c
+++ linux-2.6.20-git6-hack/drivers/char/cyclades.c
@@ -5346,8 +5346,11 @@ static int __init cy_init(void)
 	cy_serial_driver->flags = TTY_DRIVER_REAL_RAW;
 	tty_set_operations(cy_serial_driver, &cy_ops);
 
-	if (tty_register_driver(cy_serial_driver))
-		panic("Couldn't register Cyclades serial driver\n");
+	if (tty_register_driver(cy_serial_driver)) {
+		printk(KERN_ERR "Couldn't register Cyclades serial driver\n");
+		put_tty_driver(cy_serial_driver);
+		return -EIO;
+	}
 
 	for (i = 0; i < NR_CARDS; i++) {
 		/* base_addr=0 indicates board not found */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
