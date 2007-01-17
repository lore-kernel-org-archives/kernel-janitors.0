From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 17 Jan 2007 16:11:46 +0000
Subject: [KJ] what's the value of "__deprecated_for_modules"?
Message-Id: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there really an overwhelming rationale for the following?

include/linux/compiler.h:
-------------------------
...
#ifdef MODULE
#define __deprecated_for_modules __deprecated
#else
#define __deprecated_for_modules
#endif
...

when there's only one usage of that macro in the entire tree?

  include/linux/pagemap.h:
	extern __deprecated_for_modules struct page * find_trylock_page(

it just seems odd that a "useful" macro would have only one
application throughout the entire kernel.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
