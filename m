From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 05 Jun 2007 12:23:06 +0000
Subject: Re: [KJ] for loops and variable declarations...
Message-Id: <20070605122306.GD8605@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
In-Reply-To: <ab8e556c0706050422y1cf091a8n34313317a92a5afd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 05, 2007 at 07:59:19AM -0400, John Anthony Kazos Jr. wrote:
> This is 2007. C99 is not "new" and anybody writing new code designed for 
> an earlier version of C is certainly hopped up on crack at the very least.

Yes, we're all hopped up on crack.

> A second valid point is that the Linux kernel requires not only the GNU 
> CC, but a relatively recent GNU CC, and someone trying to use any other 
> compiler with it is recommended to have fun banging their head against the 
> wall. Especially since there are many (yes, MANY) places in the code that 
> not only use C99+GNU-only constructs, but in fact use pure GNU-only 
> extensions which have been discussed and approved several times on this 
> list.
> 
> The time is long past to even joke about supporting any compiler other 
> than GCC. If -c99 isn't in the CFLAGS by now, it needs to be.

Actually, this is explicitly forbidden in the Linux kernel:

# warn about C99 declaration after statement
CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)

Just because it's supported by the compiler, and permitted by a
standard, doesn't make it good CodingStyle.

Speaking of CodingStyle, the original poster should see
Documentation/CodingStyle chapter 6 for why this isn't a problem.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
