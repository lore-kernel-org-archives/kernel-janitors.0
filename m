From: Clemens Ladisch <clemens@ladisch.de>
Date: Mon, 18 Oct 2010 15:10:20 +0000
Subject: Re: [PATCH 2/8] char: hpet: fix information leak to userland
Message-Id: <4CBC635C.6030500@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287326477-7940-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287326477-7940-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

Vasiliy Kulikov wrote:
> Structure info is copied to userland with some padding fields unitialized.
> It leads to leaking of stack memory.

> --- a/drivers/char/hpet.c
> +++ b/drivers/char/hpet.c
> @@ -581,6 +581,7 @@ hpet_ioctl_common(struct hpet_dev *devp, int cmd, unsigned long arg,
>  		break;
>  	case HPET_INFO:
>  		{
> +			memset(info, 0, sizeof(*info));
>  			if (devp->hd_ireqfreq)
>  				info->hi_ireqfreq >  					hpet_time_div(hpetp, devp->hd_ireqfreq);

This makes the following assignment "info->hi_ireqfreq = 0;" superfluous.


Regards,
Clemens
