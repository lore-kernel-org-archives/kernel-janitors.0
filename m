From: Dmitry Torokhov <dtor@insightbb.com>
Date: Mon, 18 Sep 2006 01:08:36 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/base
Message-Id: <200609172108.37707.dtor@insightbb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753m2a047081qc2982bf4a693a044@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Sunday 17 September 2006 20:53, Om Narasimhan wrote:
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 2b8755d..e08950b 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -192,7 +192,7 @@ int platform_device_add_resources(struct
> =A0{
> =A0=A0=A0=A0=A0=A0=A0=A0struct resource *r;
>=20
> -=A0=A0=A0=A0=A0=A0=A0r =3D kmalloc(sizeof(struct resource) * num, GFP_KE=
RNEL);
> +=A0=A0=A0=A0=A0=A0=A0r =3D kzalloc(sizeof(struct resource) * num, GFP_KE=
RNEL);
> =A0=A0=A0=A0=A0=A0=A0=A0if (r) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memcpy(r, res, sizeof(str=
uct resource) * num);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pdev->resource =3D r;

Just out of curiosity could you tell me what is the benefit of
zeroing allocated memory here?

> @@ -216,7 +216,7 @@ int platform_device_add_data(struct plat
> =A0{
> =A0=A0=A0=A0=A0=A0=A0=A0void *d;
>=20
> -=A0=A0=A0=A0=A0=A0=A0d =3D kmalloc(size, GFP_KERNEL);
> +=A0=A0=A0=A0=A0=A0=A0d =3D kzalloc(size, GFP_KERNEL);
> =A0=A0=A0=A0=A0=A0=A0=A0if (d) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memcpy(d, data, size);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pdev->dev.platform_data =
=3D d;
>=20

And here?

--=20
Dmitry

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
