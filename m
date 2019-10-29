From: LABBE Corentin <clabbe@baylibre.com>
Date: Tue, 29 Oct 2019 12:31:52 +0000
Subject: Re: [PATCH][next] crypto: amlogic: ensure error variable err is set before returning it
Message-Id: <20191029123152.GA18754@Red>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029113230.7050-1-colin.king@canonical.com>
In-Reply-To: <20191029113230.7050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Neil Armstrong <narmstrong@baylibre.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index db5b421e88d8..fa05fce1c0de 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -162,6 +162,7 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
>  		if (!mc->chanlist[i].engine) {
>  			dev_err(mc->dev, "Cannot allocate engine\n");
>  			i--;
> +			err = -ENOMEM;
>  			goto error_engine;
>  		}
>  		err = crypto_engine_start(mc->chanlist[i].engine);
> -- 
> 2.20.1
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
