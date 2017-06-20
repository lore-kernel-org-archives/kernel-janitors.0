From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 20 Jun 2017 03:33:43 +0000
Subject: Re: [PATCH] crypto: crypto4xx - fix an error code
Message-Id: <20170620033343.GA17764@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170610125433.26294-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170610125433.26294-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jun 10, 2017 at 02:54:33PM +0200, Christophe JAILLET wrote:
> If 'kzalloc' fails, we return 0 which means success.
> return -ENOMEM instead as already done a few lines above.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
