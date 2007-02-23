From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 23 Feb 2007 17:20:33 +0000
Subject: [KJ] cleaning up "register_chrdev" and "unregister_chrdev"
Message-Id: <Pine.LNX.4.64.0702231217450.9101@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm wondering if this represents a possible janitor project.  the
old-style character device routines register_chrdev() and
unregister_chrdev() have been superseded by the newer routines
register_chrdev_region(), alloc_chrdev_region() and
unregister_chrdev_region().

  is it a worthwhile investment to make those changes?  if so, i can
add a page to the wiki for this (once the wiki is alive again).

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
