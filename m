From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Feb 2007 16:14:32 +0000
Subject: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i doubt anything will ever come of this but, given the number of
calls to "memset(addr, 0, len)", did anyone ever consider defining a
macro short form, say:

  clearmem(addr, len)
  zeromem(addr, len)

or something like that?  just curious.

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
