From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 11 Feb 2007 09:32:11 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <Pine.LNX.4.64.0702110430060.8580@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 11 Feb 2007, Alexey Dobriyan wrote:

> On Sun, Feb 11, 2007 at 03:55:26AM -0500, Robert P. J. Day wrote:
> > On Sun, 11 Feb 2007, Alexey Dobriyan wrote:
> >
> > > On Sat, Feb 10, 2007 at 05:32:10PM -0500, Robert P. J. Day wrote:
> > > >
> > > >   i've put some ideas in the wiki:
> > > >
> > > > http://fsdev.net/wiki/index.php?title=Memory_zeroing_macros
> > >
> > > Sheesh... No way in hell such macroses are going to be accepted.
> >
> > i didn't think so, but at the very least, we can probably
> > standardize on memzero(), yes?
>
> No! If anything we can put bzero() back but adding second idiom for
> clearing memory may be not worth it.

sure, i have nothing against bzero().  but, obviously, the basic
question, is it worth having a shortcut for zeroing a chunk of memory
rather than calling memset() all the time?  enough developers seem to
think so given the number of redefinitions of "memzero()".

or maybe this really is just not worth the effort.  who knows?

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
