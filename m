From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 21 Apr 2017 13:15:12 +0000
Subject: Re: [PATCH v2] crypto: chcr - Fix error handling related to 'chcr_alloc_shash'
Message-Id: <20170421131512.GD14803@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413182515.29107-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170413182515.29107-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, harsh@chelsio.com, hariprasad@chelsio.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 13, 2017 at 08:25:15PM +0200, Christophe JAILLET wrote:
> Up to now, 'crypto_alloc_shash()' may return a valid pointer, an error
> pointer or NULL (in case of invalid parameter)
> Update it to always return an error pointer in case of error. It now
> returns ERR_PTR(-EINVAL) instead of NULL in case of invalid parameter.
> 
> This simplifies error handling.
> 
> Also fix a crash in 'chcr_authenc_setkey()' if 'chcr_alloc_shash()'
> returns an error pointer and the "goto out" path is taken.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
