From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Sep 2006 10:37:16 +0000
Subject: Re: [KJ] [PATCH 16/72] arm: add KERN_ constants to
Message-Id: <20060908103716.GA15083@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060908015811.10114.24713.sendpatchset@david.homenet>
In-Reply-To: <20060908015811.10114.24713.sendpatchset@david.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

James Nelson (james4765@gmail.com) wrote:
> Signed-off-by: James Nelson <james4765@gmail.com>
> ---
> diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
> index cd3a06d..fe1f2a3 100644
> --- a/arch/arm/mach-omap1/board-h2.c
> +++ b/arch/arm/mach-omap1/board-h2.c
> @@ -276,7 +276,7 @@ static struct platform_device *h2_device
>  static void __init h2_init_smc91x(void)
>  {
>  	if ((omap_request_gpio(0)) < 0) {
> -		printk("Error requesting gpio 0 for smc91x irq\n");
> +		printk(KERN_ERR "Error requesting gpio 0 for smc91x irq\n");
>  		return;
>  	}
>  }

Some of these patches on arch/arm have already been send.

	http://lists.osdl.org/pipermail/kernel-janitors/2006-May/006378.html

Have a nice day,
-- 
++christophe;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
