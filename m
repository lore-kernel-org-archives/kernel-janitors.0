From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 12:04:25 +0000
Subject: [KJ] are there any issues regarding the abs() and labs() macros?
Message-Id: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  over at the wiki :-), on this page:

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Talk:Abs_and_labs

commenter "n" points out that the labs() macro defined in kernel.h
appears to have no invokers whatsoever anywhere in the source tree,
and wonders if usage of the regular abs() routine might have some type
issues.

i have no idea.  would anyone care to comment?

rday

-- 
===============================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA
===============================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
