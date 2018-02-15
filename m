From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 15 Feb 2018 20:44:53 +0000
Subject: Re: [PATCH][V2] rtc: tx4939: avoid unintended sign extension on a 24 bit shift
Message-Id: <20180215204453.GE14177@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215193614.28684-1-colin.king@canonical.com>
In-Reply-To: <20180215193614.28684-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/02/2018 at 19:36:14 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of buf[5] by 24 bits to the left will be promoted to
> a 32 bit signed int and then sign-extended to an unsigned long. If
> the top bit of buf[5] is set then all then all the upper bits sec
> end up as also being set because of the sign-extension. Fix this by
> casting buf[5] to an unsigned long before the shift.
> 

The timing of the discovery of this issue is suspicious. I believe it is
because I just enabled COMPILE_TEST on that driver and now this gets
compiled on a 64bit architecture.

Can I ask on which architecture this is an issue? I don't think (and a
small test program confirms) x86 does the sign extension because both
sec and buf are unsigned.

> Detected by CoverityScan, CID#1465292 ("Unintended sign extension")
> 
> Fixes: 0e1492330cd2 ("rtc: add rtc-tx4939 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-tx4939.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tx4939.c b/drivers/rtc/rtc-tx4939.c
> index feededce3ded..1f351308afdc 100644
> --- a/drivers/rtc/rtc-tx4939.c
> +++ b/drivers/rtc/rtc-tx4939.c
> @@ -109,7 +109,8 @@ static int tx4939_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	for (i = 2; i < 6; i++)
>  		buf[i] = __raw_readl(&rtcreg->dat);
>  	spin_unlock_irq(&pdata->lock);
> -	sec = (buf[5] << 24) | (buf[4] << 16) | (buf[3] << 8) | buf[2];
> +	sec = ((unsigned long)buf[5] << 24) | (buf[4] << 16) |
> +		(buf[3] << 8) | buf[2];
>  	rtc_time_to_tm(sec, tm);
>  	return rtc_valid_tm(tm);
>  }
> @@ -170,7 +171,8 @@ static int tx4939_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	alrm->enabled = (ctl & TX4939_RTCCTL_ALME) ? 1 : 0;
>  	alrm->pending = (ctl & TX4939_RTCCTL_ALMD) ? 1 : 0;
>  	spin_unlock_irq(&pdata->lock);
> -	sec = (buf[5] << 24) | (buf[4] << 16) | (buf[3] << 8) | buf[2];
> +	sec = ((unsigned long)buf[5] << 24) | (buf[4] << 16) |
> +		(buf[3] << 8) | buf[2];
>  	rtc_time_to_tm(sec, &alrm->time);
>  	return rtc_valid_tm(&alrm->time);
>  }
> -- 
> 2.15.1
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
