From: Jingoo Han <jg1.han@samsung.com>
Date: Thu, 29 May 2014 01:44:51 +0000
Subject: Re: [PATCH v2] mfd: fix unintentional NULL check in menelaus_set_voltage()
Message-Id: <000d01cf7adf$9528f9e0$bf7aeda0$%han@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401295431-23833-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401295431-23833-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Emil Goode' <emilgoode@gmail.com>, 'Lee Jones' <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Samuel Ortiz' <sameo@linux.intel.com>, 'Trilok Soni' <tsoni@codeaurora.org>, 'Tony Lindgren' <tony@atomide.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, May 29, 2014 1:44 AM, Emil Goode wrote:
> 
> The struct menelaus_vtg pointer vtg cannot be NULL here
> so the condition is never true and if it ever was true
> it would lead to a NULL pointer dereference when we goto
> label set_voltage.
> 
> Before the below patch was applied the code was:
> 
> if (vtg = 0)
> 
> The intention was to check if vtg_val is 0.
> 
> commit 59a9f7a32adf6537b4e4db8ca204eeb77d7a634e
> ("mfd: menelaus: Use NULL instead of 0")
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> v2: Changed (vtg_val = 0) to (!vtg_val)
> 
>  drivers/mfd/menelaus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> index ad25bfa..40df76a 100644
> --- a/drivers/mfd/menelaus.c
> +++ b/drivers/mfd/menelaus.c
> @@ -466,7 +466,7 @@ static int menelaus_set_voltage(const struct menelaus_vtg *vtg, int mV,
>  	struct i2c_client *c = the_menelaus->client;
> 
>  	mutex_lock(&the_menelaus->lock);
> -	if (!vtg)
> +	if (!vtg_val)
>  		goto set_voltage;

(+cc Trilok Soni, Tony Lindgren)

In this case, if 'vtg_val' is 0, setting voltage as 0 for
registers such as MENELAUS_xxx_CTRLx will be skipped. So,
it is not possible to set the voltage value as 0.

Is it right? If not, how about just removing this check and
the label 'set_voltage'?

Best regards,
Jingoo Han

> 
>  	ret = menelaus_read_reg(vtg->vtg_reg);
> --
> 1.7.10.4

