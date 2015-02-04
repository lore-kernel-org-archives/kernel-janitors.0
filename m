From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 04 Feb 2015 14:42:03 +0000
Subject: Re: [PATCH] cpufreq-dt: Delete an unnecessary check before the function call "cpufreq_cooling_unregi
Message-Id: <10630643.iI9BHrsotK@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <54D112A3.1050507@users.sourceforge.net>
In-Reply-To: <54D112A3.1050507@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tuesday, February 03, 2015 07:25:39 PM SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Feb 2015 19:21:21 +0100
> 
> The cpufreq_cooling_unregister() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Queued up for 3.20, thanks!

> ---
>  drivers/cpufreq/cpufreq-dt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index fde97d6..bab67db 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -320,8 +320,7 @@ static int cpufreq_exit(struct cpufreq_policy *policy)
>  {
>  	struct private_data *priv = policy->driver_data;
>  
> -	if (priv->cdev)
> -		cpufreq_cooling_unregister(priv->cdev);
> +	cpufreq_cooling_unregister(priv->cdev);
>  	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
>  	of_free_opp_table(priv->cpu_dev);
>  	clk_put(policy->clk);
> 

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
