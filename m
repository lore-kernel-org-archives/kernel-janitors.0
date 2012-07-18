From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Wed, 18 Jul 2012 13:07:28 +0000
Subject: Re: [Cocci] [PATCH] scripts/coccinelle/iterators/use_after_iter.cocci: list iterator variable
Message-Id: <1342616848.7530.23.camel@brekeke>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-iWCVwA4z65xfCXzlq9in"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341866451-24290-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341866451-24290-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <mmarek@suse.cz>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@diku.dk


--=-iWCVwA4z65xfCXzlq9in
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 22:40 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> If list_for_each_entry, etc complete a traversal of the list, the iterato=
r
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-iWCVwA4z65xfCXzlq9in
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBrUQAAoJECmIfjd9wqK0rDIQAL/c5EvRvD3F11Gx7YaD1PQD
Q7gGO3A2XNP69M0MWajTK6IdLBAvnEmyDAWFmx3op2ZgOz1AHLmH9Y8drALSFbxk
O26+2SHvZExB4+sxH+R3KDIoCt7mFothm8dcWWnrgLR/juY7togpGqYo/nQsr4gc
okhLbEhsKLRV0sSByZsK7HM5QNVwYAW4EpDNwYQyfYY7KgJZprmS8o0XCx4r6Zys
L/UWovihNKMZSgH6nCc/1n4ya5KuxdV20Ihh3udha6MrrNiYuievIW8pr/i1lrRk
LzFTs5dhf5NhlHYfikC3xLJbmo0Y8ov2LxtfTF94rAq0Eh201rDhQol7eA4WnsGv
XFXRk8bWs42EXgjRlCxL7j781Jm3A+H+Xu9WG2jBqCgToWE7I7rvg8R7F+Ze6ryJ
goTBaPxOsBBPYBDe943sFrlxr7oz+bNh/9pGUQ4JYEBqffQTl1/Ug8hw7IP+HTfp
Dr5wkCW5EgiKEDZdQ55/iFaEQ2WiXBR17jZwncjPvWA3qoM24RWWnloXWp97llpd
mcmbaxU+z+XH64qDfe7R1gDJVzGBgsXR4klgHuJRYkpUgZN9FegRtiiuAHkydKqV
j698+Pj4hHmPakaXFnpoGnFeFsMpmOIK3yT4cVv8OeN9TA4QntcPxY4IiwUFK7+p
NA8DhaHI2k5h8xmuvggP
=m5Sg
-----END PGP SIGNATURE-----

--=-iWCVwA4z65xfCXzlq9in--

