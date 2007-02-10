From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Feb 2007 19:56:37 +0000
Subject: Re: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <Pine.LNX.4.64.0702101453030.5962@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 10 Feb 2007, Bernd Petrovitsch wrote:

> On Sat, 2007-02-10 at 13:25 -0500, Robert P. J. Day wrote:
> > On Sat, 10 Feb 2007, Bernd Petrovitsch wrote:
> >
> > > On Sat, 2007-02-10 at 11:14 -0500, Robert P. J. Day wrote:
> > > >   i doubt anything will ever come of this but, given the number of
> > > > calls to "memset(addr, 0, len)", did anyone ever consider defining a
> > > > macro short form, say:
> > > >
> > > >   clearmem(addr, len)
> > > >   zeromem(addr, len)
> > >
> > > *BSD had "bzero()".
> > >
> > > > or something like that?  just curious.
> > >
> > > Did you ever read the man page of "bzero()"?
> >
> > sure, but that's a *userspace* routine.  AFAIK, there is no such
>
> Yes, of course. I mentioned it because there is/was already a function
> with the above semantics and signature. So why invent another name?

oh, sorry, i misunderstood.  i thought you were saying that there
already *was* a bzero() in kernel space.  my mistake.

> > routine in the linux kernel.  is there a reason there isn't?
> > wouldn't
>
> No, because bzero() is - according to the man page - deprecated.

ah, yes, i just checked up on that.  this wasn't a big deal, it just
struck me that there are a *ton* of calls to memset() to do nothing
more than zero a chunk of memory, and it would seem simpler to define
a macro as a wrapper.  but i'm not going to make a big deal out of it.

rday

p.s.  in general, whenever i see the same construct being used more
than a dozen times, i start thinking of a way to make it shorter.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
