From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 05 Aug 2016 07:55:11 +0000
Subject: Re: [PATCH v4] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <20160805075511.GN5243@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
In-Reply-To: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Fri, 01 Jul 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>

Please use `git send-email` to submit your patches.

> Adjust jump targets according to the Linux coding style convention.
> Another check for the variable "status" can be omitted then at the end.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> v4: Further feedback was integrated into this message.

This is not a good change-log.  What actually changed?

> v3: Deletion of another blank line
> v2: Rebasing
>=20
>  drivers/mfd/dm355evm_msp.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index 270e19c..86eca61 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -209,7 +209,7 @@ static struct device *add_child(struct i2c_client *cl=
ient, const char *name,
>  		status =3D platform_device_add_data(pdev, pdata, pdata_len);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add platform_data\n");

Please take the opportunity to convert these to dev_err()s.

> -			goto err;
> +			goto put_device;
>  		}
>  	}
> =20
> @@ -222,19 +222,20 @@ static struct device *add_child(struct i2c_client *=
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
> +	if (status)
> +		goto put_device;
> =20
> -err:
> -	if (status < 0) {
> -		platform_device_put(pdev);
> -		dev_err(&client->dev, "can't add %s dev\n", name);
> -		return ERR_PTR(status);
> -	}
>  	return &pdev->dev;
> +
> +put_device:
> +	platform_device_put(pdev);
> +	dev_err(&client->dev, "failed to add device %s\n", name);

... and remove this line.

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
