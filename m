From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 08 Apr 2019 06:40:15 +0000
Subject: Re: [PATCH] crypto: caam/qi - Change a couple IS_ERR_OR_NULL() checks to IS_ERR()
Message-Id: <20190408064015.yxyx6qxzus5o25n6@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328143601.GQ32590@kadam>
In-Reply-To: <20190328143601.GQ32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 28, 2019 at 05:36:01PM +0300, Dan Carpenter wrote:
> create_caam_req_fq() doesn't return NULL pointers so there is no need to
> check.  The NULL checks are problematic because it's hard to say how a
> NULL return should be handled, so removing the checks is a nice cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/caam/qi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
