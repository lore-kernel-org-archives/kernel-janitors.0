From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Mar 2020 04:54:21 +0000
Subject: Re: [PATCH -next] crypto: ccree - remove duplicated include from cc_aead.c
Message-Id: <20200327045421.GB19912@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200318020040.175704-1-yuehaibing@huawei.com>
In-Reply-To: <20200318020040.175704-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 18, 2020 at 02:00:40AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/ccree/cc_aead.c | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
