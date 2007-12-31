From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 31 Dec 2007 11:29:24 +0000
Subject: Re: [PATCH 3/3] remove explicit memset to memory allocated with k[zc]alloc
Message-Id: <200712311229.25418.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <005801c841bb$6723d330$0b01a8c0@bureau>
In-Reply-To: <005801c841bb$6723d330$0b01a8c0@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > There are quite a lot of statements like that in the kernel...
> > 
> > $ grep -r "sizeof(u8)" . | wc -l
> > 53
> 
> What is the problem you are trying to solve?
> It might in some places be an improvement to replace a sizeof(u8) with a 
> sizeof() on the actual variable, but blindly replacing sizeof(u8) with 1 
> sounds like an attempt to make the code harder to read without bringing 
> any advantage...
Perhaps my comments on the particular patch from Christophe sounded as if
they applied to all sizeof(u8) statements. I was not talking about *blindly*
replacing them. I didn't even say that they *all* should be replaced. What
I wanted to say was: maybe one should have a look at other places in the
kernel aswell. The above grep was just a quick grep through the sources.

Of course, there's no functional problem with sizeof(u8). It should be kept
in places where it makes things clear. But in my eyes, sizeof(u8) in something
like this (as in the lines affected by the patch):

kmalloc(sizeof(u8) * IOP_ADMA_TEST_SIZE, GFP_KERNEL);

isn't very useful. I think it's quite clear that kmalloc takes a number of
bytes as the first argument. So replacing the above code with the following

kmalloc(IOP_ADMA_TEST_SIZE, GFP_KERNEL);

would save some bytes and make it compile faster. And it isn't harder to read.
However, I don't insist on changes like that. I just thought that for
drivers/dma/iop-adma.c it may be included in Christophe's patch.

	Andi
