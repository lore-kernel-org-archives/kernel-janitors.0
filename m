From: Pavel Machek <pavel@suse.cz>
Date: Sun, 13 Aug 2006 22:42:12 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <20060813224212.GK6231@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

> > >         unsigned long timeout = jiffies + HZ/2;
> > >        for (;;) {
> > >                if (ready())
> > >                        return 0;
> > > [IMAGINE HALF A SECOND DELAY HERE]
> > >                if (time_after(timeout, jiffies))
> > >                        break;
> > >                msleep(10);
> > >        }
> > >
> > > Oops
> > 
> > 
> > 
> > There were three proposed solutions though.
> 
> <snip>
> 
> FWIW, here is my poll_event() patch from some time ago updated to
> 2.6.18-rc4. I think it's closest in spirit to 3). Comments, thoughts?
> 
> Description: Add the poll_event(), poll_event_timeout(),
> poll_event_interruptible() and poll_event_interruptible_timeout()
> interfaces. These macros encapsulate typical sleeping code usage in a
> sane way.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> diff -urpN 2.6.18-rc4/include/linux/delay.h 2.6.18-rc4-dev/include/linux/delay.h
> --- 2.6.18-rc4/include/linux/delay.h	2006-08-11 22:40:57.000000000 -0700
> +++ 2.6.18-rc4-dev/include/linux/delay.h	2006-08-11 23:26:23.000000000 -0700
> @@ -44,4 +44,99 @@ static inline void ssleep(unsigned int s
>  	msleep(seconds * 1000);
>  }
>  
> +/*
> + * poll_event* check if a @condition is true every @interval milliseconds,
> + * up to a @timeout maximum, if specified, else forever.
> + * The *_interruptible versions will sleep in TASK_INTERRUPTIBLE
> + * (instead of TASK_UNINTERRUPTIBLE) and will return early on signals
> + * These interfaces are intentionally very similar to wait_event*
> + */
> +
> +/**
> + * poll_event - check a condition at regular intervals
> + * @condition: Condition to check
> + * @interval: Number of milliseconds between checks
> + */
> +#define poll_event(condition, interval)				\
> +do {								\
> +	while (!(condition))					\
> +		msleep(interval);				\
> +} while(0)

Well, someone will want to do usleep here, right? poll_msec()?

> +/**
> + * poll_event_timeout - check a condition at regular intervals with a timeout
> + * @condition: Condition to check
> + * @interval: Number of milliseconds between checks
> + * @timeout: Time in jiffies to stop checking at
> + * returns: 0, if condition caused return
> + * 	    -ETIME, if timeout
> + */
> +#define poll_event_timeout(condition, interval, timeout)		\
> +({									\
> +	int __ret = 0;							\
> + 									\
> +	for (;;) {							\
> +		if (condition)						\
> +			break;						\
> + 		msleep(interval);					\
> +		if (time_after(jiffies, timeout)) {			\
> +			__ret = -ETIME;					\
> + 			break;						\
> +		}							\
> +	}								\
> +	__ret;								\
> +})

This is wrong. See my example above.
> +/**
> + * poll_event_interruptible_timeout - check a condition at regular intervals with a timeout, returning early on signals
> + * @condition: Condition to check
> + * @interval: Number of milliseconds between checks
> + * @timeout: Time in jiffies to stop checking at
> + * returns 0, if condition caused return
> + * 	   -EINTR, if a signal
> + * 	   -ETIME, if timeout
> + */
> +#define poll_event_interruptible_timeout(conditition, interval, timeout)	\
> +({										\
> +	int __ret = 0;								\
> +										\
> +	for (;;) {								\
> +		if (condition)							\
> +			break;							\
> + 		msleep_interruptible(interval);					\
> +		if (signal_pending(current)) {					\
> +			__ret = -EINTR;						\
> +			break;							\
> +		}								\
> +		if (time_after(jiffies, timeout)) {				\
> +			__ret = -ETIME;						\
> +			break;							\
> +		}								\
> +	}									\
> +	__ret;									\
> +})

Wrong.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
