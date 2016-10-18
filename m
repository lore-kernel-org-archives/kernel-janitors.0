From: Eli Billauer <eli.billauer@gmail.com>
Date: Tue, 18 Oct 2016 04:53:25 +0000
Subject: Re: [bug report] staging: New driver: Xillybus generic interface for FPGA
Message-Id: <5805AAC5.7040305@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012082834.GA23170@mwanda>
In-Reply-To: <20161012082834.GA23170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan,

Sorry, it seems like I didn't make myself clear. I'll try again, in more 
detail.

The purpose and principle of channel->wr_mutex is that it's locked as 
long as the relevant function, xillybus_read(), is invoked. Except for 
when waiting for channel->wr_wait, in which case the mutex is unlocked 
for the sake of sleeping, and then locked after being waken up.

In detail: The mutex is locked soon after the function is invoked:

690         rc = mutex_lock_interruptible(&channel->wr_mutex);
691         if (rc)
692                 return rc;

and unlocked only just before returning throughout the function, e.g.

788                         if (rc) {
789                                 mutex_unlock(&channel->wr_mutex);
790                                 return rc;
791                         }

And then there's the temporary unlock, which triggered the static checker:

897                         do {
898                                 mutex_unlock(&channel->wr_mutex);
899
900                                 if (wait_event_interruptible(
901                                             channel->wr_wait,
902                                             (!channel->wr_sleepy)))
903                                         goto interrupted;
904
905                                 if (mutex_lock_interruptible(
906 &channel->wr_mutex))
907                                         goto interrupted;
908                         } while (channel->wr_sleepy);

The mutex is already locked when the loop is reached. In the loop, it's 
unlocked for the sake of sleeping, and then locked when waking up. 
Signal handling makes it a bit more tangled than that, but the principle 
of the wr_mutex remains, because there are only two ways to get out of 
this do-loop:

(1) By successfully locking the mutex in line 905 (and the while 
condition being false)
(2) By jumping to "interrupted", in which case the mutex is indeed 
unlocked, but the function returns in that case, and in particular 
doesn't reach line 930.

So yes, I'm saying that the mutex is surely locked when reaching line 
930. It's difficult to check all paths of execution, but I stick to the 
principle: The mutex remains locked as long as the function is invoked 
(except for just after invocation, or just before returning, or within 
the do-loop at 897-908).

Do you see any execution path for which this principle is broken? Is 
there any execution path that brings us to line 930, for example, with 
the mutex unlocked? I can't find one. If there is such a path, there's a 
bug indeed.

I hope this clarified my view. If I've missed something, by all means 
please pinpoint my mistake.

Thanks,
    Eli

On 17/10/16 14:40, Dan Carpenter wrote:
> I have read and re-read your repsonse and I can't understand it at all.
>
> The only way this code is correct is if we take the lock when we do:
>
>     930                  if (left_to_sleep>  0) {
>
> Here we are unlocked.
>
>     931                          left_to_sleep >     932                                  wait_event_interruptible_timeout(
>     933                                          channel->wr_wait,
>     934                                          (!channel->wr_sleepy),
>     935                                          left_to_sleep);
>
> Are you saying that here we are locked?  That does NOT appear to be what
> you are saying, but it is the only response that I would accept to say
> that the code is correct.
>
> In other words, the bug is probably real.  Please review again.
>
> regards,
> dan carpenter
>
>    

