From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 29 Jan 2007 18:17:56 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <Pine.LNX.4.64.0701291314440.30569@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 29 Jan 2007, Alexey Dobriyan wrote:

> On Mon, Jan 29, 2007 at 12:56:08PM -0500, Robert P. J. Day wrote:
> > On Mon, 29 Jan 2007, Alexey Dobriyan wrote:
> >
> > > On Sat, Jan 27, 2007 at 03:47:37PM -0800, Howell, David P wrote:
> > >
> > > [s/__FUNCTION__/__func__/g]
> > >
> > > > If it's only a shorter version for __FuNCTION__, is this eally
> > > > worth the trouble? With no other benefits I'd forget it.
> > >
> > > __func__ is in C99.
> >
> > true, but one of the issues was whether it was worth trying to
> > replace the numerous occurrences of "__FUNCTION__" with the
> > shorter "__func__" and, given how many there are, i can't imagine
> > it being worth the effort.
>
> I think it should be done anyway. It save both horizontal and
> vertical space. It probably should be started with core kernel and
> test-compiled, because __func__ can't be concatenated with string
> literals.

if someone wants to tackle that, i suspect there's several weeks worth
of work there alone.

actually, with something that's this pervasive, it would seem that the
first thing you'd want to do is ask all subsystem maintainers to try
to clean up their own code first, and give them an entire release to
do it.  after that, someone can jump in and try to deal with what's
left.

but with the number of changes involved, it just makes sense to
browbeat the maintainers into making that initial cleanup.  and i'm
betting some of them are not going to be thrilled by it.

rday

-- 

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
