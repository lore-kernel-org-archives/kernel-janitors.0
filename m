From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Sun, 20 Aug 2017 13:33:06 +0000
Subject: Re: [PATCH] cpufreq: ti: Fix 'of_node_put' being called twice in error handling path
Message-Id: <20170820132106.GA21417@ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170819202246.18415-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170819202246.18415-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: rjw@rjwysocki.net, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19-08-17, 22:22, Christophe JAILLET wrote:
> If 'dev_pm_opp_set_supported_hw()' fails, 'opp_data->opp_node' refcount
> will be decremented 2 times.
> One, just a few lines above, and another one in the error handling path.
> 
> Fix it by simply moving the 'of_node_put' call of the normal path.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/cpufreq/ti-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
> index a7b5658c0460..b29cd3398463 100644
> --- a/drivers/cpufreq/ti-cpufreq.c
> +++ b/drivers/cpufreq/ti-cpufreq.c
> @@ -245,8 +245,6 @@ static int ti_cpufreq_init(void)
>  	if (ret)
>  		goto fail_put_node;
>  
> -	of_node_put(opp_data->opp_node);
> -
>  	ret = PTR_ERR_OR_ZERO(dev_pm_opp_set_supported_hw(opp_data->cpu_dev,
>  							  version, VERSION_COUNT));
>  	if (ret) {
> @@ -255,6 +253,8 @@ static int ti_cpufreq_init(void)
>  		goto fail_put_node;
>  	}
>  
> +	of_node_put(opp_data->opp_node);
> +
>  register_cpufreq_dt:
>  	platform_device_register_simple("cpufreq-dt", -1, NULL, 0);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
