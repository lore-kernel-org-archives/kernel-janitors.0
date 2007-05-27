From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 16:21:34 +0000
Subject: [KJ] include/linux/init.h could use some serious cleaning
Message-Id: <Pine.LNX.4.64.0705271218240.8651@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  after taking a closer look at init.h, it's obvious that it could
stand some updating, just based on stuff like this:

...
/* These macros create a dummy inline: gcc 2.9x does not count alias
 as usage, hence the `unused function' warning when __init functions
 are declared static. We use the dummy __*_module_inline functions
 both to kill the warning and check the type of the init/cleanup
 function. */

/* Each module must use one module_init(), or one no_module_init */
...

  among other things, there's no value in trying to accommodate
anything as old as gcc 2.9x, i don't see anything resembling dummy
__*_module_inline functions, and i don't think that last comment above
is true -- there are no "no_module_init()" calls anywhere in the tree,
so i'm assuming that's an obsolete construct.

  so if anyone wants to spend some time going over that header file to
figure out what can be tossed, it's probably worth a few minutes.

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
