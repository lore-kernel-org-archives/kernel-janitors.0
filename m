From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 08 Nov 2019 15:11:27 +0000
Subject: Re: [PATCH][next] crypto: amlogic: ensure error variable err is set before returning it
Message-Id: <20191108151127.uysbqg2yt2ovscfa@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029113230.7050-1-colin.king@canonical.com>
In-Reply-To: <20191029113230.7050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, "David S . Miller" <davem@davemloft.net>, Neil Armstrong <narmstrong@baylibre.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 29, 2019 at 11:32:30AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to crypto_engine_alloc_init fails the error
> return path returns an uninitialized value in the variable err. Fix
> this by setting err to -ENOMEM.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
