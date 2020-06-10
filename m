From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 10 Jun 2020 13:25:01 +0000
Subject: Re: [PATCH] hwmon: i5k_amb: remove redundant assignment to variable res
Message-Id: <20200610132501.GA112976@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610123638.1133428-1-colin.king@canonical.com>
In-Reply-To: <20200610123638.1133428-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 10, 2020 at 01:36:38PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable res is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/i5k_amb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
> index eeac4b04df27..cd5b62905eee 100644
> --- a/drivers/hwmon/i5k_amb.c
> +++ b/drivers/hwmon/i5k_amb.c
> @@ -396,7 +396,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
>  
>  static int i5k_amb_add(void)
>  {
> -	int res = -ENODEV;
> +	int res;
>  
>  	/* only ever going to be one of these */
>  	amb_pdev = platform_device_alloc(DRVNAME, 0);
