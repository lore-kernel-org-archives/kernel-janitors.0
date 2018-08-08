From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 08 Aug 2018 09:51:21 +0000
Subject: Re: [PATCH -next] crypto: hisilicon - Make function sec_send_request() static
Message-Id: <20180808095120.tuhrznflecoizaln@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533702609-162042-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533702609-162042-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 08, 2018 at 04:30:09AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/crypto/hisilicon/sec/sec_algs.c:396:5: warning:
>  symbol 'sec_send_request' was not declared. Should it be static?
> 
> Fixes: 915e4e8413da ("crypto: hisilicon - SEC security accelerator driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

This is already fixed in the current tree.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
