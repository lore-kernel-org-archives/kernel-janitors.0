From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 29 Jan 2012 14:25:33 +0000
Subject: Re: [patch] exofs: fix endian conversion in exofs_sync_fs()
Message-Id: <20120129142533.GE3356@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IRIOLc8eTv1AOxGv"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121144311.GA19025@elgon.mountain>
In-Reply-To: <20111121144311.GA19025@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--IRIOLc8eTv1AOxGv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 04:57:23PM -0800, Boaz Harrosh wrote:
> On 11/21/2011 06:43 AM, Dan Carpenter wrote:
> > fscb->s_numfiles is an __le64 field so we need to use cpu_to_le64()
> > to get a little endian 64 bit on big endian systems.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > This is a static checker fix.  Untested.
> >=20
>=20
> Will apply. s_numfiles is never used but should be loaded
> correctly regardless.
>=20

This is still the same in linux-next.

regards,
dan carpenter

--IRIOLc8eTv1AOxGv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJVbcAAoJEOnZkXI/YHqRgUgQAJUWsMoz3KXwfDZATkGCKiCn
AtiBme94mjgWCX6WztEoBp2A4pyjWuustwBArTdayr99W5JS5Yz2qk8VjHLy9KIP
eiAQzZPiSjsIgMRWx4sEzkvWFKAYz6pAUoOAL+4SgvfHNtJtBbGP+9xvEI9eVTxk
vZSryLw4tI4dTLnjolPWZd/A+Q0qX9P04mCT7ilKPy/4YMLUPjw0sZ1er1cEh1Lj
W6Bv8F+afz1s/PMTfel3z03NT11dsOAJC87rUeCYuXhhREXA1O8FHJJSMBRG9rqj
O1xJo4rdB3iKNFls7WCXOImmuenxuZjifALThoJNo06crnz0EEGVu7s6j9bUmWpD
eGDGCUkL/j0o/xE8oShwiE0EBGfUWxYy5RGmtO/q1hlcO72gRwsWPByi+6DnbclE
RzIvuhxaSt0ot7dAYKQK6KkVK1EsOV/vLHZbKDaq+U+K3x794CiTsUyh7rG37SxT
tdp/kkWnhfEQi5Z7yUoXshLa7P2Rh8CvQhy+XsEfRWx913cs7lH/68X15xtrgwBD
Pcmw0aRDzi2EjjZMrUTFdGqhGwAEID3tyysvH4VDVPA5D4InjIKOmBw+z9DA6T8r
ZnDLKMaQgCOuhZbxlvUdlC9UJTIGYklb9uVg0TcGHrSyo72ub62N8aV3+TNhC/+P
La5rThTSP6Mhy70tdz8B
=tSNj
-----END PGP SIGNATURE-----

--IRIOLc8eTv1AOxGv--
