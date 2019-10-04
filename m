From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 04 Oct 2019 12:07:52 +0000
Subject: Re: [PATCH] mfd: ipaq-micro: Use devm_platform_ioremap_resource() in micro_probe()
Message-Id: <20191004120752.GD18429@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9990bcc-2daa-67ad-4de5-7a849668d038@web.de>
In-Reply-To: <d9990bcc-2daa-67ad-4de5-7a849668d038@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

On Wed, 18 Sep 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 13:40:30 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/ipaq-micro.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
