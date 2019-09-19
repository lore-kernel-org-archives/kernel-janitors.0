From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Thu, 19 Sep 2019 20:35:34 +0000
Subject: Re: [PATCH] leds-bcm63xx: Use devm_platform_ioremap_resource() in two functions
Message-Id: <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
In-Reply-To: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-leds@vger.kernel.org, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

Hi Markus,

Thank you for the patch.

Please split it to two separate ones - one per affected driver.

Best regards,
Jacek Anaszewski

On 9/18/19 10:55 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 10:45:24 +0200
> 
> Simplify these function implementations by using a known function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/leds/leds-bcm6328.c | 7 +------
>  drivers/leds/leds-bcm6358.c | 7 +------
>  2 files changed, 2 insertions(+), 12 deletions(-)
