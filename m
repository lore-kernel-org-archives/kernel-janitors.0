From: apgo@patchbomb.org (Arthur Othieno)
Date: Thu, 18 May 2006 08:19:40 +0000
Subject: Re: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-innovator.c
Message-Id: <20060518081940.GD20402@krypton>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76242726601664912=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============76242726601664912==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2006 at 02:20:16PM +0200, Christophe Lucas wrote:
> Description:
> printk should include appropriate KERN_* constant (of course
> only at beginning of lines).
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> 
> Index: linux-2.6.16.16/arch/arm/mach-omap1/board-innovator.c
> ===================================================================
> --- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-innovator.c	2006-05-11 03:56:24.000000000 +0200
> +++ linux-2.6.16.16/arch/arm/mach-omap1/board-innovator.c	2006-05-15 12:26:20.000000000 +0200
> @@ -173,7 +173,7 @@
>  		udelay(750);
>  	} else {
>  		if ((omap_request_gpio(0)) < 0) {
> -			printk("Error requesting gpio 0 for smc91x irq\n");
> +			printk(KERN_WARNING "Error requesting gpio 0 for smc91x irq\n");

Ditto KERN_ERR.

>  			return;
>  		}
>  	}

--===============76242726601664912==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76242726601664912==--
