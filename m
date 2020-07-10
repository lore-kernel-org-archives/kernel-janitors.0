From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 10 Jul 2020 03:44:01 +0000
Subject: Re: [PATCH] cpufreq: intel_pstate: Fix static checker warning for epp variable
Message-Id: <20200710033201.batyrrr7lgqchw4j@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709200522.3566181-1-srinivas.pandruvada@linux.intel.com>
In-Reply-To: <20200709200522.3566181-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: rjw@rjwysocki.net, lenb@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org

On 09-07-20, 13:05, Srinivas Pandruvada wrote:
> Fix warning for:
> drivers/cpufreq/intel_pstate.c:731 store_energy_performance_preference()
> error: uninitialized symbol 'epp'.
> 
> This warning is for a case, when energy_performance_preference attribute
> matches pre defined strings. In this case the value of raw epp will not
> be used to set EPP bits in MSR_HWP_REQUEST. So initializing with any
> value is fine.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> This patch is on top of bleed-edge branch at
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/rafael/linux-pm
> 
>  drivers/cpufreq/intel_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 44c7b4677675..94cd07678ee3 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -709,7 +709,7 @@ static ssize_t store_energy_performance_preference(
>  	struct cpudata *cpu_data = all_cpu_data[policy->cpu];
>  	char str_preference[21];
>  	bool raw = false;
> -	u32 epp;
> +	u32 epp = 0;
>  	int ret;
>  
>  	ret = sscanf(buf, "%20s", str_preference);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
