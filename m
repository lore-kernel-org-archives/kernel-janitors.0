From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Tue, 09 Jan 2007 15:25:11 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <82faac5b0701090725s525671c0l580ef02e12e59fab@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Robert P. J. Day wrote:

> i would disagree.  as i wrote just a bit earlier, i think the
> fundamental definition of a power of 2 should *not* include zero,
> because of both mathematical and source code precedent.
>
> if anything, i would propose something like:
>
> #define IS_POWER_OF_2(x)                (x != 0 && ((x & (x - 1)) = 0))
> #define IS_POWER_OF_2_OR_ZERO(x)        (IS_POWER_OF_2(x) || x = 0)

Hmm mathematically you are right, so I guess that this naming would be better.
I would swap the logic between the two though.

#define IS_POWER_OF_2(x)                ((x) != 0 && IS_POWER_OF_2_OR_ZERO(x))
#define IS_POWER_OF_2_OR_ZERO(x)        (((x) & ((x) - 1)) = 0)

GCC would probably evaluate it the same, but it looks a little more
logical to me



> On Tue, 9 Jan 2007, Jaco Kroon wrote:

> hmm, doesn't this once more give the problem min/max has where arguments
> gets evaluated twice?  Or even in this case, what about something like
> IS_POWER_OF_2(x - 1) ... ?

Yes, this does have the multiple evaluation bug, and complex evaluation bug.
I should of put the x in brackets (my bad) however I don't know about the
macro multiple evaluation bug, it does not seem like standard practice
in the headers to
fix this. Is there an example in the code where someone uses a function ?
Is this actually needed or is it overkill ?
If we do need this, should someone look at fixing the multiple
evaluation bug in all the kernel macro's?

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
