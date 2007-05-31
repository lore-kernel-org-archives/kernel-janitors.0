From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 31 May 2007 19:01:17 +0000
Subject: [KJ] is it worth getting read of the "get_info" /proc interface?
Message-Id: <Pine.LNX.4.64.0705311459460.23501@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  given that that interface has been discouraged for quite some time,
and there's only a few instances of it left in the tree, is there any
value in switching over those remaining instances to a regular
proc_read and ditching (or at least officially deprecating) get_info?

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
