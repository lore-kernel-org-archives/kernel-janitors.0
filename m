From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 12 Oct 2018 06:22:41 +0000
Subject: Re: [PATCH -next] crypto: chtls - remove set but not used variable 'csk'
Message-Id: <20181012062241.nyhogafjkyngirbb@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538721807-120297-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538721807-120297-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 05, 2018 at 06:43:27AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/chelsio/chtls/chtls_cm.c: In function 'chtls_disconnect':
> drivers/crypto/chelsio/chtls/chtls_cm.c:408:21: warning:
>  variable 'csk' set but not used [-Wunused-but-set-variable]
>  
> drivers/crypto/chelsio/chtls/chtls_cm.c: In function 'chtls_recv_sock':
> drivers/crypto/chelsio/chtls/chtls_cm.c:1016:23: warning:
>  variable 'tcph' set but not used [-Wunused-but-set-variable]
>  
> 'csk' and 'tcph' are never used since introduce
> in commit cc35c88ae4db ("crypto : chtls - CPL handler definition")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/chelsio/chtls/chtls_cm.c | 4 ----
>  1 file changed, 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
