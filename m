From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 21 Oct 2020 12:19:50 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <20201021121950.GF2628@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de>
 <alpine.DEB.2.22.394.2010211336410.8475@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2010211336410.8475@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, viresh.kumar@linaro.org, srinivas.pandruvada@linux.intel.com

On Wed, Oct 21, 2020 at 01:56:55PM +0200, Julia Lawall wrote:
> Prior to 5.8, my machine was using intel_pstate and had few background
> tasks.  Thus the problem wasn't visible in practice.  Starting with 5.8
> the kernel decided that intel_cpufreq would be more appropriate, which
> introduced kworkers every 0.004 seconds on all cores.

That still doesn't make any sense. Are you running the legacy on-demand
thing or something?

Rafael, Srinivas, Viresh, how come it defaults to that?
