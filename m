From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 12:15:31 +0000
Subject: [KJ] "automating" the cleanup process
Message-Id: <Pine.LNX.4.64.0701050711430.24554@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just for the entertainment value, i've been writing a shell script
whose job it is to scan the source tree and identify possible
candidates for "cleanup".  if anyone has any comments or enhancements,
feel free to chime in.  (be aware that i've already submitted patches
for some of these, but i'm still scanning for them.)

  it's not a robust script, it's just to get a general idea of where
one might concentrate one's efforts, that's all.



#!/bin/sh

DIR=${1-.}

echo -e "\n=== Deprecated Kconfig 'depends', should be 'depends on' ...\n"
grep depends $(find ${DIR} -name Kconfig) | grep -v "depends on"

echo -e "\n=== Potentially unnecessary casting of k[cmz]alloc() calls ...\n"
grep -Er "\([^\)\*]+\*\) ?k[cmz]alloc ?\(" ${DIR}

echo -e "\n=== kcalloc(1,...) calls that should be kzalloc(...) ...\n"
grep -Er "kcalloc ?\(1," ${DIR}

echo -e "\n=== Where ARRAY_SIZE() might be used ...\n"
grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" ${DIR}

echo -e "\n=== Where FIELD_SIZE() might be used ...\n"
grep -Er "sizeof ?\( ?\( ?\([^\*]*[^ ] ?\*\) ?0 ?\)->[^\)]+\)" ${DIR}

echo -e "\n=== People who seem to be redefining MAX() or MIN() ...\n"
grep -Er "# *define +(min|MIN|max|MAX) *\(" ${DIR}

#
#  Some simplifying transformations using an order value of zero.  All
# of these macros are defined in include/linux/gfp.h.
#
# #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
# #define __get_free_page(gfp_mask) __get_free_pages((gfp_mask),0)
# #define __free_page(page) __free_pages((page), 0)
# #define free_page(addr) free_pages((addr),0)

echo -e "\n=== Allocation routines that use an order of zero ...\n"
grep -Er "(alloc|free)_pages ?\([^,]+, ?0" ${DIR}

#
#  Short form for DMA pages.
#
# #define __get_dma_pages(gfp_mask, order) __get_free_pages((gfp_mask) | GFP_DMA,(order))

echo -e "\n=== __get_free_pages() -> __get_dma_pages() ...\n"
grep -Er "__get_free_pages.*GFP_DMA" ${DIR}

echo -e "\n=== Things that might be replaced by DIV_ROUND_UP() ...\n"
grep -Er " ?+ ?([^ -]+) ?- ?1\) ?/ ?\1" ${DIR}

echo -e "\n=== Calls to memset() that might be replaced by clear_page() ...\n"
grep -Er "memset ?\([^,]+, ?0, ?PAGE_SIZE\)" ${DIR} | grep -v "#define clear_page"

echo -e "\nDone."
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
