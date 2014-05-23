From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 23 May 2014 10:46:48 +0000
Subject: Re: [patch] sched: signedness bug in yield_to()
Message-Id: <20140523104648.GC30445@twins.programming.kicks-ass.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3tBQ62Qve5jUyRDo"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140523102042.GA7267@mwanda>
In-Reply-To: <20140523102042.GA7267@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--3tBQ62Qve5jUyRDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2014 at 01:20:42PM +0300, Dan Carpenter wrote:
> yield_to() is supposed to return -ESRCH if there is no task to
> yield to, but because the type is bool that is the same as returning
> true.
>=20
> The only place I see which cares is kvm_vcpu_on_spin().
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!

--3tBQ62Qve5jUyRDo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJTfycYAAoJEHZH4aRLwOS6zRoP/3qj10vYVhd6BCBcxmxgG60z
ILeADetiXfLbT+EjTEk+2wDw51tE8e48rJJaWI57XRDcQpG+L1UDuIKr/6pskGOx
XYM4ioDtYa2RNve2fdFvawekzg69kxrhX9jboCwF8cUARPcltcQFhTqzCuCjlKvS
2UlU1IWSf+l3bDDseUBUCYkqkxxUVk0fv4QoQyPiTOoZFCTkuEgp1B1rFwlONb3O
zMBGkoIt+wN9UmiE15fq3/OEWQFkaLYmaQKcSObSBSTSsTXH+1l1AuKy5QIKV3gr
0NGzw/quJB/PUb2v3QmE2+unZPvD+u1fx/rjcRvmVV9rc+o86fUrn6zeT924HFUY
4y9ep1VcQsR75WQcVABOaUhx/T1/yOCwVRnh5h/lUjkkSvV06mA6ujA02c+06cbG
yAnc00pUo8P3newSm+yo6kKIAkBrzKT6uPAc1nHes8OeccJUShQUkj9RszmwX5s+
0S3PHVQo9DDNEmiUhrz2XTY8Nf+eEHf/5FB5htBUlxC2w6WvEI2lMyxnq4Tm3vO9
LD3Uhn4A/0NprLAp89DDqwe+s6+qp8EThCN7lUtvzMEGDyIIjGsGXucg/9M2+tR7
iD55umd19usfUryAGlVVMmuPzLH9RU5fK+1KU4oKOhmTFKn1WuK9WqJD/bVr8Es+
SQz8aMx6O4Y2arQy49a9
=dxlD
-----END PGP SIGNATURE-----

--3tBQ62Qve5jUyRDo--
