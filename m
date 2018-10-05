From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 05 Oct 2018 02:27:28 +0000
Subject: Re: [PATCH -next v2] crypto: ccp - Make function sev_get_firmware() static
Message-Id: <20181005022728.cr3l5jtaq7qaokss@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2018 at 02:09:23AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/crypto/ccp/psp-dev.c:444:5: warning:
>  symbol 'sev_get_firmware' was not declared. Should it be static?
> 
> Fixes: e93720606efd ("crypto: ccp - Allow SEV firmware to be chosen based on Family and Model")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: add fixes and add cc Janakarajan
> ---
>  drivers/crypto/ccp/psp-dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
