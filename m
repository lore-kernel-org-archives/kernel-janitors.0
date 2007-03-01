From: "Thomas Davies" <daviesth@onid.orst.edu>
Date: Thu, 01 Mar 2007 21:38:36 +0000
Subject: Re: [KJ] [PATCH] fix warnings that occur on make *docs
Message-Id: <953c67830703011338n6c9c6b8wafe68b6af6b974b1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <953c67830703011039x53a28509v3af6dddabffbca9f@mail.gmail.com>
	 <20070301104938.8674ca7b.randy.dunlap@oracle.com>
In-Reply-To: <20070301104938.8674ca7b.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On 3/1/07, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Thu, 1 Mar 2007 10:39:41 -0800 Thomas Davies wrote:
>
> > From: Thomas Davies <daviesth@onid.orst.edu>
> >
> > Cleaned up comments and whitespace in /drivers/message/fusion/*.c and also
> > /lib/bitmap.c to remove make *docs warnings.  An attempt by a newbie
> > to contribute
> > in some small way to the codebase.  Did I do it right?
>
> Hi,
>
> Your patch looks fine (until I tested it), but I have already
> corrected these warnings.  The patches have been in the -mm patchset
> for awhile and Andrew has sent some of it to Linus to be merged.
> Other parts need to go thru other maintainers.

Thank you for the feedback Randy.  Looks like I missed a step in the cycle;
I cloned Linus' tree with git from
git://git.kernel.org/pub/[...]/torvalds/linux-2.6.git,
was this wrong?  Is there another tree I should be cloning, or do I
apply the -mm
patch from kernel.org before making this sort of change? (The latter I suspect.)

> > Signed-off-by: Thomas Davies <daviesth@onid.orst.edu>
> > ---
> > diff -uprN -X linux-2.6/Documentation/dontdiff
> > linux-2.6/drivers/message/fusion/mptbase.c
> > linux-2.6-new/drivers/message/fusion/mptbase.c
>
> Looks like your mail client split these lines (above and below)
> so that 'patch' cannot apply the patch.
> lkml.org shows the same splitting, so I guess it's not my
> mail client on the reading end that is doing this.

I thought I could get away with using gmail in plain text mode, guess
I'll go back to using mutt.

-Tom

> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
