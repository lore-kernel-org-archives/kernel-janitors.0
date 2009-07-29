From: Julia Lawall <julia@diku.dk>
Date: Wed, 29 Jul 2009 02:20:32 +0000
Subject: Re: [PATCH 9/9] drivers/acpi: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907290420120.16543@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-1931889447-1248834032=:16543"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281756010.28189@ask.diku.dk>
 <1248828809.2670.144.camel@rzhang-dt>
In-Reply-To: <1248828809.2670.144.camel@rzhang-dt>
To: Zhang Rui <rui.zhang@intel.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-1931889447-1248834032=:16543
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jul 2009, Zhang Rui wrote:

> On Tue, 2009-07-28 at 23:56 +0800, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> >=20
> > backlight_device_register may return an ERR_PTR value rather than a val=
id
> > pointer.
> >=20
> > A simplified version of the semantic match that finds this problem is as
> > follows: (http://coccinelle.lip6.fr/)
>=20
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> >=20
> > ---
> >  drivers/acpi/video.c                |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/acpi/video.c b/drivers/acpi/video.c
> > index 8851315..29788db 100644
> > --- a/drivers/acpi/video.c
> > +++ b/drivers/acpi/video.c
> > @@ -982,6 +982,8 @@ static void acpi_video_device_find_cap(struct acpi_=
video_device *device)
> >  		sprintf(name, "acpi_video%d", count++);
> >  		device->backlight =3D backlight_device_register(name,
> >  			NULL, device, &acpi_backlight_ops);
> > +		if (IS_ERR(device->backlight))
> > +			return;
>=20
> we should kfree(name) here.

Yes, good point.

thanks,
julia

> >  		device->backlight->props.max_brightness =3D device->brightness->coun=
t-3;
> >  		kfree(name);
>=20
> how about this one?
>=20
> =FF=FFbacklight_device_register may return an ERR_PTR value rather than a=
 valid
> pointer.
>=20
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---
>  drivers/acpi/video.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Index: linux-2.6/drivers/acpi/video.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/acpi/video.c
> +++ linux-2.6/drivers/acpi/video.c
> @@ -982,8 +982,10 @@ static void acpi_video_device_find_cap(s
>  		sprintf(name, "acpi_video%d", count++);
>  		device->backlight =3D backlight_device_register(name,
>  			NULL, device, &acpi_backlight_ops);
> -		device->backlight->props.max_brightness =3D device->brightness->count-=
3;
>  		kfree(name);
> +		if (IS_ERR(device->backlight))
> +			return;
> +		device->backlight->props.max_brightness =3D device->brightness->count-=
3;
> =20
>  		result =3D sysfs_create_link(&device->backlight->dev.kobj,
>  					   &device->dev->dev.kobj, "device");
>=20
>=20
>=20
> =20
>=20
>=20
---511516320-1931889447-1248834032=:16543--
