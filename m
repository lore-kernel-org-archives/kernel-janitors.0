From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 04 Oct 2019 15:42:49 +0000
Subject: Re: [PATCH] hwrng: mediatek: Use devm_platform_ioremap_resource() in mtk_rng_probe()
Message-Id: <20191004154249.GS5148@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e6e03822-c68f-55ea-3a65-ee2a44f50e8c@web.de>
In-Reply-To: <e6e03822-c68f-55ea-3a65-ee2a44f50e8c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>

On Wed, Sep 18, 2019 at 09:44:06AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 09:34:11 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/char/hw_random/mtk-rng.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
