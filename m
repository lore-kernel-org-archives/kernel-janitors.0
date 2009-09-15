From: Julia Lawall <julia@diku.dk>
Date: Tue, 15 Sep 2009 14:35:26 +0000
Subject: Re: [PATCH 1/8] arch/mips/txx9: introduce missing kfree, iounmap
Message-Id: <Pine.LNX.4.64.0909151634030.8549@pc-004.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511572895-1888724175-1253025326=:8549"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111820370.10552@pc-004.diku.dk>
 <20090913.232548.253168283.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909131708190.25903@ask.diku.dk>
 <20090914.003321.160496287.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909132113520.31000@ask.diku.dk>
 <4AAF9E5B.5040909@rw-gmbh.de>
In-Reply-To: <4AAF9E5B.5040909@rw-gmbh.de>
To: =?windows-1252?Q?Ralf_R=F6sch?= <ralf.roesch@rw-gmbh.de>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511572895-1888724175-1253025326=:8549
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2009, Ralf R=F6sch wrote:

> The gpio_remove is missing:
>  arch/mips/txx9/generic/setup.c:838: error: implicit declaration of funct=
ion
>  ?gpio_remove?
>=20
> Should it be gpiochip_remove() instead?

Oops, sorry about that.  That is indeed the function I was looking at.

I can submit a revised patch, but I sent another question asking about=20
whether something should be done about the fact that gpiochip_remove is=20
declared as follows:

extern int __must_check gpiochip_remove(struct gpio_chip *chip);

I don't think the call can fail at this point, but should something be=20
done to avoid a compiler warning?

thanks,
julia


> --
> Ralf Roesch
>=20
>=20
> The Julia Lawall schrieb:
> > From: Julia Lawall <julia@diku.dk>
> >
> > Error handling code following a kzalloc should free the allocated data.
> > Error handling code following an ioremap should iounmap the allocated d=
ata.
> >
> > The semantic match that finds the first problem is as follows:
> > (http://www.emn.fr/x-info/coccinelle/)
> >
> > // <smpl>
> > @r exists@
> > local idexpression x;
> > statement S;
> > expression E;
> > identifier f,f1,l;
> > position p1,p2;
> > expression *ptr !=3D NULL;
> > @@
> >
> > x@p1 =3D \(kmalloc\|kzalloc\|kcalloc\)(...);
> > ...
> > if (x =3D=3D NULL) S
> > <... when !=3D x
> >      when !=3D if (...) { <+...x...+> }
> > (
> > x->f1 =3D E
> > |
> >  (x->f1 =3D=3D NULL || ...)
> > |
> >  f(...,x->f1,...)
> > )
> > ...>
> > (
> >  return \(0\|<+...x...+>\|ptr\);
> > |
> >  return@p2 ...;
> > )
> >
> > @script:python@
> > p1 << r.p1;
> > p2 << r.p2;
> > @@
> >
> > print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].=
line)
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> > ---
> >  arch/mips/txx9/generic/setup.c      |   17 +++++++++++++----
> >  1 files changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/se=
tup.c
> > index a205e2b..c860810 100644
> > --- a/arch/mips/txx9/generic/setup.c
> > +++ b/arch/mips/txx9/generic/setup.c
> > @@ -782,7 +782,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
> >   	return;
> >   iocled->mmioaddr =3D ioremap(baseaddr, 1);
> >   if (!iocled->mmioaddr)
> > -		return;
> > +		goto out_free;
> >   iocled->chip.get =3D txx9_iocled_get;
> >   iocled->chip.set =3D txx9_iocled_set;
> >   iocled->chip.direction_input =3D txx9_iocled_dir_in;
> > @@ -791,13 +791,13 @@ void __init txx9_iocled_init(unsigned long basead=
dr,
> >   iocled->chip.base =3D basenum;
> >   iocled->chip.ngpio =3D num;
> >   if (gpiochip_add(&iocled->chip))
> > -		return;
> > +		goto out_unmap;
> >   if (basenum < 0)
> >    basenum =3D iocled->chip.base;
> > =20
> >   pdev =3D platform_device_alloc("leds-gpio", basenum);
> >   if (!pdev)
> > -		return;
> > +		goto out_gpio;
> >   iocled->pdata.num_leds =3D num;
> >   iocled->pdata.leds =3D iocled->leds;
> >   for (i =3D 0; i < num; i++) {
> > @@ -812,7 +812,16 @@ void __init txx9_iocled_init(unsigned long baseadd=
r,
> >   }
> >   pdev->dev.platform_data =3D &iocled->pdata;
> >   if (platform_device_add(pdev))
> > -		platform_device_put(pdev);
> > +		goto out_pdev;
> > +	return;
> > +out_pdev:
> > +	platform_device_put(pdev);
> > +out_gpio:
> > +	gpio_remove(&iocled->chip);
> > +out_unmap:
> > +	iounmap(iocled->mmioaddr);
> > +out_free:
> > +	kfree(iocled);
> >  }
> >  #else /* CONFIG_LEDS_GPIO */
> >  void __init txx9_iocled_init(unsigned long baseaddr,
> >
> >  =20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
---511572895-1888724175-1253025326=:8549--
