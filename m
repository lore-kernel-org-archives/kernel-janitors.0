From: Vincenzo Frascino <vincenzo.frascino@st.com>
Date: Wed, 29 Feb 2012 09:02:15 +0000
Subject: Re: [patch] thermal: spear13xx: checking for NULL instead of IS_ERR()
Message-Id: <4F4DE997.4050900@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120229063151.GA18031@elgon.mountain>
In-Reply-To: <20120229063151.GA18031@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Viresh KUMAR <viresh.kumar@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Thanks Dan.

Il 29/02/2012 07:31, Dan Carpenter ha scritto:
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

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@st.com>


