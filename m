From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 08 May 2020 06:06:01 +0000
Subject: Re: [PATCH -next] crypto: drbg - fix error return code in drbg_alloc_state()
Message-Id: <20200508060601.GE24789@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200430081353.112449-1-weiyongjun1@huawei.com>
In-Reply-To: <20200430081353.112449-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 30, 2020 at 08:13:53AM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the kzalloc error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: db07cd26ac6a ("crypto: drbg - add FIPS 140-2 CTRNG for noise source")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  crypto/drbg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
