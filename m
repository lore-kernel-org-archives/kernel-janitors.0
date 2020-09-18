From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Sep 2020 13:14:34 +0000
Subject: Re: [PATCH][next] regmap: fix return of unintialized value in variable ret
Message-Id: <20200918131434.GG5703@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+sHJum3is6Tsg7/J"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918131158.24083-1-colin.king@canonical.com>
In-Reply-To: <20200918131158.24083-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 02:11:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> A recent commit removed the intialization of ret and now the !config
> error return path returns a bogus uninitialized value in ret. Fix
> this by explicitly setting ret to -EINVAL for this error exit path.

I already applied a patch for this.

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9ksrkACgkQJNaLcl1U
h9BZggf/X73CVmpulLjsNipt985pXNKkibPt9bWqQsWTiwbhU9j06StCCD1axGQR
fZdX2Lk+kb9aVd7BSc7V4Ri5GRAJoi4y/mbypUEQszMuvq63LpLPvjzhbMc36md1
5aDhaPEQbtQTVpmTPkdtZO0nFnZfrUSQCRk03F+oHVM1iXt3Ua6ftOnWgjzVtlOA
jCYhkmeLBmD9PdWlfK/H90VHaKDyw2h/d8sCsSFOtWAkUwtLHxU0sqJLh6qVGFLB
TP7IUipcCOpGxQw3gxFOptLogC8L4G+xHeUulrnT0fxjDxNHVvMRjevc3ZiW4o4w
7xgoGuso1q5asbs3KKBz940WN6E5ig==
=ng5Z
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
