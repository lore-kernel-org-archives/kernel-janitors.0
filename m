From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 21 Apr 2020 08:35:25 +0000
Subject: Re: new TODO list item
Message-Id: <20200421082324.GA32008@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421081257.GA131897@infradead.org>
In-Reply-To: <20200421081257.GA131897@infradead.org>
To: kernel-janitors@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 10:12:57AM +0200, Christoph Hellwig wrote:
> Hi Janitors,
>=20
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
> mostly trivially scriptable, except for dma_alloc_coherent, where
> the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> with GFP_KERNEL when not calling from an atomic context.

Hii Christoph,
	This is my first time posting to kernel-janitors. I would be glad to
help with this task but suggest me if I should get started with
something else.

Regards,

Suraj Upadhyay

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl6erXMACgkQ+gRsbIfe
744/vxAAlTYTMLuKBQ2X2VkCz6zzzzXDkBpqaAZGmMDtykR/a70GX9qye6zhos62
n9rDwx4RhCtD/M5mGp+e5fsvUDN3Q4A3rVv2cUHtlg290yddbJH/L4n1MZz+bgJb
gRUfAN1eEqgUVUcNZehkBouYt8mOIwde7Hi+cRTMLfG7GLNyTjgQvU+dMYAHmv0J
MZSqU3S+P3Ps4c+OZdqVNoyCn9TBJMBESDNwWR9vTZnpuYCKs8vRei40l/pluoRI
XGct0+AKNc7SULpWFW/9W0Kck9zUbTkJdB9JEokAtjKXGX7RI/9v14RAbOW6lR3S
dtRe8qsQchlGYnNJKGeYotXe8qdmCPfY1AEa/PsQeMwDcxprlz/oAU3jTIKYgbAq
38ALk69Nesrg1RsVegFYg6yuKuxL3MWLK9zhLrnFVoEhtzGzjHpBqyf63GenPMRW
S85lxvPl3KJLFFBER0AmdGL0y9V7rcN4WaJVUwMYnvD++4qLS0MjdTnFYwatcqnL
VEa1SbwyXePr257WXc5uS/5oKLWpoSL4BKE8poDjH2pvi1D4RQkQ2215JREHobM3
fxXIbHgtbA+MLK6Y1srVGshcGeZvt+XD16q06c6WhsxASm5lryPeHY0f3PhBLKHP
sBOvgx71Xan8lmTro1s+CUM7GxMk+SRklU+nneMo+Lv4QcyQZms=
=oc5u
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
