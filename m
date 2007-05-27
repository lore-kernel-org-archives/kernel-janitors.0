From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 17:57:31 +0000
Subject: [KJ] is it safe to assume anything referring to "MODULE_PARM" is
Message-Id: <Pine.LNX.4.64.0705271356130.9605@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  given that the old-style MODULE_PARM macro has been obsolete since
2003:

http://lwn.net/Articles/22197/

is it safe to assume that any still-active references to it can't
possibly mean anything?

  $ grep -rw MODULE_PARM *

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
