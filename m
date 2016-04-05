From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 05 Apr 2016 12:46:36 +0000
Subject: Re: [patch] crypto: marvell/cesa - remove unneeded condition
Message-Id: <20160405124636.GG13048@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160321090342.GB31670@mwanda>
In-Reply-To: <20160321090342.GB31670@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Arnaud Ebalard <arno@natisbad.org>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 21, 2016 at 12:03:43PM +0300, Dan Carpenter wrote:
> creq->cache[] is an array inside the struct, it's not a pointer and it
> can't be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
