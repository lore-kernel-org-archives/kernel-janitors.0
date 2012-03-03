From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 Mar 2012 08:04:49 +0000
Subject: Re: [patch] block, sx8: fix pointer math issue getting fw version
Message-Id: <20120303080449.GK22598@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wIc/V6YLA2QdyfT4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302190042.GB3951@elgon.mountain>
 <4F51C103.507@kernel.dk>
 <4F51C18C.5080903@kernel.dk>
In-Reply-To: <4F51C18C.5080903@kernel.dk>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Garzik <jgarzik@pobox.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 03, 2012 at 08:00:28AM +0100, Jens Axboe wrote:
> On 2012-03-03 07:58, Jens Axboe wrote:
> > On 2012-03-02 20:00, Dan Carpenter wrote:
> >> "mem" is type u8.  We need parenthesis here or it screws up the pointer
> >> math probably leading to an oops.
> >=20
> > Applied, thanks Dan. I have marked it stable, too.
>=20
> Hmm wait Dan, seems to me that u8 pointer math should be equiv to char *
> pointer math and hence it'd work just fine. Are you sure this is a bug?

It's the cast on the line before is what breaks it.  We need the
parentheses so we add first then cast the result.

regards,
dan carpenter


--wIc/V6YLA2QdyfT4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPUdChAAoJEOnZkXI/YHqROGAP/RawaZtVRHdRTGrnJmNPRr9m
+r/JdjPDJQBUC/azTE4QXBvW4rmlIwkPLaAnuh+FS6vyp2kc+plvZFYAMdTjth3n
8uFY+FR7qIDcpxfKSBQYZxMuepmGoPCUgFPTKaLKaed2G5aXi8UXwXhoS2CSnqag
x09+NSSAqndgRoEPKRK/+0LmtiDAkbPTHgTpkZ/OmdpGnaHIIuThLudDCuL1B9Dz
8QhTUrmKAjDhbRSjvupsZqjLqXj7+QI87f/fpbCVtgvo61juPLDQXVjzQMDopXjD
HUAmh2dkuEhKmBYSBFGtmgAMobBLE5UrNE4igqMVH3tUNiUIencEJylsz6NnFKwy
/cd0batD6AoqbrOOcY2IAbPwvKumB7rzSsiIcH8VqBB+LYqgbp4/IUup3H/r0AVJ
Td/ghGOS8EHpxh4TVZARHk0Ko2UMxkfK77Htf7D15rBfJlFbLK5YdMjJZFiKFfrZ
iXEsK6ob4a4hh4M/1LFlsH1DfERtIrqKMyNtI7HWrf2ECB2bOm4yVDW8MvvpnYn7
ZAIS7Vu11dTWkC79eqT2fzk95yv6AsntpfrXGVrLeBXcdMQgUNjXiK+Pkt9ZO6tX
BDjmSaeDiGqfWas0741l2837yoD/TVYXXaaaE6GBR5pPWge3vQo8PAAhGZoUWrrk
fSPobaOwdy27UC8YzUT4
=DjZU
-----END PGP SIGNATURE-----

--wIc/V6YLA2QdyfT4--
