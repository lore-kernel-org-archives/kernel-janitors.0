From: sebek64@post.cz (Marcel Sebek)
Date: Sun, 19 Dec 2004 19:05:30 +0000
Subject: [KJ] [PATCH] radio-sf16fmi cleanup
Message-Id: <20041219190530.GA9205@penguin.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21564062403030482=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21564062403030482==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is small cleanup of radio-sf16fmi driver.

Compile tested.

Signed-off-by: Marcel Sebek <sebek64@post.cz>

diff -urNp linux-2.6/drivers/media/radio/radio-sf16fmi.c linux-2.6-new/drivers/media/radio/radio-sf16fmi.c
--- linux-2.6/drivers/media/radio/radio-sf16fmi.c	2004-09-13 19:44:54.000000000 +0200
+++ linux-2.6-new/drivers/media/radio/radio-sf16fmi.c	2004-12-18 19:15:02.000000000 +0100
@@ -22,6 +22,7 @@
 #include <linux/delay.h>	/* udelay			*/
 #include <linux/videodev.h>	/* kernel radio structs		*/
 #include <linux/isapnp.h>
+#include <linux/moduleparam.h>
 #include <asm/io.h>		/* outb, outb_p			*/
 #include <asm/uaccess.h>	/* copy to/from user		*/
 #include <asm/semaphore.h>
@@ -36,7 +37,7 @@ struct fmi_device
 
 static int io = -1; 
 static int radio_nr = -1;
-static struct pnp_dev *dev = NULL;
+static struct pnp_dev *dev;
 static struct semaphore lock;
 
 /* freq is in 1/16 kHz to internal number, hw precision is 50 kHz */
@@ -312,9 +313,9 @@ MODULE_AUTHOR("Petr Vandrovec, vandrove@
 MODULE_DESCRIPTION("A driver for the SF16MI radio.");
 MODULE_LICENSE("GPL");
 
-MODULE_PARM(io, "i");
+module_param(io, int, 0444);
 MODULE_PARM_DESC(io, "I/O address of the SF16MI card (0x284 or 0x384)");
-MODULE_PARM(radio_nr, "i");
+module_param(radio_nr, int, 0444);
 
 static void __exit fmi_cleanup_module(void)
 {
@@ -326,13 +327,3 @@ static void __exit fmi_cleanup_module(vo
 
 module_init(fmi_init);
 module_exit(fmi_cleanup_module);
-
-#ifndef MODULE
-static int __init fmi_setup_io(char *str)
-{
-	get_option(&str, &io);
-	return 1;
-}
-
-__setup("sf16fm=", fmi_setup_io);
-#endif


--===============21564062403030482==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21564062403030482==--
