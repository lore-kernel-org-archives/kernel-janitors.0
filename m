From: Adrian Bunk <bunk@kernel.org>
Date: Mon, 31 Dec 2007 00:51:37 +0000
Subject: Re: [PATCH 3/3] remove explicit memset to memory allocated with
Message-Id: <20071231005137.GC3083@does.not.exist>
List-Id: <kernel-janitors.vger.kernel.org>
References: <005801c841bb$6723d330$0b01a8c0@bureau>
In-Reply-To: <005801c841bb$6723d330$0b01a8c0@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 18, 2007 at 11:53:58PM +0100, Andi Drebes wrote:
> Hi!
> 
> > 1) Remove an explicit memset(.., 0, ...) to a varialable allocated with
> > kzalloc.
> > 
> > 2) Allocate 'src' with kmalloc instead of kzalloc as all elements of the
> > 'src' buffer are initialized in a 'for(...)' loop
> The changes look good to me, but there's another thing that could be done in that file:
> There's no need for the expression "sizeof(u8)" since it always returns 1. Could you
> fix that too and submit a new patch?
> 
> There are quite a lot of statements like that in the kernel...
> 
> $ grep -r "sizeof(u8)" . | wc -l
> 53

What is the problem you are trying to solve?

It might in some places be an improvement to replace a sizeof(u8) with a 
sizeof() on the actual variable, but blindly replacing sizeof(u8) with 1 
sounds like an attempt to make the code harder to read without bringing 
any advantage...

> Regards,
> 	Andi

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

