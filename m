From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 23 Apr 2009 17:24:21 +0000
Subject: Re: is there a "single_bit_set" macro somewhere?
Message-Id: <49F0A445.801@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   once upon a time, the kernel source code was replete with
> conditional constructs of the form:
> 
>   if ((n & (n-1)) = 0)
> 
> as a way of testing whether something was a power of two.  mercifully,
> include/linux/log2.h was created which introduced, among other things:
> 
> static inline __attribute__((const))
> bool is_power_of_2(unsigned long n)
> {
>         return (n != 0 && ((n & (n - 1)) = 0));
> }
> 
> so we could simply ask whether "is_power_of_2(n)", which is convenient
> when we're testing things like, oh, blocksize.
> 
>   similarly, there are bunches of places which need to test whether an
> integer value has only a single set bit (for instance, to make sure
> only one flag bit out of a number of mutually exclusive bits are set).
> 
>   mathematically, that would be the same test, of course, but
> semantically, it would be ugly and inappropriate.  is there,
> somewhere, a corresponding macro/function that asks:
> 
>   single_bit_set(n)
> 
> if not, that would be handy, could be plopped into
> include/linux/bitops.h and could be defined exactly the same way, and
> would allow piles of code to be simplified.
> 
>   thoughts?

single_bit_set(n) is equivalent to
  hamming weight(n) = 1

lib/hweight.c implements hamming weights for 8/16/32/64-bit args.
