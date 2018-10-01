From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Oct 2018 11:25:26 +0000
Subject: Re: [PATCH -next] gpio: omap: Remove set but not used variable 'dev'
Message-Id: <CACRpkdZn5sm1fis4hvy-qMrM0dZMApGjTZeYXeLQPD_j5vY_yg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538101068-160486-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538101068-160486-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2018 at 4:08 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpio/gpio-omap.c: In function 'gpio_omap_cpu_notifier':
> drivers/gpio/gpio-omap.c:1327:17: warning:
>  variable 'dev' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
