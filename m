From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 15:33:18 +0000
Subject: [KJ] why doesn't module.h include init.h?
Message-Id: <Pine.LNX.4.64.0705271126550.29617@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just *know* i'm going to regret bringing this up, but does it make
sense to anyone else that include/linux/module.h doesn't explicitly
include include/linux/init.h?

  one would think that the sane way to have done this would have been
for init.h to define the generic init-related stuff, then for module.h
to include init.h and further define the module-related stuff with
respect to *that*.

  yeesh.  what a mess.

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
