From: John Stultz <john.stultz@linaro.org>
Date: Mon, 03 Jun 2013 19:08:20 +0000
Subject: Re: [patch] staging: alarm-dev: information leak in alarm_ioctl()
Message-Id: <51ACE9A4.4060600@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130603090231.GB16171@debian>
In-Reply-To: <20130603090231.GB16171@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/03/2013 02:02 AM, Dan Carpenter wrote:
> Smatch complains that if we pass an invalid clock type then "ts" is
> never set.  We need to check for errors earlier, otherwise we end up
> passing uninitialized stack data to userspace.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks ok to me. Although you probably need the exact same change in the 
compat_ioctl implementation?

Otherwise, Acked-by: John Stultz <john.stultz@linaro.org>

Cc'ing Android folks for their review as well.

thanks
-john



>
> diff --git a/drivers/staging/android/alarm-dev.c b/drivers/staging/android/alarm-dev.c
> index ceb1c643..c8600d9 100644
> --- a/drivers/staging/android/alarm-dev.c
> +++ b/drivers/staging/android/alarm-dev.c
> @@ -264,6 +264,8 @@ static long alarm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	}
>   
>   	rv = alarm_do_ioctl(file, cmd, &ts);
> +	if (rv)
> +		return rv;
>   
>   	switch (ANDROID_ALARM_BASE_CMD(cmd)) {
>   	case ANDROID_ALARM_GET_TIME(0):
> @@ -272,7 +274,7 @@ static long alarm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   		break;
>   	}
>   
> -	return rv;
> +	return 0;
>   }
>   #ifdef CONFIG_COMPAT
>   static long alarm_compat_ioctl(struct file *file, unsigned int cmd,

