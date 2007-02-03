From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 03 Feb 2007 16:57:41 +0000
Subject: Re: [KJ] some *seriously* deceased code in the tree
Message-Id: <20070203165741.GX7585@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702030436460.24858@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702030436460.24858@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 03, 2007 at 04:43:36AM -0500, Robert P. J. Day wrote:
> as one amusing example, i just ran across this in
> arch/parisc/mm/fault.c:
> 
> ======================> #if 0
> /* This is the treewalk to find a vma which is the highest that has
>  * a start < addr.  We're using find_vma_prev instead right now, but
>  * we might want to use this at some point in the future.  Probably
>  * not, but I want it committed to CVS so I don't lose it :-)
>  */
>                         while (tree != vm_avl_empty) {
>                                 if (tree->vm_start > addr) {
>                                         tree = tree->vm_avl_left;
>                                 } else {
>                                         prev = tree;
>                                         if (prev->vm_next = NULL)
>                                                 break;
>                                         if (prev->vm_next->vm_start > addr)
>                                                 break;
>                                         tree = tree->vm_avl_right;
>                                 }
>                         }
> #endif
> ======================> 
>   in the first place, how old does kernel code have to be to have been
> originally checked in via *CVS*?  :-)

The parisc-linux project switched from CVS to git in August 2006.
Since you asked so nicely, I originally checked in this code in December
2000, so it's just over 6 years old.

>   more importantly, though, this strikes me as a misuse of the
> official kernel tree -- as an archival dumping ground for snippets of
> code that have no immediate value but might someday be useful so, what
> the heck, let's throw it in there and, who knows, we might get back to
> it but maybe not.
> 
>   IMHO, that's the sort of thing that deserves to be ripped out
> without a moment's hesitation.

What harm does it do to leave it alone?  There's about a billion more
important things to spend time on than this.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
