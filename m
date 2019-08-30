From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 30 Aug 2019 08:25:16 +0000
Subject: Re: [PATCH v2 -next] crypto: hisilicon: select CRYPTO_LIB_DES while compiling SEC driver
Message-Id: <20190830082516.GJ8033@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <affd8de1-ae35-a1d0-534a-d9cdfac90de8@huawei.com>
 <20190828080740.43244-1-maowenan@huawei.com>
In-Reply-To: <20190828080740.43244-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: davem@davemloft.net, jonathan.cameron@huawei.com, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, john.garry@huawei.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 28, 2019 at 04:07:40PM +0800, Mao Wenan wrote:
> When CRYPTO_DEV_HISI_SEC=y, below compilation error is found after 
> 'commit 894b68d8be4b ("crypto: hisilicon/des - switch to new verification routines")':
> 
> drivers/crypto/hisilicon/sec/sec_algs.o: In function `sec_alg_skcipher_setkey_des_cbc':
> sec_algs.c:(.text+0x11f0): undefined reference to `des_expand_key'
> drivers/crypto/hisilicon/sec/sec_algs.o: In function `sec_alg_skcipher_setkey_des_ecb':
> sec_algs.c:(.text+0x1390): undefined reference to `des_expand_key'
> make: *** [vmlinux] Error 1
> 
> This because DES library has been moved to lib/crypto in this commit 
> '04007b0e6cbb ("crypto: des - split off DES library from generic DES cipher driver")'.
> Fix this by selecting CRYPTO_LIB_DES in CRYPTO_DEV_HISI_SEC.
> 
> Fixes: 04007b0e6cbb ("crypto: des - split off DES library from generic DES cipher driver")
> Fixes: 894b68d8be4b ("crypto: hisilicon/des - switch to new verification routines")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  v2: remove fix tag 915e4e8413da ("crypto: hisilicon - SEC security accelerator driver") 
>  drivers/crypto/hisilicon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
