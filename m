From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 29 Nov 2017 06:31:22 +0000
Subject: Re: [PATCH] crypto: chelsio - Fix an error code in chcr_hash_dma_map()
Message-Id: <20171129063122.GB21575@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109212543.6dpgzvtbhi4574wr@mwanda>
In-Reply-To: <20171109212543.6dpgzvtbhi4574wr@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Harsh Jain <harsh@chelsio.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 10, 2017 at 12:25:43AM +0300, Dan Carpenter wrote:
> The dma_map_sg() function returns zero on error and positive values on
> success.  We want to return -ENOMEM on failure here and zero on success.
> 
> Fixes: 2f47d5804311 ("crypto: chelsio - Move DMA un/mapping to chcr from lld cxgb4 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
