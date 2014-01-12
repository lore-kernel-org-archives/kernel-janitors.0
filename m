From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 12 Jan 2014 19:43:36 +0000
Subject: Re: [patch] vlynq: fix another resource size off by 1 error
Message-Id: <2337301.FMvHPCUCYL@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823081949.GD31293@elgon.mountain> <20131111114827.GE5443@mwanda>
In-Reply-To: <20131111114827.GE5443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, apkm@linux-foundation.org

Le lundi 11 novembre 2013, 14:48:27 Dan Carpenter a =E9crit :
> We still need to apply this fix.

Sorry for this late answer, vlynq changes usually go through AKPM's tree as=
 I=20
don't maintain one due to the low number of changes in this code.

>=20
> regards,
> dan carpenter
>=20
> On Fri, Aug 23, 2013 at 11:19:49AM +0300, Dan Carpenter wrote:
> > We fixed the call to request_mem_region() patch
> > 3354f73 ('drivers/vlynq/vlynq.c: fix resource size off by 1 error').
> > But we need to fix the call the release_mem_region() as well.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Static checker stuff.
> >=20
> > diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
> > index 7b07135..c0227f9 100644
> > --- a/drivers/vlynq/vlynq.c
> > +++ b/drivers/vlynq/vlynq.c
> > @@ -762,7 +762,8 @@ static int vlynq_remove(struct platform_device *pde=
v)
> >=20
> >  	device_unregister(&dev->dev);
> >  	iounmap(dev->local);
> >=20
> > -	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start);
> > +	release_mem_region(dev->regs_start,
> > +			   dev->regs_end - dev->regs_start + 1);
> >=20
> >  	kfree(dev);
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
