From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 21 Oct 2020 17:39:02 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <alpine.DEB.2.22.394.2010211937150.8475@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book> <20201021124700.GE32041@suse.de> <alpine.DEB.2.22.394.2010211452100.8475@hadrien> <20201021131827.GF32041@suse.de>
 <alpine.DEB.2.22.394.2010211522340.57356@hadrien> <20201021150800.GG32041@suse.de> <CAKfTPtDs1t6mt7fPgoGg+fT-JKmaqWybNVBN3kZhag6M4+8RUg@mail.gmail.com> <20201021170050.GI32041@suse.de>
In-Reply-To: <20201021170050.GI32041@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mel Gorman <mgorman@suse.de>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>



On Wed, 21 Oct 2020, Mel Gorman wrote:

> On Wed, Oct 21, 2020 at 05:19:53PM +0200, Vincent Guittot wrote:
> > On Wed, 21 Oct 2020 at 17:08, Mel Gorman <mgorman@suse.de> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 03:24:48PM +0200, Julia Lawall wrote:
> > > > > I worry it's overkill because prev is always used if it is idle even
> > > > > if it is on a node remote to the waker. It cuts off the option of a
> > > > > wakee moving to a CPU local to the waker which is not equivalent to the
> > > > > original behaviour.
> > > >
> > > > But it is equal to the original behavior in the idle prev case if you go
> > > > back to the runnable load average days...
> > > >
> > >
> > > It is similar but it misses the sync treatment and sd->imbalance_pct part of
> > > wake_affine_weight which has unpredictable consequences. The data
> > > available is only on the fully utilised case.
> >
> > In fact It's the same because runnable_load_avg was null when cpu is idle, so
> > if prev_cpu was idle, we were selecting prev_idle
> >
>
> Sync wakeups may only consider this_cpu and the load of the waker but
> in that case, it was probably selected already by the sync check in
> wake_affine_idle which will pass except when the domain is overloaded.
> Fair enough, I'll withdraw any concerns. It could have done with a
> comment :/

Sure, I'll resend the patch and extend the log message with this issue.

Otherwise, I was wondering are there any particular kinds of applications
where gathering the threads back with the waker is a good idea?  I've been
looking more at applications with N threads on N cores, where it would be
best for the threads to remain where they are.

thanks,
julia
