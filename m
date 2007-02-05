From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 05 Feb 2007 20:11:20 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <9a8748490702051211k1f63a7e6p65106371f0019e72@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/02/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Mon, 5 Feb 2007, Randy Dunlap wrote:
>
> > On Mon, 5 Feb 2007 12:21:26 -0500 (EST) Robert P. J. Day wrote:
> >
> > > On Mon, 5 Feb 2007, Randy Dunlap wrote:
> > >
> > > > And lastly, the schedule for everyone to send non-bug-fixes is
> > > > "within 2 weeks of the 2.6.20 announcement" AFAIK.
> > >
> > > that's what i'd heard.  so what this means is that, now that
> > > 2.6.20 is out, there's a 2-week window to try to ram in all of the
> > > non-bugfix related cleanup that we've discussing to get it into
> > > 2.6.21, is that right?
> >
> > Yes, and it won't all go in at one time.  Having it spread out makes
> > bug detection more feasible.
>
> all right so, not to belabour this but, if i have a patch that i'd
> really like to be applied to this upcoming cycle, and i've submitted
> it, and it doesn't seem to be going anywhere, what's the proper
> procedure to start getting more insistent as that 2-week window starts
> to close so that i don't miss out?
>
> i'm referring to adding the maturity levels OBSOLETE and DEPRECATED to
> kconfig.  when i first presented that, it seemed to go over well and
> people appeared to like it but, since then ... nothing.
>
> who do i prod when time starts to run out so i don't miss an entire
> release cycle?
>
Well, there are no hard and solid rules, all you have are rough
guidelines and a lot of different maintainers all handling it a bit
different ;-)

I can tell you what I usually do (which seems to work fairly well).

For really trivial patches -
  I (initially) send them to LKML, and Cc any maintainers and other
relevant people I can find + add trivial@kernel.org to Cc as well.
Sometimes a maintainer picks up the patch and fast-tracks it into
mainline and all is well. If it doesn't go into mainline quickly I
rely on Adrian Bunk (the current Trivial Patch Monkey) to queue the
patch in his trivial pile and expect the patch to be merged into
current.released.kernel.version + 2 - that is, stuff I submit this way
while 2.6.19.x is current and 2.6.20 is under development I expect to
get merged in the 2.6.21 development timeline and end up in 2.6.21
final.  If for some reason Adrian doesn't push my patch during the 2
week 2.6.21 merge window then I'll resend the patch at the time
2.6.21-rc1 hits the street and poke people to include it or at least
queue it up for 2.6.22 - if it still doesn't catch on I'll keep doing
this for subsequent kernel versions (or until I get a NACK on the
patch).

For not so trivial patches (or trivial patches that I think are a bit
more important) -
  I'll send the patch initially to LKML + Cc maintainers/authors etc.
Then I'll usually wait 7-10 days for feedback and if I get none I'll
resend the patch at that point in time and probably add Andrew Morton
to Cc the second time around.  Then I'll keep resending the patch once
or twice a month (keeping it up-to-date of course) until a maintainer
queues it for upstream inclusion or I get a NACK.  If the patch gets
included in -mm I'll usually let it sit there through at least one
kernel release and then if Andrew or a maintainer doesn't push it
onwards during the start of the next merge window I'll usually poke
the maintainer and Andrew some time during the second week of that
merge window (and I usually do the same if it gets queued in another
maintainers tree instead of Andrews -mm tree).

But remember that the above are just some rough guidelines I follow
for my own patches as a rule of thumb. For some patches I am more
aggressive in pushing them, for some I'm a lot less annoying :-)   It
all depends on the patch, how important I think it is, what amount
(and kind) of feedback I get, how much time I have etc etc..

Hope that helps a bit :-)

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
