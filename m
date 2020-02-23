From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Sun, 23 Feb 2020 15:58:19 +0000
Subject: Re: [PATCH] staging: speakup: remove redundant initialization of pointer p_key
Message-Id: <20200223155819.hycmdvrsiid27jeg@function>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200223153954.420731-1-colin.king@canonical.com>
In-Reply-To: <20200223153954.420731-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Kirk Reiser <kirk@reisers.ca>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, linux-kernel@vger.kernel.org, Chris Brannon <chris@the-brannons.com>

Colin King, le dim. 23 f=C3=A9vr. 2020 15:39:54 +0000, a ecrit:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Pointer p_key is being initialized with a value that is never read,
> it is assigned a new value later on. The initialization is redundant
> and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Indeed, thanks!

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  drivers/staging/speakup/keyhelp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/speakup/keyhelp.c b/drivers/staging/speakup/=
keyhelp.c
> index 5f1bda37f86d..822ceac83068 100644
> --- a/drivers/staging/speakup/keyhelp.c
> +++ b/drivers/staging/speakup/keyhelp.c
> @@ -49,7 +49,7 @@ static int cur_item, nstates;
>  static void build_key_data(void)
>  {
>  	u_char *kp, counters[MAXFUNCS], ch, ch1;
> -	u_short *p_key =3D key_data, key;
> +	u_short *p_key, key;
>  	int i, offset =3D 1;
> =20
>  	nstates =3D (int)(state_tbl[-1]);
> --=20
> 2.25.0
>=20

--=20
Samuel
j'etais en train de nettoyer ma souris et le coup est parti...
 -+- s sur #ens-mim - et en plus c vrai... -+-
