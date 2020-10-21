From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 21 Oct 2020 15:18:00 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <alpine.DEB.2.22.394.2010211714300.8475@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book> <20201021124700.GE32041@suse.de> <alpine.DEB.2.22.394.2010211452100.8475@hadrien> <20201021131827.GF32041@suse.de>
 <alpine.DEB.2.22.394.2010211522340.57356@hadrien> <20201021150800.GG32041@suse.de>
In-Reply-To: <20201021150800.GG32041@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mel Gorman <mgorman@suse.de>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>



On Wed, 21 Oct 2020, Mel Gorman wrote:

> On Wed, Oct 21, 2020 at 03:24:48PM +0200, Julia Lawall wrote:
> > > I worry it's overkill because prev is always used if it is idle even
> > > if it is on a node remote to the waker. It cuts off the option of a
> > > wakee moving to a CPU local to the waker which is not equivalent to the
> > > original behaviour.
> >
> > But it is equal to the original behavior in the idle prev case if you go
> > back to the runnable load average days...
> >
>
> It is similar but it misses the sync treatment and sd->imbalance_pct part of
> wake_affine_weight which has unpredictable consequences. The data
> available is only on the fully utilised case.

OK, what if my patch were:

@@ -5800,6 +5800,9 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
 	if (sync && cpu_rq(this_cpu)->nr_running = 1)
 		return this_cpu;

+	if (!sync && available_idle_cpu(prev_cpu))
+		return prev_cpu;
+
 	return nr_cpumask_bits;
 }

The sd->imbalance_pct part would have previously been a multiplication by
0, so it doesn't need to be taken into account.

julia

>
> > The problem seems impossible to solve, because there is no way to know by
> > looking only at prev and this whether the thread would prefer to stay
> > where it was or go to the waker.
> >
>
> Yes, this is definitely true. Looking at prev_cpu and this_cpu is a
> crude approximation and the path is heavily limited in terms of how
> clever it can be.
>
> --
> Mel Gorman
> SUSE Labs
>
