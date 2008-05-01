From: Adrian Bunk <bunk@kernel.org>
Date: Thu, 01 May 2008 19:43:25 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501194325.GO29330@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 01, 2008 at 01:16:27PM -0600, Matthew Wilcox wrote:
> On Thu, May 01, 2008 at 08:06:52PM +0100, Ricardo Martins wrote:
> > This is my first patch for the Linux kernel. It fixes the following
> > warnings given by gcc 4.3.0 about uninitialzed entities in mmap.c:
> 
> First, it's generally a bad idea to fix these warnings.  They sometimes
> obscure real bugs.
>...

ACK

> > -	struct vm_area_struct *vma, *prev;
> > +	struct vm_area_struct *vma, *prev = NULL;
> 
> gcc bug -- it's failing to notice that find_vma_prepare() will always
> initialise pprev.
>...

You miss the "return" inside the while() loop in find_vma_prepare().

I do not know whether the code is correct, but the answer is not that 
easy.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

