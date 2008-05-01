From: Adrian Bunk <bunk@kernel.org>
Date: Thu, 01 May 2008 21:13:56 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501211356.GR29330@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 01, 2008 at 03:05:19PM -0600, Matthew Wilcox wrote:
> On Thu, May 01, 2008 at 11:40:37PM +0300, Adrian Bunk wrote:
> > On Thu, May 01, 2008 at 02:25:33PM -0600, Matthew Wilcox wrote:
> > > However, the code is not buggy.  Just compare:
> > > 
> > >                         vma = vma_tmp;
> > >                         if (vma_tmp->vm_start <= addr)
> > >                                 return vma;
> > > 
> > > with
> > > 
> > > munmap_back:
> > >         vma = find_vma_prepare(mm, addr, &prev, &rb_link, &rb_parent);
> > >         if (vma && vma->vm_start < addr + len) {
> > >                 if (do_munmap(mm, addr, len))
> > >                         return -ENOMEM;
> > >                 goto munmap_back;
> > >         }
> > > 
> > > Now, we know that addr + len does not wrap, and that len > 0, so we know
> > > that this warning is incorrect.  But it's not reasonable to expect gcc to
> > > be able to deduce this.
> > >...
> > 
> > Can you submit a patch with your explanation that uses 
> > uninitialized_var() to silence these warnings?
> 
> I could, but I don't know if I want to.  Suppose somebody changes the
> code later to actually make prev used before it's initialised?  Then we
> would have GCC not warning about a problem.

That's why we silence the warnings with uninitialized_var() - simply 
change the #define and you'll see all silenced warnings.

The problem is that these warnings for which we know that the code is OK 
today make it harder to spot where new warnings get added that might 
indicate real bugs.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

