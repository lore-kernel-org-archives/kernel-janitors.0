From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Mon, 04 Jun 2007 11:22:41 +0000
Subject: Re: [KJ] another project or two
Message-Id: <alpine.DEB.0.99.0706040720430.20104@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>   i cleaned up the wiki page for memory allocation stuff:
> 
> http://fsdev.net/wiki/index.php?title=Memory_allocation_cleanup
> 
> so it should be more organized.
> 
>   also, something i've been thinking about for a while is the
> feasibility of centralizing a lot of the identical information that is
> duplicated across all of the include/asm-* header files.  as an
> example, if you take a look at all of the include/asm-*/types.h files,
> there's a lot of absolutely identical content.
> 
>   i'm wondering if there's any value to factoring all the common
> content and just leaving the differences in the arch-specific files.
> thoughts?

Would reduce code complexity, size, and time to compile. Seems like three 
worthy reasons to me.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
