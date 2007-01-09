From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 09 Jan 2007 14:27:54 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701090902330.3860@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  so, some final thoughts on this potential cleanup.  first, i think
it's clear that, *if* this is even going to be submitted as a patch,
the proper definition of a "is_power_of_2()" macro (or inline
function) should ***not*** validate the value zero as a power of 2
(based both on kernel source and mathematical precedent).

  second, just because the expression "(x & (x - 1))" appears
somewhere in the source doesn't necessarily mean that it's testing for
power-of-2ness.  it's always possible (although admittedly not likely)
that someone might be using that expression for something entirely
unconnected, so it's important to look at each case to see what it's
doing, and only make a macro replacement if it makes semantic sense,
and also that it duplicates the current semantics *exactly*.

  also, it might be worth designing a couple companion routines that
do "round up to power of 2" and "round down to power of 2", since that
actually happens occasionally in the source.  if you look for any
"while" loops that incorporate this power-of-2 testing:

  $ grep -Er -A5 "while.*([^\(\)]+) ?\& ?\(\1 ?- ?1\)" .

you see stuff like this:

./drivers/video/vesafb.c:                       while (temp_size & (temp_size - 1))
./drivers/video/vesafb.c-                               temp_size &= (temp_size - 1);

what the above is doing is rounding *down* to the nearest power of 2.

  on the other hand, this:

./drivers/net/pcmcia/pcnet_cs.c:    while ((window_size & (window_size - 1)) != 0)
./drivers/net/pcmcia/pcnet_cs.c-        window_size += window_size & ~(window_size - 1);

is rounding *up* to the nearest power of 2 so, even though there may
not be that many examples of the above, it might still be useful to
define those two macros/functions just to make the code clearer.  (go
on -- tell me you could have looked at that code from pcnet_cs.c above
and thought, "oh, rounding up to the next power of 2."  :-)

  (also note that, occasionally, that rounding is done purely by brute
force:

./drivers/net/myri10ge/myri10ge.c:              while ((big_pow2 & (big_pow2 - 1)) != 0)
./drivers/net/myri10ge/myri10ge.c-                      big_pow2++;

so that could still be made clearer.  i don't suppose there's a single
bitwise operation that could do this rounding without the aid of a
loop, is there?  that would certainly be a performance boost if it's
possible.)

  so, three macros/functions:

	is_power_of_2(x)
	round_up_to_power_of_2(x)
	round_down_to_power_of_2(x)

or something to that effect.

  anyone want to take a crack at this?  i have no territorial views on
this.  i already have enough patches in the system, i don't need
anything else with my name on it.  if anyone wants to adopt this as a
project and see where it goes, it's yours.

rday

p.s.  i would also put these definitions in a new header file, say
include/linux/power_of_2.h or something like that.  there's already
way too much stuff in kernel.h to add even more there.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
