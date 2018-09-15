From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Sat, 15 Sep 2018 09:15:06 +0000
Subject: Re: [PATCH net-next] net: lantiq: Fix return value check in xrx200_probe()
Message-Id: <d78b1ce9-c642-285d-a4bb-2722aa4e6272@hauke-m.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZS4D812v1Skh2vvIez927RoIXE3JplpzM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZS4D812v1Skh2vvIez927RoIXE3JplpzM
Content-Type: multipart/mixed; boundary="mvjEtLM4dgJIH76YJmpnfJsFijz9KCDQ5";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-ID: <d78b1ce9-c642-285d-a4bb-2722aa4e6272@hauke-m.de>
Subject: Re: [PATCH net-next] net: lantiq: Fix return value check in
 xrx200_probe()
References: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>

--mvjEtLM4dgJIH76YJmpnfJsFijz9KCDQ5
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: quoted-printable

On 09/15/2018 03:33 AM, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR(=
)
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>=20
> Fixes: fe1a56420cf2 ("net: lantiq: Add Lantiq / Intel VRX200 Ethernet d=
river")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

> ---
>  drivers/net/ethernet/lantiq_xrx200.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/etherne=
t/lantiq_xrx200.c
> index c8b6d90..4a16076 100644
> --- a/drivers/net/ethernet/lantiq_xrx200.c
> +++ b/drivers/net/ethernet/lantiq_xrx200.c
> @@ -461,9 +461,9 @@ static int xrx200_probe(struct platform_device *pde=
v)
>  	}
> =20
>  	priv->pmac_reg =3D devm_ioremap_resource(dev, res);
> -	if (!priv->pmac_reg) {
> +	if (IS_ERR(priv->pmac_reg)) {
>  		dev_err(dev, "failed to request and remap io ranges\n");
> -		return -ENOMEM;
> +		return PTR_ERR(priv->pmac_reg);
>  	}
> =20
>  	priv->chan_rx.dma.irq =3D platform_get_irq_byname(pdev, "rx");
>=20



--mvjEtLM4dgJIH76YJmpnfJsFijz9KCDQ5--

--ZS4D812v1Skh2vvIez927RoIXE3JplpzM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluczZoACgkQ8bdnhZyy
68dz1ggApldO85/iY5cL15ppoKymlLmdZScB1JFi8oPXBQqyvycqgDz84RupT4Vg
PkvxYycuROY9r3czmDiFcZb55GQx9FG7UqHvvqgsw28tvX4vxnPgwMwjSFyMKmTL
JntqRz2UZfqEzMo2jeZx9CEjbfmM+8Berd1yI3cYiGKFtMWu5flgvo8fvmHthgeP
ODWdsnR2TZGHnHamCAaptbhS6//UxrYTGIjWtGUD4VY0/Hb8pwPb+XcZUgf1c92t
lqHAQMK+HBTlgJVbXTjhSZexkDhePysVqbuTtVyS86jIUjbxeC5urAtNe+p3YmRR
b8CfpC3MN1RcP8pNdrehDEdBDl84QQ==
=50lt
-----END PGP SIGNATURE-----

--ZS4D812v1Skh2vvIez927RoIXE3JplpzM--
