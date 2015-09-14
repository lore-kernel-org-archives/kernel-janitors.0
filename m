From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Sep 2015 16:19:22 +0000
Subject: Re: [PATCH] serial: sccnxp: convert devm irq to non devm version
Message-Id: <CAOMZO5BPUPW_DerteqxjMLRn-y8jaw149-3ogeq7OHO6uS=TFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442151853-16186-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442151853-16186-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Sep 13, 2015 at 10:44 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> --- a/drivers/tty/serial/sccnxp.c
> +++ b/drivers/tty/serial/sccnxp.c
> @@ -963,11 +963,9 @@ static int sccnxp_probe(struct platform_device *pdev)
>         sccnxp_write(&s->port[0], SCCNXP_IMR_REG, 0);
>
>         if (!s->poll) {
> -               ret = devm_request_threaded_irq(&pdev->dev, s->irq, NULL,
> -                                               sccnxp_ist,
> -                                               IRQF_TRIGGER_FALLING |
> -                                               IRQF_ONESHOT,
> -                                               dev_name(&pdev->dev), s);
> +               ret = request_threaded_irq(s->irq, NULL, sccnxp_ist,
> +                                          IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +                                          dev_name(&pdev->dev), s);
>                 if (!ret)
>                         return 0;
>
> @@ -994,7 +992,7 @@ static int sccnxp_remove(struct platform_device *pdev)
>         struct sccnxp_port *s = platform_get_drvdata(pdev);
>
>         if (!s->poll)
> -               devm_free_irq(&pdev->dev, s->irq, s);
> +               free_irq(s->irq, s);

Couldn't we just remove the devm_free_irq() and keep using
devm_request_threaded_irq()?

Like this:

--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -993,9 +993,7 @@ static int sccnxp_remove(struct platform_device *pdev)
        int i;
        struct sccnxp_port *s = platform_get_drvdata(pdev);

-       if (!s->poll)
-               devm_free_irq(&pdev->dev, s->irq, s);
-       else
+       if (s->poll)
                del_timer_sync(&s->timer);

        for (i = 0; i < s->uart.nr; i++)
