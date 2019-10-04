From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 04 Oct 2019 15:42:16 +0000
Subject: Re: [PATCH] hwrng: iproc-rng200 - Use devm_platform_ioremap_resource() in iproc_rng200_probe()
Message-Id: <20191004154216.GR5148@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
In-Reply-To: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>, linux-arm-kernel@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>

On Wed, Sep 18, 2019 at 09:19:18AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 09:09:22 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/char/hw_random/iproc-rng200.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
