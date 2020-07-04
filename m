From: Wolfram Sang <wsa@kernel.org>
Date: Sat, 04 Jul 2020 06:32:17 +0000
Subject: Re: [PATCH] i2c: jz4780: remove redundant assignment to variable i
Message-Id: <20200704063217.GG1041@kunai>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="w/VI3ydZO+RcZ3Ux"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610125901.1134204-1-colin.king@canonical.com>
In-Reply-To: <20200610125901.1134204-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 01:59:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable i is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

What about 'ret'? Doesn't the same reasoning apply for it?


--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AInEACgkQFA3kzBSg
Kbb+Bw/8DjdHpZF7hd2HqBySqH1zWA9Pq7rs0E0odz5AgngsAIREXgm9jq3NpF8q
tN5W0f8rRuaBOyslXuR/v3FKU9ISAwGroDputlZW/O3yS4yYs6GPHxgiXqetKCq3
sCB3my5jdtugp0pndjFn36UbzFxKANCxq3I15ZhQ2S3MVXbaKo6DzmBSiodihJY5
QqG1RaKkLZoLCVlgO80CU6wCaoUOXkXlx4kurNuVSe8/3XhrbmHBylT9w8fMsxFq
uWljyt1kLMhUlkBBcA9PQmGhwh31fCzWPBsP2T8Ti8oYm82oSqxlC69MLXZYYeEf
3mIN+HjsVS1t4d2yW4li3UgMj7bBSFc1j1taOYFSxbGkxbGqMkcf6P7FnvNoIVum
czPIXeA4JkYTsn3XZGM53l/sy+eSUr4/LF01DEqksHBcvTMBGAULlOLTuXWTGE97
GEnM8aZ5fRqRa3ozV5BGbqDOhoMBvOgVoZR4jAhPVG2F8dat4UfRvu/e7V1dVS5P
1vs5L/VNDIura6ZHofk5AMKZU2rDl5NQLkSeHlo7b2fhZaRBTn9329mIPm7rOixA
jEw75Mu926qVeRnWhGRC0m4ADwSqZdsz3DGiR3WPZHY3G5JGQmqFNusfwhhJfOWj
C+dDbTmVTKNSlAV9nhFuEOpW/GtyZ3PzQeFo0C5krvzglLUWpgs=
=ZgOV
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
