From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 31 Jul 2020 07:28:52 +0000
Subject: Re: [PATCH -next] crypto: sa2ul - fix wrong pointer passed to PTR_ERR()
Message-Id: <20200731072852.GA17380@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200725063440.172238-1-weiyongjun1@huawei.com>
In-Reply-To: <20200725063440.172238-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Keerthy <j-keerthy@ti.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Sat, Jul 25, 2020 at 06:34:40AM +0000, Wei Yongjun wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: 7694b6ca649f ("crypto: sa2ul - Add crypto driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/crypto/sa2ul.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Someone has sent a similar patch already.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
