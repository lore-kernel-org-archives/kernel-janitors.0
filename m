From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 08 Jun 2016 11:14:42 +0000
Subject: Re: [PATCH 2/2] mfd: twl-core: Refactoring for add_numbered_child()
Message-Id: <20160608111442.GB14888@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682D228.7070902@users.sourceforge.net>
 <20160111082922.GB14104@x1>
 <05b7db2a-437a-60ac-d289-71d2150e7f5f@users.sourceforge.net>
 <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net>
In-Reply-To: <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 16 May 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 May 2016 19:50:55 +0200
>=20
> Adjust jump targets according to the Linux coding style convention.
> Another check for the variable "status" can be omitted then at the end.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/twl-core.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index dc34e69..3e4f4e4 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -635,7 +635,7 @@ add_numbered_child(unsigned mod_no, const char *name,=
 int num,
>  		status =3D platform_device_add_data(pdev, pdata, pdata_len);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add platform_data\n");
> -			goto err;
> +			goto put_device;
>  		}
>  	}
> =20
> @@ -648,21 +648,20 @@ add_numbered_child(unsigned mod_no, const char *nam=
e, int num,
>  		status =3D platform_device_add_resources(pdev, r, irq1 ? 2 : 1);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add irqs\n");
> -			goto err;
> +			goto put_device;
>  		}
>  	}
> =20
>  	status =3D platform_device_add(pdev);
> -	if (status =3D 0)
> -		device_init_wakeup(&pdev->dev, can_wakeup);
> +	if (status)
> +		goto put_device;
> =20
> -err:
> -	if (status < 0) {
> -		platform_device_put(pdev);
> -		dev_err(&twl->client->dev, "can't add %s dev\n", name);
> -		return ERR_PTR(status);
> -	}
> +	device_init_wakeup(&pdev->dev, can_wakeup);

Nit: Place a '\n' here.

>  	return &pdev->dev;

Nit: Place a '\n' here.

> +put_device:
> +	platform_device_put(pdev);
> +	dev_err(&twl->client->dev, "can't add %s dev\n", name);

Nit: "failed to add device %s\n"

> +	return ERR_PTR(status);
>  }
> =20
>  static inline struct device *add_child(unsigned mod_no, const char *name,

Once you've fixed those, please re-submit with my:

Acked-by: Lee Jones <lee.jones@linaro.org>

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
