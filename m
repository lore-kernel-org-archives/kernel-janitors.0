From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 23 Dec 2018 04:01:41 +0000
Subject: Re: [PATCH -next] crypto: chelsio - remove set but not used variable 'kctx_len'
Message-Id: <20181223040141.yylwdffy3i3kv4kq@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544515919-193254-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544515919-193254-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Harsh Jain <harsh@chelsio.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 11, 2018 at 08:11:59AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/crypto/chelsio/chcr_ipsec.c: In function 'chcr_ipsec_xmit':
> drivers/crypto/chelsio/chcr_ipsec.c:674:33: warning:
>  variable 'kctx_len' set but not used [-Wunused-but-set-variable]
>   unsigned int flits = 0, ndesc, kctx_len;
> 
> It not used since commit 8362ea16f69f ("crypto: chcr - ESN for Inline IPSec Tx")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/chelsio/chcr_ipsec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
