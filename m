From: =?ks_c_5601-1987?B?sejA57/4?= <jaewon02.kim@samsung.com>
Date: Fri, 05 Feb 2016 02:09:41 +0000
Subject: RE: [patch] extcon: use correct size
Message-Id: <001701d15fba$4676ed90$d364c8b0$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160204113609.GA11239@mwanda> <56B3486D.1050201@bfs.de>
 <20160204195341.GB32153@mwanda>
In-Reply-To: <20160204195341.GB32153@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'walter harms' <wharms@bfs.de>
Cc: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi, Dan


02/05/2016 04:53 AM=BF=A1 Dan Carpenter wrote:
>
> On Thu, Feb 04, 2016 at 01:47:41PM +0100, walter harms wrote:
> >=20
> >=20
> > Am 04.02.2016 12:36, schrieb Dan Carpenter:
> > > The info->status[] array has 3 elements.  We are using size=20
> > > MAX77843_MUIC_IRQ_NUM (16) instead of MAX77843_MUIC_STATUS_NUM (3)=20
> > > as intended.
> > >=20
> > > Fixes: 135d9f7d135a ('extcon: max77843: Clear IRQ bits state=20
> > > before request IRQ')
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > This is from static analysis and *NOT TESTED*.  Please review
carefully.
> > >=20
> > > diff --git a/drivers/extcon/extcon-max77843.c
> > > b/drivers/extcon/extcon-max77843.c
> > > index 7bbc300..b188bd6 100644
> > > --- a/drivers/extcon/extcon-max77843.c
> > > +++ b/drivers/extcon/extcon-max77843.c
> > > @@ -806,7 +806,7 @@ static int max77843_muic_probe(struct
platform_device *pdev)
> > >  	/* Clear IRQ bits before request IRQs */
> > >  	ret =3D regmap_bulk_read(max77843->regmap_muic,
> > >  			MAX77843_MUIC_REG_INT1, info->status,
> > > -			MAX77843_MUIC_IRQ_NUM);
> > > +			MAX77843_MUIC_STATUS_NUM);
> > >  	if (ret) {
> > >  		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
> > >  		goto err_muic_irq;
> > > --
> >=20
> >=20
> > just for my curiosity: what is wrong with ARRAY_SIZE() ?
> > So far i understand is the functions intention to fill the array=20
> > completely.
>=20
> It's done pretty consistently the one way...  Jaewon?
>=20
> regards,
> dan carpenter
>

You are right.
We should read only 3-sequential register.
(MAX77843_MUIC_REG_INT1, MAX77843_MUIC_REG_INT2, MAX77843_MUIC_REG_INT3)

Reviewed-by: Jaewon Kim <jaewon02.kim@samsung.com>

Thanks
Jaewon Kim

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
