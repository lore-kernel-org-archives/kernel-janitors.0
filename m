From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 22 Dec 2020 04:47:05 +0000
Subject: Re: [PATCH] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in the error handling path of the 
Message-Id: <20201222043505.rq3cmajc3mxv3p2z@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219101751.181783-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: f.fainelli@gmail.com, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, mmayer@broadcom.com, linux-arm-kernel@lists.infradead.org

On 19-12-20, 11:17, Christophe JAILLET wrote:
> If 'cpufreq_register_driver()' fails, we must release the resources
> allocated in 'brcm_avs_prepare_init()' as already done in the remove
> function.
> 
> To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
> to avoid code duplication. This also makes the code more readable (IMHO).
> 
> Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I'm not sure that the existing error handling in the remove function is
> correct and/or needed.
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> index 3e31e5d28b79..750ca7cfccb0 100644
> --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> @@ -597,6 +597,16 @@ static int brcm_avs_prepare_init(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void brcm_avs_prepare_uninit(struct platform_device *pdev)
> +{
> +	struct private_data *priv;
> +
> +	priv = platform_get_drvdata(pdev);
> +
> +	iounmap(priv->avs_intr_base);
> +	iounmap(priv->base);
> +}
> +
>  static int brcm_avs_cpufreq_init(struct cpufreq_policy *policy)
>  {
>  	struct cpufreq_frequency_table *freq_table;
> @@ -732,21 +742,26 @@ static int brcm_avs_cpufreq_probe(struct platform_device *pdev)
>  
>  	brcm_avs_driver.driver_data = pdev;
>  
> -	return cpufreq_register_driver(&brcm_avs_driver);
> +	ret = cpufreq_register_driver(&brcm_avs_driver);
> +	if (ret)
> +		goto err_uninit;
> +
> +	return 0;
> +
> +err_uninit:
> +	brcm_avs_prepare_uninit(pdev);
> +	return ret;

Maybe rewrite as:

	ret = cpufreq_register_driver(&brcm_avs_driver);
	if (ret)
                brcm_avs_prepare_uninit(pdev);
	return ret;

>  }
>  
>  static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
>  {
> -	struct private_data *priv;
>  	int ret;
>  
>  	ret = cpufreq_unregister_driver(&brcm_avs_driver);
>  	if (ret)
>  		return ret;

Instead of returning here, it can be just WARN_ON(ret); and then go on and free
the resources and this needs to be done in a separate patch.

>  
> -	priv = platform_get_drvdata(pdev);
> -	iounmap(priv->base);
> -	iounmap(priv->avs_intr_base);
> +	brcm_avs_prepare_uninit(pdev);
>  
>  	return 0;
>  }

-- 
viresh
