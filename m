From: apgo@patchbomb.org (Arthur Othieno)
Date: Thu, 18 May 2006 08:10:08 +0000
Subject: Re: [KJ] [PATCH] printk : arch/arm/mach-omap1/board-h3.c
Message-Id: <20060518081008.GB20402@krypton>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90882326126011403=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============90882326126011403==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2006 at 02:19:09PM +0200, Christophe Lucas wrote:
> Description:
> printk should include appropriate KERN_* constant (of course
> only at beginning of lines).
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 
> Index: linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c
> ===================================================================
> --- linux-2.6.16.16.orig/arch/arm/mach-omap1/board-h3.c	2006-05-11 03:56:24.000000000 +0200
> +++ linux-2.6.16.16/arch/arm/mach-omap1/board-h3.c	2006-05-15 12:25:21.000000000 +0200
> @@ -196,7 +196,7 @@
>  {
>  	omap_cfg_reg(W15_1710_GPIO40);
>  	if (omap_request_gpio(40) < 0) {
> -		printk("Error requesting gpio 40 for smc91x irq\n");
> +		printk(KERN_WARNING "Error requesting gpio 40 for smc91x irq\n");

Ditto KERN_ERR.

>  		return;
>  	}
>  }

--===============90882326126011403==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90882326126011403==--
