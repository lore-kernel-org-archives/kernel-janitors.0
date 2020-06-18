From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Jun 2020 11:00:50 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <20200618110050.GA10995@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
 <8e08adcb-ef91-124d-d093-921fc97da3af@nxp.com>
In-Reply-To: <8e08adcb-ef91-124d-d093-921fc97da3af@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc: Colin King <colin.king@canonical.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 18, 2020 at 01:54:55PM +0300, Horia Geant=C4=83 wrote:
>
> The proper fix would be updating the ahash_finup_no_ctx() function
> to return the specific error code:
> 	return ret;
> instead of returning -ENOMEM for all error cases.
>=20
> For example error code returned by dpaa2_caam_enqueue()
> should be returned instead of -ENOMEM.

You can do that as a follow-up.  The patch is correct as is.

Cheers,
--=20
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
