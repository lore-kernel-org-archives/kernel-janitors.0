From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 12:20:16 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-innovator.c
Message-Id: <20060515122016.GO12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52702428344206931=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============52702428344206931==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/board-innovator.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-innovator.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/board-innovator.c	2006-05-15 12:26:20.000000000 +0200
@@ -173,7 +173,7 @@
 		udelay(750);
 	} else {
 		if ((omap_request_gpio(0)) < 0) {
-			printk("Error requesting gpio 0 for smc91x irq\n");
+			printk(KERN_WARNING "Error requesting gpio 0 for smc91x irq\n");
 			return;
 		}
 	}
@@ -294,7 +294,7 @@
 		udelay(10);	/* Delay needed for FPGA */
 
 		/* Dump the Innovator FPGA rev early - useful info for support. */
-		printk("Innovator FPGA Rev %d.%d Board Rev %d\n",
+		printk(KERN_INFO "Innovator FPGA Rev %d.%d Board Rev %d\n",
 		       fpga_read(OMAP1510_FPGA_REV_HIGH),
 		       fpga_read(OMAP1510_FPGA_REV_LOW),
 		       fpga_read(OMAP1510_FPGA_BOARD_REV));

--===============52702428344206931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52702428344206931==--
