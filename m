From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Feb 2012 20:29:24 +0000
Subject: Re: [patch] ocfs2: cleanup error handling in o2hb_alloc_hb_set()
Message-Id: <20120213202923.GL4141@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Pz0BBB9QxoYXlT+x"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120213135047.GA10683@elgon.mountain>
	<20120213200408.GA22314@dhcp-172-17-9-228.mtv.corp.google.com>
In-Reply-To: <20120213200408.GA22314@dhcp-172-17-9-228.mtv.corp.google.com>
To: ocfs2-devel@oss.oracle.com


--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 12:04:09PM -0800, Joel Becker wrote:
> On Mon, Feb 13, 2012 at 04:50:47PM +0300, Dan Carpenter wrote:
> > If "ret" is NULL, then "hs" is also NULL, so there is no need to free
> > it.  config_group_init_type_name() can't fail if the name ("heartbeat"
> > in this case) is less than CONFIGFS_ITEM_NAME_LEN (20) characters long
> > so we can just remove this error handling code.
>=20
> 	Is there a problem we're fixing here?  We can make all sorts of
> arguments about single-exit functions vs immediate returns, but if there
> isn't a problem, I'm not sure what we gain by code churn.

It's a static checker thing.  It's either an unneeded NULL check or
a check on the wrong variable depending on how you look at it.
Recently, I've been sending a lot of patches to remove unneeded NULL
checks for static checkers.  I try to fix the mistakes that are
harmless so that the real bugs aren't drowned out in noise.

regards,
dan carpenter


--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPOXKjAAoJEOnZkXI/YHqR6ggP/233zcrGnsSE3qK847HSUvlT
6o1XvWRjiljkqzBb97r6/JIyztBFySP8c/ZvqCXoQa6mW1owQ8v5hmuD0XDPE3BE
I7J2jEHC2n/q2EpQE39mbGFrIIPzZCb8naGz764Pkb7mYdrC6LJ4o4+XwYHBvHyQ
7YhhXvODEQttN3nafewQPvp/OY3zRfzVLpSSPeuU/VrYJfiGaTmcF23a+mG+ELHD
s7jzRLPh4zINHxlToNlQqWRtjP9F22jT1UbKmun3rynVkOzYCWkf8S09PuxlEN4G
HUH/+cWJgTIvlT9TdSN2LYrI2FsVIRVsF7T3Af3JNf2uAEFbApB2q2Gf47wjlW/b
9Cuua25gjoHcQPXZoduJpgm7rsk80JSAB/vo98WZS4lId6nDQWTGXF9gy8uNl9xr
sEpKXxQFQxRTIKrNd0lvIPf12/6rYSpHwaeTEwSzCSqnQyyS2CA1vmZIiCoFCPge
BKZBxdn47N1QRd30LO3wKW8yP7h5kbPpzwV1AHAdJP6VA/6xDnC6g5ToNRk2P2Ud
Bw/p8l0uhLeekZFqe2wHd/8eRj6GQsLcnGRCEH71iH4w3ouwflo1q2BkijV15bia
YdBKH46TYEco7hGs4lWuiDXwGJQV8iEi7yeE0JR0lhV0UUEymB5XT/Ztit537Cmz
Z3UAlmFvjs4Gwvlugz5D
=HmyI
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
