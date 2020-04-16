From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Apr 2020 06:51:59 +0000
Subject: Re: [PATCH] crypto: sun8i-ss - Delete an error message in sun8i_ss_probe()
Message-Id: <20200416065159.GI7901@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7e1193f-7d8b-7da3-a2a8-e92ca0fd83b2@web.de>
In-Reply-To: <c7e1193f-7d8b-7da3-a2a8-e92ca0fd83b2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Sat, Apr 04, 2020 at 05:45:26PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 17:34:53 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
