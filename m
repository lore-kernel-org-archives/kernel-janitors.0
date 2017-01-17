From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Jan 2017 18:27:11 +0000
Subject: Re: [PATCH 04/17] spi: fsl: Use kmalloc_array() in of_fsl_spi_get_chipselects()
Message-Id: <20170117182711.l2xsej37mfubn5og@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dufszgkxeyt3hkkf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
 <2abbbc08-f5bf-28de-e513-5f1074996189@users.sourceforge.net>
In-Reply-To: <2abbbc08-f5bf-28de-e513-5f1074996189@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-spi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--dufszgkxeyt3hkkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 06:12:23PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 13 Jan 2017 13:37:25 +0100
>=20
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".

The previous patch changed a similar call site to use kcalloc() with a
similar explanation, the choice of function to translate to seems
entirely random since the changelogs don't address the zeroing that
kzalloc() and kcalloc() do but kmalloc() and kmalloc_array() don't.

--dufszgkxeyt3hkkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlh+Yf4ACgkQJNaLcl1U
h9DDOggAghIzczMhZtty31u3JR+Y5qrl/903L8JLeTboFPTqDlBXNXkR58XQwUUn
9UHWLeKfxIzNS8OtG9YC6rKptovgnQVw4Ubzqc4xaaYfzQMPPAMRVBECFF3sDy5R
4PZgvYnjtXUi2/hB5kh1IcHUU+ubN0BVk8uGMxpixc03B00W9cI2xJReav8rtA/M
QHFsZXfS19WnMAOuN3gc0culYhdrts/ZadOx9JdKhJ7Akau8q8M6Lnj2zpmIaBSh
mFMKoB388Wu8rRBZnOJkvi8jNID4D5PILom+iohgCLNOQSByjd9i+PutSsihvZHT
s2DOoyK1T04gHGFoffrZKkmLDZeJxw==
=Dd3y
-----END PGP SIGNATURE-----

--dufszgkxeyt3hkkf--
