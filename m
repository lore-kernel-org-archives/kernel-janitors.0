From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 13 Feb 2020 09:22:50 +0000
Subject: Re: [PATCH -next] crypto: ccree - remove set but not used variable 'du_size'
Message-Id: <20200213092250.qsvhnv6g55lnvw23@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200203153921.45273-1-yuehaibing@huawei.com>
In-Reply-To: <20200203153921.45273-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Gilad Ben-Yossef <gilad@benyossef.com>, linux-crypto@vger.kernel.org, Ofir Drang <ofir.drang@arm.com>, linux-media@vger.kernel.org

On Mon, Feb 03, 2020 at 03:39:21PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/ccree/cc_cipher.c: In function 'cc_setup_state_desc':
> drivers/crypto/ccree/cc_cipher.c:536:15: warning:
>  variable 'du_size' set but not used [-Wunused-but-set-variable]
> 
> commit 5c83e8ec4d51 ("crypto: ccree - fix FDE descriptor sequence")
> involved this unused variable, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/ccree/cc_cipher.c | 8 --------
>  1 file changed, 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
