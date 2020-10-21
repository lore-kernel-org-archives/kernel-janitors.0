From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 21 Oct 2020 12:27:34 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <CAKfTPtBhLLSjqAAbN7jO0vDi6Tr8J4CnoggM2DuBU98i9oCmpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <CAKfTPtB41JopBq0CZVvo16N1u+2Smmc1TamJXkbTVj-pRJeHzA@mail.gmail.com>
In-Reply-To: <CAKfTPtB41JopBq0CZVvo16N1u+2Smmc1TamJXkbTVj-pRJeHzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>

On Wed, 21 Oct 2020 at 09:29, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> Hi Julia,
>
> On Tue, 20 Oct 2020 at 19:21, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> >
> > On a thread wakeup, the change [1] from runnable load average to load
> > average for comparing candidate cores means that recent short-running
> > daemons on the core where a thread ran previously can be considered to
> > have a higher load than the core performing the wakeup, even when the
> > core where the thread ran previously is currently idle.  This can
> > cause a thread to migrate, taking the place of some other thread that
> > is about to wake up, and so on.  To avoid unnecessary migrations,
> > extend wake_affine_idle to check whether the core where the thread
> > previously ran is currently idle, and if so return that core as the
> > target.
> >
> > [1] commit 11f10e5420f6ce ("sched/fair: Use load instead of runnable
> > load in wakeup path")
> >
> > This particularly has an impact when using passive (intel_cpufreq)
> > power management, where kworkers run every 0.004 seconds on all cores,
> > increasing the likelihood that an idle core will be considered to have
> > a load.
> >
> > The following numbers were obtained with the benchmarking tool
> > hyperfine (https://github.com/sharkdp/hyperfine) on the NAS parallel
> > benchmarks (https://www.nas.nasa.gov/publications/npb.html).  The
> > tests were run on an 80-core Intel(R) Xeon(R) CPU E7-8870 v4 @
> > 2.10GHz.  Active (intel_pstate) and passive (intel_cpufreq) power
> > management were used.  Times are in seconds.  All experiments use all
> > 160 hardware threads.
> >
> >         v5.9/active             v5.9+patch/active
> > bt.C.c  24.725724+-0.962340     23.349608+-1.607214
> > lu.C.x  29.105952+-4.804203     25.249052+-5.561617
> > sp.C.x  31.220696+-1.831335     30.227760+-2.429792
> > ua.C.x  26.606118+-1.767384     25.778367+-1.263850
> >
> >         v5.9/passive            v5.9+patch/passive
> > bt.C.c  25.330360+-1.028316     23.544036+-1.020189
> > lu.C.x  35.872659+-4.872090     23.719295+-3.883848
> > sp.C.x  32.141310+-2.289541     29.125363+-0.872300
> > ua.C.x  29.024597+-1.667049     25.728888+-1.539772
> >
> > On the smaller data sets (A and B) and on the other NAS benchmarks
> > there is no impact on performance.
> >

A fix tag is missing
Fixes: 11f10e5420f6 ("sched/fair: Use load instead of runnable load in
wakeup path")

> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> Reviewed-by Vincent Guittot <vincent.guittot@linaro.org>
>
> >
> > ---
> >  kernel/sched/fair.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index aa4c6227cd6d..9b23dad883ee 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5804,6 +5804,9 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
> >         if (sync && cpu_rq(this_cpu)->nr_running = 1)
> >                 return this_cpu;
> >
> > +       if (available_idle_cpu(prev_cpu))
> > +               return prev_cpu;
> > +
> >         return nr_cpumask_bits;
> >  }
> >
> >
