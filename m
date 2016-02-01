From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 01 Feb 2016 14:35:21 +0000
Subject: Re: [patch] crypto: keywrap - memzero the correct memory
Message-Id: <20160201143521.GD11410@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160130143828.GC3462@mwanda>
In-Reply-To: <20160130143828.GC3462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephan Mueller <smueller@chronox.de>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 30, 2016 at 05:38:28PM +0300, Dan Carpenter wrote:
> We're clearing the wrong memory.  The memory corruption is likely
> harmless because we weren't going to use that stack memory again but not
> zeroing is a potential information leak.
> 
> Fixes: e28facde3c39 ('crypto: keywrap - add key wrapping block chaining mode')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
