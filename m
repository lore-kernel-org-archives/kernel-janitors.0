From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 23 Oct 2020 06:24:46 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <20201023061246.irzbrl62baoawmqv@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022071145.GM2628@hirez.programming.kicks-ass.net>
 <20201022104703.nw45dwor6wfn4ity@vireshk-i7>
 <34115486.YmRjPRKJaA@kreacher>
In-Reply-To: <34115486.YmRjPRKJaA@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com

On 22-10-20, 13:45, Rafael J. Wysocki wrote:
> On Thursday, October 22, 2020 12:47:03 PM CEST Viresh Kumar wrote:
> > And I am not really sure why we always wanted this backup performance
> > governor to be there unless the said governors are built as module.
> 
> Apparently, some old drivers had problems with switching frequencies fast enough
> for ondemand to be used with them and the fallback was for those cases.  AFAICS.

Do we still need this ? Or better ask those platforms to individually
enable both of them.

-- 
viresh
