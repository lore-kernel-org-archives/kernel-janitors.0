From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 19 May 2016 10:07:22 +0000
Subject: Re: [patch] crypto: omap-sham - potential Oops on error in probe
Message-Id: <20160519100722.GB25981@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160518103905.GA10470@mwanda>
In-Reply-To: <20160518103905.GA10470@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 18, 2016 at 01:39:05PM +0300, Dan Carpenter wrote:
> This if statement is reversed so we end up either leaking or Oopsing on
> error.
> 
> Fixes: dbe246209bc1 ('crypto: omap-sham - Use dma_request_chan() for requesting DMA channel')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
