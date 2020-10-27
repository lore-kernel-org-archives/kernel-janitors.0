From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 27 Oct 2020 11:11:33 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201027111133.ajlxn5lbnfeocfgb@e107158-lin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022071145.GM2628@hirez.programming.kicks-ass.net>
 <20201022104703.nw45dwor6wfn4ity@vireshk-i7>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022120213.GG2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com

On 10/22/20 14:02, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 01:45:25PM +0200, Rafael J. Wysocki wrote:
> > On Thursday, October 22, 2020 12:47:03 PM CEST Viresh Kumar wrote:
> > > On 22-10-20, 09:11, Peter Zijlstra wrote:
> > > > Well, but we need to do something to force people onto schedutil,
> > > > otherwise we'll get more crap like this thread.
> > > > 
> > > > Can we take the choice away? Only let Kconfig select which governors are
> > > > available and then set the default ourselves? I mean, the end goal being
> > > > to not have selectable governors at all, this seems like a good step
> > > > anyway.
> > > 
> > > Just to clarify and complete the point a bit here, the users can still
> > > pass the default governor from cmdline using
> > > cpufreq.default_governor=, which will take precedence over the one the
> > > below code is playing with. And later once the kernel is up, they can
> > > still choose a different governor from userspace.
> > 
> > Right.
> > 
> > Also some people simply set "performance" as the default governor and then
> > don't touch cpufreq otherwise (the idea is to get everything to the max
> > freq right away and stay in that mode forever).  This still needs to be
> > possible IMO.
> 
> Performance/powersave make sense to keep.
> 
> However I do want to retire ondemand, conservative and also very much
> intel_pstate/active mode. I also have very little sympathy for
> userspace.

Userspace is useful for testing and sanity checking. Not sure if people use it
to measure voltage/current at each frequency to generate
dynamic-power-coefficient for their platform. Lukasz, Dietmar?

Thanks

--
Qais Yousef

> 
> We should start by making it hard to use them and eventually just delete
> them outright.
> 
