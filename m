From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 10 Dec 2012 13:28:58 +0000
Subject: Re: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
Message-Id: <1355146138.2657.29.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-DsWlkbLouT5zh4UFmN1Z"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129141651.GA12199@elgon.mountain>
In-Reply-To: <20121129141651.GA12199@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Dunn <mikedunn@newsguy.com>, David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>


--=-DsWlkbLouT5zh4UFmN1Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-29 at 17:16 +0300, Dan Carpenter wrote:
> If we set oobdelta to zero then we will either return -EINVAL or hit
> a divide (modulus) by zero on the next line when we check
> "(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-DsWlkbLouT5zh4UFmN1Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxeOaAAoJECmIfjd9wqK0uDQQAJGiCVB4ALc3pkFZEMi7hJE9
yE6Ebu56YU6SzMlPpReKyJbFF1YH24vd9BQDryV4Ms9xd+VBaGItw4G4UZ6JhrbA
z9dWf0GVGSEjyi8KLg/InoPhvOaz52O3SThyBWACDxAvkrt7asC0NeJUOEuk/y7h
udfu4QGHk5j4Luh3uqtyWgD9b4cgQO7eu+y5Mlxvr3zZnmocYrU8KLAeP9fexfHQ
JwlVPzEgXWOparxjdyofiK4uQStaJYeD83wkSpIXjhFzf/jOsM7/dqTNMg7DmA/M
LJSQZXfctCw4FXNXnTx1tgBw8xzzMSSDXBHo8M8Cn/Pyejkd0MDwVjJHcEBHF+w1
Bdz7b08CM2Dat2VkOInSOpIyMapzYxCHtQPrhVU0PtK24e2nDO3s2hl3gh8RI8XK
bDSbREyf+xU6Lt7qu4NR2l+nJZICHtsj2/WVmAw9ZolW+PjAPG8XWnNxu1ffM419
HcBa4fLVZBSiwWcf1pXtobIdiaMB985dW1AhycO0IGde3FzncW+5kaVlcICWt/VX
jrgHE4UEW5PtzqOBZp1JyPLDXZQhdiFyQoscv/JaGKg+y1akcYQy1DAfrJwEpmrk
3MxWl/gTontdA+eFJJxQfSL8FQjqi0Lt/YS8itOYBHETkEUnrBGFKf/094kYpwW7
gtPuF01mNdE1YEEBbfnY
=BM0c
-----END PGP SIGNATURE-----

--=-DsWlkbLouT5zh4UFmN1Z--

