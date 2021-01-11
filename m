From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Jan 2021 16:35:51 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <20210111163551.GA33269@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
In-Reply-To: <20210108123546.19601-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 12:35:46PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently when attempting to start the BE fails because the
> FE is not started the error return variable ret is not initialized
> and garbage is returned.  Fix this by setting it to 0 so the

This doesn't apply against current code, please check and resend.

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8fmYACgkQJNaLcl1U
h9Buowf/Z7C140455AraBh0sDuBCFIG9HvDvb3RUm0/Xt5lR91JwaVxdYRlBbjJ0
dLSaYFh0GepPSHSAAn+AjVG5dN+26Lck2t/19LRscETOIZlqNwJ+YNY5f/FLJlau
Fe7Z6qDaPUL/WgeDGaY1gqAsJpdVdfGP1ojKEXeqsKjyZnB35D7Ftt9Ouw/v5MPV
V4z2ody8iK6SwNe/kIRIZndr8c2DOz3nodv0nBBuEn+18jdL1twh3CqqiL0eirCa
nC9dqQWuy12SdRHWWv6w1M/lfWqVdZKhVO5/d/2jS2nGOr2bphnJ5/3Hy9ecbF5o
TKGZIfArkmvxX+IAXxXeyPP85xKDBg==
=RuRu
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
