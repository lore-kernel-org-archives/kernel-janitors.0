From: Horia Geanta <horia.geanta@nxp.com>
Date: Mon, 01 Apr 2019 12:09:54 +0000
Subject: Re: [PATCH] crypto: caam/qi - Change a couple IS_ERR_OR_NULL() checks to IS_ERR()
Message-Id: <VI1PR0402MB34858D2A39582719767800D298550@VI1PR0402MB3485.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328143601.GQ32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 3/28/2019 4:36 PM, Dan Carpenter wrote:
> create_caam_req_fq() doesn't return NULL pointers so there is no need to
> check.  The NULL checks are problematic because it's hard to say how a
> NULL return should be handled, so removing the checks is a nice cleanup.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>

Thanks,
Horia
