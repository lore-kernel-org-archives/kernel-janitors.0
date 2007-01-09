From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 09 Jan 2007 14:42:23 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701090931360.4866@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Jan 2007, Darren Jenkins wrote:

> As for names, I would go for something like
>
> #define IS_POWER_OF_2(x) ((x & (x - 1)) = 0)
>
> With either
>
> #define IS_POWER_OF_2_NZ(x) (x != 0 && IS_POWER_OF_2(x))
> or
> #define IS_SINGLE_BIT_SET(x) (x != 0 && IS_POWER_OF_2(x))

i would disagree.  as i wrote just a bit earlier, i think the
fundamental definition of a power of 2 should *not* include zero,
because of both mathematical and source code precedent.

if anything, i would propose something like:

#define IS_POWER_OF_2(x) 		(x != 0 && ((x & (x - 1)) = 0))
#define IS_POWER_OF_2_OR_ZERO(x)	(IS_POWER_OF_2(x) || x = 0)

that way, the case of accepting zero becomes the *exception*, not the
rule.

rday

p.s.  and as darren pointed out as well, it might be interesting to
see how many instances of the current tests "((x & (x - 1) = 0)" were
really meant to *not* accept zero as a valid value -- they've just
been lucky all this time.  :-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
