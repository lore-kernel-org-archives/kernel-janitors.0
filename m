From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 15 Nov 2019 06:05:52 +0000
Subject: Re: [PATCH][next][V2] crypto: allwinner: fix some spelling mistakes
Message-Id: <20191115060552.tmmvcvahi3wyqa2v@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191105150359.61379-1-colin.king@canonical.com>
In-Reply-To: <20191105150359.61379-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Tue, Nov 05, 2019 at 03:03:59PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are spelling mistakes in dev_warn and dev_err messages. Fix these.
> Change "recommandation" to "recommendation" and "tryed" to "tried".
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Fix "tryed"
> 
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 4 ++--
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
