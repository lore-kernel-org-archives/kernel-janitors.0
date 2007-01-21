From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 21 Jan 2007 08:36:33 +0000
Subject: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  how hard would it be to define a standard for a simple true/false
boolean variable for the kernel?  gcc has had support for the C99
"_Bool" type for years, and additionally defines, in
include/linux/types.h:

  typedef _Bool                   bool;

so there's no reason to not use "bool" anywhere you need an actual
boolean, is there?

  however, it seems everyone wants to define their own macros for
the actual values "true" and "false":

  $ grep -r "define TRUE" .
  $ grep -r "define FALSE" .

yeesh.  would there be a problem adding those two defines to
"types.h", then deleting all those additional macro definitions?

  one might also get rid of redundant typedefs like:

  $ grep -r "typedef.*bool" .

where people insist on re-inventing their own booleans types.

rday

p.s.  the source file drivers/scsi/BusLogic.c repeatedly refers to the
token "true", but it's not clear where *that's" being defined.  goes
gcc actually recognize the token "true"?  that's supposed to be
defined in C99's <stdbool.h>, but that's clearly not being used here.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
