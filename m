From: Cripps <acripps@gmail.com>
Date: Wed, 16 May 2007 16:04:03 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <c6711b6b0705160916k70c520a4obf1f0f7baf8033b1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I was under the impression cleaning up Deprecated APIs and the like is
what KJ was all about ;)
Thanks for your patience with me.
-Aaron

On 5/16/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Wed, 16 May 2007, Cripps wrote:
>
> > So then where possible pm_send_all() should just be yanked from things
> > like arch/i386/kernel/apm.c , and then don't worry about it elsewhere?
> > -Aaron
>
> sure.  if you want to submit patches to get rid of deprecated API
> calls like pm_send_all(), feel free.  i'm just saying that there's no
> point trying to anything with "legacy" PM since it's junk, anyway.
>
> rday
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ====================================
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
