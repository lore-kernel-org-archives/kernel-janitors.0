From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Tue, 05 Jun 2007 11:59:19 +0000
Subject: Re: [KJ] for loops and variable declarations...
Message-Id: <alpine.DEB.0.99.0706050753460.27388@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
In-Reply-To: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > I'm seeing this style of code:
> > 
> > uchar a
> > ....
> > ....
> > ....
> > ....
> > ....
> > ....(many lines later...)
> > for(a=2; a< VALUE; a++)
> > 
> > 
> > Why are loop variables declared so far away from where they are used?
> 
>   because C forbigs in-code variable declarations (unlike C++). GNU C
> authorizes it though.
> 
> > Is this advantageous in some way?  It seems that the scope of the
> > variables is much larger than having them declared just as they are to
> > be used eg:
> > 
> > for(uchar a=2; a<VALUE; a++)
> 
>   This for is only allowed in C99, and is not well defined on some
> compilers where a scope is not necessarily limited to the for loop as
> common sense would suppose.
> 
>   So IMHO, kernel do not uses such kind of code (but I may be wrong).

This is 2007. C99 is not "new" and anybody writing new code designed for 
an earlier version of C is certainly hopped up on crack at the very least.

A second valid point is that the Linux kernel requires not only the GNU 
CC, but a relatively recent GNU CC, and someone trying to use any other 
compiler with it is recommended to have fun banging their head against the 
wall. Especially since there are many (yes, MANY) places in the code that 
not only use C99+GNU-only constructs, but in fact use pure GNU-only 
extensions which have been discussed and approved several times on this 
list.

The time is long past to even joke about supporting any compiler other 
than GCC. If -c99 isn't in the CFLAGS by now, it needs to be.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
