From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 29 Jan 2012 14:29:57 +0000
Subject: Re: [patch] exofs: fix endian conversion in exofs_sync_fs()
Message-Id: <20120129142957.GF3356@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PK5kSfjks5jzTD3m"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121144311.GA19025@elgon.mountain>
In-Reply-To: <20111121144311.GA19025@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--PK5kSfjks5jzTD3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2012 at 05:25:33PM +0300, Dan Carpenter wrote:
> On Mon, Nov 21, 2011 at 04:57:23PM -0800, Boaz Harrosh wrote:
> > On 11/21/2011 06:43 AM, Dan Carpenter wrote:
> > > fscb->s_numfiles is an __le64 field so we need to use cpu_to_le64()
> > > to get a little endian 64 bit on big endian systems.
> > >=20
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > This is a static checker fix.  Untested.
> > >=20
> >=20
> > Will apply. s_numfiles is never used but should be loaded
> > correctly regardless.
> >=20
>=20
> This is still the same in linux-next.

Also Sparse warns about the following potential stack overflows.
The kernel has an 8k stack and the upper limit on these array sizes
are not capped.

fs/exofs/super.c:562:51: error: bad constant expression
fs/exofs/super.c:563:38: error: bad constant expression

regards,
dan carpenter

--PK5kSfjks5jzTD3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJVfkAAoJEOnZkXI/YHqRKJMP/j0hvFNfoQH3t2SBq6kWYtD8
nNjD9pJU3xd4XjUNQXwDlDj2qZpb5XC8H4Zd/NSOsT2JdeEGSOdWnU3cH7LPepx7
oGwOZB4SB8nvP5ev67lYH/VMbM4RcLsDtPbGFzmp6u7K8rkxhaEd1+jsBuzicSxL
Abayz6CY+fJ6diFHr85JINTVmpQ+Mt59L39cW1hBLITWVNWHCrRZpq1/j8Ih1jWZ
d7i5CfFj4zMXpd4IHMexeXwp8wjRJeEkWRzHZEzkZUHwFKerg5g2qBN7e/MenxtY
u6HcWG0MuSWTdS7eswJDCvTniOuz4lOHaGErFEwXKfXcMUopKHbOFt2OJe2cmrHV
U1NJ1i3dDdqjHtXilNv+NitdjmH+lTNJ8gNJ6hFRMHHJMh2S7WNWcGkhC5E1ehDD
w5KrfOM/QAtQcvoQcncb/NbPdgV7n+h1lRQpHQ8BKsPZDtjzilL2YUqhvWUqRDYv
+talNAPH1TKflV4p/0j9OsDpcKJoCp6+BuwEzQsoP+xF80IhbDmbJHn8euNeLF2t
OQ+/vxunQf1IhvfbaHK+VLyTLxv2YlcDhHd0/zVOEDe6BBiFRVkGhld/FOANVrJX
H2GCVTHnwPeBYCMEwnqzc+byjTBcL7lwApOJobiZILpgSYrbvhQwP33WLSn+Sr7I
N+BpFZVZuFcaNBgIXbkL
=58FN
-----END PGP SIGNATURE-----

--PK5kSfjks5jzTD3m--
