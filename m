From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 29 May 2007 17:44:21 +0000
Subject: Re: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <Pine.LNX.4.64.0705291344160.366@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 May 2007, Matthew Wilcox wrote:

> On Tue, May 29, 2007 at 01:10:12PM -0400, Robert P. J. Day wrote:
> > > Generally these can be considered as padding, to make sure that the
> > > struct uses 7 * sizeof(int), sometimes this is due to ABI
> > > requirements.
> > >
> > > Have you checked if this is not used at all? Or if instances of
> > > this struct aren't casted to something else that uses this area
> > > for some purpose?
> >
> > i just removed it and did "make allyesconfig" and no problem with
> > a build.  so i'll submit a patch to get rid of it and see if
> > anyone complains.
>
> That's totally insufficient.

  um ... no, it's not.  it may not be completely *sufficient*, but
that's a far cry from being "totally insufficient."  let's try to
control the hyperbole, shall we?

  let's review the construct in question:

struct inodes_stat_t {
        int nr_inodes;
        int nr_unused;
        int dummy[5];
};

  in the first place, it seems unlikely that that extra space is used
for padding, since what it does is pad out to a very unusual size of 7
ints.  that's just weird.  not to mention that it's called "dummy",
which is about as worthless and uninformative a variable name as
you're ever likely to find.

> If it's part of an ABI, you won't notice bugs caused until some
> random application happens to depend on it.  If that area's being
> used as scratch space for something else, you'll get buffer
> overruns, and subtle corruptions.

  i'm sure i would, which is why, after *i* spend some time looking at
it, i submit a patch to LKML to see if *someone else* can clear up the
mystery.  and if they can, i drop it and move on.  what's your
problem?

> You need to go and look at *all* uses of inodes_stat, and figure out
> whether removing it is safe.

  in fact, i did just that, grepping through the tree to see if i
could spot any definition of that structure for which the "dummy"
array was referenced, and i didn't find one.  doesn't mean there
isn't one, only that i didn't notice one.

> Don't just post a patch; you've then put the onus of proving you're
> right on someone else.

and the problem with that is ... what exactly?  if i propose removing
something that looks useless, and not a single person on LKML can
explain what it's actually being used for, i think i've made my case.

you seem to be confusing the actions of *submitting* a patch with
forcing the application of one.  there's a difference.

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
