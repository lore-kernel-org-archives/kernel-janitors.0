From: Mel Gorman <mgorman@suse.de>
Date: Thu, 22 Oct 2020 20:32:55 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <20201022203255.GN32041@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
 <20201022122949.GW2628@hirez.programming.kicks-ass.net>
 <20201022145250.GK32041@suse.de>
 <6606e5f4-3f66-5844-da02-5b11e1464be6@canonical.com>
 <20201022151200.GC92942@lorien.usersys.redhat.com>
 <20201022163509.GM32041@suse.de>
 <CAJZ5v0he839sJNh0xjmvLqzuE7X27PgJKxtSV8giZh004E7pXw@mail.gmail.com>
In-Reply-To: <CAJZ5v0he839sJNh0xjmvLqzuE7X27PgJKxtSV8giZh004E7pXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, Colin Ian King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Giovanni Gherdovich <ggherdovich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Thu, Oct 22, 2020 at 07:59:43PM +0200, Rafael J. Wysocki wrote:
> > > Agreed. I'd like the option to switch back if we make the default change.
> > > It's on the table and I'd like to be able to go that way.
> > >
> >
> > Yep. It sounds chicken, but it's a useful safety net and a reasonable
> > way to deprecate a feature. It's also useful for bug creation -- User X
> > running whatever found that schedutil is worse than the old governor and
> > had to temporarily switch back. Repeat until complaining stops and then
> > tear out the old stuff.
> >
> > When/if there is a patch setting schedutil as the default, cc suitable
> > distro people (Giovanni and myself for openSUSE).
> 
> So for the record, Giovanni was on the CC list of the "cpufreq:
> intel_pstate: Use passive mode by default without HWP" patch that this
> discussion resulted from (and which kind of belongs to the above
> category).
> 

Oh I know, I did not mean to suggest that you did not. He made people
aware that this was going to be coming down the line and has been looking
into the "what if schedutil was the default" question.  AFAIK, it's still
a work-in-progress and I don't know all the specifics but he knows more
than I do on the topic. I only know enough that if we flipped the switch
tomorrow that we could be plagued with google searches suggesting it be
turned off again just like there is still broken advice out there about
disabling intel_pstate for usually the wrong reasons.

The passive patch was a clear flag that the intent is that schedutil will
be the default at some unknown point in the future. That point is now a
bit closer and this thread could have encouraged a premature change of
the default resulting in unfair finger pointing at one company's test
team. If at least two distos check it out and it still goes wrong, at
least there will be shared blame :/

> > Other distros assuming they're watching can nominate their own victim.
> 
> But no other victims had been nominated at that time.

We have one, possibly two if Phil agrees. That's better than zero or
unfairly placing the full responsibility on the Intel guys that have been
testing it out.

-- 
Mel Gorman
SUSE Labs
