From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sun, 16 Sep 2018 09:42:25 +0000
Subject: Re: [PATCH] power: supply: ab8500_fg: silence uninitialized variable warnings
Message-Id: <20180916094225.dpbmcsyc2c6v3o5y@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3nj3lvetxluw5uqu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180910083904.sdjreuxjxtd2puc4@kili.mountain>
In-Reply-To: <20180910083904.sdjreuxjxtd2puc4@kili.mountain>
To: kernel-janitors@vger.kernel.org


--3nj3lvetxluw5uqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 10, 2018 at 11:39:04AM +0300, Dan Carpenter wrote:
> If kstrtoul() fails then we print "charge_full" when it's uninitialized.
> The debug printk doesn't add anything so I deleted it and cleaned these
> two functions up a bit.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20

Thanks, queued.

-- Sebastian

> diff --git a/drivers/power/supply/ab8500_fg.c b/drivers/power/supply/ab85=
00_fg.c
> index 2bdadb58bcc6..776102c31305 100644
> --- a/drivers/power/supply/ab8500_fg.c
> +++ b/drivers/power/supply/ab8500_fg.c
> @@ -2433,17 +2433,14 @@ static ssize_t charge_full_store(struct ab8500_fg=
 *di, const char *buf,
>  				 size_t count)
>  {
>  	unsigned long charge_full;
> -	ssize_t ret;
> +	int ret;
> =20
>  	ret =3D kstrtoul(buf, 10, &charge_full);
> +	if (ret)
> +		return ret;
> =20
> -	dev_dbg(di->dev, "Ret %zd charge_full %lu", ret, charge_full);
> -
> -	if (!ret) {
> -		di->bat_cap.max_mah =3D (int) charge_full;
> -		ret =3D count;
> -	}
> -	return ret;
> +	di->bat_cap.max_mah =3D (int) charge_full;
> +	return count;
>  }
> =20
>  static ssize_t charge_now_show(struct ab8500_fg *di, char *buf)
> @@ -2455,20 +2452,16 @@ static ssize_t charge_now_store(struct ab8500_fg =
*di, const char *buf,
>  				 size_t count)
>  {
>  	unsigned long charge_now;
> -	ssize_t ret;
> +	int ret;
> =20
>  	ret =3D kstrtoul(buf, 10, &charge_now);
> +	if (ret)
> +		return ret;
> =20
> -	dev_dbg(di->dev, "Ret %zd charge_now %lu was %d",
> -		ret, charge_now, di->bat_cap.prev_mah);
> -
> -	if (!ret) {
> -		di->bat_cap.user_mah =3D (int) charge_now;
> -		di->flags.user_cap =3D true;
> -		ret =3D count;
> -		queue_delayed_work(di->fg_wq, &di->fg_periodic_work, 0);
> -	}
> -	return ret;
> +	di->bat_cap.user_mah =3D (int) charge_now;
> +	di->flags.user_cap =3D true;
> +	queue_delayed_work(di->fg_wq, &di->fg_periodic_work, 0);
> +	return count;
>  }
> =20
>  static struct ab8500_fg_sysfs_entry charge_full_attr =3D

--3nj3lvetxluw5uqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlueJYEACgkQ2O7X88g7
+pqEghAAggSP4D426spw4xgUwCVMrDwJJHjV/PA0h9hn0t+2CxVKy69ui1cWC1N2
MJHopVtMVlVhhnqUJEe8Z8IPxRyXywW6y+ku4Is8NaNfB6ygahfQL5MRRe/FC0av
KhcAptvtS8gGtRtecn1HNADIp0jwnEvgL1/f/OaFMgloAdJOsqAFDgOAlr5MjyGO
1Wdr7QbWGGn64cjyzIMsEY39Xp7mKw8/POU/VS1i2N06LOz6eh2l+UGXxUm5NbIz
mQyQTcl+FZmflfGK12V08TaRH1tq/MC/J8iOPLALk0ioY6ikU5dB58yqSk4Dcgm6
KF49f1OOQaS5htSHLuUwBPtl0rPpvp9wIKalE1gKpZJ165HgK5WP0OUZNAUgIkZN
yHm/tirgdf3GDRV1CdDnETRFWBU/Ao2u3aPoA8NrYkcFmD+Q5Ke2BlhvEmgrWxmO
A9cq+w3BG+zF7Q9TnxMuJRO2cS9t9IzsaortzoavOpuh/jq2sBBk70w5yFNL110n
5MFxWCpgZNlPNUPI4ewfXwCdIfCHVd4UeB3sVkUkt5tLn6fR/Hvq2KWGCcMsoRWU
s4QnGL+bFvJy9o64RxbvQk5yYYeRjEw0fI7qvZFNSPAavloig/knE8USBPBURD9j
DIDtt5QmL3NoLWOqWtQjqkQMVV2pa0zFpx3m/lE5wwoL93poBR8=
=2qEA
-----END PGP SIGNATURE-----

--3nj3lvetxluw5uqu--
