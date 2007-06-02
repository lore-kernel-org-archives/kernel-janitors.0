From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 02 Jun 2007 15:29:54 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <Pine.LNX.4.64.0706021111330.10144@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2 Jun 2007, Matthew Wilcox wrote:

> On Sat, Jun 02, 2007 at 11:59:22AM +0000, Andi Drebes wrote:

> > I recently grep'd through the kernel sources and found *a lot* of
> > lines that are commented out using #if 0. Is there any reason to
> > keep them?
>
> Yes -- the people who wrote the code originally put them there.

with all due respect, matthew, that's an idiotic answer.

> Unless you're willing to go through each one, and figure out whether
> it's still useful or not for anyone reading this section of code
> later, it's better to leave it alone.

it's not clear that andi was suggesting a single, sweeping deletion
operation (which *would* be a bad idea).  when i read his post, *i*
interpreted it as suggesting that a gradual examination might be in
order, and stuff that was clearly worthless could be removed bit by
bit.

> Why are comments considered useful, yet commented-out sections of
> code considered worthy of deletion?

gee, matt, i dunno ... could it be that, if some code has been deleted
via "#if 0", it might actually no longer have any value?  could *that*
be it?

> Of course things can be taken too far and #if 0 / #if 1 sections can
> clutter up the function and make it harder to understand.

good boy, matt ... thanks for clueing in eventually.

> But each one needs to be taken in context and understood, not
> mindlessly excised.

which is how i read andi's post.

> I think the kernel-janitors need a Hypocritic Oath.  First, do no
> harm. I'm a little sensitive to so-called 'trivial' changes right
> now, given that Kyle just spent two days tracking down breakages on
> parisc from these kinds of patches.

first, it's "hippocratic".  second, if patches are submitted by
janitors that cause actual breakage, then i suggest it's the fault of
the official maintainers who eventually *applied* those patches.  few
janitors have the authority to *force* a patch on anyone's tree, so if
a KJ patch f**ks something up, i suggest the blame lies elsewhere.

and, finally, a lot of the work being done by janitors wouldn't be
necessary if the actual developers invested just a bit of time in
keeping their code relatively clean.  instead, crappy and
slowly-rotting code is allowed to accumulate in the tree to the point
where you have (and i speak from personal experience):

  - misspelled and/or long-dead CONFIG variables
  - long-deceased header files
  - source files that are never used as part of the build under
	*any* circumstances
  - and, as above, hundreds upon hundreds of "#if 0" constructs,
	many of which i'm sure have been there for years and have
	absolutely no value

i submit, matthew, that there wouldn't even be a *need* for a kernel
janitors project if so many developers weren't so lazy and/or sloppy.
but, sadly, they are, and the annoying part of all of this is that a
lot of those developers are quite happy to leave the scut work to the
janitors, but get all excited and put out when the occasional patches
are submitted that cause breakage.

if folks like you are so irked by broken patches, then the solution is
simple -- fix all your own code and don't accept anything from
janitors.  but as long as you feel like leaving that sort of
maintenance to people who offer to be janitors, then you should be
prepared to deal with the occasional bad patch.

and, you know, saying "thank you" for all that janitorial effort every
so often probably wouldn't be out of line, either.

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
