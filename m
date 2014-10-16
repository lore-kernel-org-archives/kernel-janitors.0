From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Oct 2014 14:25:21 +0000
Subject: Re: [patch -mm] rtc: pm8xxx: unlock on error in pm8xxx_rtc_set_time()
Message-Id: <20141016142521.GF23154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016075520.GA29096@mwanda>
In-Reply-To: <20141016075520.GA29096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 16, 2014 at 04:57:07PM +0300, Stanimir Varbanov wrote:
> > @@ -100,6 +101,7 @@ static int pm8xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  	dev_dbg(dev, "Seconds value to be written to RTC = %lu\n", secs);
> >  
> >  	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
> > +	locked = 1;
> 
> Sparse complaining in this function too:
> 
> warning: context imbalance in 'pm8xxx_rtc_set_time' - different lock
> contexts for basic block

Yeah.  Smatch is a little more clever than Sparse this time.  :)  Smatch
accepted any fix but Sparse complained regardless.

> 
> I'm wondering for a better fix to this. Isn't better to avoid this
> conditional call to spin_unlock_irqrestore() and lock regmap writes
> every time without care is the alarm is enabled or not.
> 

I don't know.  If you go that road, please give me a Reporte-by tag.

regards,
dan carpenter

