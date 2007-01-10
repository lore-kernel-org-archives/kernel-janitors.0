From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Wed, 10 Jan 2007 16:44:33 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <82faac5b0701100844w1ef3966ft798b281cba954f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/11/07, Robert P. J. Day <rpjday@mindspring.com> wrote:

>  i'm still
> interested if there's a single (bitwise?) operation to do the rounding
> up or down without involving a loop, which would be cool, but i don't
> know if that's possible.  anyone?

I don't think it is possible.

Here is something to think about though.
It is late and I am tired, but I think it works

It should only do as many loops as there are 01 bit transitions in the input.
So I am guessing on average half as many as an algo that does a loop
for every bit set.

static inline unsigned long round_up_to_power_of_2(unsigned long i)
{
    i = (i & (i-1)) ? ((i<<1) & ~i) : i )

    while (i & (i - 1))
        i &= (i - 1);

    return i;
}

Anyway It's time for me to sleep.


Darren J
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
