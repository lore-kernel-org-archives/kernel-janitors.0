From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 06 Feb 2007 19:13:42 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <20070206111342.08890eb5.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 6 Feb 2007 12:33:44 -0500 (EST) Robert P. J. Day wrote:

> On Mon, 5 Feb 2007, Chris Miller wrote:
> 
> > On 2/5/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > > On Mon, 5 Feb 2007 02:04:10 -0500 (EST) Robert P. J. Day wrote:
> > >
> > > >
> > > >   now that 2.6.20 is official, what's the schedule for the
> > > > queued patches to hit linus' tree?
> > >
> > > Which patches are queued?
> > >
> > > IMO, it would help if other KJ subscribers would comment on
> > > patches and not just leave everything up to the maintainer,
> > > although I don't know what the maintainer thinks of this.
> > >
> > > And lastly, the schedule for everyone to send non-bug-fixes is
> > > "within 2 weeks of the 2.6.20 announcement" AFAIK.
> >
> > To me it sounds like this patch process needs to be clearly
> > documented with nice viewgraphs and other visual aids somewhere.
> 
> i agree, and i think it's important to clarify the timeline to ensure
> that potential kernel janitors have realistic expectations as to when
> (or even *if*) their patches are finally going to make it into the
> main tree.
> 
> as it stands, a number of kernel janitors have been working pretty
> hard creating and submitting patches, possibly not being aware of this
> whole "two-week merge window" thing, which means that, given that
> things will get increasingly frantic as that window starts to close,
> there's a strong possibility that a *lot* of those patch submissions
> won't make it in, and will have to wait until the *next* kernel cycle.
> that has the potential to discourage some people who would really like
> to see the fruits of their labour, but are about to learn the hard way
> that they're just going to have to wait for another few months (if not
> longer).

OK, if anyone on the KJ mailing list has outstanding KJ patches,
please do this:

1.  identify the patch by date and subject
2.  tell me if it is merged anywhere for testing
	(if not, it will be difficult for the patch to be merged
	in the 2.6.20 open patch window)

and I will see what I can do to help Alexey with the KJ patch queue.


> this is particularly crucial for patches that are an underlying
> dependency for future work.  if those "base" patches don't make it in,
> it gets that much harder to work on patches that sit on top of that
> work.
> 
> and, not to belabour this point but, almost two days after 2.6.20 was
> released, there is still (AFAICT) not a single change to the main
> tree.  normally, two days wouldn't mean that much but, when you're
> talking about only a two-week merge window, the clock is ticking.

You are welcome to take that up with Linus.  We (or any subsystem
maintainers) do not control that.

> at the risk of stepping on a few toes here, come on, folks -- the new
> kernel's out, the super bowl's over, the beer is all gone, it's been a
> relaxing couple of days, but it's time to get this process rolling,
> no?  the people who have been putting in all that time generating
> patches to help with the cleanup deserve at least that consideration,
> don't you think?

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
