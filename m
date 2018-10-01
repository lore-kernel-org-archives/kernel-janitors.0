From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Oct 2018 10:28:03 +0000
Subject: Re: [PATCH -next] gpio: htc-egpio: Remove set but not used variable 'bit'
Message-Id: <CACRpkdZPUw2SHdyywaNyk4uhDFaO5yOJ3dz++e+g23faqbnMKg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2018 at 4:09 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpio/gpio-htc-egpio.c: In function 'egpio_set':
> drivers/gpio/gpio-htc-egpio.c:192:20: warning:
>  variable 'bit' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
