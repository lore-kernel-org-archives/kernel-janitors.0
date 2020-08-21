From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 21 Aug 2020 07:55:52 +0000
Subject: Re: [PATCH] crypto: ixp4xx - Fix the size used in a 'dma_free_coherent()' call
Message-Id: <20200821075552.GE25143@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802145648.699335-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802145648.699335-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, chohnstaedt@innominate.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 02, 2020 at 04:56:48PM +0200, Christophe JAILLET wrote:
> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()', in 'setup_crypt_desc()'.
> 
> Fixes: 81bef0150074 ("crypto: ixp4xx - Hardware crypto support for IXP4xx CPUs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/ixp4xx_crypto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
