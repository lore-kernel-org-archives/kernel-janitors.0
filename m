From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 19 May 2020 09:19:07 +0000
Subject: Re: [PATCH -next] iommu/sun50i: Fix return value check in sun50i_iommu_probe()
Message-Id: <20200519091907.ulpo7mu5fsfqszcf@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="74zdazyhkrmz3gaa"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519091857.134170-1-weiyongjun1@huawei.com>
In-Reply-To: <20200519091857.134170-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, iommu@lists.linux-foundation.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org


--74zdazyhkrmz3gaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 09:18:57AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_platform_ioremap_resource() returns
> ERR_PTR() not NULL. The NULL test in the return value check must be
> replaced with IS_ERR().
>=20
> Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--74zdazyhkrmz3gaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXsOkiwAKCRDj7w1vZxhR
xVpwAP0TCPZzgy5kSKkqW1DtDNUXKg/Gg5CGSNLmLbi8KqlKGwD/XOjsUH9OEO/s
GMvet9K0RJJNvGd7XgptJpN3LKyLpA4=
=lJPX
-----END PGP SIGNATURE-----

--74zdazyhkrmz3gaa--
