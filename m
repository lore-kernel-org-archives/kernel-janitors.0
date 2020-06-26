From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 26 Jun 2020 06:08:04 +0000
Subject: Re: [PATCH] crypto: img-hash: remove redundant initialization of variable err
Message-Id: <20200626060803.GC20811@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618101625.11986-1-colin.king@canonical.com>
In-Reply-To: <20200618101625.11986-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 18, 2020 at 11:16:25AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/img-hash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
