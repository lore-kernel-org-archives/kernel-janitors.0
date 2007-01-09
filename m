From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 09 Jan 2007 12:25:02 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701090713470.8172@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:

... big snip involving power of 2 stuff ...

> > p.s.  personally, i would define an "is_power_of_2" macro to
> > explicitly reject zero, the way the current definitions do.
> >
> I agree! But should it not be "IS_POWER_OF_2" to reflect it is a
> macro?

not necessarily.  currently, the aesthetics of macro names is a bit
inconsistent, as in kernel.h:

  #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
  #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))

and, given that there is already a precedent (albeit a small one) for
the lower case form, i'd be tempted to keep it like that, *if*
anything is to be done along those lines.

> However, I think the only thing is to check all the occurrences of
> the (x & (x-1)) and see what it really is suppose to be (and if
> possible, ask the maintainer).

i agree -- each case should be examined to see what the intent was.
in some cases, the code can be seriously obscure, as in
drivers/pcmcia/i82365.c:

      if (!poll_interval) {
        u_int tmp = (mask & 0xff20);
        tmp = tmp & (tmp-1);		// power of 2 test?
        if ((tmp & (tmp-1)) = 0)       // and test again???
            poll_interval = HZ;

in the case of the above, that first assignment is not actually
testing, it's calculating the bit mask.  the *second* expression
represents a power-of-2 test, though, and it would be fair to replace
that with the macro invocation.

> What about something like:
>
> #define LESS_THEN_2_BITS(x)  (x & (x - 1))
> #define IS_POWER_OF_2(x)   (x != 0 && LESS_THEN_2_BITS(x))

i'm not sure i'd bother with the "LESS_THAN_2_BITS" macro, since i
doubt it would have widespread application.  in any event, this is
just something to think about for future consideration.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
