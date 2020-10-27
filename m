From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 27 Oct 2020 03:13:30 +0000
Subject: Re: [PATCH v2] cpufreq: Avoid configuring old governors as default with intel_pstate
Message-Id: <20201027030130.uz2vl77dj7ii7gfv@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201022120213.GG2611@hirez.programming.kicks-ass.net>
 <8312288.dAKoTdFk2S@kreacher>
 <9382251.a2nkXps1mP@kreacher>
In-Reply-To: <9382251.a2nkXps1mP@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles Muller <Gilles.Muller@inria.fr>, srinivas.pandruvada@linux.intel.com, Linux PM <linux-pm@vger.kernel.org>, Len Brown <len.brown@intel.com>

On 23-10-20, 17:15, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Commit 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by
> default without HWP") was meant to cause intel_pstate to be used
> in the passive mode with the schedutil governor on top of it, but
> it missed the case in which either "ondemand" or "conservative"
> was selected as the default governor in the existing kernel config,
> in which case the previous old governor configuration would be used,
> causing the default legacy governor to be used on top of intel_pstate
> instead of schedutil.
> 
> Address this by preventing "ondemand" and "conservative" from being
> configured as the default cpufreq governor in the case when schedutil
> is the default choice for the default governor setting.
> 
> [Note that the default cpufreq governor can still be set via the
>  kernel command line if need be and that choice is not limited,
>  so if anyone really wants to use one of the legacy governors by
>  default, it can be achieved this way.]
> 
> Fixes: 33aa46f252c7 ("cpufreq: intel_pstate: Use passive mode by default without HWP")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Cc: 5.8+ <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
> 
> The v2 addresses a review comment from Viresh regarding of the expression format
> and adds a missing Reported-by for Julia.
> 
> ---
>  drivers/cpufreq/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
