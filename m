From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Aug 2017 07:58:51 +0000
Subject: Re: [PATCH] crypto: inside-secure - fix an error handling path in safexcel_probe()
Message-Id: <20170822075851.GJ6269@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815193324.8193-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170815193324.8193-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: antoine.tenart@free-electrons.com, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 15, 2017 at 09:33:24PM +0200, Christophe JAILLET wrote:
> 'ret' is known to be 0 at this point.
> If 'safexcel_request_ring_irq()' fails, it returns an error code.
> Return this value instead of 0 which means success.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
