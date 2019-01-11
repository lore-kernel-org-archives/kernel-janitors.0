From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 11 Jan 2019 06:31:48 +0000
Subject: Re: [PATCH -next] crypto: ux500 catch dma submission error
Message-Id: <20190111063148.q6zah2ms3d5n7yrp@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545977433-125317-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545977433-125317-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <natechancellor@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 28, 2018 at 06:10:33AM +0000, YueHaibing wrote:
> Test cookie return by dmaengine_submit() and return error if any.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/ux500/cryp/cryp_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
