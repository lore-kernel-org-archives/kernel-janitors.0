From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 05 Apr 2020 10:43:50 +0000
Subject: Re: [PATCH] gpio: msic: Delete an error message in platform_msic_gpio_probe()
Message-Id: <CAHp75Ve8hf9TZ4YL43nVJnZ+jcs80VdOddL8wbAqh-Te=0r12Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
In-Reply-To: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

On Sat, Apr 4, 2020 at 10:35 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 21:30:12 +0200
>
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.

No need to touch this ancient driver, since it's subject to remove in
one of the (nearest) future releases.

-- 
With Best Regards,
Andy Shevchenko
