From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 09 Jan 2007 17:31:18 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <20070109093118.10fe5358.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Jan 2007 11:16:50 -0500 (EST) Robert P. J. Day wrote:

> On Wed, 10 Jan 2007, Darren Jenkins wrote:
> 
> > > Robert P. J. Day wrote:
> >
> > > i would disagree.  as i wrote just a bit earlier, i think the
> > > fundamental definition of a power of 2 should *not* include zero,
> > > because of both mathematical and source code precedent.
> > >
> > > if anything, i would propose something like:
> > >
> > > #define IS_POWER_OF_2(x)                (x != 0 && ((x & (x - 1)) = 0))
> > > #define IS_POWER_OF_2_OR_ZERO(x)        (IS_POWER_OF_2(x) || x = 0)
> >
> > Hmm mathematically you are right, so I guess that this naming would
> > be better.
> 
> just for some final entertainment value, i googled on the notion of
> testing for power-of-2ness in C, and found the following:
> 
>   http://www.parashift.com/c++-faq-lite/intrinsic-types.html#faq-26.12
> 
> so that seems to finalize the rule that zero is not considered a power
> of two.  now if someone wants to propose an initial power-of-2.h
> header file with the appropriate routines, we can argue about *that*.
> :-)

Looks like using an inline function would be safer and probably
more in the current vogue.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
