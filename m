From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 01 Nov 2019 06:08:46 +0000
Subject: Re: [PATCH] crypto: mediatek: remove redundant bitwise-or
Message-Id: <20191101060846.3yzkupv7dbkecey4@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023114824.30509-1-colin.king@canonical.com>
In-Reply-To: <20191023114824.30509-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, Vic Wu <vic.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 23, 2019 at 12:48:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Bitwise-or'ing 0xffffffff with the u32 variable ctr is the same result
> as assigning the value to ctr.  Remove the redundant bitwise-or and
> just use an assignment.
> 
> Addresses-Coverity: ("Suspicious &= or |= constant expression")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/mediatek/mtk-aes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
