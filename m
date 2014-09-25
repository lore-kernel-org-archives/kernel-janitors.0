From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Date: Thu, 25 Sep 2014 16:28:10 +0000
Subject: Re: [patch] [media] em28xx-input: NULL dereference on error
Message-Id: <20140925132810.28572100.m.chehab@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925113941.GB3708@mwanda> <542421DF.9060000@googlemail.com>
 <alpine.DEB.2.10.1409251736480.2766@hadrien>
In-Reply-To: <alpine.DEB.2.10.1409251736480.2766@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Frank =?UTF-8?B?U2Now6RmZXI=?= <fschaefer.oss@googlemail.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Thu, 25 Sep 2014 17:37:46 +0200
Julia Lawall <julia.lawall@lip6.fr> escreveu:

> On Thu, 25 Sep 2014, Frank Sch=C3=A4fer wrote:
>=20
> > Hi Dan,
> >
> > Am 25.09.2014 um 13:39 schrieb Dan Carpenter:
> > > We call "kfree(ir->i2c_client);" in the error handling and that doesn=
't
> > > work if "ir" is NULL.
> > >
> > > Fixes: 78e719a5f30b ('[media] em28xx-input: i2c IR decoders: improve =
i2c_client handling')
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/=
usb/em28xx/em28xx-input.c
> > > index 581f6da..23f8f6a 100644
> > > --- a/drivers/media/usb/em28xx/em28xx-input.c
> > > +++ b/drivers/media/usb/em28xx/em28xx-input.c
> > > @@ -712,8 +712,10 @@ static int em28xx_ir_init(struct em28xx *dev)
> > >  	em28xx_info("Registering input extension\n");
> > >
> > >  	ir =3D kzalloc(sizeof(*ir), GFP_KERNEL);
> > > +	if (!ir)
> > > +		return -ENOMEM;
> > >  	rc =3D rc_allocate_device();
> > > -	if (!ir || !rc)
> > > +	if (!rc)
> > >  		goto error;
>=20
> I have never understood this kind of code.  If the kmalloc fails, why not
> give up immediately (as in Dan's patch)?


I agree. In this specific place, it can just return an error, as there's
nothing yet used, just like the previous clauses.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
