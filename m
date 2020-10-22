From: Mel Gorman <mgorman@suse.de>
Date: Thu, 22 Oct 2020 14:52:50 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201022145250.GK32041@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
 <20201022122949.GW2628@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022122949.GW2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Giovanni Gherdovich <ggherdovich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Thu, Oct 22, 2020 at 02:29:49PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 02:19:29PM +0200, Rafael J. Wysocki wrote:
> > > However I do want to retire ondemand, conservative and also very much
> > > intel_pstate/active mode.
> > 
> > I agree in general, but IMO it would not be prudent to do that without making
> > schedutil provide the same level of performance in all of the relevant use
> > cases.
> 
> Agreed; I though to have understood we were there already.

AFAIK, not quite (added Giovanni as he has been paying more attention).
Schedutil has improved since it was merged but not to the extent where
it is a drop-in replacement. The standard it needs to meet is that
it is at least equivalent to powersave (in intel_pstate language)
or ondemand (acpi_cpufreq) and within a reasonable percentage of the
performance governor. Defaulting to performance is a) giving up and b)
the performance governor is not a universal win. There are some questions
currently on whether schedutil is good enough when HWP is not available.
There was some evidence (I don't have the data, Giovanni was looking into
it) that HWP was a requirement to make schedutil work well. That is a
hazard in itself because someone could test on the latest gen Intel CPU
and conclude everything is fine and miss that Intel-specific technology
is needed to make it work well while throwing everyone else under a bus.
Giovanni knows a lot more than I do about this, I could be wrong or
forgetting things.

For distros, switching to schedutil by default would be nice because
frequency selection state would follow the task instead of being per-cpu
and we could stop worrying about different HWP implementations but it's
not at the point where the switch is advisable. I would expect hard data
before switching the default and still would strongly advise having a
period of time where we can fall back when someone inevitably finds a
new corner case or exception.

For reference, SLUB had the same problem for years. It was switched
on by default in the kernel config but it was a long time before
SLUB was generally equivalent to SLAB in terms of performance. Block
multiqueue also had vaguely similar issues before the default changes
and a period of time before it was removed removed (example whinging mail
https://lore.kernel.org/lkml/20170803085115.r2jfz2lofy5spfdb@techsingularity.net/)
It's schedutil's turn :P

-- 
Mel Gorman
SUSE Labs
