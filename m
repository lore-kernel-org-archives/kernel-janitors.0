From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 16:57:28 +0000
Subject: [KJ] thoughts on cleaning up all this "round up" chaos?
Message-Id: <Pine.LNX.4.64.0701051144360.4700@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  one possible candidate for massive cleanup is to rewrite all of the
appropriate code snippets in terms of these two macros from kernel.h:

  #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
  #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))

but, given how widespread the chaos is, i'm not sure it's even
possible.

  it's already disconcerting that two potentially useful macros are
defined so different aesthetically ("DIV_ROUND_UP" vs "roundup") but
ignore that for the time being.  it's immediately obvious if you
search using REs that there are countless places where code could be
simplified using these macros:

  $ grep -Er " ?+ ?([^ -]+) ?- ?1\) ?/ ?\1" .

  in addition, numerous files insist on defining their own variations
of ROUND_UP macros:

  $ grep -r ROUND_UP .

or using some similar name.

  worst of all, occasionally some source file defines a "round up"
macro which, against all tradition, has side effects (notice the
assignment in the following macro definitions):

drivers/net/ixgb/ixgb.h:#define IXGB_ROUNDUP(i, size) ((i) = (((i) + (size) - 1) & ~((size) - 1)))
drivers/net/e1000/e1000.h:#define E1000_ROUNDUP(i, size) ((i) = (((i) + (size) - 1) & ~((size) - 1)))

  like i said, i'm not sure this is even cleanable anymore.  but, if
it was, at a bare minimum, there should be some consensus on a
canonical set of macros for kernel.h, perhaps with a consistent naming
convention.

  thoughts?  this is *clearly* not something that would be handled by
a single patch, if it's done at all.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
