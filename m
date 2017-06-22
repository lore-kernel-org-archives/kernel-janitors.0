From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Jun 2017 09:00:31 +0000
Subject: Re: [PATCH] crypto: cavium/nitrox - dma_mapping_error() returns bool
Message-Id: <20170622090031.GE25859@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170619105124.GA23831@elgon.mountain>
In-Reply-To: <20170619105124.GA23831@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Srikanth Jampala <Jampala.Srikanth@cavium.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 19, 2017 at 01:51:25PM +0300, Dan Carpenter wrote:
> We want to return negative error codes here, but we're accidentally
> propogating the "true" return from dma_mapping_error().
> 
> Fixes: 14fa93cdcd9b ("crypto: cavium - Add support for CNN55XX adapters.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
