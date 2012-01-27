From: Tony Lindgren <tony@atomide.com>
Date: Fri, 27 Jan 2012 00:37:05 +0000
Subject: Re: [PATCH 15/15] arch/arm/mach-omap2/smartreflex.c: add missing iounmap
Message-Id: <20120127003704.GH29812@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-15-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326362117-29371-15-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

* Julia Lawall <Julia.Lawall@lip6.fr> [120112 01:23]:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Add missing iounmap in error handling code, in a case where the function
> already preforms iounmap on some other execution path.

Thanks I'll apply this into omap fixes branch.

Regards,

Tony
 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> statement S,S1;
> int ret;
> @@
> e = \(ioremap\|ioremap_nocache\)(...)
> ... when != iounmap(e)
> if (<+...e...+>) S
> ... when any
>     when != iounmap(e)
> *if (...)
>    { ... when != iounmap(e)
>      return ...; }
> ... when any
> iounmap(e);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  arch/arm/mach-omap2/smartreflex.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/smartreflex.c b/arch/arm/mach-omap2/smartreflex.c
> index 9dd9345..7e755bb 100644
> --- a/arch/arm/mach-omap2/smartreflex.c
> +++ b/arch/arm/mach-omap2/smartreflex.c
> @@ -897,7 +897,7 @@ static int __init omap_sr_probe(struct platform_device *pdev)
>  		ret = sr_late_init(sr_info);
>  		if (ret) {
>  			pr_warning("%s: Error in SR late init\n", __func__);
> -			return ret;
> +			goto err_iounmap;
>  		}
>  	}
>  
> 
