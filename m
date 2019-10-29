From: LABBE Corentin <clabbe@baylibre.com>
Date: Tue, 29 Oct 2019 12:42:03 +0000
Subject: Re: [PATCH -next] crypto: amlogic - Use kmemdup in meson_aes_setkey()
Message-Id: <20191029124203.GB18754@Red>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029015523.126987-1-yuehaibing@huawei.com>
In-Reply-To: <20191029015523.126987-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 01:55:23AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index e9283ffdbd23..78e776c58705 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -372,10 +372,9 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		kfree(op->key);
>  	}
>  	op->keylen = keylen;
> -	op->key = kmalloc(keylen, GFP_KERNEL | GFP_DMA);
> +	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>  	if (!op->key)
>  		return -ENOMEM;
> -	memcpy(op->key, key, keylen);
>  
>  	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
>  }
> 
> 
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
