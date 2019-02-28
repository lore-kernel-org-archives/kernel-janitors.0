From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 28 Feb 2019 06:23:17 +0000
Subject: Re: [PATCH -next] crypto: marvell - Remove set but not used variable 'ivsize'
Message-Id: <20190228062317.m7dl2duf5mbc7yge@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218085947.3800-1-yuehaibing@huawei.com>
In-Reply-To: <20190218085947.3800-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 08:59:47AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/marvell/cipher.c: In function 'mv_cesa_skcipher_dma_req_init':
> drivers/crypto/marvell/cipher.c:325:15: warning:
>  variable 'ivsize' set but not used [-Wunused-but-set-variable]
> 
> It's not used any more after 0c99620f0ac1 ("crypto: marvell - Use an unique
> pool to copy results of requests")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/marvell/cipher.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
