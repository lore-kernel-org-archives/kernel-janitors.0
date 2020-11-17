From: Brad Campbell <brad@fnarfbargle.com>
Date: Tue, 17 Nov 2020 09:25:41 +0000
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-Id: <A530B4BD-89E0-4806-8F63-A967D02CD3CB@fnarfbargle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072401.GE1111239@mwanda>
In-Reply-To: <20201117072401.GE1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

G’day Dan,

Have you tested that change on hardware?

Sent from an annoyingly small mobile device with no keyboard.

> On 17 Nov 2020, at 7:52 pm, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> ﻿This test is reversed so the function will return without sending
> the APPLESMC_READ_CMD or completing the rest of the function.
> 
> Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/hwmon/applesmc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 79b498f816fe..289b39537683 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -227,7 +227,7 @@ static int smc_sane(void)
>    int ret;
> 
>    ret = wait_status(0, SMC_STATUS_BUSY);
> -    if (!ret)
> +    if (ret)
>        return ret;
>    ret = send_command(APPLESMC_READ_CMD);
>    if (ret)
> -- 
> 2.29.2
> 
> 
