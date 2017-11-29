From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 29 Nov 2017 06:38:28 +0000
Subject: Re: [PATCH] crypto: hifn_795x - Fix a memory leak in the error handling path of 'hifn_probe()'
Message-Id: <20171129063828.GL21575@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171118134545.25784-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171118134545.25784-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 18, 2017 at 02:45:45PM +0100, Christophe JAILLET wrote:
> 'dev' is leaking in the error handling path of 'hifn_probe()'.
> 
> Add a 'kfree(dev)' to match the code in 'hifn_remove()'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
