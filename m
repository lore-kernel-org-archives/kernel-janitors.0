From: Oleksij Rempel <linux@rempel-privat.de>
Date: Fri, 07 Dec 2018 18:04:40 +0000
Subject: Re: [PATCH][misc-next] misc: cardreader: fix spelling mistake "invailid" -> "invalid"
Message-Id: <6ea8c539-1b81-f19b-608a-ce9ead1d6fb5@rempel-privat.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zIYITDqYwnnCBmikaZfeWZ1QHyl07uTFU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181206091936.11871-1-colin.king@canonical.com>
In-Reply-To: <20181206091936.11871-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zIYITDqYwnnCBmikaZfeWZ1QHyl07uTFU
Content-Type: multipart/mixed; boundary="cTP1uIVH3BeszxpHWKz2jT13hojFzjLwR";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <6ea8c539-1b81-f19b-608a-ce9ead1d6fb5@rempel-privat.de>
Subject: Re: [PATCH][misc-next] misc: cardreader: fix spelling mistake
 "invailid" -> "invalid"
References: <20181206091936.11871-1-colin.king@canonical.com>
In-Reply-To: <20181206091936.11871-1-colin.king@canonical.com>

--cTP1uIVH3BeszxpHWKz2jT13hojFzjLwR
Content-Type: text/plain; charset=utf-8
Content-Language: ru
Content-Transfer-Encoding: quoted-printable

Am 06.12.18 um 10:19 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in a couple of dev_dbg messages, fix these.=

>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Oleksij Rempel <linux@rempel-privat.de>

thanks!

> ---
>  drivers/misc/cardreader/alcor_pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardrea=
der/alcor_pci.c
> index 6872b8e29b4d..bcb10fa4bc3a 100644
> --- a/drivers/misc/cardreader/alcor_pci.c
> +++ b/drivers/misc/cardreader/alcor_pci.c
> @@ -105,7 +105,7 @@ static int alcor_pci_find_cap_offset(struct alcor_p=
ci_priv *priv,
>  	while (1) {
>  		pci_read_config_dword(pci, where, &val32);
>  		if (val32 =3D=3D 0xffffffff) {
> -			dev_dbg(priv->dev, "find_cap_offset invailid value %x.\n",
> +			dev_dbg(priv->dev, "find_cap_offset invalid value %x.\n",
>  				val32);
>  			return 0;
>  		}
> @@ -116,7 +116,7 @@ static int alcor_pci_find_cap_offset(struct alcor_p=
ci_priv *priv,
>  		}
> =20
>  		if ((val32 & 0xff00) =3D=3D 0x00) {
> -			dev_dbg(priv->dev, "pci_find_cap_offset invailid value %x.\n",
> +			dev_dbg(priv->dev, "pci_find_cap_offset invalid value %x.\n",
>  				val32);
>  			break;
>  		}
>=20


--=20
Regards,
Oleksij


--cTP1uIVH3BeszxpHWKz2jT13hojFzjLwR--

--zIYITDqYwnnCBmikaZfeWZ1QHyl07uTFU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlwKtjgACgkQdQOiSHVI
77QXvQf/fFdltk96GQCgEQ7tqwC01EsNV7/sQBAVjziMYGONzpEzoWP/9vusHRdD
r520x4oubWbog8tFtzj8kj4E78+X3CbA504RlAzd5pc53voZdCpx0d3nGDxVDiAt
hgJtjBRpsx4A3mgK27R0CFAaxd9iCvG+JjzXmNbLyDJvaK57Xc1bXgCd9l/Etjxf
M1C3bwMn79a8SxgLSDfXoyHflHVsYam3qKaZdmdRoSzTo0C3/PlsofkUcQA7Dx2M
UnAYRHsPYFrId506VgiW91SHbS5G6pzWOx2YyX3uBhZRN2FkXyJ27bwnBW8DdpiP
GTABtMpQ8Eap4IMalb650noU7LMjBA==
=NA+o
-----END PGP SIGNATURE-----

--zIYITDqYwnnCBmikaZfeWZ1QHyl07uTFU--
