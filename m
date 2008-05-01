From: Adrian Bunk <bunk@kernel.org>
Date: Thu, 01 May 2008 20:40:37 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501204037.GQ29330@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 01, 2008 at 02:25:33PM -0600, Matthew Wilcox wrote:
> On Thu, May 01, 2008 at 10:43:25PM +0300, Adrian Bunk wrote:
> > > > -	struct vm_area_struct *vma, *prev;
> > > > +	struct vm_area_struct *vma, *prev = NULL;
> > > 
> > > gcc bug -- it's failing to notice that find_vma_prepare() will always
> > > initialise pprev.
> > >...
> > 
> > You miss the "return" inside the while() loop in find_vma_prepare().
> > 
> > I do not know whether the code is correct, but the answer is not that 
> > easy.
> 
> You're right, it isn't that easy.
> 
> However, the code is not buggy.  Just compare:
> 
>                         vma = vma_tmp;
>                         if (vma_tmp->vm_start <= addr)
>                                 return vma;
> 
> with
> 
> munmap_back:
>         vma = find_vma_prepare(mm, addr, &prev, &rb_link, &rb_parent);
>         if (vma && vma->vm_start < addr + len) {
>                 if (do_munmap(mm, addr, len))
>                         return -ENOMEM;
>                 goto munmap_back;
>         }
> 
> Now, we know that addr + len does not wrap, and that len > 0, so we know
> that this warning is incorrect.  But it's not reasonable to expect gcc to
> be able to deduce this.
>...

Can you submit a patch with your explanation that uses 
uninitialized_var() to silence these warnings?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

