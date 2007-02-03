From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 03 Feb 2007 09:43:36 +0000
Subject: [KJ] some *seriously* deceased code in the tree
Message-Id: <Pine.LNX.4.64.0702030436460.24858@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  over here:

http://www.fsdev.dreamhosters.com/wiki/index.php?title=If_0_or_if_1_directives

i mentioned the depressing number of "#if 0" and "#if 1" directives in
the tree, many of which i'm *sure* have long since lost their value.
as one amusing example, i just ran across this in
arch/parisc/mm/fault.c:

======================#if 0
/* This is the treewalk to find a vma which is the highest that has
 * a start < addr.  We're using find_vma_prev instead right now, but
 * we might want to use this at some point in the future.  Probably
 * not, but I want it committed to CVS so I don't lose it :-)
 */
                        while (tree != vm_avl_empty) {
                                if (tree->vm_start > addr) {
                                        tree = tree->vm_avl_left;
                                } else {
                                        prev = tree;
                                        if (prev->vm_next = NULL)
                                                break;
                                        if (prev->vm_next->vm_start > addr)
                                                break;
                                        tree = tree->vm_avl_right;
                                }
                        }
#endif
======================
  in the first place, how old does kernel code have to be to have been
originally checked in via *CVS*?  :-)

  more importantly, though, this strikes me as a misuse of the
official kernel tree -- as an archival dumping ground for snippets of
code that have no immediate value but might someday be useful so, what
the heck, let's throw it in there and, who knows, we might get back to
it but maybe not.

  IMHO, that's the sort of thing that deserves to be ripped out
without a moment's hesitation.

  thoughts?

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
