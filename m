From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 May 2020 17:29:20 +0000
Subject: Re: [PATCH -next] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
Message-Id: <20200511172920.GJ8216@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MPkR1dXiUZqK+927"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507115550.139457-1-weiyongjun1@huawei.com>
 <158921769453.22432.2365518895564552869.b4-ty@kernel.org>
In-Reply-To: <158921769453.22432.2365518895564552869.b4-ty@kernel.org>
To: Sanjay R Mehta <sanju.mehta@amd.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, Hulk Robot <hulkci@huawei.com>


--MPkR1dXiUZqK+927
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 06:22:01PM +0100, Mark Brown wrote:
> On Thu, 7 May 2020 11:55:50 +0000, Wei Yongjun wrote:
> > The call to spi_master_put() in amd_spi_remove() is redundant and
> > may causes user after free since the master have been freed by
> > spi_unregister_master(), so remove it.
>=20
> Applied to
>=20
>    local tree spi/for-5.7

No it wasn't, sorry for the noise here.

--MPkR1dXiUZqK+927
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65i3AACgkQJNaLcl1U
h9BZhgf/To5Opp1U5IvZBJmxD4iQoXnz/vU/Skvv+eM07mxrZ43FOdR9dJ3BiKBU
uXJXHA8L6z9bjtK2HQIQfKzsZVIFmAKkhZ4Kx1TpCGAu/ZFOQMnUHKDbDuWSSW88
lgW1bM4c2iQ6nIjezmMbB5hr1Bh2OagO+uaCK89Hd0YrSpMsxPGK3YitN+KNkEG2
MmPBbwpsW9z3Zf2z4F/Tqov7E3UTkiLdjO3l4yCBEaBbGok+GwgCi602sPs55B3P
BC9OpIlI3ElAOvzWr9WGsdgrMK2csS8johbF2nebiJIKZ55NT+nE6PlhDnH85cKZ
iQigArp8qPSNYtppnK6Gb3vhEISfmg==
=lyAT
-----END PGP SIGNATURE-----

--MPkR1dXiUZqK+927--
