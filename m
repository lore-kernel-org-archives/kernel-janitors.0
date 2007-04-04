From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 04 Apr 2007 10:25:03 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <Pine.LNX.4.64.0704040623120.21759@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 3 Apr 2007, Randy Dunlap wrote:

> On Wed, 04 Apr 2007 03:41:56 +0200 Richard Knutsson wrote:
>
> > Robert P. J. Day wrote:
> > > On Wed, 4 Apr 2007, Richard Knutsson wrote:
> > >
> > >
> > >> Yep, and just found a few C/C++ structs not even _used_ in the kernel...
> > >>
> > >
> > > i'm not sure what that means ... can you explain that?  with an
> > > example or two?
> > >
> > The ones I was talking about is in drivers/scsi/dpt/sys_info.h. Only
> > found sysInfo_S to be used (by drivers/scsi/dpt_i2o.c).
>
> Interesting.  Those structs don't seem to be used.
>
> Vendor drivers historically have carried excess baggage in Linux,
> often for "management application" purposes. I doubt that that
> driver would be merged in that same condition today.

under the circumstances, then, i would think that it's fair to rip out
anything related to C++ that is not *currently* and *explicitly*
exported to userspace for a good reason.

and i would pay no mind to the inevitable whiners who like to say
things like, "well, it's for future use." if it eventually becomes
useful, they can always put it back in sometime down the road.

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
