From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 19 Aug 2019 06:58:22 +0000
Subject: Re: [PATCH] cpufreq: remove redundant assignment to ret
Message-Id: <20190819065814.333kowws4mpw3qfx@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813122121.28160-1-colin.king@canonical.com>
In-Reply-To: <20190813122121.28160-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 13-08-19, 13:21, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ret is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/cpufreq/cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index c28ebf2810f1..26d82e0a2de5 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2140,7 +2140,7 @@ int cpufreq_driver_target(struct cpufreq_policy *policy,
>  			  unsigned int target_freq,
>  			  unsigned int relation)
>  {
> -	int ret = -EINVAL;
> +	int ret;
>  
>  	down_write(&policy->rwsem);
>  

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
