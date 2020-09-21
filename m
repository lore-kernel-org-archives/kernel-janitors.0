From: "Dr. David Alan Gilbert" <linux@treblig.org>
Date: Mon, 21 Sep 2020 16:48:16 +0000
Subject: Re: [PATCH] hwmon: (w83627ehf) Fix a resource leak in probe
Message-Id: <20200921164816.GA15497@gallifrey>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200921125212.GA1128194@mwanda>
In-Reply-To: <20200921125212.GA1128194@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

* Dan Carpenter (dan.carpenter@oracle.com) wrote:
> Smatch has a new check for resource leaks which found a bug in probe:
> 
>     drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe()
>     warn: 'res->start' not released on lines: 2412.
> 
> We need to clean up if devm_hwmon_device_register_with_info() fails.
> 
> Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeh that looks right to me; thanks!

Reviewed-by: Dr. David Alan Gilbert <linux@treblig.org>

> ---
>  drivers/hwmon/w83627ehf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 5a5120121e50..3964ceab2817 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1951,8 +1951,12 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  							 data,
>  							 &w83627ehf_chip_info,
>  							 w83627ehf_groups);
> +	if (IS_ERR(hwmon_dev)) {
> +		err = PTR_ERR(hwmon_dev);
> +		goto exit_release;
> +	}
>  
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	return 0;
>  
>  exit_release:
>  	release_region(res->start, IOREGION_LENGTH);
> -- 
> 2.28.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
