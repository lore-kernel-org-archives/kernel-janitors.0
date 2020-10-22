From: A L <mail@lechevalier.se>
Date: Thu, 22 Oct 2020 15:45:11 +0000
Subject: Re: default cpufreq gov, was: [PATCH] sched/fair: check for idle core
Message-Id: <c232b2.c086afce.17550fc4644@lechevalier.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <34115486.YmRjPRKJaA@kreacher> <20201022120213.GG2611@hirez.programming.kicks-ass.net> <1790766.jaFeG3T87Z@kreacher> <20201022122949.GW2628@hirez.programming.kicks-ass.net>
In-Reply-To: <20201022122949.GW2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>



---- From: Peter Zijlstra <peterz@infradead.org> -- Sent: 2020-10-22 - 14:29 ----

> On Thu, Oct 22, 2020 at 02:19:29PM +0200, Rafael J. Wysocki wrote:
>> > However I do want to retire ondemand, conservative and also very much
>> > intel_pstate/active mode.
>> 
>> I agree in general, but IMO it would not be prudent to do that without making
>> schedutil provide the same level of performance in all of the relevant use
>> cases.
> 
> Agreed; I though to have understood we were there already.

Hi, 


Currently schedutil does not populate all stats like ondemand does, which can be a problem for some monitoring software. 

On my AMD 3000G CPU with kernel-5.9.1:


grep. /sys/devices/system/cpu/cpufreq/policy0/stats/*

With ondemand:
time_in_state:3900000 145179
time_in_state:1600000 9588482
total_trans:177565
trans_table:   From  :    To
trans_table:         :   3900000   1600000
trans_table:  3900000:         0     88783
trans_table:  1600000:     88782         0

With schedutil only two file exists:
reset:<empty>
total_trans:216609 


I'd really like to have these stats populated with schedutil, if that's possible.

Thanks. 
