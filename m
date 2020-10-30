From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 30 Oct 2020 06:49:33 +0000
Subject: Re: [PATCH] crypto: inside-secure: Fix sizeof() mismatch
Message-Id: <20201030064933.GE25453@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201010164736.12871-1-colin.king@canonical.com>
In-Reply-To: <20201010164736.12871-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Antoine Tenart <atenart@kernel.org>, "David S . Miller" <davem@davemloft.net>, Ofer Heifetz <oferh@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 10, 2020 at 05:47:36PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(priv->ring[i].rdr_req) is
> not correct, it should be sizeof(*priv->ring[i].rdr_req). Note that
> since the size of ** is the same size as * this is not causing any
> issues.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: 9744fec95f06 ("crypto: inside-secure - remove request list to improve performance")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/inside-secure/safexcel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
