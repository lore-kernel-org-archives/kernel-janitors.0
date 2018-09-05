From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Sep 2018 10:13:42 +0000
Subject: Re: [PATCH -next] pinctrl: sirf: atlas7: remove set but not used variables 'conf, bank'
Message-Id: <CACRpkdY5qurpthqB8=ek5RhD3egXbceWi0RYK1P8pboH-KcA7Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535681346-152447-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535681346-152447-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Aug 31, 2018 at 3:58 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/pinctrl/sirf/pinctrl-atlas7.c: In function 'atlas7_pinmux_resume_noirq':
> drivers/pinctrl/sirf/pinctrl-atlas7.c:5545:6: warning:
>  variable 'bank' set but not used [-Wunused-but-set-variable]
>   u32 bank;
>
> drivers/pinctrl/sirf/pinctrl-atlas7.c:5543:28: warning:
>  variable 'conf' set but not used [-Wunused-but-set-variable]
>   struct atlas7_pad_config *conf;
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
