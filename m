From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 08 Jan 2021 08:06:33 +0000
Subject: Re: [PATCH for can-next] MAINTAINERS: adjust entry to tcan4x5x file split
Message-Id: <0ba9535f-2e1d-116d-1c47-01bdd0ff89b3@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xUXzECopG6TaH5wOM76FytFesP1twLoUD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108073932.20804-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210108073932.20804-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-can@vger.kernel.org
Cc: Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>, Sriram Dash <sriram.dash@samsung.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xUXzECopG6TaH5wOM76FytFesP1twLoUD
Content-Type: multipart/mixed; boundary="bfck0ZA6GpZnpvjvcExJt4b0J73jFy9tz";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-can@vger.kernel.org
Cc: Dan Murphy <dmurphy@ti.com>, Sean Nyekjaer <sean@geanix.com>,
 Sriram Dash <sriram.dash@samsung.com>, Joe Perches <joe@perches.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <0ba9535f-2e1d-116d-1c47-01bdd0ff89b3@pengutronix.de>
Subject: Re: [PATCH for can-next] MAINTAINERS: adjust entry to tcan4x5x file
 split
References: <20210108073932.20804-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210108073932.20804-1-lukas.bulwahn@gmail.com>

--bfck0ZA6GpZnpvjvcExJt4b0J73jFy9tz
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 1/8/21 8:39 AM, Lukas Bulwahn wrote:
> Commit 7813887ea972 ("can: tcan4x5x: rename tcan4x5x.c -> tcan4x5x-core=
=2Ec")
> and commit 67def4ef8bb9 ("can: tcan4x5x: move regmap code into seperate=

> file") split the file tcan4x5x.c into two files, but missed to adjust t=
he
> TI TCAN4X5X DEVICE DRIVER section in MAINTAINERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>   warning: no file matches    F:    drivers/net/can/m_can/tcan4x5x.c
>=20
> Adjust the file entry in MAINTAINERS to the tcan4x5x file splitting.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210107, not for current master
>=20
> Marc, please pick this for your -next tree on top of the tcan4x5x clean=
up.

Makes perfect sense. Applied to linux-can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--bfck0ZA6GpZnpvjvcExJt4b0J73jFy9tz--

--xUXzECopG6TaH5wOM76FytFesP1twLoUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl/4EokACgkQqclaivrt
76ldpAf/We4hotK7pNis8TKNSmVSOpiXwd3LXMjbV/D94OjNKLK+Qxdj6hCC1g5E
wl/mR8rciF/qh8p2f/EeIcRexHrrDWhd17lkZizk8JfXNfwWWyZGDUqOkC7UOipv
2qS36SOIcPrai4LIA4ZTwzONa7aNxsZrLCcjpkjryf4Mw2MU1c7ND/Ii+SCbLjcs
EI4JYcaXuVM1Hw0OEn80M4RA6b3dr1+OhxE141Yk8+LG3MPZ56x1CzVnorSlo3LD
3/lfaZTY0pnrKskcIwZUsTlRF1sQQHdOqPqqKb1kFScXxuTH49YQie3vq50sMY6N
dmNXbuQ06BnZmy0eJiRHHXLyq61qYQ==
=FGF/
-----END PGP SIGNATURE-----

--xUXzECopG6TaH5wOM76FytFesP1twLoUD--
