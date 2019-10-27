From: Sebastian Reichel <sre@kernel.org>
Date: Sun, 27 Oct 2019 21:34:56 +0000
Subject: Re: [PATCH -next] power: supply: ab8500_charger: Fix wrong pointer passed to PTR_ERR()
Message-Id: <20191027213456.yexbg6kzgt7vl5fm@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ayrkqrrimiyumc6c"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022111856.44118-1-weiyongjun1@huawei.com>
In-Reply-To: <20191022111856.44118-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org


--ayrkqrrimiyumc6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 22, 2019 at 11:18:56AM +0000, Wei Yongjun wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>=20
> Fixes: 97ab78bac5d0 ("power: supply: ab8500_charger: Convert to IIO ADC")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thanks for the patch. Gustavo A. R. Silva send an identical patch
one day earlier, so I applied his patch and added an Reviewed-by
=66rom you.

-- Sebastian

>  drivers/power/supply/ab8500_charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply=
/ab8500_charger.c
> index ff2bb4411a22..8a0f9d769690 100644
> --- a/drivers/power/supply/ab8500_charger.c
> +++ b/drivers/power/supply/ab8500_charger.c
> @@ -3393,7 +3393,7 @@ static int ab8500_charger_probe(struct platform_dev=
ice *pdev)
>  		if (PTR_ERR(di->adc_main_charger_c) =3D=3D -ENODEV)
>  			return -EPROBE_DEFER;
>  		dev_err(&pdev->dev, "failed to get ADC main charger current\n");
> -		return PTR_ERR(di->adc_main_charger_v);
> +		return PTR_ERR(di->adc_main_charger_c);
>  	}
>  	di->adc_vbus_v =3D devm_iio_channel_get(&pdev->dev, "vbus_v");
>  	if (IS_ERR(di->adc_vbus_v)) {
>=20
>=20
>=20

--ayrkqrrimiyumc6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl22DX8ACgkQ2O7X88g7
+pq3AA//XlhQ9Z3XbxQL2ENPtxj3Z9vncXBd8iNpcPAupduu4bIVpeAQosMIz7i9
1BmohV6r5Sp9tw5R0h4wN5GjZ3GCQlky9ok1XdV0P/Y3OvyKcnZVR6EIRbK+3zrn
meSAlWvZgr8VSoXyDSKPI5s0bJmRXV8q2sGQ2pRZwHNcazTF4d43wKgEEt162CD5
YSvS1KqRBPNA7RGE9/cupoaPzkUIG18wWvrRFQKAz3iAOyZW2j+t6KPRs7pJ4HY+
Th0+9WW2PPt97XzGJR4Ys51M41nVJK71lgf2V5Ip2PNVVSVKhbxWkp/IVK1HeeZI
hgjvVHqN/r132gLl3RdEeWqCIulM4349flTeR4hVLzIo2oAF+qOAb9+xMQqOwsDs
xqyDqt656efjpPy66FNM1LbJSf35I0snX5Ca4z6xIIXmRDe+sn7WgP7hULAulYty
SOCdmyAWJEpV8CcOQQizUldjn4vAVM7vfdaOrqRitP8dDRVJvFGGdF2AIDwWHTTQ
xRWd0I8t2JJn9Wyvphr15UiVzh1AdcoboSPsD27GXq8cmmnE9qegYVLsMa5T9rfl
YaroIPHc+vFYFnSwYLxaKAhWYVB4PDIeR6/aGixC9qexfMHKNuz+LLpeVbvoEvpS
IrfO/S+9H1cxY/szm+JSNudSx+bBa4wVFq9AKO3Vwp9AH7M0yYY=
=Rqe6
-----END PGP SIGNATURE-----

--ayrkqrrimiyumc6c--
