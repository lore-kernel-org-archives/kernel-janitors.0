From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 03 Jun 2019 05:57:07 +0000
Subject: Re: [PATCH -next] cpufreq: armada-37xx: Remove set but not used variable 'freq'
Message-Id: <20190603055702.thhlyazwqmekdvyd@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190601074338.64187-1-yuehaibing@huawei.com>
In-Reply-To: <20190601074338.64187-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On 01-06-19, 07:43, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/cpufreq/armada-37xx-cpufreq.c: In function 'armada37xx_cpufreq_avs_setup':
> drivers/cpufreq/armada-37xx-cpufreq.c:260:28: warning:
>  variable 'freq' set but not used [-Wunused-but-set-variable]
> 
> It's never used since introduction in commit 1c3528232f4b ("cpufreq:
> armada-37xx: Add AVS support")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
> index 0df16eb1eb3c..aa0f06dec959 100644
> --- a/drivers/cpufreq/armada-37xx-cpufreq.c
> +++ b/drivers/cpufreq/armada-37xx-cpufreq.c
> @@ -257,7 +257,7 @@ static void __init armada37xx_cpufreq_avs_configure(struct regmap *base,
>  static void __init armada37xx_cpufreq_avs_setup(struct regmap *base,
>  						struct armada_37xx_dvfs *dvfs)
>  {
> -	unsigned int avs_val = 0, freq;
> +	unsigned int avs_val = 0;
>  	int load_level = 0;
>  
>  	if (base = NULL)
> @@ -275,8 +275,6 @@ static void __init armada37xx_cpufreq_avs_setup(struct regmap *base,
>  
>  
>  	for (load_level = 1; load_level < LOAD_LEVEL_NR; load_level++) {
> -		freq = dvfs->cpu_freq_max / dvfs->divider[load_level];
> -
>  		avs_val = dvfs->avs[load_level];
>  		regmap_update_bits(base, ARMADA_37XX_AVS_VSET(load_level-1),
>  		    ARMADA_37XX_AVS_VDD_MASK << ARMADA_37XX_AVS_HIGH_VDD_LIMIT |
> 

Applied. Thanks.

-- 
viresh
