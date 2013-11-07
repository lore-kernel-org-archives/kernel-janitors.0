From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 07 Nov 2013 08:11:18 +0000
Subject: Re: [patch] gpio: rcar: NULL dereference on error in probe()
Message-Id: <CANqRtoSkLBBr0H433JHv8ntjHhJuU4hN8dYpcEC0+7X_unTQRw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075651.GN21844@elgon.mountain>
In-Reply-To: <20131107075651.GN21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Grant Likely <grant.likely@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 4:56 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> It's not obvious from the label name but "err1" tries to release
> "p->irq_domain" which leads to a NULL dereference.
>
> Fixes: 119f5e448d32 ('gpio: Renesas R-Car GPIO driver V3')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index d3f15ae..fe088a3 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -381,7 +381,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>         if (!p->irq_domain) {
>                 ret = -ENXIO;
>                 dev_err(&pdev->dev, "cannot initialize irq domain\n");
> -               goto err1;
> +               goto err0;
>         }
>
>         if (devm_request_irq(&pdev->dev, irq->start,

Hey Dan,

Thanks a lot for the patch, it looks correct to me.

Acked-by: Magnus Damm <damm@opensource.se>

Cheers,

/ magnus
