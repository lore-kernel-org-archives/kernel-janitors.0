From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 17 Dec 2014 05:38:29 +0000
Subject: Re: [patch] thermal: cpu_cooling: small memory leak on error
Message-Id: <CAOh2x=kRssziL3yu=Fm-N3m0PV3gAMg1_D=9KLem54pr=VbxqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141216235553.GG31467@mwanda>
In-Reply-To: <20141216235553.GG31467@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Linux PM list <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 17, 2014 at 5:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There was a left over return here so the error handling isn't run.
> It leads to a small memory leak and a static checker warning.
>
>         drivers/thermal/cpu_cooling.c:351 __cpufreq_cooling_register()
>         info: ignoring unreachable code.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Fixes: f6859014c7e7 ("thermal: cpu_cooling: Store frequencies in
descending order")

>
> diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
> index 051eb48..9b45f64 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -347,7 +347,6 @@ __cpufreq_cooling_register(struct device_node *np,
>         cpufreq_dev->freq_table = kmalloc(sizeof(*cpufreq_dev->freq_table) *
>                                           cpufreq_dev->max_level, GFP_KERNEL);
>         if (!cpufreq_dev->freq_table) {
> -               return ERR_PTR(-ENOMEM);
>                 cool_dev = ERR_PTR(-ENOMEM);
>                 goto free_cdev;
>         }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
