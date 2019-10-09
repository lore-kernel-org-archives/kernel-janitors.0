From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Date: Wed, 09 Oct 2019 13:28:47 +0000
Subject: RE: [PATCH -next] crypto: Use PTR_ERR_OR_ZERO in safexcel_xcbcmac_cra_init()
Message-Id: <MN2PR20MB29737A41C34E055FB7FFD9FBCA950@MN2PR20MB2973.namprd20.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009120621.45834-1-yuehaibing@huawei.com>
In-Reply-To: <20191009120621.45834-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.org> On Behalf Of
> YueHaibing
> Sent: Wednesday, October 9, 2019 2:06 PM
> To: Antoine Tenart <antoine.tenart@bootlin.com>; Herbert Xu <herbert@gondor.apana.org.au>
> Cc: YueHaibing <yuehaibing@huawei.com>; linux-crypto@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next] crypto: Use PTR_ERR_OR_ZERO in safexcel_xcbcmac_cra_init()
> 
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
Acked-by: Pascal van Leeuwen <pvanleeuwen@verimatrix.com>

> ---
>  drivers/crypto/inside-secure/safexcel_hash.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-
> secure/safexcel_hash.c
> index 85c3a075f283..a07a2915fab1 100644
> --- a/drivers/crypto/inside-secure/safexcel_hash.c
> +++ b/drivers/crypto/inside-secure/safexcel_hash.c
> @@ -2109,10 +2109,7 @@ static int safexcel_xcbcmac_cra_init(struct crypto_tfm *tfm)
> 
>  	safexcel_ahash_cra_init(tfm);
>  	ctx->kaes = crypto_alloc_cipher("aes", 0, 0);
> -	if (IS_ERR(ctx->kaes))
> -		return PTR_ERR(ctx->kaes);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(ctx->kaes);
>
Ah cool, you can do that in one go, didn't know that yet :-) Thanks!

>  }
> 
>  static void safexcel_xcbcmac_cra_exit(struct crypto_tfm *tfm)
> 
> 
> 
> 

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com
