From: Doug Ledford <dledford@redhat.com>
Date: Wed, 31 Jul 2019 15:54:54 +0000
Subject: Re: [PATCH][next] RDMA/core: fix spelling mistake "Nelink" -> "Netlink"
Message-Id: <ccc04779d78c8856f3dd3ef57299a59df5686bc3.camel@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-TiHXGszeHh0v77g7ujL8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731080144.18327-1-colin.king@canonical.com>
         <20190731082837.GO4878@mtr-leonro.mtl.com>
In-Reply-To: <20190731082837.GO4878@mtr-leonro.mtl.com>
To: Leon Romanovsky <leon@kernel.org>, Colin King <colin.king@canonical.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--=-TiHXGszeHh0v77g7ujL8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-31 at 11:28 +0300, Leon Romanovsky wrote:
> On Wed, Jul 31, 2019 at 09:01:44AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > There is a spelling mistake in a warning message, fix it.
> >=20
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/infiniband/core/netlink.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20
> Thanks,
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

Thanks, applied to for-next.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-TiHXGszeHh0v77g7ujL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAl1Buc4ACgkQuCajMw5X
L93xDg/+L2blb3qy7x0h7UHlovEAcdgNtq8TTtGnS51i2gGaE0uLdfLC6JI7ohJJ
SdeGHdxhrSRSeS0SbT1Q865JcmWlpt0fUpC109bAS78fhtsH/7ySJ1cKrZpCdCi3
M/U7cGXKnZcdSqwBKYBpDzMQZzugOl5Q2tvRYeFv+8wuTFp7WReexDaZWeA0hEH9
eOzsCHp4kR4/x4hIZw/feI4oAuI0MZtYawIqrR75Zj0JzXwWz1OpHMx0qJe58+cB
N2lysGUmzgnID3iJXDKDmx1tWP4+d2WYFJ1Keeo9DhgcaCGBjuMmfW07LL0e2zou
zuId8Xe5GwdOLpAIESPB7D+lANfVZpsJSDx+ge1x6gzQollIjA0bBnjds+28Z43G
SEgbDmZSmhedEUiE/GnkJcQJxMKVE1bOD5RtcodqKmq1Vc4UCAK6oABE2peVzqSI
3im0kHf26dvknZXh77ews4U5qIRERxLPDycGb8EuRvAe7yiF3G61qCKeeiTreDXH
IIhjxPeCOhgpHh2WYSIyWZceWuZNnIx7e0UL9qvoYX+MnssfJdT7PoVgIZPRSxaX
ifjk/AD79B1K6RpqdsrnyzGhmM6GCllsSPpR1kVlBn/pNqC8FIe3Jt5o0W86hh1U
306tkS3oABmJyTLiW1TcrNMuAiJj5nFLeWxAzE28A1Mf6+HfBcQ=
=inNQ
-----END PGP SIGNATURE-----

--=-TiHXGszeHh0v77g7ujL8--
