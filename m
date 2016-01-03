From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 Jan 2016 12:48:51 +0000
Subject: Re: [PATCH 7/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_interrupt()
Message-Id: <alpine.DEB.2.02.1601031348350.2053@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <5688DF2D.6090204@users.sourceforge.net> <5688E229.4010400@users.sourceforge.net>
In-Reply-To: <5688E229.4010400@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 3 Jan 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 3 Jan 2016 09:00:30 +0100
> 
> Pass the address of the data structure element "time" directly in calls
> of the function "rtc_update_irq" instead of an extra initialisation
> for one local variable at the beginning.

Also, I don't see anything related to time in this patch.

julia

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/rtc/rtc-ab-b5ze-s3.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
> index e3a015a..88f1d0b 100644
> --- a/drivers/rtc/rtc-ab-b5ze-s3.c
> +++ b/drivers/rtc/rtc-ab-b5ze-s3.c
> @@ -816,7 +816,6 @@ static irqreturn_t _abb5zes3_rtc_interrupt(int irq, void *data)
>  	struct i2c_client *client = data;
>  	struct device *dev = &client->dev;
>  	struct abb5zes3_rtc_data *rtc_data = dev_get_drvdata(dev);
> -	struct rtc_device *rtc = rtc_data->rtc;
>  	u8 regs[ABB5ZES3_CTRL_SEC_LEN];
>  	int ret, handled = IRQ_NONE;
>  
> @@ -844,8 +843,7 @@ static irqreturn_t _abb5zes3_rtc_interrupt(int irq, void *data)
>  	/* Check alarm flag */
>  	if (regs[ABB5ZES3_REG_CTRL2] & ABB5ZES3_REG_CTRL2_AF) {
>  		dev_dbg(dev, "RTC alarm!\n");
> -
> -		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
> +		rtc_update_irq(rtc_data->rtc, 1, RTC_IRQF | RTC_AF);
>  
>  		/* Acknowledge and disable the alarm */
>  		_abb5zes3_rtc_clear_alarm(dev);
> @@ -857,8 +855,7 @@ static irqreturn_t _abb5zes3_rtc_interrupt(int irq, void *data)
>  	/* Check watchdog Timer A flag */
>  	if (regs[ABB5ZES3_REG_CTRL2] & ABB5ZES3_REG_CTRL2_WTAF) {
>  		dev_dbg(dev, "RTC timer!\n");
> -
> -		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
> +		rtc_update_irq(rtc_data->rtc, 1, RTC_IRQF | RTC_AF);
>  
>  		/*
>  		 * Acknowledge and disable the alarm. Note: WTAF
> -- 
> 2.6.3
> 
> 
