From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 24 Mar 2017 14:14:07 +0000
Subject: Re: [PATCH] crypto: zip - Memory corruption in zip_clear_stats()
Message-Id: <20170324141407.GG14780@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170317204621.GD16505@mwanda>
In-Reply-To: <20170317204621.GD16505@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mahipal Challa <mahipalreddy2006@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jan Glauber <jglauber@cavium.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 17, 2017 at 11:46:21PM +0300, Dan Carpenter wrote:
> There is a typo here.  It should be "stats" instead of "state".  The
> impact is that we clear 224 bytes instead of 80 and we zero out memory
> that we shouldn't.
> 
> Fixes: 09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
