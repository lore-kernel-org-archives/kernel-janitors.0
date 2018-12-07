From: Oleksij Rempel <linux@rempel-privat.de>
Date: Fri, 07 Dec 2018 18:04:11 +0000
Subject: Re: [PATCH -next] mmc: remove set but not used variables 'len, clock_out'
Message-Id: <d5160712-7233-f010-7cc6-44eb4cdcda9c@rempel-privat.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nKjtxT2uZOEGfpducyvzSBa7tPen2HcDm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544164487-52246-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544164487-52246-1-git-send-email-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nKjtxT2uZOEGfpducyvzSBa7tPen2HcDm
Content-Type: multipart/mixed; boundary="NDTSWgUmkQkhkeROd6bBXL5OxfEANki52";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: YueHaibing <yuehaibing@huawei.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-ID: <d5160712-7233-f010-7cc6-44eb4cdcda9c@rempel-privat.de>
Subject: Re: [PATCH -next] mmc: remove set but not used variables 'len,
 clock_out'
References: <1544164487-52246-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544164487-52246-1-git-send-email-yuehaibing@huawei.com>

--NDTSWgUmkQkhkeROd6bBXL5OxfEANki52
Content-Type: text/plain; charset=utf-8
Content-Language: ru
Content-Transfer-Encoding: quoted-printable

Am 07.12.18 um 07:34 schrieb YueHaibing:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/mmc/host/alcor.c: In function 'alcor_data_set_dma':
> drivers/mmc/host/alcor.c:124:12: warning:
>  variable 'len' set but not used [-Wunused-but-set-variable]
>=20
> drivers/mmc/host/alcor.c:648:15: warning:
>  variable 'clock_out' set but not used [-Wunused-but-set-variable]
>=20
> It never used since introduction in commit 2a9a4742e825 ("mmc: add new =
Alcor
> Micro Cardreader SD/MMC driver")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Reviewed-by: Oleksij Rempel <linux@rempel-privat.de>

thanks!

> ---
>  drivers/mmc/host/alcor.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
> index f729a64..c712b7d 100644
> --- a/drivers/mmc/host/alcor.c
> +++ b/drivers/mmc/host/alcor.c
> @@ -121,7 +121,7 @@ static void alcor_reset(struct alcor_sdmmc_host *ho=
st, u8 val)
>  static void alcor_data_set_dma(struct alcor_sdmmc_host *host)
>  {
>  	struct alcor_pci_priv *priv =3D host->alcor_pci;
> -	u32 addr, len;
> +	u32 addr;
> =20
>  	if (!host->sg_count)
>  		return;
> @@ -138,7 +138,6 @@ static void alcor_data_set_dma(struct alcor_sdmmc_h=
ost *host)
> =20
> =20
>  	addr =3D (u32)sg_dma_address(host->sg);
> -	len =3D sg_dma_len(host->sg);
> =20
>  	alcor_write32(priv, addr, AU6601_REG_SDMA_ADDR);
>  	host->sg =3D sg_next(host->sg);
> @@ -645,7 +644,6 @@ static irqreturn_t alcor_irq(int irq, void *d)
>  static void alcor_set_clock(struct alcor_sdmmc_host *host, unsigned in=
t clock)
>  {
>  	struct alcor_pci_priv *priv =3D host->alcor_pci;
> -	unsigned int clock_out =3D 0;
>  	int i, diff =3D 0x7fffffff, tmp_clock =3D 0;
>  	u16 clk_src =3D 0;
>  	u8 clk_div =3D 0;
> @@ -670,7 +668,6 @@ static void alcor_set_clock(struct alcor_sdmmc_host=
 *host, unsigned int clock)
>  			diff =3D tmp_diff;
>  			clk_src =3D cfg->clk_src_reg;
>  			clk_div =3D tmp_div;
> -			clock_out =3D tmp_clock;
>  		}
>  	}
> =20
>=20
>=20
>=20
>=20
>=20


--=20
Regards,
Oleksij


--NDTSWgUmkQkhkeROd6bBXL5OxfEANki52--

--nKjtxT2uZOEGfpducyvzSBa7tPen2HcDm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlwKthsACgkQdQOiSHVI
77RhjQf+M+3hAL67BAjZYeHkB40Sh3nnFFn14494v0LkOZ1a5pRWgX/4WL66PtIA
I/qI5svimnZGL3zVY9HehSvwjFEPrlvw79jnlq00QLo6m4qoVS4LNW9Sz6wW30Rx
04iR1wgLzMVozT5hTt4Hms4/HUMuXId1XpCP1JrjupbxMWYx/4psiCFc+7FRNDN5
m1JrDeqzWgSro6l7U0lvIL+ki0Zp4oIL5oaYwQXdG86a4R9OQl1iCpyq4E+blySW
ci4AF5n/a4S6SrMA0Y70VQ9vFiIedFDj41xoWpyxnGY4kLKa8wjK0+DVbgZ2lW1j
VqbrwX2dzgPbRC6H18WjMkPhnvPVpg==
=H50T
-----END PGP SIGNATURE-----

--nKjtxT2uZOEGfpducyvzSBa7tPen2HcDm--
