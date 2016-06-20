From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 20 Jun 2016 11:35:35 +0000
Subject: Re: [patch] crypto: drbg - fix an error code in drbg_init_sym_kernel()
Message-Id: <20160620113535.GE10773@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617091618.GC25609@mwanda>
In-Reply-To: <20160617091618.GC25609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephan Mueller <smueller@chronox.de>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 17, 2016 at 12:16:19PM +0300, Dan Carpenter wrote:
> We accidentally return PTR_ERR(NULL) which is success but we should
> return -ENOMEM.
> 
> Fixes: 355912852115 ('crypto: drbg - use CTR AES instead of ECB AES')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
