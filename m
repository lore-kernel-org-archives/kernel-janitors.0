From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 26 Jan 2007 17:11:22 +0000
Subject: [KJ] is CONFIG_UNWIND_INFO still a live kernel config choice?
Message-Id: <Pine.LNX.4.64.0701261210130.26996@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  there's only a single test in the entire source tree for that
variable in include/asm-i386/dwarf2.h, but nothing else checks it and
nothing sets it.  is this a dead setting?

rday


-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
