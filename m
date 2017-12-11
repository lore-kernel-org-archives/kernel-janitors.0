From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Dec 2017 12:02:43 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: nuc900: Fix platform_get_irq() error checking some more
Message-Id: <20171211120243.GC9854@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2/5bycvrmDh4d1IB"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209115203.pdtdfnmzwz6zpjqs@mwanda>
 <5A2BE644.3070009@gmail.com> <20171209172732.GF15660@piout.net>
 <20171210015200.gr4mxzqgzyvamxui@mwanda>
 <5A2C9E9A.7020501@gmail.com>
 <20171211084053.p5ke733i3kzzk5mz@mwanda>
 <a191218d-fe63-db5f-1993-2167a2077f70@gmail.com>
 <20171211102730.agtoczxiu4dcn5ra@mwanda>
 <20171211114950.GB32306@piout.net>
In-Reply-To: <20171211114950.GB32306@piout.net>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 11, 2017 at 12:49:50PM +0100, Alexandre Belloni wrote:

> Maybe the good thing to do is to actaully leave the nuc900 code alone
> instead of trying to change something that never failed and that doesn't
> seem to interest anyone anymore (else the platform would have been
> converted to DT).

Yes, this definitely seems like far more trouble than it's worth.

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlouc+MACgkQJNaLcl1U
h9AXRQf+ItIZrCiqkh/u+QDqBlNTL8imB5YhIa6jPboR1B9hewVY/T5Y/okGh3wa
4FOxq//x2NwkKa6RKtzMu+4Jy7Bo9671kRxri5+h7OW0Z85bSHvOkTsmiNcWPD5Q
QG9Y3hsFZhnA2JHW1YZDo33QPJBlOrxYtg+mPYBhv9elsWsS2h8KME/ieT/qCYRB
L9uFD8cN3X3x6B/c2YQAQnK6Bp5Q9HT13pgG62ZRdmidhoS1B9JS1J2kiuY6jiXy
eDOcALZrRr9nXww9+7/oR90DJ0dp3mZuRL2mw0APJbkgZG8+7q0JAmAtgwnFYIGk
pA98Xe5/ydyatXPulxtUnxQGVOrg/Q==
=nhKv
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
