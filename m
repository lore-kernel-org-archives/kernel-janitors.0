From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Sep 2019 11:35:06 +0000
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in stfsm_probe()
Message-Id: <20190919133506.6e46601f@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
 <20190919112937.GA3072241@kroah.com>
In-Reply-To: <20190919112937.GA3072241@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Armijn Hemel <armijn@tjaldur.nl>, linux-mtd@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>, Richard Weinberger <richard@nod.at>, Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>

Hi Greg,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote on Thu, 19 Sep
2019 13:29:37 +0200:

> On Thu, Sep 19, 2019 at 11:10:14AM +0200, Miquel Raynal wrote:
> > Hi Markus,
> >=20
> > Markus Elfring <Markus.Elfring@web.de> wrote on Wed, 18 Sep 2019
> > 14:50:27 +0200:
> >  =20
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Wed, 18 Sep 2019 14:37:34 +0200
> > >=20
> > > Simplify this function implementation by using a known wrapper functi=
on.
> > >=20
> > > This issue was detected by using the Coccinelle software.
> > >=20
> > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > ---
> > >  drivers/mtd/devices/st_spi_fsm.c | 8 +-------
> > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/s=
t_spi_fsm.c
> > > index f4d1667daaf9..5bd1c44ae529 100644
> > > --- a/drivers/mtd/devices/st_spi_fsm.c
> > > +++ b/drivers/mtd/devices/st_spi_fsm.c
> > > @@ -2034,13 +2034,7 @@ static int stfsm_probe(struct platform_device =
*pdev)
> > >=20
> > >  	platform_set_drvdata(pdev, fsm);
> > >=20
> > > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > -	if (!res) {
> > > -		dev_err(&pdev->dev, "Resource not found\n");
> > > -		return -ENODEV;
> > > -	}
> > > -
> > > -	fsm->base =3D devm_ioremap_resource(&pdev->dev, res);
> > > +	fsm->base =3D devm_platform_ioremap_resource(pdev, 0);
> > >  	if (IS_ERR(fsm->base)) {
> > >  		dev_err(&pdev->dev,
> > >  			"Failed to reserve memory region %pR\n", res);
> > > --
> > > 2.23.0
> > >  =20
> >=20
> >=20
> > Is this even compiled tested? 'res' is not initialized anymore so you
> > can't use it in the error trace. I suppose you should even drop it from
> > the stack parameters. =20
>=20
> You are responding to a email address/bot that is on a number of kernel
> developers "black list" as something to just totally ignore.  I
> recommend you do the same if possible...
>=20
> greg k-h

Oh right... Sure, I'll ignore it/him as well.

Thanks for the info,
Miqu=C3=A8l
