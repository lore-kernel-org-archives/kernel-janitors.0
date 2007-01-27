From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 27 Jan 2007 15:42:33 +0000
Subject: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  given what you read here:

http://gcc.gnu.org/onlinedocs/gcc-4.1.1/gcc/Function-Names.html

  i briefly imagined replacing occurrences of "__FUNCTION__" with
"__func__" until i counted the number of times the former occurs in
the source tree:  7903.

ouch.

  in any event, it doesn't really matter since kernel.h contains:

#define __FUNCTION__ (__func__)

so i imagine it's best to let this one go.  i doubt anyone would
approve of a single cleanup *that* disruptive.

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
