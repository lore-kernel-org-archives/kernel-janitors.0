From: Sebastian Reichel <sre@kernel.org>
Date: Sun, 20 Oct 2019 21:14:43 +0000
Subject: Re: [PATCH] power: supply: sbs-battery: Fix a signedness bug in sbs_get_battery_capacity()
Message-Id: <20191020211443.mdvope3llryhdlrs@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="p6yo3nbqp7ril766"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110128.GM3264@mwanda>
In-Reply-To: <20190925110128.GM3264@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--p6yo3nbqp7ril766
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 25, 2019 at 02:01:28PM +0300, Dan Carpenter wrote:
> The "mode" variable is an enum and in this context GCC treats it as an
> unsigned int so the error handling is never triggered.
>=20
> Fixes: 51d075660457 ("bq20z75: Add support for charge properties")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/sbs-battery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sb=
s-battery.c
> index f8d74e9f7931..62110af1abcf 100644
> --- a/drivers/power/supply/sbs-battery.c
> +++ b/drivers/power/supply/sbs-battery.c
> @@ -555,7 +555,7 @@ static int sbs_get_battery_capacity(struct i2c_client=
 *client,
>  		mode =3D BATTERY_MODE_AMPS;
> =20
>  	mode =3D sbs_set_battery_mode(client, mode);
> -	if (mode < 0)
> +	if ((int)mode < 0)
>  		return mode;
> =20
>  	ret =3D sbs_read_word_data(client, sbs_data[reg_offset].addr);
> --=20
> 2.20.1
>=20

--p6yo3nbqp7ril766
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2szj8ACgkQ2O7X88g7
+prfixAAnPFJtGlcvjzrygJStA/dzUZJ0FWbttCedD3msf+pRX1qZ75ncKZwl0QI
SH/4+IfWxF5vK7ZEwvyvxszRv1flUefITQbDaFHYh+H134UBZQ3MiWfApVrSjz+J
xLjErmJl9whtl2C3Cjx8I/CZKhOHyzMJvTm/5SzaVUf0IGPbQsuupA28ygSYeyI/
0aNAvQrrQ5FQMyKbYskw9G8rDKa4VZc7amoEbIzbwfamFw3DzIYReCV0yIa4cmLd
uGt+T2zONrFdwaEkBoTom1vjyYg1prN7587lbNu0QeUAcfl0faG/EkNIW8DTv8X+
/Dc60x+V/3an1eBQjrFZOuWMZzuoPdrxuqBCoTsXAvfXdaupAK6bSDPdG9zPpYj0
6NNltTCJiEnLxp2E8YEMHE8GGQLQH9mSUgX7cw3qdrrih3WrdTTsh6F57mgwfsB7
DcQg/YSuZPyHuP6e7doPY2ZPg4zEMJZFiBfQpg0YGdrwQTXeOG1flygCL4VAafeQ
SN/2jI3ydI1V4gGqkNYEUxnqXvapJzermXAeGuKGFEmWIGwjaXYrFfcGhgUkm82K
PC+Nwkd5zqwH1RgexPM2WQkm0QDuUylRhmrhAKI4yZm6t6lZ0uDCGGMckrb23HtX
AaH8gKNTIgy5slyuLB4/8a3h53huhaxkgVm/bcPBIlA2DPMKtII=
=YAB+
-----END PGP SIGNATURE-----

--p6yo3nbqp7ril766--
