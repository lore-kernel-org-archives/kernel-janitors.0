From: Cripps <acripps@gmail.com>
Date: Wed, 16 May 2007 22:26:11 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <c6711b6b0705161538m6b377e0dyd8eb2348299cab98@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Wow ... after doing a few hours of digging around in pm_legacy.h,
pm.h, apm.c, pm.txt, and pm.c I've actually realized how big a job
this is.
Even just trying to do any cleaning up in apm.c is going to break the
apm suspend() (and/or other things) call which, correct me if I'm
wrong, is what the swsusp crew is all about. It looks like the whole
apm system is going to need refactoring to get that *obsolete* call
out of there ... much too big a job for a newb like yours truly.
Thanks for letting me know about this, I should have listened as soon
as you warned me. Oh well, everything is a learning experience.
Cheers,
-Aaron

On 5/16/07, Cripps <acripps@gmail.com> wrote:
> I see. That's where  I'll look for my next task. I got the idea for
> this one by following a procedure similar to that on here:
> http://fsdev.net/wiki/index.php?title=Generating_build_warnings
> -Aaron
>
> On 5/16/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> > On Wed, 16 May 2007, Cripps wrote:
> >
> > > I was under the impression cleaning up Deprecated APIs and the like
> > > is what KJ was all about ;)
> >
> > it is.  but make sure you consult the file
> > Documentation/feature-removal-schedule.txt first.  there's no sense
> > wasting any time cleaning up code that's already scheduled for
> > removal.
> >
> > rday
> >
> > p.s.  legacy PM is not actually listed in that file, i just know that
> > there's already some effort being made to toss it.
> >
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
