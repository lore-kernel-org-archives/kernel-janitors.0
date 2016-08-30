From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 15:10:44 +0000
Subject: Re: [PATCH v5 1/2] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <20160830151044.GN10121@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
 <0e48a854-11dc-e4b5-e77c-b7f4ab36eb48@users.sourceforge.net>
In-Reply-To: <0e48a854-11dc-e4b5-e77c-b7f4ab36eb48@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 11 Aug 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Aug 2016 13:30:32 +0200
>=20
> Adjust jump targets according to the Linux coding style convention.
> Another check for the variable "status" can be omitted then at the end.
>=20
> Link: https://lkml.kernel.org/g/<20160628163146.GG29166@dell>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>=20
> v5: Rebased on the source files from Linux next-20160809.
>=20
> v4: Adjustment of an error message at the end
>    =20
>     See also a change request for the module "twl-core" on 2016-06-08:
>     https://lkml.kernel.org/g/<20160608111442.GB14888@dell>
>=20
> v3: Deletion of another blank line as requested by Lee Jones
>=20
> v2: Rebasing
>=20
>  drivers/mfd/dm355evm_msp.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index 270e19c..86eca61 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -209,7 +209,7 @@ static struct device *add_child(struct i2c_client *cl=
ient, const char *name,
>  		status =3D platform_device_add_data(pdev, pdata, pdata_len);
>  		if (status < 0) {
>  			dev_dbg(&pdev->dev, "can't add platform_data\n");
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
