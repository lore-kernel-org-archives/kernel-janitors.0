From: rohit maheshwari <rohitm@chelsio.com>
Date: Sun, 15 Mar 2020 16:22:45 +0000
Subject: Re: [PATCH -next] crypto: chelsio - remove set but not used variable 'adap'
Message-Id: <fcf6f896-8d60-836c-cdad-b5ca9c95b562@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200314104441.79953-1-yuehaibing@huawei.com>
In-Reply-To: <20200314104441.79953-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org


On 14/03/20 4:14 PM, YueHaibing wrote:
> drivers/crypto/chelsio/chcr_algo.c: In function 'chcr_device_init':
> drivers/crypto/chelsio/chcr_algo.c:1440:18: warning:
>   variable 'adap' set but not used [-Wunused-but-set-variable]
>   
> commit 567be3a5d227 ("crypto: chelsio - Use multiple txq/rxq per tfm
> to process the requests") involved this unused variable.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/crypto/chelsio/chcr_algo.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
> index 8952732c0b7d..c29b80dd30d8 100644
> --- a/drivers/crypto/chelsio/chcr_algo.c
> +++ b/drivers/crypto/chelsio/chcr_algo.c
> @@ -1437,7 +1437,6 @@ static int chcr_aes_decrypt(struct skcipher_request *req)
>   static int chcr_device_init(struct chcr_context *ctx)
>   {
>   	struct uld_ctx *u_ctx = NULL;
> -	struct adapter *adap;
>   	int txq_perchan, ntxq;
>   	int err = 0, rxq_perchan;
>   
> @@ -1448,7 +1447,6 @@ static int chcr_device_init(struct chcr_context *ctx)
>   			goto out;
>   		}
>   		ctx->dev = &u_ctx->dev;
> -		adap = padap(ctx->dev);
>   		ntxq = u_ctx->lldi.ntxq;
>   		rxq_perchan = u_ctx->lldi.nrxq / u_ctx->lldi.nchan;
>   		txq_perchan = ntxq / u_ctx->lldi.nchan;
>
Thanks for fixing it. Looks good to me.
>
