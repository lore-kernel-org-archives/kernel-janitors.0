From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Sat, 15 Sep 2018 09:14:13 +0000
Subject: Re: [PATCH net-next] net: dsa: gswip: Fix return value check in gswip_probe()
Message-Id: <1f664c39-077b-ba9f-2651-71c45642a2b2@hauke-m.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="JmB9oJuoqESLebrECks9cZQaMfHqwKE8n"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JmB9oJuoqESLebrECks9cZQaMfHqwKE8n
Content-Type: multipart/mixed; boundary="5q30mXRLVI1Vy2ENPtyIdySmYbvFUD2Qz";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Wei Yongjun <weiyongjun1@huawei.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-ID: <1f664c39-077b-ba9f-2651-71c45642a2b2@hauke-m.de>
Subject: Re: [PATCH net-next] net: dsa: gswip: Fix return value check in
 gswip_probe()
References: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975201-184967-1-git-send-email-weiyongjun1@huawei.com>

--5q30mXRLVI1Vy2ENPtyIdySmYbvFUD2Qz
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: quoted-printable

On 09/15/2018 03:33 AM, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR(=
)
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>=20
> Fixes: 14fceff4771e ("net: dsa: Add Lantiq / Intel DSA driver for vrx20=
0")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

> ---
>  drivers/net/dsa/lantiq_gswip.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gs=
wip.c
> index 9c28d0b..faac359 100644
> --- a/drivers/net/dsa/lantiq_gswip.c
> +++ b/drivers/net/dsa/lantiq_gswip.c
> @@ -1044,18 +1044,18 @@ static int gswip_probe(struct platform_device *=
pdev)
> =20
>  	gswip_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	priv->gswip =3D devm_ioremap_resource(dev, gswip_res);
> -	if (!priv->gswip)
> -		return -ENOMEM;
> +	if (IS_ERR(priv->gswip))
> +		return PTR_ERR(priv->gswip);
> =20
>  	mdio_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	priv->mdio =3D devm_ioremap_resource(dev, mdio_res);
> -	if (!priv->mdio)
> -		return -ENOMEM;
> +	if (IS_ERR(priv->mdio))
> +		return PTR_ERR(priv->mdio);
> =20
>  	mii_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
>  	priv->mii =3D devm_ioremap_resource(dev, mii_res);
> -	if (!priv->mii)
> -		return -ENOMEM;
> +	if (IS_ERR(priv->mii))
> +		return PTR_ERR(priv->mii);
> =20
>  	priv->hw_info =3D of_device_get_match_data(dev);
>  	if (!priv->hw_info)
>=20



--5q30mXRLVI1Vy2ENPtyIdySmYbvFUD2Qz--

--JmB9oJuoqESLebrECks9cZQaMfHqwKE8n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluczWsACgkQ8bdnhZyy
68d9xwf6AhH6/Kq0n6XsUum9dG2ta7RHHKZRtrN4TIX44ULb8hveS5bgQYC47tkE
qyE0vRhcVp8A85WOiHO8V0XoYbGxxch1tkUEWKiiqDKBEf0CYexapU32TdDiVTc6
OKqAXSNz70F8tDY+5BYjA2zU4qMY6Rl0WNQbeap/UIv9J5ZGVpQUHMDfXR1DGjki
cJdCCtDM/tgIXtZfPfxteYr60LJI79wDqiMNmC1OmG6dC9brc7Q3+ngnl6JCJbs0
0Waa7kZ6JrD6B02AWwHWikSuOec68/ZscMeN/6H+CM/pb9LFMbyiP8OHv+ttVcWx
Jz4SrlIBb9zuPdpr5Ulpi4NSCqQG8Q==
=cUw5
-----END PGP SIGNATURE-----

--JmB9oJuoqESLebrECks9cZQaMfHqwKE8n--
