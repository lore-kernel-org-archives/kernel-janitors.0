From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 02 Aug 2019 12:07:10 +0000
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check on trigger
Message-Id: <954ea3c6-3a2d-ee4e-c4c8-a49358d569b6@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="G8TMHH3aqvcSICyEMi0JzW5k4s1Z46P22"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G8TMHH3aqvcSICyEMi0JzW5k4s1Z46P22
Content-Type: multipart/mixed; boundary="9MrFRpJrl4DodDkv4jgC1ZDYOd5mgQRYA";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Colin King <colin.king@canonical.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-can@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
 Henning Colliander <henning.colliander@evidente.se>,
 Jimmy Assarsson <extja@kvaser.com>, Christer Beskow <chbe@kvaser.com>
Message-ID: <954ea3c6-3a2d-ee4e-c4c8-a49358d569b6@pengutronix.de>
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check
 on trigger
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>

--9MrFRpJrl4DodDkv4jgC1ZDYOd5mgQRYA
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Adding the Author(s) to Cc.

On 7/25/19 1:25 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The check to see if trigger is less than zero is always false, trigger
> is always in the range 0..255.  Hence the check is redundant and can
> be removed.
>=20
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/can/kvaser_pciefd.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_p=
ciefd.c
> index 3af747cbbde4..68e00aad0810 100644
> --- a/drivers/net/can/kvaser_pciefd.c
> +++ b/drivers/net/can/kvaser_pciefd.c
> @@ -652,9 +652,6 @@ static void kvaser_pciefd_pwm_stop(struct kvaser_pc=
iefd_can *can)
>  	top =3D (pwm_ctrl >> KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT) & 0xff;
> =20
>  	trigger =3D (100 * top + 50) / 100;
> -	if (trigger < 0)
> -		trigger =3D 0;
> -
>  	pwm_ctrl =3D trigger & 0xff;
>  	pwm_ctrl |=3D (top & 0xff) << KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT;
>  	iowrite32(pwm_ctrl, can->reg_base + KVASER_PCIEFD_KCAN_PWM_REG);
>=20

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--9MrFRpJrl4DodDkv4jgC1ZDYOd5mgQRYA--

--G8TMHH3aqvcSICyEMi0JzW5k4s1Z46P22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAl1EJ24ACgkQWsYho5Hk
nSDHLAf/evif4UhnEzCWXAm6eTOORviGs1HoDY+7aLbIDSzIJqNmrBE4W5H7dlVq
II7nIgfEu4FRW2Ke4eOJFwFz7YrCrN3FfwXtULrH6oSrKzd8Jrcc+1qJBa+sfNkd
J8dQkD1vNRlU0yhrsE7oPi8gdZwKyT55C4sJ5CSuEVNdDwOZOvpEPr8CwKd8erEc
XI/ifzl8S/25miv9+usoONExoo+1ckwxJmzjXsqlVn1l5kLG8Z8lyhXZwpj5qYip
ZB8qE1nW4WpdjYEAZysg15ZcN+PtZx6knodcU/LGCR4kkbai+x2YyClwFFkDZg9m
diJnI5UV6WvPEiMx6y8GcXhBmYqVqw==
=1rK7
-----END PGP SIGNATURE-----

--G8TMHH3aqvcSICyEMi0JzW5k4s1Z46P22--
