From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Jul 2020 11:56:33 +0000
Subject: Re: [PATCH 1/2] Crypto/chcr: Avoid some code duplication
Message-Id: <20200716115633.GH31166@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200712211404.276211-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200712211404.276211-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ayush.sawal@chelsio.com, vinay.yadav@chelsio.com, rohitm@chelsio.com, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 12, 2020 at 11:14:04PM +0200, Christophe JAILLET wrote:
> The error handling path of 'chcr_authenc_setkey()' is the same as this
> error handling code.
> 
> So just 'goto out' as done everywhere in the function to simplify the code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/chelsio/chcr_algo.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
