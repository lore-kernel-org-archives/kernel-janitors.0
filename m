From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 12:18:24 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-h2.c
Message-Id: <20060515121824.GM12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39599392581669601=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39599392581669601==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h2.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c	2006-05-15 12:24:39.000000000 +0200
@@ -121,7 +121,7 @@
 static void __init h2_init_smc91x(void)
 {
 	if ((omap_request_gpio(0)) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
+		printk(KERN_WARNING "Error requesting gpio 0 for smc91x irq\n");
 		return;
 	}
 }

--===============39599392581669601==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39599392581669601==--
