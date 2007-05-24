From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 24 May 2007 23:40:11 +0000
Subject: [KJ] looking for a project?
Message-Id: <Pine.LNX.4.64.0705241934530.4351@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  there's still lots to be done here:

http://fsdev.net/wiki/index.php?title=ARRAY_SIZE

with respect to replacing all those silly C constructs that calculate
an array size with the ARRAY_SIZE macro.

  and i wouldn't even try to do it automatically with a script, since
there are numerous places where you can be a bit more clever than just
a mindless substitution.

  for instance, there are places in the tree that define their own
version of that macro:

drivers/ide/ide-cd.h:#define ARY_LEN(a) ((sizeof(a) / sizeof(a[0])))

that suggests that the ide-cd code uses ARY_LEN() at least once.  so
you could not only replace those calls to ARY_LEN with ARRAY_SIZE, but
you could then delete the macro definition of ARY_LEN.

  if you want to see where similar things are done, just run:

$ grep -r "define.*sizeof.*/.*sizeof" *

of course, not all of those hits represent possible changes, but
there's no lack of work there.

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
