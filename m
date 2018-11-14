From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 14 Nov 2018 00:09:17 +0000
Subject: Re: [PATCH] rtc: max77686: Fix the returned value in case of error in 'max77686_rtc_read_time()'
Message-Id: <5BEB67AD.30800@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20181113233753epcas4p2ecc97f5931a34bc0d176111b155738b8@epcas4p2.samsung.com>
        <20181113233645.9118-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181113233645.9118-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, krzk@kernel.org, b.zolnierkie@samsung.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2018년 11월 14일 08:36, Christophe JAILLET wrote:
> In case of error, we return 0.
> This is spurious and not consistent with the other functions of the driver.
> Commit e115a2bf1426 has modified more than what is said in the commit
> message. Reverse part of it znd return an error when needed, as it was
> previously.
> 
> Fixes: e115a2bf1426 ("rtc: max77686: stop validating rtc_time in .read_time")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-max77686.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 8a60900d6b8b..4aff349ae301 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -360,7 +360,7 @@ static int max77686_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  
>  out:
>  	mutex_unlock(&info->lock);
> -	return 0;
> +	return ret;
>  }
>  
>  static int max77686_rtc_set_time(struct device *dev, struct rtc_time *tm)
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
