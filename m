From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 14 Nov 2018 17:01:10 +0000
Subject: Re: [PATCH] rtc: max8997: Fix the returned value in case of error in 'max8997_rtc_read_alarm()'
Message-Id: <20181114170110.GZ29768@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181114165025.2293-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181114165025.2293-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/11/2018 17:50:25+0100, Christophe JAILLET wrote:
> In case of error, we return 0.
> This is spurious and not consistent with the other functions of the driver.
> Commit 22652ba72453 has modified more than what is said in the commit
> message and error should be propagated.
> 
> Fixes: 22652ba72453 ("rtc: stop validating rtc_time in .read_time")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure that the Fixes tag is the right one.
> It is related, but not 100% accurate IMHO.

Well, as you note, this make your commit message wrong 22652ba72453
didn't modified more than what it said and the behavior stayed exactly
the same as the previous one. Can you reword?

> ---
>  drivers/rtc/rtc-max8997.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
> index 08c661a332ec..20e50d9fdf88 100644
> --- a/drivers/rtc/rtc-max8997.c
> +++ b/drivers/rtc/rtc-max8997.c
> @@ -215,7 +215,7 @@ static int max8997_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  
>  out:
>  	mutex_unlock(&info->lock);
> -	return 0;
> +	return ret;
>  }
>  
>  static int max8997_rtc_stop_alarm(struct max8997_rtc_info *info)
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
