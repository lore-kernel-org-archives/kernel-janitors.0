From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 18 Sep 2019 17:13:01 +0000
Subject: Re: [PATCH] hwrng: iproc-rng200 - Use devm_platform_ioremap_resource() in iproc_rng200_probe()
Message-Id: <22a01133-be69-e13b-b382-f44ac61020e1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
In-Reply-To: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

On 9/18/19 12:19 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 09:09:22 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
