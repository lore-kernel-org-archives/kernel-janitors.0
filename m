From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 25 Aug 2012 11:04:52 +0000
Subject: Re: [PATCH 7/14] drivers/mtd/maps/rbtx4939-flash.c: delete unneeded test
Message-Id: <1345892692.1815.1.camel@kyv>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-rstieTBhcE4zXoZVHmDP"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345365870-29831-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-8-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org


--=-rstieTBhcE4zXoZVHmDP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-19 at 10:44 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Err has only been initialized to 0 at this, so it is not possible that th=
is
> test can be true.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to l2-mt.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-rstieTBhcE4zXoZVHmDP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOLFUAAoJECmIfjd9wqK024IP/Ra7ygyqMPeCbTaRUUVTP7G2
mNMuCqahzZJaB1oGHt0aqHM53T715nyR7Tip4k0C/k4uOTQ3y5ClTrLyIhNTVoFJ
zanj7osxapaxO97GNwcb5NhJZOAxoCepEFG42h0U3MPDkQzQlNRVzN6Aj4b8v/I6
6nAlgAslwQZRyU2Zp95o4O4VvxmCTeRckSN+XyXvT/8+UnbTohvQkuAl9DIMSWGm
kU39EFGDSbMH7Yh3sUkRYLgbjHyHbCt70GL6cjKsrS5Py+NH0vOg3q0nBWitLD9t
PR+80D9NpRlcuEu9aBvHeuvV8sjgNz6qwiyqa+b4FuVFaUAm07ikaP/LyGmyki0u
p2/ORzwa2bMerbPfREu10Q+FpIV7sMCP0zn6HBgHeSHOgOZ2I2Xl0FYH4pQ1qnHK
9IUeeXqm18izmktnZC7xzigcXUsQ8f+UKxsqp9AmzPvuFNs+fp5i8PCycLMc4JE9
H6MO7UGbctDvh5Lu7AHVkV9cCegaHKdRRGsjMDYO8OeQ9PZrOOy8O4+yhrTy/nBn
MYJGkRIhgG7pInKfRHvLAYfTiIk1pYrulyNshIWRf1TD0v0clJHQIMq58xo/TZX5
AeV0Sff2nWDx+SFftgq/2AgTRx6loljGdCE6XwAVQiPB7FwcHEpslOXJ4z6cDNNF
XuJnMU9bMAw7oRPMmo2g
=xMxu
-----END PGP SIGNATURE-----

--=-rstieTBhcE4zXoZVHmDP--

