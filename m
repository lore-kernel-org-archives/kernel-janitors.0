From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 18 May 2006 08:25:25 +0000
Subject: Re: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-h3.c
Message-Id: <20060518082525.GE7899@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24408139316661348=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============24408139316661348==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arthur Othieno (apgo@patchbomb.org) wrote:
> Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c
> > ===================================================================
> > --- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h3.c	2006-05-11 03:56:24.000000000 +0200
> > +++ linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c	2006-05-15 12:25:21.000000000 +0200
> 
> Ditto KERN_ERR.

Ok Here is the corriged patch:

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h3.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c	2006-05-18 10:23:33.000000000 +0200
@@ -196,7 +196,7 @@
 {
 	omap_cfg_reg(W15_1710_GPIO40);
 	if (omap_request_gpio(40) < 0) {
-		printk("Error requesting gpio 40 for smc91x irq\n");
+		printk(KERN_ERR "Error requesting gpio 40 for smc91x irq\n");
 		return;
 	}
 }

--===============24408139316661348==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24408139316661348==--
