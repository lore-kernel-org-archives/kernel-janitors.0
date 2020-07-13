From: Benjamin Poirier <benjamin.poirier@gmail.com>
Date: Mon, 13 Jul 2020 06:48:35 +0000
Subject: Re: [PATCH] staging: qlge: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200713064835.GA11354@f3>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711124633.GA16459@blackclown> <20200713045959.GA7563@f3>
 <20200713054424.GD12262@blackclown>
In-Reply-To: <20200713054424.GD12262@blackclown>
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-07-13 11:14 +0530, Suraj Upadhyay wrote:
> On Mon, Jul 13, 2020 at 01:59:59PM +0900, Benjamin Poirier wrote:
> > On 2020-07-11 18:16 +0530, Suraj Upadhyay wrote:
> > > The legacy API wrappers in include/linux/pci-dma-compat.h
> > > should go away as it creates unnecessary midlayering
> > > for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
> > > APIs directly.
> > >=20
> > > The patch has been generated with the coccinelle script below
> > > and compile-tested.
> > >=20
> > [...]
> > >=20
> > > @@ expression E1, E2, E3, E4; @@
> > > - pci_dma_sync_single_for_device(E1, E2, E3, E4)
> > > + dma_sync_single_for_device(&E1->dev, E2, E3, (enum dma_data_directi=
on)E4)
> >=20
> > The qlge driver contains more usages of the deprecated pci_dma_* api
> > than what this diff addresses. In particular, there are some calls to
> > pci_dma_sync_single_for_cpu() which were not changed despite this
> > expression being in the semantic patch.
>=20
> Hii Ben,
>         I couldn't find any instances of pci_dma_sync_single_for_cpu in
> the drivers/staging/qlge/ driver, I ran a simple `git grep pci_dma_sync_s=
ingle_for_cpu/device`
> and got nothing.
> If I am wrong, please send the line number of the usages.

You're right, sorry. I was missing commit e955a071b9b3 ("staging: qlge:
replace deprecated apis pci_dma_*") in my tree.

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEkvpDtefvZykbqQVOaJBbS33YWS0FAl8MA8MACgkQaJBbS33Y
WS3Viw/9F4tUPBlh3yVIBpSQ1Ax5GZhlnpGL3XUpFA7Z1aBtZIU+1W9EbDXmZNOo
KO5Nbqr0CfNDPeKJRpB2K+YVriga9F7B299BVvnqKvEvv5NcxSGfVzpEWpyJL3RL
tmjpcquRyY6huKBbYVyfa3D0iUkrURoGmPm9QbpA1JNcKGs55qIyHbwqI+3nYrZt
DZYf5VruMkqQh7gqhW9koHjUyANhWAL4qCLSoQsZAC+HNsY7UsAWLU8sPqD18UaZ
yE1tSSqOyl4R52tGVzaH5WFMbT8xYhCZ7ZXc862LjoEcPoB4jPeHDdDxxq8w2VhS
Kt2O3b5HC8VFByaA32sHVRYpG1iFtMY8MEb6VM+N6qTUmZVNkVJkNTDYpEHSfJ/U
x+j0bunXKUUdnaS14vuzgpfG/L2XAFq9wezZUWvoVg8NWTabHOyeRlNPF1aVYeGr
eJsJ2wtGPNEVPcDpZMo9nSCZeSevun1/9OyFYEkXKO/OQ1vXORY54jik2rv4pPx6
vmYS413oRgOru8drLJR5jiRoZuGjk2RsiEVwdrqkj7pdf7FJ7fr6tYbnoHeWJPz4
h6Wa2prcQ16lPhndAtne+xjc77/O8zqDUmBLShf2ca/5+QgQPuJv6+kC0S9DIK/7
DcAik0SP5lG9iiOAuRxPgQUCYu+prWCBuRcR+2ITbnDd4s2A5cY=
=YM6/
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
