From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 04 Nov 2015 13:59:01 +0000
Subject: Re: [patch] rtc: rtc-rv8803: Fix a couple locking bugs
Message-Id: <20151104135901.GY22331@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104134045.GJ20966@mwanda>
In-Reply-To: <20151104134045.GJ20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org

Hi,

On 04/11/2015 at 16:40:45 +0300, Dan Carpenter wrote :
> There was one missing unlock on error in rv8803_set_alarm() and one
> unlock in rv8803_ioctl() which was missing altogether.
> 
> Fixes: 2f370c4a1a44 ('rtc: Add a driver for Micro Crystal RV8803')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Presumably the IOCTL issue was a last minute change after the driver had
> been tested...
> 

Yeah, I already fixed the first one and the lock in rv8803_ioctl is
actually unnecessary.

Thanks for the info.

> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 63244eb..9508de4 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -240,8 +240,10 @@ static int rv8803_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	spin_lock_irqsave(&rv8803->flags_lock, irqflags);
>  
>  	ret = i2c_smbus_read_i2c_block_data(client, RV8803_FLAG, 2, ctrl);
> -	if (ret != 2)
> +	if (ret != 2) {
> +		spin_unlock_irqrestore(&rv8803->flags_lock, irqflags);
>  		return ret < 0 ? ret : -EIO;
> +	}
>  
>  	alarmvals[0] = bin2bcd(alrm->time.tm_min);
>  	alarmvals[1] = bin2bcd(alrm->time.tm_hour);
> @@ -338,6 +340,7 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>  	case RTC_VL_READ:
>  		spin_lock_irqsave(&rv8803->flags_lock, irqflags);
>  		flags = i2c_smbus_read_byte_data(client, RV8803_FLAG);
> +		spin_unlock_irqrestore(&rv8803->flags_lock, irqflags);
>  		if (flags < 0)
>  			return flags;
>  

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
