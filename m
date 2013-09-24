From: Mark Brown <broonie@kernel.org>
Date: Tue, 24 Sep 2013 10:07:12 +0000
Subject: Re: [patch] spi: spi-topcliff-pch: fix a pci_iomap() check
Message-Id: <20130924100712.GQ21013@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sHj+bPVFXs3YLS9f"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130924075451.GA29141@elgon.mountain>
In-Reply-To: <20130924075451.GA29141@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--sHj+bPVFXs3YLS9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2013 at 10:54:51AM +0300, Dan Carpenter wrote:
> If pci_iomap() returns NULL, adding "PCH_ADDRESS_SIZE * plat_dev->id"
> can make it non-NULL which breaks the error handling.

Applied, thanks.

--sHj+bPVFXs3YLS9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQWRNAAoJELSic+t+oim9HPcP/A/wiTVXCBgE+vxYQZyw3W7T
iz9IwSRE1f2O7G5iaQeOoqX5bbHq2L6VxbSo/6L0DIQzsFuRMjYvg30JS/jL1J4P
CSWKGQLOm1s+xSa9n7jiiX1nnrBg81GUzbaO+X8PVr3zj40mYYMdDBrX1RdRr177
Wo0BneEEye1b8lb0SZiAHax+Fqq9MY1McO8IZpbPpp8pWNxtiEtlQVvcaxwFOf6b
h9dr2v1xXycPxDNG8985h2/5TS+WQFyJ6UBhv7fGk1d8g4cIWT4zLmICCK/1PIU2
31633dwyfUb7aRE7ORPdudKL+bn6iid5OBUZUi0xqLW2B7ALbvCfgTfu8ZVc2zv1
lNaiRxWMy/9RqueL2ZELASOMCaJ6ZkJsz0Qr9P0aqwcyrWdd8Stu/3lXOo5xLvRy
0TM3wmiW/WE301VIJ2oi02g/T8uZY6I9DzsgzywCWVuRppC4TJG3Q1t4Y1cZXSSE
gzeLYBNXbnSOD7UpizRZUUU+QVVAiaOcQRACT1LziOFYcGLaCqyaxAm47lqBif/N
w7y6XPf0GV0rtgE32St2tPSMvdpfJbTNWhE/F12kSp1neSFdYHtNhfo+NPhcPk6h
r1Hm2/Sul8WL5j+fm+Frlgj9z6aiRqBeUaWKUfXVfhRIlG8mfZM6tltT/Laqa2N8
eoIYlK+dCfGESRMU8g5W
=rMw1
-----END PGP SIGNATURE-----

--sHj+bPVFXs3YLS9f--
