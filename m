From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 17 Jul 2017 10:46:44 +0000
Subject: Re: [PATCH] mfd: rtsx: make arrays depth and cd_mask static const
Message-Id: <20170717104644.igajn5icexlowvkt@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630093327.8595-1-colin.king@canonical.com>
In-Reply-To: <20170630093327.8595-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Please start the commit subject description with an uppercase char.

> From: Colin Ian King <colin.king@canonical.com>

This is odd.  How are you sending this patch Colin?

> Don't populate the arrays depath and cd_mask on the stack but make
> them static const.  Makes the object code smaller:
>=20
>    text    data     bss     dec     hex filename
>   25413    7216     448   33077    8135 drivers/mfd/rtsx_pcr.o
>=20
>    text    data     bss     dec     hex filename
>   25151    7360     448   32959    80bf drivers/mfd/rtsx_pcr.o
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/rtsx_pcr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'll fix the $SUBJECT line.

Applied, thanks.

> diff --git a/drivers/mfd/rtsx_pcr.c b/drivers/mfd/rtsx_pcr.c
> index a0ac89dfdf0f..3cf69e5c5703 100644
> --- a/drivers/mfd/rtsx_pcr.c
> +++ b/drivers/mfd/rtsx_pcr.c
> @@ -644,7 +644,7 @@ int rtsx_pci_switch_clock(struct rtsx_pcr *pcr, unsig=
ned int card_clock,
>  {
>  	int err, clk;
>  	u8 n, clk_divider, mcu_cnt, div;
> -	u8 depth[] =3D {
> +	static const u8 depth[] =3D {
>  		[RTSX_SSC_DEPTH_4M] =3D SSC_DEPTH_4M,
>  		[RTSX_SSC_DEPTH_2M] =3D SSC_DEPTH_2M,
>  		[RTSX_SSC_DEPTH_1M] =3D SSC_DEPTH_1M,
> @@ -768,7 +768,7 @@ EXPORT_SYMBOL_GPL(rtsx_pci_card_power_off);
> =20
>  int rtsx_pci_card_exclusive_check(struct rtsx_pcr *pcr, int card)
>  {
> -	unsigned int cd_mask[] =3D {
> +	static const unsigned int cd_mask[] =3D {
>  		[RTSX_SD_CARD] =3D SD_EXIST,
>  		[RTSX_MS_CARD] =3D MS_EXIST
>  	};

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
