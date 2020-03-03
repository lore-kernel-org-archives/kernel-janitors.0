From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Mar 2020 12:33:21 +0000
Subject: Re: [PATCH][next] ASoc: amd: use correct format specifier for a long int
Message-Id: <20200303123321.GC3866@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="JgQwtEuHJzHdouWu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303103903.9259-1-colin.king@canonical.com>
In-Reply-To: <20200303103903.9259-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 10:39:03AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the format specifier %d is being used for a long int. Fix
> the by using %ld instead.

Someone already sent a fix for this.

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eTpEACgkQJNaLcl1U
h9AKuQf/U01aci745PIHD/iQ86xIE2c0Ph5wIDFYgVS45kaTlPwBGX6iX72t/5tT
/BesrakIoU6wHxO5wNQst+QuxCauSfQTqwuqtA4k4P/sizM7M5NPcoxeM/uECmGf
Z91qqtfZq492X6yWceLwhCt9SA+5xzJ1bKdeETaOGaiJ594qhD/4+22WjhuibSF5
FHcllXvFPVKZCVGB0QOAVtUpBK0NQfRBsjshPlNLwMsop+dXJSfI3YhrhiIq5+sS
41UM1RDsJu3jGE6Lld3dBl5BgUdxR5yxudSuCqPtliEYnKyINev6qqWrrGoiwZ4B
SbuwgxiOqB11TS0lW97afaTVtdAETQ==
=tEk3
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
