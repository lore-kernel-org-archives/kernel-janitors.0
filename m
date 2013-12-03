From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Dec 2013 07:44:52 +0000
Subject: Re: [PATCH] proposed consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131203074452.GL5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131202145646.GA5126@opentech.at>
In-Reply-To: <20131202145646.GA5126@opentech.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 03, 2013 at 12:30:32AM +0100, Nicholas Mc Guire wrote:
> > >  the api was extended with include/linux/spinlock.h:spin_unlock_wait() for 
> > >  just this purpose (I think atleast) so the below patch changes these 
> > >  currently hard-coded spin_lock/unlock to use the available API.
> > >  so as its in spinlock.h and the code in question is using spin_lock/unlock
> > >  no new header file inclusion is needed.
> > 
> > We hopefully can assume you compile tested these so this information
> > about header files is redundant.  If you didn't compile test, then we
> > will get really annoyed.
> >
> 
> yes but only ran it on a 32 and 64 bit box to test them - but taht would
> at most cover the case in fs so that is very limited. What I did is generate
> the .i files and then looked at the function that got plugged in at that line
> e.g. arch_spin_unlock_wait in the fs/fscache/object.c then checked if that
> should be equivalent. in the arch/cris/arch-v32/drivers/mach-fs/gpio.c
> I contacted the maintainer of the file as I could not figure out what it was
> waiting on (and its UP only).
>  

Really, in the case where a cleanup breaks the build people are going to
be annoyed.  The traditional thing to do is just to applogize ahead of
time between the --- and the diffstat.

Please note:  I don't think this breaks the build but I can't compile it
myself.

regards,
dan carpenter

