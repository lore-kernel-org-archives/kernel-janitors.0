From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 14 Jan 2021 06:47:36 +0000
Subject: Re: [PATCH] crypto: keembay-ocs-hcu - Fix a WARN() message
Message-Id: <20210114064736.GJ12584@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WB9IlpyIi+5p5s@mwanda>
In-Reply-To: <X/WB9IlpyIi+5p5s@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Declan Murphy <declan.murphy@intel.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 06, 2021 at 12:25:08PM +0300, Dan Carpenter wrote:
> The first argument to WARN() is a condition and the messages is the
> second argument is the string, so this WARN() will only display the
> __func__ part of the message.
> 
> Fixes: ae832e329a8d ("crypto: keembay-ocs-hcu - Add HMAC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/keembay/keembay-ocs-hcu-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
