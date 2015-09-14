From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 14 Sep 2015 18:45:29 +0000
Subject: Re: [PATCH] serial: sccnxp: convert devm irq to non devm version
Message-Id: <alpine.DEB.2.02.1509142045250.2048@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442151853-16186-1-git-send-email-Julia.Lawall@lip6.fr> <CAOMZO5BPUPW_DerteqxjMLRn-y8jaw149-3ogeq7OHO6uS=TFg@mail.gmail.com>
In-Reply-To: <CAOMZO5BPUPW_DerteqxjMLRn-y8jaw149-3ogeq7OHO6uS=TFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>



On Mon, 14 Sep 2015, Fabio Estevam wrote:

> On Sun, Sep 13, 2015 at 10:44 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> 
> > --- a/drivers/tty/serial/sccnxp.c
> > +++ b/drivers/tty/serial/sccnxp.c
> > @@ -963,11 +963,9 @@ static int sccnxp_probe(struct platform_device *pdev)
> >         sccnxp_write(&s->port[0], SCCNXP_IMR_REG, 0);
> >
> >         if (!s->poll) {
> > -               ret = devm_request_threaded_irq(&pdev->dev, s->irq, NULL,
> > -                                               sccnxp_ist,
> > -                                               IRQF_TRIGGER_FALLING |
> > -                                               IRQF_ONESHOT,
> > -                                               dev_name(&pdev->dev), s);
> > +               ret = request_threaded_irq(s->irq, NULL, sccnxp_ist,
> > +                                          IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > +                                          dev_name(&pdev->dev), s);
> >                 if (!ret)
> >                         return 0;
> >
> > @@ -994,7 +992,7 @@ static int sccnxp_remove(struct platform_device *pdev)
> >         struct sccnxp_port *s = platform_get_drvdata(pdev);
> >
> >         if (!s->poll)
> > -               devm_free_irq(&pdev->dev, s->irq, s);
> > +               free_irq(s->irq, s);
> 
> Couldn't we just remove the devm_free_irq() and keep using
> devm_request_threaded_irq()?
> 
> Like this:

I assumed that if the person went to the trouble of putting it there, it 
was because the interrupt handler needs some data that is freed later in 
the remove function and interrupts have to be turned off at this point.  I 
can look into it more though, but the interactions are not always easy to 
spot.

julia


> 
> --- a/drivers/tty/serial/sccnxp.c
> +++ b/drivers/tty/serial/sccnxp.c
> @@ -993,9 +993,7 @@ static int sccnxp_remove(struct platform_device *pdev)
>         int i;
>         struct sccnxp_port *s = platform_get_drvdata(pdev);
> 
> -       if (!s->poll)
> -               devm_free_irq(&pdev->dev, s->irq, s);
> -       else
> +       if (s->poll)
>                 del_timer_sync(&s->timer);
> 
>         for (i = 0; i < s->uart.nr; i++)
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
