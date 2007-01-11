From: "Paul Bonser" <misterpib@gmail.com>
Date: Thu, 11 Jan 2007 11:37:10 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <e6101e100701110337m1ea7f5f8h53e3e92a7465bc90@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Okay, here's a much better, faster, shorter version. You need to
include asm/bitops.h.
fls is (for most architectures) an inline function which has a single
assembly instruction to find the most significant set bit. Shift a 1
over by that same amount (which will put it one to the left of the MSB
that was just found), and you have the next highest power of two.

The first little bit is there to make it just return zero if there's
not a higher power of two to round up to, which is what the initially
proposed version does.
The second bit in there is checking if it's already a power of two.
Rounding down is simply the same thing, but moving the set bit to the right one.

static inline unsigned long round_up_to_power_of_2(unsigned long i)
{
#if BITS_PER_LONG = 64
	return i > i<<62? 0 : i&(i-1) ? 1ul << fls64(i) : i;
#else
	return i > i<<30? 0 : i&(i-1) ? 1ul << fls(i) : i;
#endif
}
static inline unsigned long round_down_to_power_of_2(unsigned long i)
{
#if BITS_PER_LONG = 64
	return i&(i-1) ? 1ul << (fls64(i)-1) : i;
#else
	return i&(i-1) ? 1ul << (fls(i)-1) : i;
#endif
}

running this code on the numbers 1 through 500,000,000 took 15
seconds, versus 38 seconds with the old code, so it looks like a good
improvement. Plus it was a fun challenge tracking down the best way
(i.e. a cross-platform way) to find the biggest set bit.

-Paul Bonser
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
