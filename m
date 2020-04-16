From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Apr 2020 06:51:54 +0000
Subject: Re: [PATCH] hwrng: xgene - Delete an error message in xgene_rng_probe()
Message-Id: <20200416065154.GH7901@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45447185-d64f-027c-7bca-c59ea21e6021@web.de>
In-Reply-To: <45447185-d64f-027c-7bca-c59ea21e6021@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Chuhong Yuan <hslester96@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>, YueHaibing <yuehaibing@huawei.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

On Sat, Apr 04, 2020 at 05:17:19PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 17:07:34 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/char/hw_random/xgene-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
