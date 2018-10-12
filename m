From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 12 Oct 2018 06:23:40 +0000
Subject: Re: [PATCH -next] crypto: mxs-dcp: make symbols 'sha1_null_hash' and 'sha256_null_hash' static
Message-Id: <20181012062340.2svcghj26cr74463@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539222588-21750-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539222588-21750-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 11, 2018 at 01:49:48AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warnings:
> 
> drivers/crypto/mxs-dcp.c:39:15: warning:
>  symbol 'sha1_null_hash' was not declared. Should it be static?
> drivers/crypto/mxs-dcp.c:43:15: warning:
>  symbol 'sha256_null_hash' was not declared. Should it be static?
> 
> Fixes: c709eebaf5c5 ("crypto: mxs-dcp - Fix SHA null hashes and output length")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/crypto/mxs-dcp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
