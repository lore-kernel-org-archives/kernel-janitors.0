From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 28 Jun 2016 15:02:45 +0000
Subject: Re: [PATCH 1/6] mfd: twl-core: Return directly after a failed platform_device_alloc() in add_numbere
Message-Id: <20160628150245.GI24982@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682D228.7070902@users.sourceforge.net>
 <20160111082922.GB14104@x1>
 <05b7db2a-437a-60ac-d289-71d2150e7f5f@users.sourceforge.net>
 <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net>
 <20160608111442.GB14888@dell>
 <e4eaf0b4-e539-b400-c8a2-70f210cee1fa@users.sourceforge.net>
 <fe8a131a-2149-2bd6-73f5-b17854209107@users.sourceforge.net>
In-Reply-To: <fe8a131a-2149-2bd6-73f5-b17854209107@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 26 Jun 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 26 Jun 2016 12:25:36 +0200

Please use `git send-email` when sending patches to the list.

> The platform_device_put() function was called in one case by the
> add_numbered_child() function during error handling even if the passed
> variable "pdev" contained a null pointer.
> Return directly in this case.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/twl-core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied though, thanks.

> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index 831696e..9458c6d 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -622,11 +622,8 @@ add_numbered_child(unsigned mod_no, const char *name=
, int num,
>  	twl =3D &twl_priv->twl_modules[sid];
> =20
>  	pdev =3D platform_device_alloc(name, num);
> -	if (!pdev) {
> -		dev_dbg(&twl->client->dev, "can't alloc dev\n");
> -		status =3D -ENOMEM;
> -		goto err;
> -	}
> +	if (!pdev)
> +		return ERR_PTR(-ENOMEM);
> =20
>  	pdev->dev.parent =3D &twl->client->dev;
> =20

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
