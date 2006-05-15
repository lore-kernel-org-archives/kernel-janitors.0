From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 14:34:45 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-osk.c
Message-Id: <20060515143445.GR12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87128317401630451=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============87128317401630451==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/board-osk.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-osk.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/board-osk.c	2006-05-15 12:27:32.000000000 +0200
@@ -148,7 +148,7 @@
 static void __init osk_init_smc91x(void)
 {
 	if ((omap_request_gpio(0)) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
+		printk(KERN_WARNING "Error requesting gpio 0 for smc91x irq\n");
 		return;
 	}
 
@@ -160,7 +160,7 @@
 {
 	omap_cfg_reg(M7_1610_GPIO62);
 	if ((omap_request_gpio(62)) < 0) {
-		printk("Error requesting gpio 62 for CF irq\n");
+		printk(KERN_WARNING "Error requesting gpio 62 for CF irq\n");
 		return;
 	}
 	/* the CF I/O IRQ is really active-low */

--===============87128317401630451==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87128317401630451==--
