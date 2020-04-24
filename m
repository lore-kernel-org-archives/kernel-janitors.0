From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 24 Apr 2020 07:46:34 +0000
Subject: Re: [PATCH] crypto: algif_rng: remove redundant assignment to variable err
Message-Id: <20200424074634.GC24682@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200415230358.1566912-1-colin.king@canonical.com>
In-Reply-To: <20200415230358.1566912-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 16, 2020 at 12:03:58AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  crypto/algif_rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
