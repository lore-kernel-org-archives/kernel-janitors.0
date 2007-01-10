From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 10 Jan 2007 14:00:46 +0000
Subject: Re: [KJ] How does macro time_after(unknown,
Message-Id: <20070110140046.GD21967@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2007 at 09:40:19PM +0800, Lei W wrote:
> BUT why the macro
> #define time_after(unknown,known) ((long)(unknown) -
> (long)(known)<0))
> will not?

Just think about it a bit.  What happens near extreme points?

time_after(a, b)

If a is 100 greater than b, how does it behave when b is slightly below
0?  Slightly above 0?  Near INT_MAX?  Near 2^32?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
