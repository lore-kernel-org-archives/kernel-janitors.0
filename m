From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 19:10:28 +0000
Subject: [KJ] is there a compelling reason for module param type "invbool"?
Message-Id: <Pine.LNX.4.64.0705271508200.10776@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm amused that, in the entire kernel source tree, there is
precisely one instance of someone using a module parameter type of
invbool:

$ grep -rw invbool *
drivers/video/aty/aty128fb.c:module_param_named(nomtrr, mtrr, invbool, 0);
include/linux/moduleparam.h:   ulong, charp, bool or invbool, or XXX if you define param_get_XXX,

that's the sort of thing that tells me that:

1) there's no real reason for invbool, and
2) that's one confusingly-written driver.  :-)

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
