From: Brad Campbell <brad@fnarfbargle.com>
Date: Tue, 17 Nov 2020 09:58:47 +0000
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-Id: <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072401.GE1111239@mwanda>
In-Reply-To: <20201117072401.GE1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Henrik Rydberg <rydberg@bitmath.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On 17/11/20 6:24 pm, Dan Carpenter wrote:
> This test is reversed so the function will return without sending
> the APPLESMC_READ_CMD or completing the rest of the function.

That is as designed. The routine looks at the busy line and if it's already in the right state then it simply ends. If not then it tries to "re-align" the state machine by sending a new command.

> Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hwmon/applesmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 79b498f816fe..289b39537683 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -227,7 +227,7 @@ static int smc_sane(void)
>  	int ret;
>  
>  	ret = wait_status(0, SMC_STATUS_BUSY);
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  	ret = send_command(APPLESMC_READ_CMD);
>  	if (ret)
> 
