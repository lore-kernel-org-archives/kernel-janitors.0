From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 18 May 2006 08:30:00 +0000
Subject: Re: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-h2.c
Message-Id: <20060518083000.GF7899@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22311450740921113=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============22311450740921113==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arthur Othieno (apgo@patchbomb.org) wrote:
> On Mon, May 15, 2006 at 02:18:24PM +0200, Christophe Lucas wrote:
> > Description:
> > printk should include appropriate KERN_* constant (of course
> > only at beginning of lines).
> > 
> > Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> > 
> > Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c
> > ===================================================================
> > --- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h2.c	2006-05-11 03:56:24.000000000 +0200
> > +++ linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c	2006-05-15 12:24:39.000000000 +0200
> > @@ -121,7 +121,7 @@
> >  static void __init h2_init_smc91x(void)
> >  {
> >  	if ((omap_request_gpio(0)) < 0) {
> > -		printk("Error requesting gpio 0 for smc91x irq\n");
> > +		printk(KERN_WARNING "Error requesting gpio 0 for smc91x irq\n");
> 
> On error path. KERN_ERR here.
> 
> >  		return;
> >  	}
> >  }

Ok here it is the corriged patch :

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h2.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/board-h2.c	2006-05-18 10:26:14.000000000 +0200
@@ -121,7 +121,7 @@
 static void __init h2_init_smc91x(void)
 {
 	if ((omap_request_gpio(0)) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
+		printk(KERN_ERR "Error requesting gpio 0 for smc91x irq\n");
 		return;
 	}
 }

--===============22311450740921113==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22311450740921113==--
