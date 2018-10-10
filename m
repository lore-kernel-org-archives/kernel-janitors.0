From: Quentin Schulz <quentin.schulz@bootlin.com>
Date: Wed, 10 Oct 2018 06:43:51 +0000
Subject: Re: [PATCH -next] phy: phy-ocelot-serdes: fix return value check in serdes_probe()
Message-Id: <20181010064351.lsntlt45ujhms7ge@qschulz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uqmvk2lc7u5vyulk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539136824-44940-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539136824-44940-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org


--uqmvk2lc7u5vyulk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Wei Yongjun,

On Wed, Oct 10, 2018 at 02:00:24AM +0000, Wei Yongjun wrote:
> In case of error, the function syscon_node_to_regmap() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>=20
> Fixes: 51f6b410fc22 ("phy: add driver for Microsemi Ocelot SerDes muxing")

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>

Thanks!
Quentin

--uqmvk2lc7u5vyulk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlu9n6YACgkQhLiadT7g
8aPOwBAAlgPT4wvAX8gVnmzktWqa4tX9gQY8wpFIbMhzgOxdcMSX/DUtMJcv66zN
oLGUzEqy8WZpkh/tkKCsa/h64ZUZE1LLBcHkh7YDu8hRZmvv/tJKdLBOnYaMO0yG
e4guaI0r6jlbZGMZgRCgyvLDNhfUjIii6zewHJngt8WE1z/l38N1tmo/XwDwBcIK
EmPsZIVF4WoPdoKi6WJOuxeTWNPbi59NITUxRsb+127g71iw1B5FzLG1rCRGTNkF
EKuU6fta6+QQovLWo2CK3tuL8h2mhrwRtFYGvWCCtCr/hlMC3TuiM+qHPFYC/GQY
H5LAGIp6sNJ1wssFCxVU78O1YEG0ZYwGjUgSZq5nQgr2JUwT2RkRkrBmFndHMWKN
6rOFweOegQr4LO3TsCfwu/7wDxnbUa6gt0c1bqmHI60jWMulfFysgtJho5zpp35K
DufpZuKRhQ+54D2Zb5J9RfGxsp+gB29possbcG90AgEqAogetd99QE0hu5xO5QwV
GLOiFQPywki6cJSiYPDxSHlzYAJNGdwuOgvB8hfcDK5yNNtBz3zva95MiEGEU1Br
N0nQrLNArbCPrnUaWUQdhPllRwCN1WkO0if0iIAFFuELENZ4CobtywYKWJpt/Ofv
5Fo0eAz5EtMaRm2X9EvvBuEpQzbvtwjKcStqmvT5OzDIKEyFsbg=
=tRhA
-----END PGP SIGNATURE-----

--uqmvk2lc7u5vyulk--
