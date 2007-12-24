From: YOSHIFUJI Hideaki / =?iso-2022-jp?B?GyRCNUhGIzFRTEAbKEI=?=
Date: Mon, 24 Dec 2007 15:25:53 +0000
Subject: Re: [PATCH 3/38] arch/ia64/sn: Use time_before, time_before_eq,
Message-Id: <20071225.002553.56248499.yoshfuji@linux-ipv6.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241518040.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241518040.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: jes@sgi.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In article <Pine.LNX.4.64.0712241518040.23999@ask.diku.dk> (at Mon, 24 Dec 2007 15:18:56 +0100 (CET)), Julia Lawall <julia@diku.dk> says:

> diff -r -u -p a/arch/ia64/sn/kernel/xpc_main.c b/arch/ia64/sn/kernel/xpc_main.c
> --- a/arch/ia64/sn/kernel/xpc_main.c	2007-11-12 10:35:56.000000000 +0100
> +++ b/arch/ia64/sn/kernel/xpc_main.c	2007-12-23 20:32:54.000000000 +0100
> @@ -230,7 +231,7 @@ xpc_hb_beater(unsigned long dummy)
>  {
>  	xpc_vars->heartbeat++;
>  
> -	if (jiffies >= xpc_hb_check_timeout) {
> +	if (time_before_eq(jiffies, xpc_hb_check_timeout)) {
>  		wake_up_interruptible(&xpc_act_IRQ_wq);
>  	}
>  

time_after_eq()

> @@ -270,7 +271,7 @@ xpc_hb_checker(void *ignore)
>  
>  
>  		/* checking of remote heartbeats is skewed by IRQ handling */
> -		if (jiffies >= xpc_hb_check_timeout) {
> +		if (time_before_eq(jiffies, xpc_hb_check_timeout)) {
>  			dev_dbg(xpc_part, "checking remote heartbeats\n");
>  			xpc_check_remote_hb();
>  

ditto.

> @@ -305,7 +306,7 @@ xpc_hb_checker(void *ignore)
>  		/* wait for IRQ or timeout */
>  		(void) wait_event_interruptible(xpc_act_IRQ_wq,
>  			    (last_IRQ_count < atomic_read(&xpc_act_IRQ_rcvd) ||
> -					jiffies >= xpc_hb_check_timeout ||
> +			     time_before_eq(jiffies, xpc_hb_check_timeout) ||
>  						(volatile int) xpc_exiting));
>  	}
>  

ditto.

--yoshfuji
