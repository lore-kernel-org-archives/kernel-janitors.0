From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 18 Oct 2019 08:02:34 +0000
Subject: Re: [PATCH -next] crypto: Use PTR_ERR_OR_ZERO in safexcel_xcbcmac_cra_init()
Message-Id: <20191018080233.GC25128@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009120621.45834-1-yuehaibing@huawei.com>
In-Reply-To: <20191009120621.45834-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Antoine Tenart <antoine.tenart@bootlin.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 09, 2019 at 12:06:21PM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/inside-secure/safexcel_hash.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
