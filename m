From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 22 Oct 2020 12:29:49 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201022122949.GW2628@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
In-Reply-To: <1790766.jaFeG3T87Z@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Thu, Oct 22, 2020 at 02:19:29PM +0200, Rafael J. Wysocki wrote:
> > However I do want to retire ondemand, conservative and also very much
> > intel_pstate/active mode.
> 
> I agree in general, but IMO it would not be prudent to do that without making
> schedutil provide the same level of performance in all of the relevant use
> cases.

Agreed; I though to have understood we were there already.
