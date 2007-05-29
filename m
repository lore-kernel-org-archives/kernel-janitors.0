From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 29 May 2007 08:27:16 +0000
Subject: Re: [KJ] Header files
Message-Id: <Pine.LNX.4.64.0705290425580.23183@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
In-Reply-To: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 May 2007, Vegard Nossum wrote:

> Hey,
>
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
>
> Perhaps these are worth fixing.

yes, you can *definitely* send in patches for those, they're just
wrong.  more later.

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
