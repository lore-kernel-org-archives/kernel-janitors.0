From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 21 Jan 2007 12:47:19 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701210735580.14942@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 21 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:

> > actually, while lots of files define 'FALSE' and 'TRUE', very few
> > files define values for the tokens 'false' and 'true' since, as alexey
> > pointed out, those are defined in include/linux/stddef.h:
> >
> > enum {
> >         false   = 0,
> >         true    = 1
> > };
> >
> >

> No file should define 'false' and 'true' since I removed them to
> make it build with the above. Please point me to those if you find
> any.

sorry, bad phrasing on my part.  there are no others.

> > > Then, to be able to compile, the
> > > "6e21828743247270d09a86756a0c11702500dbfb" (git show) redefined
> > > BusLogic.h's
> > >
> > > -typedef enum { false, true } __attribute__ ((packed)) boolean;
> > >
> > > to
> > >
> > > +typedef bool boolean;
> > >
> >
> > but that second typedef doesn't define any values for the tokens
> > 'true' and 'false', so that still has to be done by *someone*.
> >
> That was a quick-fix to get rid of the defining of 'false'/'true'.
> So now a find 'n' replace of 'boolean' should be painless (can
> submit a patch later today...)

ok, that makes sense.

> > i just submitted the following patch to LKML:
> >
> > ===========================
> > diff --git a/drivers/net/wireless/strip.c
> > b/drivers/net/wireless/strip.c
> > index ce3a8ba..5e64ec1 100644
> > --- a/drivers/net/wireless/strip.c
> > +++ b/drivers/net/wireless/strip.c
> > @@ -177,8 +177,6 @@ typedef struct {
> >         MetricomNode node[NODE_TABLE_SIZE];
> >  } MetricomNodeTable;
> >
> > -enum { FALSE = 0, TRUE = 1 };
> > -
> >  /*
> >   * Holds the radio's firmware version.
> >   */
> >
> Have you done a "allyes"-build? Surprised there is not more to do...
> > diff --git a/include/linux/types.h b/include/linux/types.h
> > index 0351bf2..d988636 100644
> > --- a/include/linux/types.h
> > +++ b/include/linux/types.h
> > @@ -34,6 +34,8 @@ typedef __kernel_mqd_t                mqd_t;
> >
> >  #ifdef __KERNEL__
> >  typedef _Bool                  bool;
> > +#define TRUE                   1
> > +#define FALSE                  0

> First of, I believe this should be in stddef.h (as 'false'/'true'/NULL).

i agree, but that's not the issue here.  the issue is what is *in* the
source tree, now what people someday agree on what will eventually be
there.

> Second, why add a second definition of false and true? I have yet to
> hear someone wanting upper-cast instead of lower (0/1 yes, but not
> upper-cast).

*these* people want upper case:

  $ grep -rw TRUE .

and, no, as i said, it's not an issue of what the standard will be
*some day*, it's what is in the tree *today* and, with a small patch,
a whole whack of useless defines of TRUE and FALSE can be deleted,
while having absolutely no effect on what people eventually decide
what to do about this.

> Actually some would like it to be 'null' instead of NULL :)

and *i* would like a date with jessica alba.

> Just, what is the rush to remove that "crap"? It's been there for
> quite some time and will be taken care of when converted to a
> generic boolean.

and the thread discussing this happened months ago, and nothing
happened.  and -- one more time -- the patch above doesn't even
*attempt* to standardize what will eventually be used for booleans.
it simply allows all of the redundant defines -- which have to be
removed *anyway* -- to be removed *now* while the powers that be
continue to ruminate on this for the *next* several months.  or years.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
