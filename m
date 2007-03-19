From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 19 Mar 2007 19:47:06 +0000
Subject: Re: [KJ] do all schedule_timeout() calls need to set state first?
Message-Id: <Pine.LNX.4.64.0703191543230.13939@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703191358530.13393@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703191358530.13393@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 19 Mar 2007, Nishanth Aravamudan wrote:

> On 19.03.2007 [14:00:53 -0400], Robert P. J. Day wrote:
> >
> >   based on what i've been reading, all calls to schedule_timeout()
> > *must* first set the current process state to either
> > TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE, is that correct?
>
> Yes, but note that setting it directly before is not always
> necessary, in particular when used with wait-queues.

right, i realized that.  but it does have to be set at *some* point
before invoking that routine.

> But, take a look at the comment heading schedule_timeout():
>
>  * Make the current task sleep until @timeout jiffies have elapsed. The
>  * routine will return immediately unless the current task state has
>  * been set (see set_current_state()).
>
> >   since i was once again perusing the source tree and noticed the
> > following in drivers/hwmon/ams/ams-i2c.c (line 93):
> >
> >         while (remaining) {
> >                 result = ams_i2c_read(AMS_COMMAND);
> >                 if (result = 0 || result & 0x80)
> >                         return 0;
> >
> >                 remaining = schedule_timeout(remaining);
> >         }
> >
> > it certainly *seems* that the state isn't being set here.  is that an
> > error?  just curious.
>
> Yes, it is.

as in, yes, it is an error?  (i'm *assuming* that's what you meant
here.)

> That is why we have schedule_timeout_interruptible() and
> schedule_timeout_uninterruptible().

i'd noticed those -- does that mean that there is no need to ever call
schedule_timeout(), and that one should always use one of those two
routines above?  or am i misreading this?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
