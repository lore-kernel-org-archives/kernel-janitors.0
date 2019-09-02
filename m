From: Sebastian Reichel <sre@kernel.org>
Date: Mon, 02 Sep 2019 19:13:47 +0000
Subject: Re: [PATCH] power: supply: isp1704: remove redundant assignment to variable ret
Message-Id: <20190902191347.thcbxwo2vm32hozz@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kuxj64xjg5hlbeip"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705093612.21925-1-colin.king@canonical.com>
In-Reply-To: <20190705093612.21925-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--kuxj64xjg5hlbeip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 05, 2019 at 10:36:12AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable ret is being assigned with a value that is never
> read and it is being updated later with a new value. The
> assignment is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/isp1704_charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/isp1704_charger.c b/drivers/power/suppl=
y/isp1704_charger.c
> index b48cb7aba97b..4812ac1ff2df 100644
> --- a/drivers/power/supply/isp1704_charger.c
> +++ b/drivers/power/supply/isp1704_charger.c
> @@ -342,7 +342,7 @@ static inline int isp1704_test_ulpi(struct isp1704_ch=
arger *isp)
>  	int vendor;
>  	int product;
>  	int i;
> -	int ret =3D -ENODEV;
> +	int ret;
> =20
>  	/* Test ULPI interface */
>  	ret =3D isp1704_write(isp, ULPI_SCRATCH, 0xaa);
> --=20
> 2.20.1
>=20

--kuxj64xjg5hlbeip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl1taesACgkQ2O7X88g7
+pq+wg//cBEGbqz/V0ogRccgqe9hAgyqMIC1Q3A8ThtdLESA24kd5zqxL3j2/k7A
+fr7UPFlqouOuDzMzoQpiplSTsKX+PNnneXAVbbUAvcoEQGq6SB9bCbNKrZWJTgj
6R5Fh6p6ErzCjXIf5+NufZd9Gw8iT2ExnGrcCjocFdKgAQ9VtUE2YFPffnJKhMCK
iG3ovEQgZUUWDsxzdGGZtpRb0UwVK6AxtQHufMveozIwau8kqMw7ZiIkWrPa7zNx
9i8zIOBVVsPAhkeCeZ/kLgGXYwagnRzOdG3qTVMExf8EpJbNVr/XL06dPJ8INpnm
2j2y/bavvMteCWgynOt4h4n08cbLGDUuHvqypRmUw42Qm1jc5FPjofSjRy86tiYM
cx8Q7Yy0fedYHIJTgP5zzvTRPPi3DRlB0A97T3ZhzYW+ntQaiUqHC+QGzOBoDeuu
OtUhoZ9CfyA4x0jMBIT+R953P1U5wfYdpown1F3tqZ5rlK/0FHOQWhZ4PjVA7VsM
5AfkhCfm6Bc6gj8OeU1E7MAAN6SSG6lGVOeE3ITPqRebQ1zUlF3sVgruTEBpmHhF
Wke/WNM7hpsVyiATycD0gKhka5t9r2uynO3Acc9s88k85pqFobBrjoSakYUVmw5R
BUlSnNB6XDV0qiRRZhKyEe2zhcWvHWCfDog/kOx072j1s6WWY3o=
=Y1QI
-----END PGP SIGNATURE-----

--kuxj64xjg5hlbeip--
