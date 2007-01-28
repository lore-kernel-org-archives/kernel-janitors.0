From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 28 Jan 2007 08:48:47 +0000
Subject: [KJ] clear_page() and copy_page()
Message-Id: <Pine.LNX.4.64.0701280332020.29915@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  there are numerous instances of calls to memset() of the form

  memset(<addr>, 0, PAGE_SIZE);

to clear a single page, as you can see sprinkled throughout the output
here (obviously, not every line of output represents one of those
cases, the grep pattern is overly general):

  $ grep -r "memset.*PAGE_SIZE" .

  however, most architectures define a more convenient clear_page()
macro in a "page.h" header file thusly:

  $ grep -r "#define clear_page" include
  include/asm-frv/page.h:#define clear_page(pgaddr) memset((pgaddr), 0, PAGE_SIZE)
  include/asm-v850/page.h:#define clear_page(page)  memset ((void *)(page), 0, PAGE_SIZE)
  include/asm-parisc/page.h:#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
  ...

and so on, which suggests the obvious cleanup that those calls to
memset() should be replaced by calls to clear_page().  is it really
that simple?  well, maybe not.

  from include/asm-i386/page.h:

=============================
#ifdef CONFIG_X86_USE_3DNOW

#include <asm/mmx.h>

#define clear_page(page)        mmx_clear_page((void *)(page))
#define copy_page(to,from)      mmx_copy_page(to,from)

#else

/*
 *      On older X86 processors it's not a win to use MMX here it seems.
 *      Maybe the K6-III ?
 */

#define clear_page(page)        memset((void *)(page), 0, PAGE_SIZE)
#define copy_page(to,from)      memcpy((void *)(to), (void *)(from),
PAGE_SIZE)

#endif
=============================

so what are the issues involved with that kind of cleanup?

  similarly, there are a (smaller) number of calls of the form

  memcpy(<src>, <dest>, PAGE_SIZE);

as you can see:

  $ grep -r "memcpy.*PAGE_SIZE"

even though most arches also define the equivalent "copy_page" macro:

  $ grep -r "#define copy_page" include

same questions here -- any issues with standardizing on calls to
copy_page()?

rday

p.s.  obviously, rewriting to use those simpler macros would imply
that *every* architecture would need to define those macros, and i
don't think that's the case at the moment.

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
