From: walter harms <wharms@bfs.de>
Date: Sat, 13 Aug 2005 13:42:59 +0000
Subject: [KJ] argument type of generic_fls()
Message-Id: <42FDF8E3.5010403@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
after the log2 discussion i was looking for log2 in kernel. i found 
long_log2() in page_alloc.c. What the author actualy wanted was fls().
To my confusion the generic_fls() searches only 32 bit but has an 
argument of type int (i would expect uint32).
Will it create confusion with 64bit int systems ? if anyone considers 
these a problem i would add a flsl() function and replace the int with 
uint32.

re
	walter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
