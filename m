From: Alexandre Courbot <gnurou@gmail.com>
Date: Mon, 09 Feb 2015 05:29:29 +0000
Subject: Re: [patch] gpio: ge: fix error code in gef_gpio_probe()
Message-Id: <CAAVeFuKOzMQDeOyxUHdLc19480u+JyN5xb+2cK4rx9s7jcioAw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128191320.GB10259@mwanda>
In-Reply-To: <20150128191320.GB10259@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kamlakant Patel <kamlakant.patel@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jan 29, 2015 at 4:13 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If kstrdup() fails then we should return -ENOMEM but instead the current
> code returns success.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
> index 6ea9303..07e9b39 100644
> --- a/drivers/gpio/gpio-ge.c
> +++ b/drivers/gpio/gpio-ge.c
> @@ -77,8 +77,10 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
>
>         /* Setup pointers to chip functions */
>         bgc->gc.label = kstrdup(pdev->dev.of_node->full_name, GFP_KERNEL);
> -       if (!bgc->gc.label)
> +       if (!bgc->gc.label) {
> +               ret = -ENOMEM;
>                 goto err0;
> +       }

This one is already fixed by
http://www.spinics.net/lists/linux-gpio/msg03670.html
