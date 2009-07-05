From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 05 Jul 2009 11:23:23 +0000
Subject: Re: [PATCH 3/3] drivers/vlynq/vlynq.c: Fix resource size off by 1 error
Message-Id: <200907051323.24140.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907042332300.9841@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907042332300.9841@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: openwrt-devel@lists.openwrt.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le Saturday 04 July 2009 23:33:21 Julia Lawall, vous avez =E9crit=A0:
> From: Julia Lawall <julia@diku.dk>
>
> In this case, the calls to request_mem_region, ioremap, and
> release_mem_region all have a consistent length argument, len, but since =
in
> other files (res->end - res->start) + 1, equivalent to resource_size(res),
> is used for a resource-typed structure res, one could consider whether the
> same should be done here.

Thanks for spotting this Julia.

>
> The problem was found using the following semantic patch:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> struct resource *res;
> @@
>
> - (res->end - res->start) + 1
> + resource_size(res)
>
> @@
> struct resource *res;
> @@
>
> - res->end - res->start
> + BAD(resource_size(res))
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Florian Fainelli <florian@openwrt.org>

>
> ---
>  drivers/vlynq/vlynq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p
> a/drivers/vlynq/vlynq.c
> b/drivers/vlynq/vlynq.c
> --- a/drivers/vlynq/vlynq.c 2009-06-24 21:18:50.000000000 +0200
> +++ b/drivers/vlynq/vlynq.c 2009-07-04 21:37:28.000000000 +0200
> @@ -703,7 +703,7 @@ static int vlynq_probe(struct platform_d
>  	dev->mem_start =3D mem_res->start;
>  	dev->mem_end =3D mem_res->end;
>
> -	len =3D regs_res->end - regs_res->start;
> +	len =3D resource_size(regs_res);
>  	if (!request_mem_region(regs_res->start, len, dev_name(&dev->dev))) {
>  		printk(KERN_ERR "%s: Can't request vlynq registers\n",
>  		       dev_name(&dev->dev));
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
