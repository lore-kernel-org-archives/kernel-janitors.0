From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Aug 2017 07:58:58 +0000
Subject: Re: [PATCH] crypto: cavium/nitrox - Fix an error handling path in 'nitrox_probe()'
Message-Id: <20170822075858.GK6269@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816051606.14950-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170816051606.14950-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, Jampala.Srikanth@cavium.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 16, 2017 at 07:16:06AM +0200, Christophe JAILLET wrote:
> 'err' is known to be 0 at this point.
> If 'kzalloc()' fails, returns -ENOMEM instead of 0 which means success.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
