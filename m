From: Xu Zaibo <xuzaibo@huawei.com>
Date: Mon, 24 Feb 2020 01:14:30 +0000
Subject: Re: [PATCH] crypto: hisilicon: remove redundant assignment of pointer ctx
Message-Id: <e0133b58-5acc-5706-c369-6eeacf1c67a6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222142409.141057-1-colin.king@canonical.com>
In-Reply-To: <20200222142409.141057-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Yes, thank you!


On 2020/2/22 22:24, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer ctx is being re-assigned with the same value as it
> was initialized with. The second assignment is redundant and
> can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/crypto/hisilicon/sec2/sec_crypto.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/crypto/hisilicon/sec2/sec_crypto.c b/drivers/crypto/hisilicon/sec2/sec_crypto.c
> index a2cfcc9ccd94..acd15507eb8a 100644
> --- a/drivers/crypto/hisilicon/sec2/sec_crypto.c
> +++ b/drivers/crypto/hisilicon/sec2/sec_crypto.c
> @@ -447,7 +447,6 @@ static int sec_skcipher_init(struct crypto_skcipher *tfm)
>   	struct sec_ctx *ctx = crypto_skcipher_ctx(tfm);
>   	int ret;
>   
> -	ctx = crypto_skcipher_ctx(tfm);
>   	ctx->alg_type = SEC_SKCIPHER;
>   	crypto_skcipher_set_reqsize(tfm, sizeof(struct sec_req));
>   	ctx->c_ctx.ivsize = crypto_skcipher_ivsize(tfm);
