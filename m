From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 20 Oct 2020 15:52:32 +0000
Subject: Re: [PATCH] can: isotp: make const array static, makes object smaller
Message-Id: <84468e24-899c-6dac-5349-da6613c3eb98@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tJG8cfsxoLOlGC1Y1hfR0tNaUE9sTYVnB"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201020154203.54711-1-colin.king@canonical.com>
In-Reply-To: <20201020154203.54711-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Oliver Hartkopp <socketcan@hartkopp.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tJG8cfsxoLOlGC1Y1hfR0tNaUE9sTYVnB
Content-Type: multipart/mixed; boundary="tumPUlKtpQx75xVhhXq0eeC7YAM9A2EQ0";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Colin King <colin.king@canonical.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <84468e24-899c-6dac-5349-da6613c3eb98@pengutronix.de>
Subject: Re: [PATCH] can: isotp: make const array static, makes object smaller
References: <20201020154203.54711-1-colin.king@canonical.com>
In-Reply-To: <20201020154203.54711-1-colin.king@canonical.com>

--tumPUlKtpQx75xVhhXq0eeC7YAM9A2EQ0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 10/20/20 5:42 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the const array plen on the stack but instead it
> static. Makes the object code smaller by 926 bytes.
>=20
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   26531	   1943	     64	  28538	   6f7a	net/can/isotp.o
>=20
> After:
>    text	   data	    bss	    dec	    hex	filename
>   25509	   2039	     64	  27612	   6bdc	net/can/isotp.o
>=20
> (gcc version 10.2.0)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

applied to linux-can/testing.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--tumPUlKtpQx75xVhhXq0eeC7YAM9A2EQ0--

--tJG8cfsxoLOlGC1Y1hfR0tNaUE9sTYVnB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl+PB8AACgkQqclaivrt
76nH/Qf9H4/fOWvnpPiH+Zwsx6UlqqnrDA+fdj82eTRlv+qSnIcMZDuuYwanVCsF
GWxkDJo+DgRGv0blQEGyQXhHAMZ6BY6ymLDMAMX/0U24Ehyc4MQJgFb8xOjBcXVm
7Uy4y/QKCzXKzzRjWbGapSHNGg/WO/bhQZgjECc3BqSyeTZQ91kF7lBgYKyKFRNb
7g9/ire+mwOY8sOPiptdlrm08wGsW12E7rqiqfJPA6j46U7+/9FMlRJJassLyYTt
5XPJlsFY7CZas3/GSCXTWXhQISFXD7yRH0ahWRhJ4dv1cTFNll61BNH3Mlo8OIon
OSi+2u1JSjpaZR4rTtxtJw4STHKK8g==
=A1ER
-----END PGP SIGNATURE-----

--tJG8cfsxoLOlGC1Y1hfR0tNaUE9sTYVnB--
