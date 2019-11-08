From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 08 Nov 2019 15:11:09 +0000
Subject: Re: [PATCH -next] crypto: amlogic - Use kmemdup in meson_aes_setkey()
Message-Id: <20191108151108.axg6mblvepkcr443@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029015523.126987-1-yuehaibing@huawei.com>
In-Reply-To: <20191029015523.126987-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 01:55:23AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
