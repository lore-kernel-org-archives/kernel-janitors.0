From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 13 Feb 2020 09:17:51 +0000
Subject: Re: [PATCH] crypto: rng - Fix a refcounting bug in crypto_rng_reset()
Message-Id: <20200213091750.x7fke4xva3rtkcap@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200120143804.pbmnrh72v2gogx43@kili.mountain>
In-Reply-To: <20200120143804.pbmnrh72v2gogx43@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neil Horman <nhorman@tuxdriver.com>, Corentin Labbe <clabbe@baylibre.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 05:38:04PM +0300, Dan Carpenter wrote:
> We need to decrement this refcounter on these error paths.
> 
> Fixes: f7d76e05d058 ("crypto: user - fix use_after_free of struct xxx_request")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  crypto/rng.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
