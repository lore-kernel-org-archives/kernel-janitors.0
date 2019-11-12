From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 12 Nov 2019 08:34:21 +0000
Subject: Re: [PATCH] clocksource/drivers/davinci: fix memory leak on clockevent on error return
Message-Id: <CAMpxmJVjVNXBu5t9Mv8PT854Fh=hH6K-L-BTjhEFMt3nkCcwUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109155836.223635-1-colin.king@canonical.com>
 <CAMpxmJVC5GGhR0z_4CkF7Opfw-5HpEKD8fUrKsgBZTbz0wDd-Q@mail.gmail.com> <alpine.DEB.2.21.1911120033220.1833@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1911120033220.1833@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Colin King <colin.king@canonical.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

wt., 12 lis 2019 o 00:37 Thomas Gleixner <tglx@linutronix.de> napisał(a):
>
> Bartosz,
>
> On Sun, 10 Nov 2019, Bartosz Golaszewski wrote:
> > sob., 9 lis 2019 o 16:58 Colin King <colin.king@canonical.com> napisał(a):
> > >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > In the case where request_irq fails, the return path does not kfree
> > > clockevent and hence we have a memory leak.  Fix this by kfree'ing
>
> s/we have/creates/  or whatever verb you prefer.
>
> > > clockevent before returning.
> > >
> > > Addresses-Coverity: ("Resource leak")
> > > Fixes: 721154f972aa ("clocksource/drivers/davinci: Add support for clockevents")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/clocksource/timer-davinci.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> > > index 62745c962049..910d4d2f0d64 100644
> > > --- a/drivers/clocksource/timer-davinci.c
> > > +++ b/drivers/clocksource/timer-davinci.c
> > > @@ -299,6 +299,7 @@ int __init davinci_timer_register(struct clk *clk,
> > >                          "clockevent/tim12", clockevent);
> > >         if (rv) {
> > >                 pr_err("Unable to request the clockevent interrupt");
> > > +               kfree(clockevent);
> > >                 return rv;
> > >         }
> > >
> > > --
> > > 2.20.1
> > >
> >
> > Hi Daniel,
> >
> > this is what I think the third time someone tries to "fix" this
> > driver's "memory leaks". I'm not sure what the general approach in
> > clocksource is but it doesn't make sense to free resources on
> > non-recoverable errors, does it? Should I add a comment about it or
> > you'll just take those "fixes" to stop further such submissions?
>
> There are two ways to deal with that:
>
>   1) If the error is really unrecoverable, panic right there. No point
>      to continue.

Fair enough.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

>
>   2) If there is even a minimal chance to survive, free the memory and
>      return.
>
> Adding a comment is just a useless non-option.
>
> Thanks,
>
>         tglx
