From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Tue, 29 Aug 2006 16:18:24 +0000
Subject: Re: [KJ] [Patch] convert schedule_timeout to msleep in cciss.c
Message-Id: <82faac5b0608290918m37e1b08asdb62947afe763911@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156838302.31519.28.camel@localhost.localdomain>
In-Reply-To: <1156838302.31519.28.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day Nish

On 8/30/06, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> On 29.08.2006 [17:58:22 +1000], Darren Jenkins" wrote:
> > G'day list
> >
> > I was doing some more grepping for schedule_timeout without HZ and found
> > one in cciss.c.
> >
> > Now I found a patch from Nish
>
> Would have been good to Cc me ;)
>
> > http://lists.osdl.org/mailman/htdig/kernel-janitors/2005-February/003637.html
> > that was ack'd
> > http://lists.osdl.org/mailman/htdig/kernel-janitors/2005-February/003638.html
> >
> > That contained a fix, but does not seem to have been applied.
> >
> > Now Nish posted another patch
> > http://lists.osdl.org/mailman/htdig/kernel-janitors/2004-September/001849.html
> > that does seem to be in the KJ patch set, but doesn't fix the second
> > schedule_timeout().
>
> Keep in mind, these were obviously submitted in the opposite order. The

Actually I didn't notice the reverse order thing.
It makes a lot more sense now.


> simplest fix is for Alexey to drop the 2004-September patch and then
> pick-up the Acked-by-Maintainer version from 2005-February.

Yep, either that or to get your patch upstream. It was Acked.


> Alexey, is that ok by you?
>
> Once he responds, we can decide if your patch is necessary or not.

Seems like you have it covered. :)

> Thanks,
> Nish

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
