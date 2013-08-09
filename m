From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 09 Aug 2013 15:16:41 +0000
Subject: Re: [PATCH] trivial: convert comma to semicolon
Message-Id: <alpine.DEB.2.02.1308091715310.2295@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375990372-19033-1-git-send-email-Julia.Lawall@lip6.fr> <1375990372-19033-2-git-send-email-Julia.Lawall@lip6.fr> <CACQ1gAg__bY9pCnGnkf2QGHkBvssXXdS3bMJiuOJfh9e082jhA@mail.gmail.com>
In-Reply-To: <CACQ1gAg__bY9pCnGnkf2QGHkBvssXXdS3bMJiuOJfh9e082jhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Genoud <richard.genoud@gmail.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Fri, 9 Aug 2013, Richard Genoud wrote:
> > diff --git a/drivers/clocksource/time-armada-370-xp.c b/drivers/clocksource/time-armada-370-xp.c
> > index 847cab6..8149b7b 100644
> > --- a/drivers/clocksource/time-armada-370-xp.c
> > +++ b/drivers/clocksource/time-armada-370-xp.c
> > @@ -175,10 +175,10 @@ static int armada_370_xp_timer_setup(struct clock_event_device *evt)
> >         evt->name               = "armada_370_xp_per_cpu_tick",
> There's one missed just here !                                  ^
>
> >         evt->features           = CLOCK_EVT_FEAT_ONESHOT |
> >                                   CLOCK_EVT_FEAT_PERIODIC;
> > -       evt->shift              = 32,
> > -       evt->rating             = 300,
> > -       evt->set_next_event     = armada_370_xp_clkevt_next_event,
> > -       evt->set_mode           = armada_370_xp_clkevt_mode,
> > +       evt->shift              = 32;
> > +       evt->rating             = 300;
> > +       evt->set_next_event     = armada_370_xp_clkevt_next_event;
> > +       evt->set_mode           = armada_370_xp_clkevt_mode;
> >         evt->irq                = armada_370_xp_clkevt_irq;
> >         evt->cpumask            = cpumask_of(cpu);
> >
> [snip]
>
> The rest looks good to me !

Thanks for the feedback.  I was going to try to make a patch that does
everything that this one does not, but it is not working out very well, so
I will make a new patch that does everything.

julia
