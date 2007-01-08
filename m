From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 08 Jan 2007 22:37:16 +0000
Subject: [KJ] another cleanup TO DO:  is_power_of_2() check
Message-Id: <Pine.LNX.4.64.0701081732070.25196@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  there are *numerous* places in the code that check if some value is
a power of 2 using the basic test "((x & (x - 1)) = 0)":

  $ grep -Er "(.*) ?\& ?\(\1 ?- ?1\)" .

as you can see, that test is all over the place.

  occasionally, someone decides to do the right thing and define a
macro:

  $ grep -r "#define is_power_of_2" .

i'm thinking it might be cleaner to define that macro in kernel.h and
clean up the source to use that macro, rather than constantly
rewriting that expression.

  thoughts?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
