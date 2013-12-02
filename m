From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Dec 2013 15:45:05 +0000
Subject: Re: [PATCH] proposed consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131202154505.GL28413@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131202145646.GA5126@opentech.at>
In-Reply-To: <20131202145646.GA5126@opentech.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I think the patch is generally ok.  It needs to be split up and sent
through the individual maintainers.  The changelog has a lot of extra
verbiage.

On Mon, Dec 02, 2013 at 03:56:46PM +0100, Nicholas Mc Guire wrote:
> >From 5b3d0b88438846cbdd888798c2fb04e20c69e95d Mon Sep 17 00:00:00 2001
> From: Nicholas Mc Guire <der.herr@hofr.at>
> Date: Sun, 1 Dec 2013 22:53:18 -0500
> Subject: [PATCH] consolidate spin_lock/unlock waiting with spin_unlock_wait
> 

Don't include these bits in the patch and don't indent the changelog by
one space (don't indent at all, it should be hard left).

> Hi !
> 
>  Not sure if this is the right place to put this...
>  This patch proposes a small API consolidation. 
> 
>  in the following files there is a spin_lock/unlock in use for waiting on
>  some possibly concurrent thread - that is there is a
> 
> 	spin_lock(lock);
> 	spin_unlock(lock);
> 
>  so in the contended case the calling thread will wait for any concurrent
>  access.
> 
>   arch/blackfin/mach-bf561/smp.c lock/unlock at lines 72 73
>   arch/arm/mach-sti/platsmp.c lock/unlock at lines 53 54
>   arch/cris/arch-v32/drivers/mach-fs/gpio.c lock/unlock at lines 764 765
>   drivers/staging/lustre/lustre/obdclass/llog_obd.c lock/unlock at lines 87 89
>   drivers/net/ethernet/chelsio/cxgb/cxgb2.c lock/unlock at lines 287 288
>   drivers/net/ethernet/ti/cpmac.c lock/unlock at lines 582 583
>   fs/fscache/object.c lock/unlock at lines 692 693

This block is not useful.

> 
>  in 
>  commit c2f21ce2e31286a0a32f8da0a7856e9ca1122ef3
>  Author: Thomas Gleixner <tglx@linutronix.de>
>  Date:   Wed Dec 2 20:02:59 2009 +0100
> 
>     locking: Implement new raw_spinlock
>  

This is not the patch which introduced spin_unlock_wait().  That
function was around before we adopted git.

>  the api was extended with include/linux/spinlock.h:spin_unlock_wait() for 
>  just this purpose (I think atleast) so the below patch changes these 
>  currently hard-coded spin_lock/unlock to use the available API.
>  so as its in spinlock.h and the code in question is using spin_lock/unlock
>  no new header file inclusion is needed.

We hopefully can assume you compile tested these so this information
about header files is redundant.  If you didn't compile test, then we
will get really annoyed.

> 
>  all the above listed cases are consecutive spin_lock/spin_unlock.
>  the one-line offset in llog_obd.c at lines 87 89 is due to a comment not code
>  so it also is a consecutive spin_lock/spin_unlock, 

Obvious.  Don't include this in the commit message.

> 
>  If these changes make any sense should this go out to all of the code authors
>  for review/ack or is this simple enough for it to just go out via 
>  kernel-janitors/LKML for review ?
> 
>  patch is against 3.13.0-rc1 (linux-stable Greg KH tree)
> 

Don't do patches against stable.  Do them against the current -rc or
against linux-next.  In theory, the current -rc is better because then
you can test them without other patches affecting the results, but in
real life, you don't have the hardware for most of these and I doubt you
are going to test the filesystem ones.

> @@ -284,8 +284,7 @@ static int cxgb_close(struct net_device *dev)
>  	    !(adapter->open_device_map & PORT_MASK)) {
>  		/* Stop statistics accumulation. */
>  		smp_mb__after_clear_bit();
> -		spin_lock(&adapter->work_lock);   /* sync with update task */
                                                     ^^^^^^^^^^^^^^^^^^^^^
Keep this comment.  It's useful.

> -		spin_unlock(&adapter->work_lock);
> +		spin_unlock_wait(&adapter->work_lock);
>  		cancel_mac_stats_update(adapter);
>  	}
>  

regards,
dan carpenter
