From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2013 10:42:29 +0000
Subject: Re: [patch] gpio: msm: make msm_gpio.summary_irq signed for error handling
Message-Id: <CACRpkdYZBe9AxYoy9k3Nyfocgc1-8OOpZhFb8bdqgDZrwteNHQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075134.GI21844@elgon.mountain>
In-Reply-To: <20131107075134.GI21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:51 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a bug in msm_gpio_probe() where we do:
>
>         msm_gpio.summary_irq = platform_get_irq(pdev, 0);
>         if (msm_gpio.summary_irq < 0) {
>
> The problem is that "msm_gpio.summary_irq" is unsigned so the error
> handling doesn't work.  I've fixed it by making it signed.
>
> Fixes: 43f68444bce7 ('gpio: msm: Add device tree and irqdomain support for gpio-msm-v2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for fixes and tagged for stable.

Yours,
Linus Walleij
