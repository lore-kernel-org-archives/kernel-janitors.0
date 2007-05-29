From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Tue, 29 May 2007 13:50:32 +0000
Subject: Re: [KJ] Header files
Message-Id: <b6fcc0a0705290650m4791e087oa3ef3eca9a01ed7f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
In-Reply-To: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, Vegard Nossum <vegard.nossum@gmail.com> wrote:
> I have written a perl script to perform certain checks on header
> files. It's rather quick and dirty but works for the most part.
> Running it on the Linux headers yields the following:
>
> $ perl headerguards.pl include/
> include/asm-x86_64/seccomp.h: guard on first line, but not on second
> include/asm-i386/seccomp.h: guard on first line, but not on second
> include/asm-parisc/psw.h: guard on first line, but not on second
> include/asm-sparc64/seccomp.h: guard on first line, but not on second
> include/asm-arm/arch-iop13xx/dma.h: inconsistency between first and second
> guard

Nice. Wonder why last is not an empty file...

> Now I wonder: There are a lot of inconsistencies in the header files.
> For instance:
> 1) Guard names: There are many possible naming schemes, and the kernel
> probably uses them all. This, of course, means that there are
> potentially conflicts between current header files or current and
> future header files.

Unless they match (dma.h) and no conflicts, don't waste time on one true way.

> 2) Self-consistency: A lot of headers are not self-consistent, i.e.
> they rely on certain headers being included in advance.
>
> Is this worth fixing? (If you can call it fixing. "If it's not
> broken...") Correcting this would span most of the headers, possibly
> introducing thousands of lines of patches. I think a lot of people
> would find it a waste of time and resources; consequently, the changes
> would be hard to get into the kernel. I'd like to start doing it but
> won't if it won't be used.

As someone who cross-compiles kernels on $BIGNUM targets, I ask everyone
to not add headers just in case it will break in the future. Only add
if it fixes
compilation breakage. Just in case will just slow down compilation.

Good thing is to remove header A from header B if A is truly not needed, or was
included for some silly reason. In fact I plan to do more such cleanups like
module.h vs sched.h, or mm.h vs sched.h patches right after next -rc1.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
