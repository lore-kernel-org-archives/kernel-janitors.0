From: Sricharan R <r.sricharan@ti.com>
Date: Fri, 04 Apr 2014 06:42:36 +0000
Subject: Re: [patch] irqchip/irq-crossbar: not allocating enough memory
Message-Id: <533E518C.5020807@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140403072134.GA14286@mwanda>
In-Reply-To: <20140403072134.GA14286@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thursday 03 April 2014 12:51 PM, Dan Carpenter wrote:
> We are allocating the size of a pointer and not the size of the data.
> This will lead to memory corruption.
>
> There isn't actually a "cb_device" struct, btw.  The code is only able
> to compile because GCC knows that all pointers are the same size.
>
> Fixes: 96ca848ef7ea ('DRIVERS: IRQCHIP: CROSSBAR: Add support for Crossbar IP')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
> index fc817d2..3d15d16 100644
> --- a/drivers/irqchip/irq-crossbar.c
> +++ b/drivers/irqchip/irq-crossbar.c
> @@ -107,7 +107,7 @@ static int __init crossbar_of_init(struct device_node *node)
>  	int i, size, max, reserved = 0, entry;
>  	const __be32 *irqsr;
>  
> -	cb = kzalloc(sizeof(struct cb_device *), GFP_KERNEL);
> +	cb = kzalloc(sizeof(*cb), GFP_KERNEL);
>  
>  	if (!cb)
>  		return -ENOMEM;
Yes. correct. Thanks for the catch.

Acked-by: Sricharan R <r.sricharan@ti.com>


Regards,
 Sricharan
