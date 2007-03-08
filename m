From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 08 Mar 2007 20:39:19 +0000
Subject: [KJ] "clear_page" and "copy_page"?
Message-Id: <Pine.LNX.4.64.0703081535010.9138@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i asked about this once upon a time, but can anyone clarify whether
it's possible to effect the following replacements:

  1) memset(addr, 0, PAGE_SIZE) --> clear_page(addr)
  2) memcpy(to, from, PAGE_SIZE) --> copy_page(to, from)

the only issues i can see is if clear_page() and/or copy_page() have
some special semantics above and beyond simple memset and/or memcpy.
perhaps an alignment requirement or something.

  it's fairly clear that every architecture *must* implement both
clear_page() and copy_page().  so is this a possible cleanup?  if so,
i can add a page to the wiki.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
