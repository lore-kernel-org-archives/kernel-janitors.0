From: Sebastian Reichel <sre@kernel.org>
Date: Mon, 02 Sep 2019 19:03:09 +0000
Subject: Re: [PATCH] power: supply: max17042_battery: Fix a typo in function names
Message-Id: <20190902190309.yshdhrswhemdf7yb@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="geki2nibjgyihtcm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721160328.24660-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721160328.24660-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--geki2nibjgyihtcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 21, 2019 at 06:03:28PM +0200, Christophe JAILLET wrote:
> It is likely that 'max10742_[un]lock_model()' functions should be
> 'max17042_[un]lock_model()'
> (0 and 7 switched in 10742)
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/max17042_battery.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supp=
ly/max17042_battery.c
> index 581c6bd23388..da3904822929 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -511,7 +511,7 @@ static inline void max17042_override_por(struct regma=
p *map,
>  		regmap_write(map, reg, value);
>  }
> =20
> -static inline void max10742_unlock_model(struct max17042_chip *chip)
> +static inline void max17042_unlock_model(struct max17042_chip *chip)
>  {
>  	struct regmap *map =3D chip->regmap;
> =20
> @@ -519,7 +519,7 @@ static inline void max10742_unlock_model(struct max17=
042_chip *chip)
>  	regmap_write(map, MAX17042_MLOCKReg2, MODEL_UNLOCK2);
>  }
> =20
> -static inline void max10742_lock_model(struct max17042_chip *chip)
> +static inline void max17042_lock_model(struct max17042_chip *chip)
>  {
>  	struct regmap *map =3D chip->regmap;
> =20
> @@ -577,7 +577,7 @@ static int max17042_init_model(struct max17042_chip *=
chip)
>  	if (!temp_data)
>  		return -ENOMEM;
> =20
> -	max10742_unlock_model(chip);
> +	max17042_unlock_model(chip);
>  	max17042_write_model_data(chip, MAX17042_MODELChrTbl,
>  				table_size);
>  	max17042_read_model_data(chip, MAX17042_MODELChrTbl, temp_data,
> @@ -589,7 +589,7 @@ static int max17042_init_model(struct max17042_chip *=
chip)
>  		temp_data,
>  		table_size);
> =20
> -	max10742_lock_model(chip);
> +	max17042_lock_model(chip);
>  	kfree(temp_data);
> =20
>  	return ret;
> --=20
> 2.20.1
>=20

--geki2nibjgyihtcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl1tZ20ACgkQ2O7X88g7
+priMg//R7FBlaET+kgtJlE1Iw8yaVuXLYkOfpjDXo4asEFbs5SPxrD4VyTWAXTs
McaDNnlAmVs5kinXneVN8LMYdU6MstWi0a3eV/5JYxGGMkvf9eBMOsqFvP6JOcsG
bypNfnKdLbuhaxC5ZjHLRK/D3b9oZ6nSBqBZjHvRQt4lIeqmTyNw/z0XaHqLhVHU
/eI6Y+FSx+v1agf+ycRfCOoIP95ZEEsxeBZLhe+aBlnUjD9WzmU4VZwmTM0PkmZt
Xq6xvkp6WezD4QihyOx911i08KHSMuxBQu6kd5eXQW+T0IdcIDQpbp8WD7pzOjrY
Gz9xE9f7T3kEjm4FRlBbGZe92X7GVpltqW/qOoeD1y87JbPAHNlLWkjv55KgysLK
yfnB+mbSetnlZ/lBnmLaeQnyzNJowykvqveQYJO4t+iO4dEFmplTAFS9syZcTicF
g0fAJWY4W9DZSLLQEG+f1PlxyaCwvabQpOTeQsHuPAc6FnA9ChxWePnoho9Y72Kk
GNx50V4/KS3A5agpyQ0JwfY9Jz48sZ0wHz6gEnccNeobzoxGYLgOJjDwLw1EtRv9
ACr3y/SbzjltKqjC5PgYHCfRESlCTXV7Ngt5Q1ZErvqH5ZeBnZwAhzV9hqY1shTc
07x8g4NyCMzsq07FOSbNqRZgvk6vEXk+gmNohoLLSlXlt916Bss=
=QS8p
-----END PGP SIGNATURE-----

--geki2nibjgyihtcm--
