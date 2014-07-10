From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 10 Jul 2014 09:00:15 +0000
Subject: Re: [patch] crypto: qat - remove an unneeded cast
Message-Id: <20140710090015.GC15621@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140708105907.GE19737@mwanda>
In-Reply-To: <20140708105907.GE19737@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tadeusz Struk <tadeusz.struk@intel.com>, "David S. Miller" <davem@davemloft.net>, Bruce Allan <bruce.w.allan@intel.com>, Pingchaox Yang <pingchaox.yang@intel.com>, Bo Cui <bo.cui@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 08, 2014 at 01:59:07PM +0300, Dan Carpenter wrote:
> The cast to (unsigned int *) doesn't hurt anything but it is pointless.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
