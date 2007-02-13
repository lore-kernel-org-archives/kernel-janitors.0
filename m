From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Feb 2007 09:46:46 +0000
Subject: Re: [KJ] anyone interested in the "power of 2" stuff?
Message-Id: <Pine.LNX.4.64.0702130444350.3518@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Feb 2007, Vignesh Babu BM wrote:

>
> I have a doubt:
> There are instances as follows:
>
> /* ASIC location registers should be 0 or have only a single bit set. */
>     if (   (iobase_reg  & (iobase_reg - 1))
>
> here and in other similar situations the variables values vary from 0
> and above
> In such checks the above might be more optimized...as the is_power_of_2
> will
> 1. check for 0 and fail that
> 2. check for even and pass it
> 3. or if it is odd...fail it
>
> op 1 would be done followed by op 2/3
>
> The code would be like
> if(!iobase_reg && !is_power_of_2(iobase_reg))
> ---where we are checking for 0 at 2 places-both inside and outside of
> is_power_of_2
>
> But the n & (n-1) is just one step.
> Is this not more optimised?
>
> What would you suggest here?

i was fairly sure this issue was going to raise its ugly head
eventually -- where a test was checking if something was a power of
two *or* zero.  first off, let's agree that we are *not* going to
redefine what it means to be a power of two.  zero *isn't*.  period.
so changing that macro is out of the question.

here's an option.  that test above isn't *really* asking if something
is a power of two, *is* it?  it's asking if at most one bit is set.
and while that might seem *superficially* almost the same thing,
semantically it's quite different.

it might be worth defining a macro:

  #define at_most_one_bit_set(n)      ((n) & ((n) - 1))

then we get the optimization, we get the proper behaviour, and we get
more meaningful semantics that actually reflect the test that is being
done.  in a nutshell, don't test for "power of twoness" if that's not
what's being asked.  if one is testing for at most one bit set, phrase
it that way.  obviously, this means you might have to look at one of
those tests closely to deduce what the programmer was trying to do
but, for the most part, that shouldn't be impossible.

thoughts?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
