From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 27 Oct 2005 19:11:46 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/cdrom/mcdx.c: replace
Message-Id: <20051027191146.GD28730@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19050445410649708=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051026191842.GA9416@mipter.zuzino.mipt.ru>
In-Reply-To: <20051026191842.GA9416@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============19050445410649708==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 26.10.2005 [22:56:05 -0500], irwan.djajadi@iname.com wrote:
> On Wed, Oct 26, 2005 at 12:48:27PM -0700, Nishanth Aravamudan wrote:
> > On 26.10.2005 [23:18:42 +0400], Alexey Dobriyan wrote:
> > > On Sat, Oct 22, 2005 at 09:59:18PM -0500, irwan.djajadi@iname.com wrote:
> > > > drivers/cdrom/mcdx.c: replace interruptible_sleep_on() with
> > > > wait_event_interruptible() and schedule_timeout_interruptible(). Removed
> > > > sleepq wait_queue, since it's no longer needed. Reordered some conditional
> > > > prints because wait_event_interruptible_timeout() returns -ERESTARTSYS when
> > > > interrupted by a signal.
> > > 
> > > > --- 2.6.14-rc5/drivers/cdrom/mcdx.c
> > > > +++ mod/drivers/cdrom/mcdx.c
> > > > @@ -909,7 +908,7 @@ static int mcdx_talk(struct s_drive_stuf
> > > >
> > > >  	while (stuffp->lock) {
> > > >  		xtrace(SLEEP, "*** talk: lockq\n");
> > > > -		interruptible_sleep_on(&stuffp->lockq);
> > > > +		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
> > > >  		xtrace(SLEEP, "talk: awoken\n");
> > > >  	}
> > > 
> > > > @@ -1335,7 +1333,7 @@ static int mcdx_xfer(struct s_drive_stuf
> > > >  	}
> > > >  
> > > >  	while (stuffp->lock) {
> > > > -		interruptible_sleep_on(&stuffp->lockq);
> > > > +		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
> > > >  	}
> > > 
> > > Looks like the whole loops should be replaced.
> > > wait_event_interruptible() does it's own looping.
> > 
> > That seems fine for the second replacement, but the first will lose
> > per-iteration tracing. Depends on whether the maintainer cares.
> > 
> > Thanks,
> > Nish
> > 
> 
> Ehh.. well, I think those prints are just for debugging, and aren't
> necessarily useful..
> Here's my next try for mcdx.c..

Maybe because you aren't debugging? But what if someone is?

> However, I think there is a bigger problem here. I think the code uses the
> wrong synchronization mechanism. Even with wait_event_interruptible(), there
> is no guarantee that by the time the call returns, stuffp->lock is 0. The
> current thread might get preempted by something else that grabs the lock, then
> the current thread assumes that it's the only one who is grabbing the lock,
> and then it's screwed.. I don't know why the code uses
> wait_eent_interruptible(). This seems buggy to me. Unless, I'm missing
> something else again.
> 
> It seems that wait_event_interruptible() can only work well for things that
> can only happen once for the current context.
> 
> Oh well, here's the fix to the patch..
> Thanks
> --
> Irwan
> 
> 
> mcdx.c: replace interruptible_sleep_on() with proper newer calls.
> 
> Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>
> 
> diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/cdrom/mcdx.c mod/drivers/cdrom/mcdx.c
> --- 2.6.14-rc5/drivers/cdrom/mcdx.c	2005-09-16 20:02:12.000000000 -0500
> +++ mod/drivers/cdrom/mcdx.c	2005-10-26 22:38:18.000000000 -0500
> @@ -155,7 +155,6 @@ struct s_drive_stuff {
>  	/* waitqueues */
>  	wait_queue_head_t busyq;
>  	wait_queue_head_t lockq;
> -	wait_queue_head_t sleepq;
>  
>  	/* flags */
>  	volatile int introk;	/* status of last irq operation */
> @@ -838,8 +837,8 @@ static void mcdx_delay(struct s_drive_st
>  	if (jifs < 0)
>  		return;
>  
> -	xtrace(SLEEP, "*** delay: sleepq\n");
> -	interruptible_sleep_on_timeout(&stuff->sleepq, jifs);
> +	xtrace(SLEEP, "*** delay: %ld jiffies\n", jifs);
> +	schedule_timeout_interruptible(jifs);

Nobody was doing a wake_up*() on stuff->sleepq? If they were, you've
changed the functionality.

>  	xtrace(SLEEP, "delay awoken\n");
>  	if (signal_pending(current)) {
>  		xtrace(SLEEP, "got signal\n");
> @@ -907,11 +906,7 @@ static int mcdx_talk(struct s_drive_stuf
>  	if ((discard = (buffer == NULL)))
>  		buffer = &c;
>  
> -	while (stuffp->lock) {
> -		xtrace(SLEEP, "*** talk: lockq\n");
> -		interruptible_sleep_on(&stuffp->lockq);
> -		xtrace(SLEEP, "talk: awoken\n");
> -	}
> +	wait_event_interruptible(stuffp->lockq, !stuffp->lock);
>  
>  	stuffp->lock = 1;
>  
> @@ -1115,7 +1110,6 @@ static int __init mcdx_init_drive(int dr
>  
>  	init_waitqueue_head(&stuffp->busyq);
>  	init_waitqueue_head(&stuffp->lockq);
> -	init_waitqueue_head(&stuffp->sleepq);
>  
>  	/* check if i/o addresses are available */
>  	if (!request_region(stuffp->wreg_data, MCDX_IO_SIZE, "mcdx")) {
> @@ -1334,9 +1328,7 @@ static int mcdx_xfer(struct s_drive_stuf
>  		return -1;
>  	}
>  
> -	while (stuffp->lock) {
> -		interruptible_sleep_on(&stuffp->lockq);
> -	}
> +	wait_event_interruptible(stuffp->lockq, !stuffp->lock);
>  
>  	if (stuffp->valid && (sector >= stuffp->pending)
>  	    && (sector < stuffp->low_border)) {
> @@ -1360,16 +1352,16 @@ static int mcdx_xfer(struct s_drive_stuf
>  			while (stuffp->busy) {
>  
>  				timeout =
> -				    interruptible_sleep_on_timeout
> -				    (&stuffp->busyq, 5 * HZ);
> +				    wait_event_interruptible_timeout
> +				    (stuffp->busyq, !stuffp->busy, 5 * HZ);

This is funky to me. I'll have to think about it.

Thanks,
Nish

--===============19050445410649708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19050445410649708==--
