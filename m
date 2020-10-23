From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Fri, 23 Oct 2020 17:46:35 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <4a0db95a-1ba2-21f5-5c9d-67b9f82ed130@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <34115486.YmRjPRKJaA@kreacher>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <1790766.jaFeG3T87Z@kreacher>
 <20201022122949.GW2628@hirez.programming.kicks-ass.net>
 <20201022145250.GK32041@suse.de>
 <20201022152514.GJ2611@hirez.programming.kicks-ass.net>
 <1603397435.16275.45.camel@suse.com>
 <20201023070310.GK2611@hirez.programming.kicks-ass.net>
In-Reply-To: <20201023070310.GK2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Giovanni Gherdovich <ggherdovich@suse.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>, puwen@hygon.cn, yazen.ghannam@amd.com, kim.phillips@amd.com, suravee.suthikulpanit@amd.com, "Fontenot, Nathan" <Nathan.Fontenot@amd.com>

On 10/23/20 2:03 AM, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 10:10:35PM +0200, Giovanni Gherdovich wrote:
>> * for the AMD EPYC machines we haven't yet implemented frequency invariant
>>    accounting, which might explain why schedutil looses to ondemand on all
>>    the benchmarks.
> 
> Right, I poked the AMD people on that a few times, but nothing seems to
> be forthcoming :/ Tom, any way you could perhaps expedite the matter?

Adding Nathan to the thread to help out here.

Thanks,
Tom

> 
> In particular we're looking for some X86_VENDOR_AMD/HYGON code to run in
> 
>    arch/x86/kernel/smpboot.c:init_freq_invariance()
> 
> The main issue is finding a 'max' frequency that is not the absolute max
> turbo boost (this could result in not reaching it very often) but also
> not too low such that we're always clipping.
> 
> And while we're here, IIUC AMD is still using acpi_cpufreq, but AFAIK
> the chips have a CPPC interface which could be used instead. Is there
> any progress on that?
> 
