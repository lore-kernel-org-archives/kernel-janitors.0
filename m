From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 30 Aug 2019 08:13:50 +0000
Subject: Re: [PATCH] crypto: picoxcell - Fix the name of the module in the description of CRYPTO_DEV_PICOXCEL
Message-Id: <20190830081350.GA7573@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190819051833.6622-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190819051833.6622-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 19, 2019 at 07:18:33AM +0200, Christophe JAILLET wrote:
> The help section says that the module will be called 'pipcoxcell_crypto'.
> This is likely a typo.
> Use 'picoxcell_crypto' instead
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
