From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Jan 2020 17:06:11 +0000
Subject: Re: [PATCH -next] leds: leds-bd2802: remove set but not used variable 'pdata'
Message-Id: <CACRpkdYz0UwAj0Ncs9SKWbN8vN-5E14GHL2KkANMb6H5OqEW7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108015322.51103-1-yuehaibing@huawei.com>
In-Reply-To: <20200108015322.51103-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 8, 2020 at 2:57 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/leds/leds-bd2802.c: In function 'bd2802_probe':
> drivers/leds/leds-bd2802.c:663:35: warning:
>  variable 'pdata' set but not used [-Wunused-but-set-variable]
>
> commit 4c3718f9d6a6 ("leds: bd2802: Convert to use GPIO descriptors")
> left behind this unused variable.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
