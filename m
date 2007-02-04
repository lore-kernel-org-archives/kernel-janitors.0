From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 04 Feb 2007 10:46:21 +0000
Subject: [KJ] A new wiki page for HOWTOs and programming guidelines
Message-Id: <Pine.LNX.4.64.0702040538530.32243@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i noticed a while back that wiki admin chris miller added a new
top-level page to the wiki for HOWTOs:

http://www.fsdev.dreamhosters.com/wiki/index.php?title=How_To%27s

which currently has an entry just for subversion.

  i was pondering another top-level page whose name might be something
like "Kernel Programming Gudelines".  it would differ from the
CodingStyle document in that it would get more into proper programming
*structure* (if that distinction makes any sense).

  i can imagine separate entries (and pages) for things like:

	* Data types
	* Endianness
	* Macros versus inline functions
	* Proper use of gcc "__attribute__"s

and so on.  each of those subpages would explain that concept with
respect to how to use it properly in the context of kernel
programming, references to the relevant header files and so on.

  nothing says those pages have to be new and original content -- a
pointer to an existing web page that already explained that would be
perfectly acceptable.

  again, thoughts on this?

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
