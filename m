From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 25 Sep 2014 15:37:46 +0000
Subject: Re: [patch] [media] em28xx-input: NULL dereference on error
Message-Id: <alpine.DEB.2.10.1409251736480.2766@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2141670814-1411659467=:2766"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925113941.GB3708@mwanda> <542421DF.9060000@googlemail.com>
In-Reply-To: <542421DF.9060000@googlemail.com>
To: =?ISO-8859-15?Q?Frank_Sch=E4fer?= <fschaefer.oss@googlemail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2141670814-1411659467=:2766
Content-Type: TEXT/PLAIN; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Sep 2014, Frank Sch=E4fer wrote:

> Hi Dan,
>
> Am 25.09.2014 um 13:39 schrieb Dan Carpenter:
> > We call "kfree(ir->i2c_client);" in the error handling and that doesn't
> > work if "ir" is NULL.
> >
> > Fixes: 78e719a5f30b ('[media] em28xx-input: i2c IR decoders: improve i2=
c_client handling')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/us=
b/em28xx/em28xx-input.c
> > index 581f6da..23f8f6a 100644
> > --- a/drivers/media/usb/em28xx/em28xx-input.c
> > +++ b/drivers/media/usb/em28xx/em28xx-input.c
> > @@ -712,8 +712,10 @@ static int em28xx_ir_init(struct em28xx *dev)
> >  	em28xx_info("Registering input extension\n");
> >
> >  	ir =3D kzalloc(sizeof(*ir), GFP_KERNEL);
> > +	if (!ir)
> > +		return -ENOMEM;
> >  	rc =3D rc_allocate_device();
> > -	if (!ir || !rc)
> > +	if (!rc)
> >  		goto error;

I have never understood this kind of code.  If the kmalloc fails, why not
give up immediately (as in Dan's patch)?

julia


> >  	/* record handles to ourself */
> I would prefer to fix it where the actual problem is located.
> Can you send an updated version that changes the code to do
>
> ...
> error:
> if (ir)
>   kfree(ir->i2c_client);
> ...
>
> This makes the code less prone to future error handling changes.
>
> Thanks !
>
> Regards,
> Frank
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-2141670814-1411659467=:2766--
