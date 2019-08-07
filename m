From: Doug Ledford <dledford@redhat.com>
Date: Wed, 07 Aug 2019 20:47:45 +0000
Subject: Re: [PATCH] IB/mlx5: Check the correct variable in error handling code
Message-Id: <a9cb1d33ec5c7d30e044c331d351a6495305f2e6.camel@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-QKp/f/v2t+6NumgNjUwF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190807123236.GA11452@mwanda>
In-Reply-To: <20190807123236.GA11452@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org


--=-QKp/f/v2t+6NumgNjUwF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-07 at 15:32 +0300, Dan Carpenter wrote:
> The code accidentally checks "event_sub" instead of "event_sub-
> >eventfd".
>=20
> Fixes: 759738537142 ("IB/mlx5: Enable subscription for device events
> over DEVX")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to for-rc.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-QKp/f/v2t+6NumgNjUwF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAl1LOPEACgkQuCajMw5X
L903jA/9E4n/DIgJE5MbY7snCWoJibwzvy+Kc3vC4t2MoS8lORuLU9+rRCX1RqEP
acQKazYsac4TKv/SG7MgDWYbd92qqiHLfuIgUzLbAxgzyEUeY09ET+EolCZTwPAH
d+vk1tAyKaBaJu0WLgZ5r8/XimPwVGBvxmmZRar1DcyGnK1WySXXjj9qb2US6aCU
YVTxVhQ22vB1aVZ66fOPq6It2GGaTdLChz0iChTgaP9AldSirzbvsrDt+QGTzzPa
BIJ0civiFRRky8Jt1OGjVprkMo4BNTY1BYxOjppdDlI4sowMhNpIuyIgmFWnv9sW
fqNaYiEhsEAfM1wRcv5apImpgNJmaLhnGqHHQRYS6l2ykB1n+JpTunqYYW0EtjBV
7Sni7E47fTjpPi19mTfRLfu80yE1+y/FjRnwPvKAEXg92gsZbUsy4bZf9lRHu5VJ
8mh4XA2Xmql3ReOn3i7Q3/Ke7nNpPGF0GxkDATaxQm8kLqxXVdqCJxghfp+N++As
mvWpmpsCymGpl1K5Kw0qMasKm2YLtoWiKoyYVyjTvB1bzyE2T+GtrgNoMtrciDUp
npE0e9Ser099L7ZGekeU6nGdLXZEPZUutl/GDm3/uDfYk+fitsNtEStimtyUCSkd
3fpiuZYWd0M8KKUFP9/4A8dcMB9QTnwwnWQUNPouDfxsuxzkl5I=
=lqiY
-----END PGP SIGNATURE-----

--=-QKp/f/v2t+6NumgNjUwF--
