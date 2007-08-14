From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 14 Aug 2007 09:14:59 +0000
Subject: [KJ] rounddown_pow_of_2 inclusion into log2.h
Message-Id: <1187082179.3874.18.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

rday,

  Any plans on including what Andrew Morton suggested in the near
future?
Think you have had enough time to convince yourself ;)

(Sorry, had put kj in bcc in prev mail by mistake)

Vignesh

On Thu, 25 Jan 2007, Andrew Morton wrote:

> On Thu, 25 Jan 2007 04:32:12 -0500 (EST)
> "Robert P. J. Day" <rpjday@mindspring.com> wrote:

> > +/*
> > + * round down to nearest power of two
> > + */
> > +static inline __attribute__((const))
> > +unsigned long __rounddown_pow_of_two(unsigned long n)
> > +{
> > +   return 1UL << (fls_long(n) - 1);
> > +}
>
> So __rounddown_pow_of_two(16) returns 8?

it does?  but if that was true, so would 17, and 18, and 19 ...  i
didn't actually test this since it seemed so straightforward.
doesn't fls_long() return the most significant bit?  oh, wait ...
reading further ...
 >
> >  /**
> >   * ilog2 - log of base 2 of 32-bit or a 64-bit unsigned value
> >   * @n - parameter
> > @@ -154,4 +174,20 @@ unsigned long __roundup_pow_of_two(unsigned
long n)
> >     __roundup_pow_of_two(n)                 \
> >   )
> >
> > +/**
> > + * rounddown_pow_of_two - round the given value down to nearest
power of two
> > + * @n - parameter
> > + *
> > + * round the given value down to the nearest power of two
> > + * - the result is undefined when n = 0
> > + * - this can be used to initialise global variables from constant
data
> > + */
> > +#define rounddown_pow_of_two(n)                    \
> > +(                                          \
> > +   __builtin_constant_p(n) ? (             \
> > +           (n = 1) ? 0 :                  \
> > +           (1UL << ilog2(n)) :             \
> > +   __rounddown_pow_of_two(n)               \
> > + )
>
> But (1UL << ilog2(16)) returns 16?
>
>
> And, afiact, your __rounddown_pow_of_two() is basically equivalent to
(1UL
> << ilog2(n)) anyway.  So a suitable (and less buggy) implementation
might be
>
> static inline unsigned long rounddown_pow_of_two(unsigned long n)
> {
>       return (n = 1) ? 0 : (1UL << ilog2(n));
> }

i think you're right.  it's been a long day so give me a few minutes
to convince myself.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA
-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
