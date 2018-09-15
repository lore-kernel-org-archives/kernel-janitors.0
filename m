From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Sat, 15 Sep 2018 09:14:42 +0000
Subject: Re: [PATCH net-next] net: dsa: gswip: Fix copy-paste error in gswip_gphy_fw_probe()
Message-Id: <442eb499-8250-1c51-03e6-3746ba985483@hauke-m.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hiop7HsYsDOHoVauJ35vDGaOJCEs9rf4v"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975218-185034-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975218-185034-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hiop7HsYsDOHoVauJ35vDGaOJCEs9rf4v
Content-Type: multipart/mixed; boundary="RY23zc7VG3vBztRJjmHs8160xigFquC4G";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Wei Yongjun <weiyongjun1@huawei.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-ID: <442eb499-8250-1c51-03e6-3746ba985483@hauke-m.de>
Subject: Re: [PATCH net-next] net: dsa: gswip: Fix copy-paste error in
 gswip_gphy_fw_probe()
References: <1536975218-185034-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975218-185034-1-git-send-email-weiyongjun1@huawei.com>

--RY23zc7VG3vBztRJjmHs8160xigFquC4G
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: quoted-printable

On 09/15/2018 03:33 AM, Wei Yongjun wrote:
> The return value from of_reset_control_array_get_exclusive() is not
> checked correctly. The test is done against a wrong variable. This
> patch fix it.
>=20
> Fixes: 14fceff4771e ("net: dsa: Add Lantiq / Intel DSA driver for vrx20=
0")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

> ---
>  drivers/net/dsa/lantiq_gswip.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gs=
wip.c
> index 9c28d0b..9c10570 100644
> --- a/drivers/net/dsa/lantiq_gswip.c
> +++ b/drivers/net/dsa/lantiq_gswip.c
> @@ -934,10 +934,10 @@ static int gswip_gphy_fw_probe(struct gswip_priv =
*priv,
>  	}
> =20
>  	gphy_fw->reset =3D of_reset_control_array_get_exclusive(gphy_fw_np);
> -	if (IS_ERR(priv->gphy_fw)) {
> -		if (PTR_ERR(priv->gphy_fw) !=3D -EPROBE_DEFER)
> +	if (IS_ERR(gphy_fw->reset)) {
> +		if (PTR_ERR(gphy_fw->reset) !=3D -EPROBE_DEFER)
>  			dev_err(dev, "Failed to lookup gphy reset\n");
> -		return PTR_ERR(priv->gphy_fw);
> +		return PTR_ERR(gphy_fw->reset);
>  	}
> =20
>  	return gswip_gphy_fw_load(priv, gphy_fw);
>=20



--RY23zc7VG3vBztRJjmHs8160xigFquC4G--

--hiop7HsYsDOHoVauJ35vDGaOJCEs9rf4v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluczYMACgkQ8bdnhZyy
68e+IQgA3/4KK27fXmcedM43W20wvZoA+R8ZVh4OdFP/860Q44R1igmxFRtXVmzL
gPqhFQtUTZj5O1Wuyn1ufB7UVTepaosM1c1QsLMZoppY13SHhCicM918oYJ6NngR
NugJkAfIly+gvowoyfmcN0gdoaJtbTaGctqj2fIdqY2OfuvUv+RtGlX+0UVFZJzm
12Gj64vTPViBNspdtMLM4APf0uqMpFAgW8jfIacim0xub4vxVqyfXqFtTng0WrNE
1a5fkpHZrOOoiCcKuztdwonZSFKC+CKymTHQ6CutLBQf0oM5qTH8S/sSAl6w2dii
PWaHndEekyY7tEsC5LBSmZkGHesuVQ==
=vOFJ
-----END PGP SIGNATURE-----

--hiop7HsYsDOHoVauJ35vDGaOJCEs9rf4v--
