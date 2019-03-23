From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 23 Mar 2019 09:59:05 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <20190323095905.GB24127@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="eAbsdosE1cNLO4uF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-03-23 17:55:59, YueHaibing wrote:
> +cc Daniel Mack
>=20
> On 2019/3/23 17:29, Pavel Machek wrote:
> > On Sat 2019-03-23 02:45:23, YueHaibing wrote:
> >> Fixes gcc '-Wunused-but-set-variable' warning:
> >>
> >> drivers/leds/leds-lt3593.c: In function 'lt3593_led_probe':
> >> drivers/leds/leds-lt3593.c:69:19: warning:
> >>  variable 'flags' set but not used [-Wunused-but-set-variable]
> >>
> >> It's never used since inroduction in
> >> commit 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")
> >>
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >=20
> > Does the driver work for you? I mean... take a look at the code, those
> > flags seem to be needed.
> >=20
> > You probably want to cc original author of the commit.
>=20
> ok.

Does the driver work for you? I mean... take a look at the code, those
flags seem to be needed.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyWA2kACgkQMOfwapXb+vLU5ACeIrHrHJWV8gAYBUfY63NvbfM8
3akAoMOF1lGAWitigzH6zKtYmJpvyXBg
=m2ze
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
