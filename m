From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 09 Jan 2007 12:16:03 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <45A38783.2060504@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   yesterday, i made the off-the-cuff suggestion that you could get
> more readable code by replacing the numerous tests of the form "(x &
> (x - 1))" with the appropriate power-of-2 test macro, something like:
>
>   #define is_power_of_2(x) (((x) & ((x) - 1)) = 0)
>
> however, i didn't think far enough ahead to wonder how to treat the
> boundary case of zero.
>
>   should zero be considered a power of 2 or not?  according to the
> above test, it *would* be.  however, there are already some
> definitions of that macro in the kernel tree:
>
>   $ grep -r is_power_of_2 .
>
> where the tests specifically disqualify zero from being considered a
> power of two, as in:
>
>   #define ... ((x) != 0 && (((x) & ((x) - 1)) = 0))
>                ^^^^^^^^
>                  DON'T consider zero a power of two!
>
> but all this makes one wonder ... if you see some code that just tests
> the expression "(x & (x - 1))", did that programmer understand how
> zero would be treated?
>
>   in some cases, it's clear that he/she did, as in:
>
> ./fs/hfsplus/btree.c:   if (!size || size & (size - 1))
>
> so whoever wrote the above code to recognize *invalid* values clearly
> understood that boundary condition.  but what about, say:
>
>   ./fs/jbd/revoke.c:      J_ASSERT ((hash_size & (hash_size-1)) = 0);
>
> clearly, the above assertion is asserting that "hash_size" should be a
> power of 2, but did the programmer realize that a value of zero would
> *also* be considered valid?  i have no idea.  could this represent a
> possible error?  who knows?  is a hash size of zero meaningful?
> according to the above assertion, it would be.
>
>   in any event, i didn't mean to ramble, but it struck me how making
> what seemed like an innocuous change suddenly became a bit more
> complicated given that boundary case of zero, and how different
> programmers might have made different assumptions about it.
>
> rday
>
> p.s.  personally, i would define an "is_power_of_2" macro to
> explicitly reject zero, the way the current definitions do.
>   
I agree! But should it not be "IS_POWER_OF_2" to reflect it is a macro?

However, I think the only thing is to check all the occurrences of the 
(x & (x-1)) and see what it really is suppose to be (and if possible, 
ask the maintainer).

What about something like:

#define LESS_THEN_2_BITS(x)  (x & (x - 1))
#define IS_POWER_OF_2(x)   (x != 0 && LESS_THEN_2_BITS(x))

(better names maybe...)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
