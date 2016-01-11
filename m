From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 11 Jan 2016 08:12:19 +0000
Subject: Re: [PATCH 2/2] mfd: smsc-ece1099: Refactoring for smsc_i2c_probe()
Message-Id: <20160111081219.GT3331@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <56829630.6030706@users.sourceforge.net>
 <20160111081059.GS3331@x1>
In-Reply-To: <20160111081059.GS3331@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Oh, the subject line is also duff.  Please describe the changes properly.

"refactoring X", "making changes to Y" are not good subject lines.=20

On Mon, 11 Jan 2016, Lee Jones wrote:
> On Tue, 29 Dec 2015, SF Markus Elfring wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 29 Dec 2015 15:03:31 +0100
> >=20
> > This issue was detected by using the Coccinelle software.
> >=20
> > * Let us return directly if a call of the function "devm_regmap_init_i2=
c"
> >   or "regmap_write" failed.
> >=20
> > * Delete the jump label "err" then.
>=20
> Why are you bullet pointing here?
>=20
> Just use proper sentences to tell us what's going on.
>=20
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/mfd/smsc-ece1099.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> Code looks fine however.
>=20
> Please re-submit the set with the aforementioned changes along with my:
>=20
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> > diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
> > index bcac488..951333a 100644
> > --- a/drivers/mfd/smsc-ece1099.c
> > +++ b/drivers/mfd/smsc-ece1099.c
> > @@ -46,10 +46,8 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
> >  	}
> > =20
> >  	smsc->regmap =3D devm_regmap_init_i2c(i2c, &smsc_regmap_config);
> > -	if (IS_ERR(smsc->regmap)) {
> > -		ret =3D PTR_ERR(smsc->regmap);
> > -		goto err;
> > -	}
> > +	if (IS_ERR(smsc->regmap))
> > +		return PTR_ERR(smsc->regmap);
> > =20
> >  	i2c_set_clientdata(i2c, smsc);
> >  	smsc->dev =3D &i2c->dev;
> > @@ -68,7 +66,7 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
> > =20
> >  	ret =3D regmap_write(smsc->regmap, SMSC_CLK_CTRL, smsc->clk);
> >  	if (ret)
> > -		goto err;
> > +		return ret;
> > =20
> >  #ifdef CONFIG_OF
> >  	if (i2c->dev.of_node)
> > @@ -76,7 +74,6 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
> >  					   NULL, NULL, &i2c->dev);
> >  #endif
> > =20
> > -err:
> >  	return ret;
> >  }
> > =20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
