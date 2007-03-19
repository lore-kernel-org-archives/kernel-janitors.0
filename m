From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 19 Mar 2007 15:51:23 +0000
Subject: [KJ] SEC() and MSEC() and USEC() macros
Message-Id: <Pine.LNX.4.64.0703191148570.12453@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  no, it's not a serious proposal but, boy, wouldn't it have made the
code more readable if someone had defined macros/inline functions like
sec(), msec() and usec() rather than cluttering up the code with
things like "22*HZ/10" and "30*HZ/100".

  just thinking out loud, don't take it seriously.

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
