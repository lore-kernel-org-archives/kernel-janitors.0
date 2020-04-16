From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Apr 2020 06:51:50 +0000
Subject: Re: [PATCH] hwrng: omap - Delete an error message in of_get_omap_rng_device_details()
Message-Id: <20200416065150.GG7901@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eae7170c-4371-4865-7b85-589c0ed2b5b6@web.de>
In-Reply-To: <eae7170c-4371-4865-7b85-589c0ed2b5b6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Deepak Saxena <dsaxena@plexity.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

On Sat, Apr 04, 2020 at 04:56:57PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 16:45:57 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/char/hw_random/omap-rng.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
