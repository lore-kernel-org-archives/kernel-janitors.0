From: Stephan Mueller <smueller@chronox.de>
Date: Fri, 17 Jun 2016 09:19:58 +0000
Subject: Re: [patch] crypto: drbg - fix an error code in drbg_init_sym_kernel()
Message-Id: <1774858.Ao0ox7E6zA@tauon.atsec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617091618.GC25609@mwanda>
In-Reply-To: <20160617091618.GC25609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Freitag, 17. Juni 2016, 12:16:19 schrieb Dan Carpenter:

Hi Dan,

> We accidentally return PTR_ERR(NULL) which is success but we should
> return -ENOMEM.
> 
> Fixes: 355912852115 ('crypto: drbg - use CTR AES instead of ECB AES')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Stephan Mueller <smueller@chronox.de>

That points to an error in the documentation of skcipher_request_alloc.

I will send a follow-up patch.
> 
> diff --git a/crypto/drbg.c b/crypto/drbg.c
> index ded8638..6872d15 100644
> --- a/crypto/drbg.c
> +++ b/crypto/drbg.c
> @@ -1686,7 +1686,7 @@ static int drbg_init_sym_kernel(struct drbg_state
> *drbg) if (!req) {
>  		pr_info("DRBG: could not allocate request queue\n");
>  		drbg_fini_sym_kernel(drbg);
> -		return PTR_ERR(req);
> +		return -ENOMEM;
>  	}
>  	drbg->ctr_req = req;
>  	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,


Ciao
Stephan
