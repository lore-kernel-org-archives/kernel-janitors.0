From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 01 May 2008 21:05:19 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501210518.GY14976@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 01, 2008 at 11:40:37PM +0300, Adrian Bunk wrote:
> On Thu, May 01, 2008 at 02:25:33PM -0600, Matthew Wilcox wrote:
> > However, the code is not buggy.  Just compare:
> > 
> >                         vma = vma_tmp;
> >                         if (vma_tmp->vm_start <= addr)
> >                                 return vma;
> > 
> > with
> > 
> > munmap_back:
> >         vma = find_vma_prepare(mm, addr, &prev, &rb_link, &rb_parent);
> >         if (vma && vma->vm_start < addr + len) {
> >                 if (do_munmap(mm, addr, len))
> >                         return -ENOMEM;
> >                 goto munmap_back;
> >         }
> > 
> > Now, we know that addr + len does not wrap, and that len > 0, so we know
> > that this warning is incorrect.  But it's not reasonable to expect gcc to
> > be able to deduce this.
> >...
> 
> Can you submit a patch with your explanation that uses 
> uninitialized_var() to silence these warnings?

I could, but I don't know if I want to.  Suppose somebody changes the
code later to actually make prev used before it's initialised?  Then we
would have GCC not warning about a problem.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
