From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Fri, 20 Sep 2019 19:23:58 +0000
Subject: Re: [PATCH v2] ethernet: lantiq_xrx200: Use devm_platform_ioremap_resource() in xrx200_probe()
Message-Id: <4b187ad3-a922-c6de-39f0-f8c4f06b8ae4@hauke-m.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ORhnJJW3VQI6lFWchTi2AweT5hQc2sSsi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
 <43bed158-2af9-c518-2f97-a473c2b84eb7@web.de>
In-Reply-To: <43bed158-2af9-c518-2f97-a473c2b84eb7@web.de>
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Radhey Shyam Pandey <radheys@xilinx.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ORhnJJW3VQI6lFWchTi2AweT5hQc2sSsi
Content-Type: multipart/mixed; boundary="AM2kbTKM9toKGdZzP8Tem8qNH4G8sy3WK";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Radhey Shyam Pandey <radheys@xilinx.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Message-ID: <4b187ad3-a922-c6de-39f0-f8c4f06b8ae4@hauke-m.de>
Subject: Re: [PATCH v2] ethernet: lantiq_xrx200: Use
 devm_platform_ioremap_resource() in xrx200_probe()
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
 <43bed158-2af9-c518-2f97-a473c2b84eb7@web.de>
In-Reply-To: <43bed158-2af9-c518-2f97-a473c2b84eb7@web.de>

--AM2kbTKM9toKGdZzP8Tem8qNH4G8sy3WK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/20/19 12:57 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 11:48:33 +0200
>=20
> Simplify this function implementation by using the wrapper function
> =E2=80=9Cdevm_platform_ioremap_resource=E2=80=9D instead of calling the=
 functions
> =E2=80=9Cplatform_get_resource=E2=80=9D and =E2=80=9Cdevm_ioremap_resou=
rce=E2=80=9D directly.
>=20
> * Thus reduce also a bit of exception handling code here.
> * Delete the local variable =E2=80=9Cres=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

But this can also wait till kernel 5.5.

> ---
>=20
> v2:
> Further changes were requested by Radhey Shyam Pandey.
>=20
> https://lore.kernel.org/r/CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR0=
2MB7000.namprd02.prod.outlook.com/
>=20
>=20
>=20
> * Updates for three modules were split into a separate patch for each d=
river.
>=20
> * The commit description was adjusted.
>=20
>=20
>=20
>=20
>=20
>  drivers/net/ethernet/lantiq_xrx200.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/etherne=
t/lantiq_xrx200.c
> index 900affbdcc0e..0a7ea45b9e59 100644
> --- a/drivers/net/ethernet/lantiq_xrx200.c
> +++ b/drivers/net/ethernet/lantiq_xrx200.c
> @@ -424,7 +424,6 @@ static int xrx200_probe(struct platform_device *pde=
v)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct resource *res;
>  	struct xrx200_priv *priv;
>  	struct net_device *net_dev;
>  	const u8 *mac;
> @@ -443,15 +442,7 @@ static int xrx200_probe(struct platform_device *pd=
ev)
>  	SET_NETDEV_DEV(net_dev, dev);
>  	net_dev->min_mtu =3D ETH_ZLEN;
>  	net_dev->max_mtu =3D XRX200_DMA_DATA_LEN;
> -
> -	/* load the memory ranges */
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "failed to get resources\n");
> -		return -ENOENT;
> -	}
> -
> -	priv->pmac_reg =3D devm_ioremap_resource(dev, res);
> +	priv->pmac_reg =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->pmac_reg)) {
>  		dev_err(dev, "failed to request and remap io ranges\n");
>  		return PTR_ERR(priv->pmac_reg);
> --
> 2.23.0
>=20



--AM2kbTKM9toKGdZzP8Tem8qNH4G8sy3WK--

--ORhnJJW3VQI6lFWchTi2AweT5hQc2sSsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl2FJ1oACgkQ8bdnhZyy
68fN5Af/cWbOgxE1FTNI66Jx9Q0F7qbLUmbO/wq2s3tCInXrZEOd1zaJVFNlTyCj
UEtxTaFy+EfDZ/xjCQFi9uHT7aQvSX5Siy8DqcN5gxb/xhrq2dT08stgDkKtdfwe
+avu0w8WRyZxO/V4WaqdpXyVNtzTyzfnxCtTnfF1DE7kZ7v1YcaZbDGPURG2Fjar
X1gb3M+S7EaJTv4FlMe4IJkNqb19PqiMdxTAHvtJTNAjJL8m/3JITthJvgdbUELC
CHMPEXa8gsmW8YE7keoXoorIdtllegyjqaqRhAaM/5eqcCHu259snXv/P2XwLklx
zQY/OlKEwxKyANZh/OlrsEEc1A0OWg==
=2Rvi
-----END PGP SIGNATURE-----

--ORhnJJW3VQI6lFWchTi2AweT5hQc2sSsi--
