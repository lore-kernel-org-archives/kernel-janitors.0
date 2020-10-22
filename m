From: Giovanni Gherdovich <ggherdovich@suse.com>
Date: Thu, 22 Oct 2020 20:16:00 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <1603397760.16275.49.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
         <34115486.YmRjPRKJaA@kreacher>
         <20201022120213.GG2611@hirez.programming.kicks-ass.net>
         <1790766.jaFeG3T87Z@kreacher>
         <20201022122949.GW2628@hirez.programming.kicks-ass.net>
         <20201022145250.GK32041@suse.de>
         <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
         <1603397435.16275.45.camel@suse.com>
In-Reply-To: <1603397435.16275.45.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Thu, 2020-10-22 at 22:10 +0200, Giovanni Gherdovich wrote:
> [...]
> To read the tables:
> 
> Tilde (~) means the result is the same as baseline (or, the ratio is close
> to 1). The double asterisk (**) is a visual aid and means the result is
> worse than baseline (higher or lower depending on the case).

Ouch, the opposite. Double asterisk (**) is where the result is better
than baseline, and schedutil needs improvement.


Giovanni
