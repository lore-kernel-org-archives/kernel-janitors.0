From: Viresh Kumar <viresh.kumar@st.com>
Date: Wed, 29 Feb 2012 06:46:01 +0000
Subject: Re: [patch] thermal: spear13xx: checking for NULL instead of IS_ERR()
Message-Id: <4F4DC6D9.7050204@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120229063151.GA18031@elgon.mountain>
In-Reply-To: <20120229063151.GA18031@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Armando VISCONTI <armando.visconti@st.com>

On 2/29/2012 12:01 PM, Dan Carpenter wrote:
> thermal_zone_device_register() never returns NULL, on error it returns
> and ERR_PTR().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/thermal/spear_thermal.c b/drivers/thermal/spear_thermal.c
> index 880bf28..7352cf8 100644
> --- a/drivers/thermal/spear_thermal.c
> +++ b/drivers/thermal/spear_thermal.c
> @@ -149,9 +149,9 @@ static int spear_thermal_probe(struct platform_device *pdev)
>  
>  	spear_thermal = thermal_zone_device_register("spear_thermal", 0,
>  				stdev, &ops, 0, 0, 0, 0);
> -	if (!spear_thermal) {
> +	if (IS_ERR(spear_thermal)) {
>  		dev_err(&pdev->dev, "thermal zone device is NULL\n");
> -		ret = -EINVAL;
> +		ret = PTR_ERR(spear_thermal);
>  		goto disable_clk;
>  	}
>  

Thanks.

Reviewed-by: Viresh Kumar <viresh.kumar@st.com>

-- 
viresh
