From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:30:41 +0000
Subject: [KJ] [PATCH] convert airo_cs wireless driver to module_param
Message-Id: <20041109213041.GB9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2842009057189947=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2842009057189947==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in airo_cs wireless driver.

--- drivers/net/wireless/airo_cs.c.orig	2004-11-09 20:40:21.891939232 +0100
+++ drivers/net/wireless/airo_cs.c	2004-11-08 23:09:48.000000000 +0100
@@ -52,7 +52,7 @@
 */
 #ifdef PCMCIA_DEBUG
 static int pc_debug = PCMCIA_DEBUG;
-MODULE_PARM(pc_debug, "i");
+module_param(pc_debug, int, 0644);
 static char *version = "$Revision: 1.2 $";
 #define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args);
 #else
@@ -75,8 +75,8 @@ MODULE_DESCRIPTION("Support for Cisco/Ai
 		   with the airo module.");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_SUPPORTED_DEVICE("Aironet 4500, 4800 and Cisco 340 PCMCIA cards");
-MODULE_PARM(irq_mask, "i");
-MODULE_PARM(irq_list, "1-4i");
+module_param(irq_mask, int, 0644);
+module_param_array(irq_list, int, NULL, 0444);
 
 /*====================================================================*/
 

--===============2842009057189947==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2842009057189947==--
