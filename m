From: =?windows-1252?Q?Ralf_R=F6sch?= <ralf.roesch@rw-gmbh.de>
Date: Tue, 15 Sep 2009 14:02:03 +0000
Subject: Re: [PATCH 1/8] arch/mips/txx9: introduce missing kfree, iounmap
Message-Id: <4AAF9E5B.5040909@rw-gmbh.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111820370.10552@pc-004.diku.dk> <20090913.232548.253168283.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909131708190.25903@ask.diku.dk> <20090914.003321.160496287.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909132113520.31000@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909132113520.31000@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The gpio_remove is missing:
  arch/mips/txx9/generic/setup.c:838: error: implicit declaration of functi=
on =91gpio_remove=92

Should it be gpiochip_remove() instead?

--
Ralf Roesch


The Julia Lawall schrieb:
> From: Julia Lawall <julia@diku.dk>
>
> Error handling code following a kzalloc should free the allocated data.
> Error handling code following an ioremap should iounmap the allocated dat=
a.
>
> The semantic match that finds the first problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr !=3D NULL;
> @@
>
> x@p1 =3D \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x =3D NULL) S
> <... when !=3D x
>      when !=3D if (...) { <+...x...+> }
> (
> x->f1 =3D E
> |
>  (x->f1 =3D NULL || ...)
> |
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
>
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
>
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].li=
ne)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  arch/mips/txx9/generic/setup.c      |   17 +++++++++++++----
>  1 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setu=
p.c
> index a205e2b..c860810 100644
> --- a/arch/mips/txx9/generic/setup.c
> +++ b/arch/mips/txx9/generic/setup.c
> @@ -782,7 +782,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
>  		return;
>  	iocled->mmioaddr =3D ioremap(baseaddr, 1);
>  	if (!iocled->mmioaddr)
> -		return;
> +		goto out_free;
>  	iocled->chip.get =3D txx9_iocled_get;
>  	iocled->chip.set =3D txx9_iocled_set;
>  	iocled->chip.direction_input =3D txx9_iocled_dir_in;
> @@ -791,13 +791,13 @@ void __init txx9_iocled_init(unsigned long baseaddr,
>  	iocled->chip.base =3D basenum;
>  	iocled->chip.ngpio =3D num;
>  	if (gpiochip_add(&iocled->chip))
> -		return;
> +		goto out_unmap;
>  	if (basenum < 0)
>  		basenum =3D iocled->chip.base;
> =20
>  	pdev =3D platform_device_alloc("leds-gpio", basenum);
>  	if (!pdev)
> -		return;
> +		goto out_gpio;
>  	iocled->pdata.num_leds =3D num;
>  	iocled->pdata.leds =3D iocled->leds;
>  	for (i =3D 0; i < num; i++) {
> @@ -812,7 +812,16 @@ void __init txx9_iocled_init(unsigned long baseaddr,
>  	}
>  	pdev->dev.platform_data =3D &iocled->pdata;
>  	if (platform_device_add(pdev))
> -		platform_device_put(pdev);
> +		goto out_pdev;
> +	return;
> +out_pdev:
> +	platform_device_put(pdev);
> +out_gpio:
> +	gpio_remove(&iocled->chip);
> +out_unmap:
> +	iounmap(iocled->mmioaddr);
> +out_free:
> +	kfree(iocled);
>  }
>  #else /* CONFIG_LEDS_GPIO */
>  void __init txx9_iocled_init(unsigned long baseaddr,
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
