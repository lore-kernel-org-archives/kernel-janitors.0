From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 18 Sep 2020 07:29:05 +0000
Subject: Re: [PATCH] crypto: sa2ul - Fix pm_runtime_get_sync() error checking
Message-Id: <20200918072904.GE23319@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200909094528.GB420136@mwanda>
In-Reply-To: <20200909094528.GB420136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 09, 2020 at 12:45:28PM +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() function returns either 0 or 1 on success but
> this code treats a return of 1 as a failure.
> 
> Fixes: 7694b6ca649f ("crypto: sa2ul - Add crypto driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/sa2ul.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
