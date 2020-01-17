From: Xu Zaibo <xuzaibo@huawei.com>
Date: Fri, 17 Jan 2020 09:32:11 +0000
Subject: Re: [PATCH][next] crypto: hisilicon: fix spelling mistake "disgest" -> "digest"
Message-Id: <7df81648-eb73-c770-e5d4-65148cd46b95@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200117092819.97640-1-colin.king@canonical.com>
In-Reply-To: <20200117092819.97640-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Yes, thanks.


On 2020/1/17 17:28, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/crypto/hisilicon/sec2/sec_crypto.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/hisilicon/sec2/sec_crypto.c b/drivers/crypto/hisilicon/sec2/sec_crypto.c
> index a0a35685e838..a2cfcc9ccd94 100644
> --- a/drivers/crypto/hisilicon/sec2/sec_crypto.c
> +++ b/drivers/crypto/hisilicon/sec2/sec_crypto.c
> @@ -690,7 +690,7 @@ static int sec_aead_auth_set_key(struct sec_auth_ctx *ctx,
>   		ret = crypto_shash_digest(shash, keys->authkey,
>   					  keys->authkeylen, ctx->a_key);
>   		if (ret) {
> -			pr_err("hisi_sec2: aead auth disgest error!\n");
> +			pr_err("hisi_sec2: aead auth digest error!\n");
>   			return -EINVAL;
>   		}
>   		ctx->a_key_len = blocksize;
