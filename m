From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Jun 2018 14:45:49 +0000
Subject: Re: [PATCH -next] spi: spi-fsl-dspi: Fix a typo in dspi_probe()
Message-Id: <20180622144549.GC15386@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="V88s5gaDVPzZ0KCq"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1529632152-99368-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1529632152-99368-1-git-send-email-weiyongjun1@huawei.com>
To: kernel-janitors@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 01:49:12AM +0000, Wei Yongjun wrote:
> Fix a typo, use 'dspi->regmap_pushr' instead of 'dspi->regmap'.
>=20
> Fixes: 58ba07ec79e6 ("spi: spi-fsl-dspi: Add support for XSPI mode regist=
ers")

This doesn't apply against current code, please check and resend.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlstC50ACgkQJNaLcl1U
h9CONgf9EtjBE9yXU9SvIigkZXJgr67t4iIpru2lxX6e490QAEtTlV+AxEz4wMsB
TUqcgB9xRmWPFbqw97NXSXwSzfsGg3bGPzh0JWnI24FQV0fEG79cL1yda+0vdKxF
U1LLanb8AcFop0wBoAm4JhShCy2T2PUknYycYagB0iElBRr53G5+M6t82gFD9ctV
avaKzULhoTYI1Id5ZGsJtpCOk2+TM2hJXvHaVcm417bx5OZ6XFQzCPKIibyNSeng
EmQE2BEVPwWBWMa50MQGI4Tub0k4eHz3aLlGiq0kTpvhSorsN71y8PDzr7YE6GgX
dEqdg/+tJFB6bMEy8rFMhiw70nbIhw==
=5Qk8
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
