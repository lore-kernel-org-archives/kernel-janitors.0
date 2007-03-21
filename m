From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 21 Mar 2007 22:50:28 +0000
Subject: [KJ] another project:  remove gcc-2* remnants
Message-Id: <Pine.LNX.4.64.0703211847370.5352@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  as another possible project, it might be useful to remove any
leftovers in the tree related to the use of gcc-2.x.  to see what i
mean just run:

  $ grep -r "gcc[- ]2" *

and you'll see a screenful of lines apparently related to gcc-2.x
workaround hacks and so on.  since the kernel doesn't officially
support anything earlier than gcc-3.2, one would think those
workarounds/hacks can be removed, no?

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
