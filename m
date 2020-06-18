From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 Jun 2020 07:58:17 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <20200618075816.GI10091@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
In-Reply-To: <20200611153934.928021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 11, 2020 at 04:39:34PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned a value that is never read, the
> error exit path via label 'unmap' returns -ENOMEM anyhow, so assigning
> ret with -ENOMEM is redundamt.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/caam/caamalg_qi2.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
