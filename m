From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 26 Dec 2006 19:35:45 +0000
Subject: Re: [KJ] [PATCH] set_current_state usage in oss/
Message-Id: <20061226193545.GA11047@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1167089629.11578.2.camel@alice>
In-Reply-To: <1167089629.11578.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 26.12.2006 [00:33:49 +0100], Eric Sesterhenn wrote:
> hi,
> 
> since we have a macro to set the current state,
> we should use it, instead of open coding it.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.20-rc2/sound/oss/btaudio.c.orig	2006-12-26 00:04:05.000000000 +0100
> +++ linux-2.6.20-rc2/sound/oss/btaudio.c	2006-12-26 00:04:05.000000000 +0100
> @@ -531,7 +531,7 @@ static ssize_t btaudio_dsp_read(struct f
>  				break;
>  			}
>  			mutex_unlock(&bta->lock);
> -			current->state = TASK_INTERRUPTIBLE;
> +			__set_current_state(TASK_INTERRUPTIBLE);
>  			schedule();
>  			mutex_lock(&bta->lock);
>  			if(signal_pending(current)) {
> @@ -608,7 +608,7 @@ static ssize_t btaudio_dsp_read(struct f
>  	}
>  	mutex_unlock(&bta->lock);
>  	remove_wait_queue(&bta->readq, &wait);
> -	current->state = TASK_RUNNING;
> +	__set_current_state(TASK_RUNNING);

Both lines might be replaced with something like finish_wait().

>  	return ret;
>  }
>  
> --- linux-2.6.20-rc2/sound/oss/cs4232.c.orig	2006-12-26 00:04:05.000000000 +0100
> +++ linux-2.6.20-rc2/sound/oss/cs4232.c	2006-12-26 00:04:05.000000000 +0100
> @@ -98,7 +98,7 @@ static unsigned char crystal_key[] =	/* 
>  
>  static void sleep(unsigned howlong)
>  {
> -	current->state = TASK_INTERRUPTIBLE;
> +	__set_current_state(TASK_INTERRUPTIBLE);
>  	schedule_timeout(howlong);

schedule_timeout_interruptible()

>  }
>  
> --- linux-2.6.20-rc2/sound/oss/cs46xx.c.orig	2006-12-26 00:04:05.000000000 +0100
> +++ linux-2.6.20-rc2/sound/oss/cs46xx.c	2006-12-26 00:04:06.000000000 +0100
> @@ -1435,7 +1435,7 @@ static int drain_dac(struct cs_state *st
>  	for (;;) {
>  		/* It seems that we have to set the current state to TASK_INTERRUPTIBLE
>  		   every time to make the process really go to sleep */
> -		current->state = TASK_INTERRUPTIBLE;
> +		__set_current_state(TASK_INTERRUPTIBLE);
>  
>  		spin_lock_irqsave(&state->card->lock, flags);
>  		count = dmabuf->count;
> @@ -1449,7 +1449,7 @@ static int drain_dac(struct cs_state *st
>  
>  		if (nonblock) {
>  			remove_wait_queue(&dmabuf->wait, &wait);
> -			current->state = TASK_RUNNING;
> +			__set_current_state(TASK_RUNNING);

finish_wait()

>  			return -EBUSY;
>  		}
>  
> @@ -1463,7 +1463,7 @@ static int drain_dac(struct cs_state *st
>  		}
>  	}
>  	remove_wait_queue(&dmabuf->wait, &wait);
> -	current->state = TASK_RUNNING;
> +	__set_current_state(TASK_RUNNING);

ditto

>  	if (signal_pending(current)) {
>  		CS_DBGOUT(CS_FUNCTION, 4, printk("cs46xx: drain_dac()- -ERESTARTSYS\n"));
>  		/*
> @@ -1834,7 +1834,7 @@ static int cs_midi_release(struct inode 
>          unsigned count, tmo;
>  
>          if (file->f_mode & FMODE_WRITE) {
> -                current->state = TASK_INTERRUPTIBLE;
> +                __set_current_state(TASK_INTERRUPTIBLE);
>                  add_wait_queue(&card->midi.owait, &wait);

prepare_to_wait()

>                  for (;;) {
>                          spin_lock_irqsave(&card->midi.lock, flags);
> @@ -1851,7 +1851,7 @@ static int cs_midi_release(struct inode 
>                                  printk(KERN_DEBUG "cs46xx: midi timed out??\n");
>                  }
>                  remove_wait_queue(&card->midi.owait, &wait);
> -                current->state = TASK_RUNNING;
> +                __set_current_state(TASK_RUNNING);

<snip>

And so on. Consider using these APIs
(schedule_timeout_{,un}interruptible(), prepare_to_wait(),
finish_wait()) rather than just the small change of using the
__set_current_state() macro. Admittedly, this is all in OSS, which is
slowly being removed (by Adrian Bunk) in favor of ALSA. I sent in many
patches before for fixing up similar callers, but left OSS alone.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
