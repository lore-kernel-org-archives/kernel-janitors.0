From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 12 Feb 2007 12:54:22 +0000
Subject: [KJ] need a better name for existing "FIELD_SIZE" macro under
Message-Id: <Pine.LNX.4.64.0702120748030.23229@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  one of the outstanding tasks in the wiki is to use the
"FIELD_SIZE()" macro (currently defined as FIELD_SIZEOF but that's
being renamed in the patch) in include/linux/kernel.h to simplify some
code in the tree.  i had already submitted that patch without noticing
that a few files under the sound/ directory already define a
"FIELD_SIZE" macro which clashes:

  $ grep -rw FIELD_SIZE *

  andrew morton suggested that the easiest solution is to just rename
the one under the sound/ directory, but i have no idea what that macro
represents.  anyone know what's going on there and can recommend a
better (and less universally intrusive) name that doesn't steal prime
macro naming real estate?

  once the name "FIELD_SIZE" is reclaimed from those sound files, i
can resubmit the global patch.  thanks.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
