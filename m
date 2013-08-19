From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 19 Aug 2013 11:35:51 +0000
Subject: Re: [PATCH 4/6] usb: musb: dsps: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <alpine.DEB.2.02.1308191334340.2313@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-586657187-1376912151=:2313"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr> <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr> <5211FED3.4090102@secomea.dk>
In-Reply-To: <5211FED3.4090102@secomea.dk>
To: =?ISO-8859-15?Q?Svenning_S=F8rensen?= <sss@secomea.dk>
Cc: Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-586657187-1376912151=:2313
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Mon, 19 Aug 2013, Svenning S=F8rensen wrote:

> On 19-08-2013 10:51, Julia Lawall wrote:
> > diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> > index 4ffbaac..f2f9710 100644
> > --- a/drivers/usb/musb/musb_dsps.c
> > +++ b/drivers/usb/musb/musb_dsps.c
> > @@ -357,9 +357,6 @@ static int dsps_musb_init(struct musb *musb)
> >   	u32 rev, val;
> >     	r =3D platform_get_resource_byname(parent, IORESOURCE_MEM, "contro=
l");
> > -	if (!r)
> > -		return -EINVAL;
> > -
> >   	reg_base =3D devm_ioremap_resource(dev, r);
> >   	if (!musb->ctrl_base)
> >   		return -EINVAL;
> Not really related to Julia's patch, apart from making it more obvious th=
at
> there's a bug here.
> I believe it is reg_base that needs to be checked, right?

Indeed, it is all backwards.  I could extend the patch, if you want.

julia
--8323329-586657187-1376912151=:2313--
