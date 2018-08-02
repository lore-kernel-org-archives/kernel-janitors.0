From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 02 Aug 2018 21:33:50 +0000
Subject: Re: [PATCH -next] gpio: pxa: remove set but not used variable 'gpio_offset'
Message-Id: <CACRpkdb4L7zgTi8UWn_HdF=1fXn1Ue8r4eURD3Z+dB_TvzHz_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y3dpooli.fsf@belgarion.home>
In-Reply-To: <87y3dpooli.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 1, 2018 at 3:33 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_probe’:
> drivers/gpio/gpio-pxa.c:629:35: warning:
>  variable ‘gpio_offset’ set but not used [-Wunused-but-set-variable]
>   int irq0 = 0, irq1 = 0, irq_mux, gpio_offset = 0;
>                                    ^
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Fixed up the funny characters and applied with Robert's ACK!

Yours,
Linus Walleij
