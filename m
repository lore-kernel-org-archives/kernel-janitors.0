From: Mark Brown <broonie@kernel.org>
Date: Wed, 17 Apr 2019 16:38:36 +0000
Subject: Re: [PATCH -next] regulator: stm32-pwr: Make some symbols static
Message-Id: <20190417163836.GA1675@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190417023112.162916-1-weiyongjun1@huawei.com>
In-Reply-To: <20190417023112.162916-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Pascal PAILLET-LME <p.paillet@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 02:31:12AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warnings:
>=20
> drivers/regulator/stm32-pwr.c:35:5: warning:
>  symbol 'ready_mask_table' was not declared. Should it be static?
> drivers/regulator/stm32-pwr.c:47:5: warning:
>  symbol 'stm32_pwr_reg_is_ready' was not declared. Should it be static?
> drivers/regulator/stm32-pwr.c:57:5: warning:
>  symbol 'stm32_pwr_reg_is_enabled' was not declared. Should it be static?

Someone already sent a patch for this.

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly3VosACgkQJNaLcl1U
h9BTqgf/efTFfwbNwPOEnavpH8p2CUDIke5R4NB5EjkTYY54sng9TIrP1IpX8Yhy
ZJoFYdGz47bHsXupVE0UAHCFrX9KTPR02Lfh0+9qI1ry7WNUQ+kWkP1Z7PW5b7XJ
G2gy7ecZTbfWUAs2H4o2/qhZl5HYWCPKujb+Qyg+lRBLgOxACMATdkij99sujOz4
YnR3FwPKVNHUL8TwaBA78WAiXITVAZ7xycUumhMLG/5TvuXd8NqtNg1pd1aOaHPJ
RBVi/L1QnP6L1lNJCvzr4Xm7nmwSCd01vJbIQ5bllhKaxjOHd9ogd4A58tAXvpAQ
EY5uP6rktrhnM4Mbv/Me24ddT4lfpA==
=drWu
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
