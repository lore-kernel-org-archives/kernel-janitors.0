From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Jan 2017 18:21:00 +0000
Subject: Re: [PATCH 02/17] spi: Adjust checks for null pointers in two functions
Message-Id: <20170117182100.nysd3ghalaie5uyb@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7congqv7gvs42ik2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
 <1e19b52a-119a-d52c-3a54-0a533ac5b6db@users.sourceforge.net>
In-Reply-To: <1e19b52a-119a-d52c-3a54-0a533ac5b6db@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-spi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--7congqv7gvs42ik2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 06:09:52PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 13 Jan 2017 13:23:32 +0100
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit

Something's messed up with your setup for sending out patches here...
can you check please?

> The script "checkpatch.pl" pointed information out like the following.
>=20
> Comparison to NULL could be written !=E2=80=A6
>=20
> Thus fix the affected source code places.

This isn't a fix, it's a stylistic choice.

--7congqv7gvs42ik2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlh+YIsACgkQJNaLcl1U
h9A1CAgAgFGeH1ZWw+oKejDpU3NfQbIss0JaA8bwxr5SgFjBIVXvFRnUOjGH+ZkY
Izx53F97ZPysS5YycPWmYI7mM7QV6js+dKZc5T8nY4s+O+iF9T1rrlZBrzJn2b9m
pQpI5DAkzeps/UElISEJFG83IXzCXSKf3EyMpHjf+vskg+YwkhyQ8Rjl4MAcy64H
FknrQ4F/PHZk5nLpal75ZGksbgBJCVHw1Y+bEFIOL4BGesukJCNZ47A0y3BDp7Lm
9h2UM3SdRmiXX5HkTKEJzbUd1MIffl1qYk+4XyGnIjEQc5HTHTNBLelQWiRyrGcj
mnfVrCHFaQujC8PNWVGuocxUl3bjWw==
=7Cpk
-----END PGP SIGNATURE-----

--7congqv7gvs42ik2--
