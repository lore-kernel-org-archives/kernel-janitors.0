From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 07 Jan 2007 20:24:41 +0000
Subject: [KJ] ruminations on kernel.h
Message-Id: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just thinking out loud here, but does anyone else think that the
header file include/linux/kernel.h is a little ... unstructured?
IMHO, i would think that it would make more sense to partition a lot
of the content of that file into other (and possibly newer) header
files.

  to begin with, all of the preliminary macros of the form
{INT/LONG_MIN/MAX} would seem to be more at home in limits.h, to more
match the headers for glibc.  (yes, i realize there's no *obligation*
to do it the way glibc does it, but it would at least look more
familiar to userspace programmers.)

  the various utility macros (ARRAY_SIZE, FIELD_SIZE, min/max,
container_of, etc.) might fit better into a file called macros.h or
util.h.

  then there's all the debugging/logging stuff -- the priority macros,
loglevel stuff, pr_debug, pr_info, etc.  why not a new file called
"debug.h"?

  anyway, you get the idea.  there doesn't seem to be much rhyme or
reason for what has been tossed into kernel.h.

  thoughts?  i might whip up a patch just to get some feedback.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
