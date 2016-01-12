From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 12 Jan 2016 11:59:06 +0000
Subject: Re: [PATCH] mfd-dm355evm_msp: One function call less in add_child() after error detection
Message-Id: <20160112115906.GD27358@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <568284D3.3060006@users.sourceforge.net>
In-Reply-To: <568284D3.3060006@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

The subject format is wrong and the summary itself isn't very informative.

On Tue, 29 Dec 2015, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 29 Dec 2015 13:56:42 +0100

This patch format is wrong, please consider using `git format-patch`
and `git send-email`.

> The platform_device_put() function was called in one case by the
> add_child() function during error handling even if the passed
> variable "pdev" contained a null pointer.
>=20
> Implementation details could be improved by the adjustment of jump targets
> according to the Linux coding style convention.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/dm355evm_msp.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index bc90efe..e4aa1b8 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -202,7 +202,7 @@ static struct device *add_child(struct i2c_client *cl=
ient, const char *name,
>  	if (!pdev) {
>  		dev_dbg(&client->dev, "can't alloc dev\n");

Make this dev_err().

>  		status =3D -ENOMEM;
> -		goto err;
> +		goto report_failure;

Return here.

>  	}
> =20
>  	device_init_wakeup(&pdev->dev, can_wakeup);
> @@ -212,7 +212,7 @@ static struct device *add_child(struct i2c_client *cl=
ient, const char *name,
>  		status =3D platform_device_add_data(pdev, pdata, pdata_len);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add platform_data\n");
> -			goto err;
> +			goto put_device;
>  		}
>  	}
> =20
> @@ -225,19 +225,18 @@ static struct device *add_child(struct i2c_client *=
client, const char *name,
>  		status =3D platform_device_add_resources(pdev, &r, 1);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add irq\n");
> -			goto err;
> +			goto put_device;
>  		}
>  	}
> =20
>  	status =3D platform_device_add(pdev);
> -
> -err:
> -	if (status < 0) {
> -		platform_device_put(pdev);
> -		dev_err(&client->dev, "can't add %s dev\n", name);
> -		return ERR_PTR(status);
> -	}
> -	return &pdev->dev;
> +	if (!status)

Be more consistent here.

Reverse the condition and return an instead, as you do above.

> +		return &pdev->dev;
> +put_device:
> +	platform_device_put(pdev);
> +report_failure:
> +	dev_err(&client->dev, "can't add %s dev\n", name);

This isn't a very friendly error message.  Better to convert the
dev_dbg() calls to dev_err() and tell the user what the problem was.

> +	return ERR_PTR(status);
>  }
> =20
>  static int add_children(struct i2c_client *client)

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
