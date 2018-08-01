From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Wed, 01 Aug 2018 19:48:09 +0000
Subject: Re: [PATCH -next] gpio: pxa: remove set but not used variable 'gpio_offset'
Message-Id: <87y3dpooli.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpio/gpio-pxa.c: In function â€˜pxa_gpio_probeâ€™:
> drivers/gpio/gpio-pxa.c:629:35: warning:
>  variable â€˜gpio_offsetâ€™ set but not used [-Wunused-but-set-variable]
There are weird characters here : â€˜ and â€™
>   int irq0 = 0, irq1 = 0, irq_mux, gpio_offset = 0;

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Once that is fixed,
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
