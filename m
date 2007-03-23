From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 23 Mar 2007 13:32:50 +0000
Subject: [KJ] replacing all "register_chrdev" with newer calls?
Message-Id: <Pine.LNX.4.64.0703230928050.8701@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  not sure if this is worth it, but is there any value to replacing
the old-style register_chrdev() calls with the newer
register_chrdev_region() calls?

  it's not as if the register_chrdev() routine has been marked for
deletion anytime soon, so it may be easier to leave it as is.

  thoughts?

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
