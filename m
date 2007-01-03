From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 03 Jan 2007 04:29:34 +0000
Subject: Re: [KJ] [PATCH] set_current_state usage in oss/
Message-Id: <20070103042934.GH14048@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1167089629.11578.2.camel@alice>
In-Reply-To: <1167089629.11578.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 03.01.2007 [00:23:26 +0100], Eric Sesterhenn wrote:
> hi,
> 
> thanks for your comments, i am sorry i
> didnt have time to look at this again until now
> 
> > >  			}
> > >  			mutex_unlock(&bta->lock);
> > > -			current->state = TASK_INTERRUPTIBLE;
> > > +			__set_current_state(TASK_INTERRUPTIBLE);
> > >  			schedule();
> > >  			mutex_lock(&bta->lock);
> > >  			if(signal_pending(current)) {
> > > @@ -608,7 +608,7 @@ static ssize_t btaudio_dsp_read(struct f
> > >  	}
> > >  	mutex_unlock(&bta->lock);
> > >  	remove_wait_queue(&bta->readq, &wait);
> > > -	current->state = TASK_RUNNING;
> > > +	__set_current_state(TASK_RUNNING);
> >
> > Both lines might be replaced with something like finish_wait().
> 
> care to explain the first one?
> 
> 
> > > --- linux-2.6.20-rc2/sound/oss/cs46xx.c.orig	2006-12-26 00:04:05.000000000 +0100
> > > +++ linux-2.6.20-rc2/sound/oss/cs46xx.c	2006-12-26 00:04:06.000000000 +0100
> > > @@ -1435,7 +1435,7 @@ static int drain_dac(struct cs_state *st
> > >  	for (;;) {
> > >  		/* It seems that we have to set the current state to TASK_INTERRUPTIBLE
> > >  		   every time to make the process really go to sleep */
> > > -		current->state = TASK_INTERRUPTIBLE;
> > > +		__set_current_state(TASK_INTERRUPTIBLE);
> > >
> > >  		spin_lock_irqsave(&state->card->lock, flags);
> > >  		count = dmabuf->count;
> > > @@ -1449,7 +1449,7 @@ static int drain_dac(struct cs_state *st
> > >
> > >  		if (nonblock) {
> > >  			remove_wait_queue(&dmabuf->wait, &wait);
> > > -			current->state = TASK_RUNNING;
> > > +			__set_current_state(TASK_RUNNING);
> >
> > finish_wait()
> 
> same here, the second one is clear

Sorry, in both these cases, I just forgot to snip the earlier bits, new
patch looks much better. Note, that in the case of several OSS drivers,
they are already replaced by ALSA ones -- and the ALSA ones are much
better maintained. A lot of the wait-queue bits in OSS seem to be poorly
done, or more obfuscated than necessary.

Oh well.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
