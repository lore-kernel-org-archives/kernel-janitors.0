From: Stanimir Varbanov <svarbanov@mm-sol.com>
Date: Thu, 16 Oct 2014 13:57:07 +0000
Subject: Re: [patch -mm] rtc: pm8xxx: unlock on error in pm8xxx_rtc_set_time()
Message-Id: <543FCEB3.8070907@mm-sol.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016075520.GA29096@mwanda>
In-Reply-To: <20141016075520.GA29096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for catching that.

On 10/16/2014 10:55 AM, Dan Carpenter wrote:
> We recently added a new error path to this function and it is missing an
> unlock.
> 
> Fixes: 798187920a6e ('drivers/rtc/rtc-pm8xxx.c: rework to support pm8941 rtc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index af88817..dd98895 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -86,6 +86,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	unsigned int ctrl_reg;
>  	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
>  	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
> +	int locked;
>  
>  	if (!rtc_dd->allow_set_time)
>  		return -EACCES;
> @@ -100,6 +101,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	dev_dbg(dev, "Seconds value to be written to RTC = %lu\n", secs);
>  
>  	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
> +	locked = 1;

Sparse complaining in this function too:

warning: context imbalance in 'pm8xxx_rtc_set_time' - different lock
contexts for basic block

I'm wondering for a better fix to this. Isn't better to avoid this
conditional call to spin_unlock_irqrestore() and lock regmap writes
every time without care is the alarm is enabled or not.

>  
>  	rc = regmap_read(rtc_dd->regmap, regs->ctrl, &ctrl_reg);
>  	if (rc)
> @@ -115,6 +117,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  		}
>  	} else {
>  		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
> +		locked = 0;
>  	}
>  
>  	/* Write 0 to Byte[0] */
> @@ -149,7 +152,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	}
>  
>  rtc_rw_fail:
> -	if (alarm_enabled)
> +	if (locked)
>  		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
>  
>  	return rc;
> 


-- 
regards,
Stan
