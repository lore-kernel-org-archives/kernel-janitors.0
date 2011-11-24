From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 09:31:20 +0000
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
Message-Id: <20111124093119.GH3258@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bpVaumkpfGNUagdU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124072117.GC14122@elgon.mountain> <4ECE083D.4030707@bfs.de>
In-Reply-To: <4ECE083D.4030707@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 10:02:53AM +0100, walter harms wrote:
> 	the code nicely shows that docg3_floors[floor] will be foobar if mtd=3D=
=3DNULL and floor > 0
> 	I guess that can cause problems with the "doc_release_device(docg3_floor=
s[floor]);"
> =09
> 	perhaps a "docg3_floors[floor] =3D NULL;" can help here ?
>=20

It's allocated with kzalloc() so it already is.

regards,
dan carpenter

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOzg7nAAoJEOnZkXI/YHqRhxEQAKM0rCjCY4nS93Y+ah4mrIiN
30P/6mJP/b9yiO/QrdNhHCdTVTCPRvWp0BF+aucNncljDwSDd4S6snbflKNVz62A
1tdaGlGRIg7OxRwMotuzU+xJwGkD5x4zYHJnZhWZ5CudJDrt3cp0y1gZNKZmZRZB
FSHySrr8/r0CYNCDG/QliRpBuo8CPKUbHJTGIGhRalb5h95DYBnH6Ir07t//1JSL
KIGZGaUTITNTn/uzp7NcCtQxomR3b0Lm8Nzco8NNyG9NmXp1Fn9QcLU9Q6MDwI6u
jg0lcg9iRVJ3tk8eykubohBudlykGSquB15Sk20bY1oHb8QNsO9q1kwY+pAVuHkm
mHAdBt9WEf2NAR0t/GMsx51FtanmvDCQi+LgpLA8zF4/Qk4E/D+KQGfarUYGRuIp
5vF/iYCvl4xBRXWdAoW242slYbrbVloBHR8YcPCxY3ObtyKBvrxrUoJNR/OpmYo+
WIyanyFNmJbL+qws1tln/Owben3rJpjlwa8R70mInLkyxgd+ZCcNY6GKp9nzkN+C
6rIgqxrEuZeNj4KF1pZb7mofgHtjAyhvFO9jWJwTbJNXPrfxhxVIOoASrXw2Mfbb
DaPJJykgH5CjN5MfNPosZkbNpqXrDR6XPov+AR5sDp/89oXFX2RUubnLDlPZ5PKl
Ph2SZKmVwXO4MDjLQbMb
=Pjt3
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--
