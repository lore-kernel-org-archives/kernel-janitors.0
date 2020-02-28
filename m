From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 28 Feb 2020 00:53:49 +0000
Subject: Re: [PATCH] crypto: hisilicon: remove redundant assignment of pointer ctx
Message-Id: <20200228005349.GE9506@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222142409.141057-1-colin.king@canonical.com>
In-Reply-To: <20200222142409.141057-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 22, 2020 at 02:24:09PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer ctx is being re-assigned with the same value as it
> was initialized with. The second assignment is redundant and
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/hisilicon/sec2/sec_crypto.c | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
