From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 09 Mar 2018 15:17:34 +0000
Subject: Re: [PATCH] hwrng: cavium: make two functions static
Message-Id: <20180309151734.GB13567@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 26, 2018 at 02:51:19PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions cavium_rng_remove and cavium_rng_remove_vf are local to the
> source and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> drivers/char/hw_random/cavium-rng-vf.c:80:7: warning: symbol
> 'cavium_rng_remove_vf' was not declared. Should it be static?
> drivers/char/hw_random/cavium-rng.c:65:7: warning: symbol
> 'cavium_rng_remove' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
