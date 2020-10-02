From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 02 Oct 2020 06:43:41 +0000
Subject: Re: [PATCH][next] crypto: sun8i-ss@: fix memory leak on pointer d
Message-Id: <20201002064341.GA2826@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200929133819.156092-1-colin.king@canonical.com>
In-Reply-To: <20200929133819.156092-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Tue, Sep 29, 2020 at 02:38:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return path on a failed dma_mapping_error call
> is not kfree'ing memory allocated to d. Add an extra error exit label
> to end of the function where the kfree and return occurs to fix this
> issue.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: ac2614d721de ("crypto: sun8i-ss - Add support for the PRNG")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This patch is already in the queue:

	https://patchwork.kernel.org/patch/11804435/

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
