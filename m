From: Joe Perches <joe@perches.com>
Date: Sat, 07 May 2011 18:02:40 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <1304791360.1738.6.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110507012717.GA15854@x61.tchesoft.com>
	 <1304733100.11874.33.camel@Joe-Laptop>
	 <20110507173141.GA4204@x61.tchesoft.com>
In-Reply-To: <20110507173141.GA4204@x61.tchesoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aquini@linux.com
Cc: kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Jay Vosburgh <fubar@us.ibm.com>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Sat, 2011-05-07 at 14:31 -0300, Rafael Aquini wrote:
> To exemplify my point, I'll taking that very  __ad_timer_to_ticks() as an example:
> static u16 __ad_timer_to_ticks(u16 timer_type, u16 par)
> {
>         u16 retval = 0;
> 
>         switch (timer_type) {
>         case AD_CURRENT_WHILE_TIMER:    /* for rx machine usage */
>                 if (par)
>                         retval = (AD_SHORT_TIMEOUT_TIME*ad_ticks_per_sec);
>                 else
>                         retval = (AD_LONG_TIMEOUT_TIME*ad_ticks_per_sec);
>                 break;
>         case AD_ACTOR_CHURN_TIMER:      /* for local churn machine */
>                 retval = (AD_CHURN_DETECTION_TIME*ad_ticks_per_sec);
>                 break;
>         case AD_PERIODIC_TIMER:         /* for periodic machine */
>                 retval = (par*ad_ticks_per_sec);
>                 break;
>         case AD_PARTNER_CHURN_TIMER:    /* for remote churn machine */
>                 retval = (AD_CHURN_DETECTION_TIME*ad_ticks_per_sec);
>                 break;
>         case AD_WAIT_WHILE_TIMER:       /* for selection machine */
>                 retval = (AD_AGGREGATE_WAIT_TIME*ad_ticks_per_sec);
>                 break;
>         }
>         return retval;
> }
> 
> If, for some unknown reason timer_type receives an 'alien' value, and
> we were
> using retval uninitialized, this function, as it is, would return an
> unpredictable value to its caller. Unless we have the switch block
> re-factored, we cannot leave retval uninitialized. So, it's not just a
> matter of leaving the variable uninitialized, or initialize it just to
> get rid of a compiler warning. That's why those comments are not
> helpful anyway.

I'd write this not using a retval variable at all as:

	switch (timer_type) {
	case AD_CURRENT_WHILE_TIMER:	/* for rx machine usage */
		if (par)
			return AD_SHORT_TIMEOUT_TIME * ad_ticks_per_sec;
		return AD_LONG_TIMEOUT_TIME * ad_ticks_per_sec;
	case AD_ACTOR_CHURN_TIMER:	/* for local churn machine */
		return AD_CHURN_DETECTION_TIME * ad_ticks_per_sec;
	...
	}
	WARN(1, "Invalid timer type: %u\n", timer_type)
	return 0;
}


