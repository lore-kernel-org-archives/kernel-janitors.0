From: Mel Gorman <mgorman@suse.de>
Date: Thu, 22 Oct 2020 16:29:43 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201022162943.GL32041@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
 <20201022122949.GW2628@hirez.programming.kicks-ass.net>
 <20201022145250.GK32041@suse.de>
 <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Giovanni Gherdovich <ggherdovich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Thu, Oct 22, 2020 at 05:25:14PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 03:52:50PM +0100, Mel Gorman wrote:
> 
> > There are some questions
> > currently on whether schedutil is good enough when HWP is not available.
> 
> Srinivas and Rafael will know better, but Intel does run a lot of tests
> and IIRC it was found that schedutil was on-par for !HWP. That was the
> basis for commit:
> 
>   33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by default without HWP")
> 
> But now it turns out that commit results in running intel_pstate-passive
> on ondemand, which is quite horrible.
> 

I know Intel ran a lot of tests, no question about it and no fingers are
being pointed. I know I've had enough bugs patches tested with a battery
of tests on various machines and still ended up with bug reports :)

> > There was some evidence (I don't have the data, Giovanni was looking into
> > it) that HWP was a requirement to make schedutil work well.
> 
> That seems to be the question; Rafael just said the opposite.
> 
> > For distros, switching to schedutil by default would be nice because
> > frequency selection state would follow the task instead of being per-cpu
> > and we could stop worrying about different HWP implementations but it's
> 
> s/HWP/cpufreq-governors/ ? But yes.
> 

I've seen cases where HWP had variable behaviour between CPU
generations. It was hard to quantify and/or figure out because HWP is a
black box.

> > not at the point where the switch is advisable. I would expect hard data
> > before switching the default and still would strongly advise having a
> > period of time where we can fall back when someone inevitably finds a
> > new corner case or exception.
> 
> Which is why I advocated to make it 'difficult' to use the old ones and
> only later remove them.
> 

That's fair.

-- 
Mel Gorman
SUSE Labs
