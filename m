From: Neil Horman <nhorman@tuxdriver.com>
Date: Mon, 20 Jan 2020 15:56:21 +0000
Subject: Re: [PATCH] crypto: rng - Fix a refcounting bug in crypto_rng_reset()
Message-Id: <20200120155621.GA22044@hmswarspite.think-freely.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200120143804.pbmnrh72v2gogx43@kili.mountain>
In-Reply-To: <20200120143804.pbmnrh72v2gogx43@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 05:38:04PM +0300, Dan Carpenter wrote:
> We need to decrement this refcounter on these error paths.
> 
> Fixes: f7d76e05d058 ("crypto: user - fix use_after_free of struct xxx_request")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  crypto/rng.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/rng.c b/crypto/rng.c
> index 1e21231f71c9..1490d210f1a1 100644
> --- a/crypto/rng.c
> +++ b/crypto/rng.c
> @@ -37,12 +37,16 @@ int crypto_rng_reset(struct crypto_rng *tfm, const u8 *seed, unsigned int slen)
>  	crypto_stats_get(alg);
>  	if (!seed && slen) {
>  		buf = kmalloc(slen, GFP_KERNEL);
> -		if (!buf)
> +		if (!buf) {
> +			crypto_alg_put(alg);
>  			return -ENOMEM;
> +		}
>  
>  		err = get_random_bytes_wait(buf, slen);
> -		if (err)
> +		if (err) {
> +			crypto_alg_put(alg);
>  			goto out;
> +		}
>  		seed = buf;
>  	}
>  
> -- 
> 2.11.0
> 
> 
LGTM
Acked-by: Neil Horman <nhorman@tuxdriver.com>
