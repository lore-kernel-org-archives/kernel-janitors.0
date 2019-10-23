From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 23 Oct 2019 04:50:55 +0000
Subject: Re: [PATCH] clocksource/drivers: Fix memory leak in ttc_setup_clockevent
Message-Id: <CAEkB2ES=S64T9FH8bSj=muXD3hSXc3-MWEVt_0sggoTdZFQswg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191021201848.4231-1-navid.emamdoost@gmail.com>
 <fb5d5331-9a89-8370-1e61-396dd05f291a@web.de>
 <2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com>
In-Reply-To: <2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michal Simek <michal.simek@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Markus Elfring <Markus.Elfring@web.de>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org

Thanks for the feedback, I updated this patch and sent v2.
Also, I submitted a patch to fix the error handling path in
ttc_setup_clocksource(). Here is the link to it:
https://lore.kernel.org/patchwork/patch/1143242/

On Tue, Oct 22, 2019 at 3:51 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 22. 10. 19 10:26, Markus Elfring wrote:
> >> In the impelementation of ttc_setup_clockevent() the allocated memory
> >> for ttcce should be released if clk_notifier_register() fails.
> >
> > * Please avoid the copying of typos from previous change descriptions.
> >
> > * Under which circumstances will an “imperative mood” matter for you here?
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n151
> >
> >
> >> +++ b/drivers/clocksource/timer-cadence-ttc.c
> >> @@ -424,6 +424,7 @@ static int __init ttc_setup_clockevent(struct clk *clk,
> >>                                  &ttcce->ttc.clk_rate_change_nb);
> >>      if (err) {
> >>              pr_warn("Unable to register clock notifier.\n");
> >> +            kfree(ttcce);
> >>              return err;
> >>      }
> >
> > This addition looks correct.
> > But I would prefer to move such exception handling code to the end of
> > this function implementation so that duplicate source code will be reduced.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n450
>
> Just a note. Maybe you should also consider to fix this error path in
> ttc_setup_clocksource() when notifier also can fail that there is no
> need to continue with code execution.
>
> Thanks,
> Michal



-- 
Navid.
