From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 13:00:08 +0000
Subject: [KJ] why so many more "down()" than "down_interruptible()" calls?
Message-Id: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  reading robert love's kernel book, he writes that, when going to
sleep on a semaphore, it's more likely you'll want to use
down_interruptible() rather than just down() and, because of this,
"use of down_interruptible() is much more common than down()".

  that's not what i see.  just counting the calls under drivers/, it
looks like there's about four times as many calls of down() as
down_interruptible().  is there some reason that the actual stats
differ so markedly from the claim in love's book?  just curious.

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
