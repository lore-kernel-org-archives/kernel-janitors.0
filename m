From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Aug 2013 18:09:55 +0000
Subject: Re: [patch] regulator: 88pm800: forever loop in pm800_regulator_probe()
Message-Id: <20130814180955.GF2401@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Z0mFw3+mXTC5ycVe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814161403.GA13601@elgon.mountain>
In-Reply-To: <20130814161403.GA13601@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2013 at 07:14:03PM +0300, Dan Carpenter wrote:
> This is supposed to be testing "i < ARRAY_SIZE()" instead of just
> "ARRAY_SIZE()".

Applied, thanks.

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC8fvAAoJELSic+t+oim91EkP/RVbXWi7Hj1wdZaM13BsouKB
MLpRc3Ax9Vow5RWtqU4esKVWkJrKOO6WOEPuAFi/6XlfGqD4vttIyZeaf1q59S7f
/w6ZmsIMYR1JSqK49ulHJ1bZ35//gF+cx8/d3sERxih4AmpXJwnpQKQUVP1Zvyyp
PJAb3UESuRwfDRn6cF9w3XwDiET5alylwHsVqBg/XnkM5t1KrMLMIP1fx7En9xUa
iM7KEdsi9yjyufCRqUUVuBgLH2GHm4Sao3KIgxVjU3L7DrE99q8lNlrRW9VNFePP
BgAoExk2EgqUFimUAu7nPBu0VC80FPXz+kzc/EDaE3jbW1oxmrk+D4038zgPCEZw
iNGdDNSZJaYkGDCYCE46pe5gdE4RwruZzp1PZCoXUer5Q2sUCnG/FN5b82J/RQNm
LePTD1/qNGcPcgRJkNmrVn/j7L68mpYAGUjQWIeXCP4dybrnOvcIBn2/nTtTyrG5
WZn5spY2bgh0UppBJ90X/yM6X9eL85fLv7as18Sgy1taTqItMDxSwdnYeCyJZ47j
Ke5bAM00ajhXYL+r1/03EuVtsPGW4cMan9IIsZOfLaSznhUb9ax81B6aBOq2LTlq
hxTuPEoJ6HfaHFOKwn718KAse3/1lHiz5ZNYXdmeR6oyhzYKEetXKv7hEH6Z/1D4
S/SUg66JJyV0wkjr35qx
=FfpP
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
