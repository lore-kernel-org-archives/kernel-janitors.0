From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 06 Apr 2007 11:06:04 +0000
Subject: [KJ] how about a "NO-OP" macro or something?
Message-Id: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  it's amusing how many source/header files use the construct "do { }
while (0)" to define macros into nothingness:

  $ grep -r "do { } while (0)" * | wc -l
  1051

  i'm guessing it's *way* too late to do anything about it now, but
wouldn't it have made more sense to define a "NO-OP" macro or
something to represent the empty operation?  just thinking out loud.

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
