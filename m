From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 27 Aug 2007 15:56:36 +0000
Subject: Re: standard for documenting conditional preprocessor directives?
Message-Id: <Pine.LNX.4.64.0708271152570.8481@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 27 Aug 2007, Andre Haupt wrote:

> On Mon, Aug 27, 2007 at 10:55:09AM -0400, Robert P. J. Day wrote:

> > ... imagine that you're perusing code and you remember that you'd
> > already seen:
> >
> >   #ifdef SNAFU
> >
> > sometime later, you run across:
> >
> >   #endif /* SNAFU */
> >
> > now you're not sure if that's a simple end to "SNAFU" or possibly
> > the "#else" part that you missed during the perusal.  i'll grant
> > you that

> so your perusal was not done very thoroughly ;-)

i realize you're being humourous, but i can still address that point.
sometimes, you jump into the middle of a source file because you're
searching for something, and you're not sure if this code is  being
conditionally included.  if, just below it, you see

  #endif /* SNAFU */

you might *still* not be sure.  but if it says, instead

  #endif /* !SNAFU */

you're far more likely to understand it.

  in any event, i realize it might look awkward at first, but it seems
that this approach doesn't have any real drawbacks, and it has
measurable benefit.  and that's my theory. :-)

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
