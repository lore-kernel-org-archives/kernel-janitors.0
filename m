From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 20 Dec 2006 20:37:02 +0000
Subject: [KJ] possible page allocation-related cleanup
Message-Id: <Pine.LNX.4.64.0612201527100.5315@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is it necessarily true that "alloc_pages(gfp_mask, 0)" is exactly
equivalent to "alloc_page(gfp_mask)"?  it would certainly seem to be
given the definition in include/linux/gfp.h:

  #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)

are there any situations where this *wouldn't* hold?

rday

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
