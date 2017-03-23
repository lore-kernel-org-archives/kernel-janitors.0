From: Pavel Machek <pavel@ucw.cz>
Date: Thu, 23 Mar 2017 11:16:55 +0000
Subject: Re: [PATCH] leds: mt6323: Fix an off by one bug in probe
Message-Id: <20170323111655.GA12792@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323104049.GC20154@mwanda>
In-Reply-To: <20170323104049.GC20154@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Sean Wang <sean.wang@mediatek.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-03-23 13:40:49, Dan Carpenter wrote:
> It should be ">=3D MT6323_MAX_LEDS" instead of ">".  Also "reg" is a u32
> so it can't be negative and we can remove the test for negative values.
>=20
> Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> index 48081bccbea5..8893c74e9a1f 100644
> --- a/drivers/leds/leds-mt6323.c
> +++ b/drivers/leds/leds-mt6323.c
> @@ -417,7 +417,7 @@ static int mt6323_led_probe(struct platform_device *p=
dev)
>  			goto put_child_node;
>  		}
> =20
> -		if (reg < 0 || reg > MT6323_MAX_LEDS || leds->led[reg]) {
> +		if (reg >=3D MT6323_MAX_LEDS || leds->led[reg]) {
>  			dev_err(dev, "Invalid led reg %u\n", reg);
>  			ret =3D -EINVAL;
>  			goto put_child_node;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljTrqcACgkQMOfwapXb+vL80QCgkbm4xkqm3DyxQOPXGOV2RHnr
z7cAn1jMMfv/9ewRNV4LWhQe71ZYsa69
=0p98
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
