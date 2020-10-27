From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 27 Oct 2020 11:42:14 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201027114214.irsgdlfvyo46jpww@e107158-lin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022071145.GM2628@hirez.programming.kicks-ass.net>
 <20201022104703.nw45dwor6wfn4ity@vireshk-i7>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <20201027111133.ajlxn5lbnfeocfgb@e107158-lin>
 <jhjlffrq58y.mognet@arm.com>
In-Reply-To: <jhjlffrq58y.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com

On 10/27/20 11:26, Valentin Schneider wrote:
> 
> On 27/10/20 11:11, Qais Yousef wrote:
> > On 10/22/20 14:02, Peter Zijlstra wrote:
> >> However I do want to retire ondemand, conservative and also very much
> >> intel_pstate/active mode. I also have very little sympathy for
> >> userspace.
> >
> > Userspace is useful for testing and sanity checking. Not sure if people use it
> > to measure voltage/current at each frequency to generate
> > dynamic-power-coefficient for their platform. Lukasz, Dietmar?
> >
> 
> It's valuable even just for cpufreq sanity checking - we have that test
> that goes through increasing frequencies and asserts the work done is
> monotonically increasing. This has been quite useful in the past to detect
> broken bits.
> 
> That *should* still be totally doable with any other governor by using the
> scaling_{min, max}_freq sysfs interface.

True. This effectively makes every governor a potential user space governor.

/me not sure to be happy or grumpy about it

Thanks

--
Qais Yousef
