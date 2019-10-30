From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 30 Oct 2019 15:15:51 +0000
Subject: Re: [PATCH][next] soc: samsung: exynos-asv: fix potential overflow in multiply
Message-Id: <20191030151551.GA25718@pi3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030145457.10120-1-colin.king@canonical.com>
In-Reply-To: <20191030145457.10120-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 30, 2019 at 02:54:57PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The multiplication of opp_freq by MHZ is performed using unsigned int
> multiplication however the result is being passed into a function where
> the frequency is an unsigned long, so there is an expectation that the
> result won't fit into an unsigned int. Fix any potential integer overflow
> my making opp_freq an unsigned long.  Also change from %u to %lu format
> specifiers
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")

Although I like the idea of using the same type as the
dev_pm_opp_find_freq_exact() interface, but I do not agree with severity
of this. This is currently only ARMv7 (32-bit) driver, so using long
does not change anything. It's still 4 bytes and it is still up to 4
GHz.

Therefore on ARMv7, the possibility of overflow is exactly the same as
before. Nothing was fixed.

If we really want to fix it, then all this should be "long long" or
value should be checked while parsing DT.

Semantically I agree, so I would prefer to adjust only the commit
message.

Best regards,
Krzysztof


> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/soc/samsung/exynos-asv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
> index 8abf4dfaa5c5..d66fc74379a3 100644
> --- a/drivers/soc/samsung/exynos-asv.c
> +++ b/drivers/soc/samsung/exynos-asv.c
> @@ -30,7 +30,7 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
>  {
>  	struct exynos_asv_subsys *subsys = NULL;
>  	struct dev_pm_opp *opp;
> -	unsigned int opp_freq;
> +	unsigned long opp_freq;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(asv->subsys); i++) {
> @@ -51,7 +51,7 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
>  
>  		opp = dev_pm_opp_find_freq_exact(cpu, opp_freq * MHZ, true);
>  		if (IS_ERR(opp)) {
> -			dev_info(asv->dev, "cpu%d opp%d, freq: %u missing\n",
> +			dev_info(asv->dev, "cpu%d opp%d, freq: %lu missing\n",
>  				 cpu->id, i, opp_freq);
>  
>  			continue;
> @@ -68,11 +68,11 @@ static int exynos_asv_update_cpu_opps(struct exynos_asv *asv,
>  						new_volt, new_volt, new_volt);
>  		if (ret < 0)
>  			dev_err(asv->dev,
> -				"Failed to adjust OPP %u Hz/%u uV for cpu%d\n",
> +				"Failed to adjust OPP %lu Hz/%u uV for cpu%d\n",
>  				opp_freq, new_volt, cpu->id);
>  		else
>  			dev_dbg(asv->dev,
> -				"Adjusted OPP %u Hz/%u -> %u uV, cpu%d\n",
> +				"Adjusted OPP %lu Hz/%u -> %u uV, cpu%d\n",
>  				opp_freq, volt, new_volt, cpu->id);
>  	}
>  
> -- 
> 2.20.1
> 
