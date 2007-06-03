From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 03 Jun 2007 12:20:24 +0000
Subject: [KJ] any value to clear_page/copy_page cleanup?
Message-Id: <Pine.LNX.4.64.0706030818030.15638@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  quite some time back, i created this page:

http://fsdev.net/wiki/index.php?title=Clear_page_copy_page

suggesting a cleanup where numerous calls to memset() and memcpy()
could be replaced with the respective, simpler calls to clear_page()
and copy_page()?

  is this worth leaving as an open project?  or is just not worth the
effort?  i'm open to suggestions.  if it's not worth the trouble, i'll
drop that page from the wiki.

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
